import numpy as np
from numpy import genfromtxt
# from sklearn.datasets import make_friedman1
from sklearn.feature_selection import RFECV
from sklearn.model_selection import cross_val_predict, cross_val_score
from sklearn.svm import SVR
from sklearn import linear_model
import matplotlib.pyplot as plt
import csv


# csv reader
def csvReader(fileName):
    readData = []
    with open(fileName) as f:
        for line in f:
            readData.append(line.strip().split(','))
    return readData


# csv write a formated csv file
def csvFormatedOutput(fileName, ans):
    with open(fileName, 'w', newline='') as f:
        c = csv.writer(f, delimiter=',',
                       quotechar='|', quoting=csv.QUOTE_MINIMAL)
        c.writerow(['ID', 'Prediction'])
        for i in range(0, len(ans)):
            c.writerow([i + 1, ans[i]])
    return 0


def forwardSubsetSelection(model, feature0, featureCandidate, targets, cv):
    feature = [];
    feature.append(feature0);
    feature.append(featureCandidate);

    #     get the cv score
    score = cross_val_score(model, feature.T, targets.T, cv)
    #     return np.median(score)
    return score


def listToMat(l):
    return np.array(l).reshape(-1, np.array(l).shape[-1])

def linearRegression(trainingFeatures, trainingTargets, trainingExamples):
    lr = linear_model.LinearRegression()
    cvList = []
    cvList.append(10)
    cvList.append(np.sqrt(trainingExamples))
    lr.fit(trainingFeatures.T, trainingTargets.T)
    lrPredicted = cross_val_predict(lr, trainingFeatures.T, trainingTargets.T, cv=int(np.min(cvList)))
    return lr, lrPredicted;

def ridgeRegression(trainingFeatures, trainingTargets, trainingExamples, alpha):
    cvList = []
    cvList.append(10)
    cvList.append(np.sqrt(trainingExamples))
    ridge = linear_model.Ridge(alpha)
    ridge.fit(trainingFeatures.T, trainingTargets.T)
    ridgePredicted = cross_val_predict(ridge, trainingFeatures.T, trainingTargets.T, cv=int(np.min(cvList)))
    return ridge, ridgePredicted;

def elasticNetRegression(trainingFeatures, trainingTargets, trainingExamples):

    return 0

# load training and test
# training data
temp = []
temp.append(genfromtxt("trainFeature.csv", delimiter=','))
trainingFeatures = np.array(temp).reshape(-1, np.array(temp).shape[-1])
featureLength = np.array(trainingFeatures).shape[0]
trainingExamples = np.array(trainingFeatures).shape[1]

temp = []
temp.append(genfromtxt("trainTargets.csv", delimiter=','))
trainingTargets = np.array(temp).reshape(-1, np.array(temp).shape[-1])

# testing data
temp = []
temp.append(genfromtxt("testFeature.csv", delimiter=','))
testFeatures = (np.array(temp).reshape(-1, np.array(temp).shape[-1]))
testExamples = np.array(testFeatures).shape[1]


# linear regression
# lr, lrPredicted = linearRegression(trainingFeatures, trainingTargets, trainingExamples)
# # # plot the result
# fig, ax = plt.subplots()
# y = trainingTargets.T
# ax.scatter(y, lrPredicted)
# ax.plot([y.min(), y.max()], [y.min(), y.max()], 'k--', lw=4)
# ax.set_xlabel('Measured')
# ax.set_ylabel('Predicted')
# plt.show()

# ridge regression
# ridge = linear_model.Ridge(alpha = 0.005)
# ridgePredicted = cross_val_predict(ridge, trainingFeatures.T, trainingTargets.T, cv=int(np.min(cvList)))
# # plot the result
# fig, ax = plt.subplots()
# y = trainingTargets.T
# ax.scatter(y, ridgePredicted)
# ax.plot([y.min(), y.max()], [y.min(), y.max()], 'k--', lw=4)
# ax.set_xlabel('Measured')
# ax.set_ylabel('Predicted')
# plt.show()

#lasso
# cvList = []
# cvList.append(10)
# cvList.append(np.sqrt(trainingExamples))
# lasso = linear_model.LassoLarsCV(cv=int(np.min(cvList)), max_iter=5000, max_n_alphas=1000)
# lasso.fit(trainingFeatures.T, trainingTargets.T)
# lassoEstimation = lasso.predict(testFeatures.T)
outputFileName = 'submissionCZLassoLarsOnlyOrg.csv'
# csvFormatedOutput(outputFileName, lassoEstimation)

# rescaling the output
minAge = min(trainingTargets);
maxAge = max(trainingTargets);

temp = []
temp.append(genfromtxt(outputFileName, delimiter=','))
temp = (np.array(temp).reshape(-1, np.array(temp).shape[-1]))
# tempOut= (np.array(lassoEstimation).reshape(-1, np.array(lassoEstimation).shape[-1]))
# testExamples = np.array(testFeatures).shape[1]
tempOut = (np.array(temp[:,1]).reshape(-1, np.array(temp[:,1]).shape[-1]))

print(tempOut.shape)
# for i in range(len(tempOut)):
#     tempOut[i] = int(np.round(tempOut[i]))
#
# for i in range(len(tempOut)):
#     if tempOut[i] < minAge:
#         tempOut[i] = minAge;
#     if tempOut[i] > maxAge:
#         tempOut[i] = maxAge;
#
# csvFormatedOutput('submissionCZLassoLarsOnlyOrgInt.csv', tempOut)

# plot the result
# fig, ax = plt.subplots()
# y = trainingTargets.T
# ax.scatter(y, lasso.predict(trainingFeatures.T))
# ax.plot([y.min(), y.max()], [y.min(), y.max()], 'k--', lw=4)
# ax.set_xlabel('Measured')
# ax.set_ylabel('Predicted')
# plt.show()




# lasso.alpha_
# print(lasso.alpha_)
# print(lasso.coef_)
# elastic net regression
# elasticNet = linear_model.ElasticNetCV(l1_ratio=0.95, eps=0.001,
#                                        n_alphas=100, alphas=None,
#                                        fit_intercept=True, normalize=False,
#                                        precompute='auto', max_iter=5000, tol=0.0001,
#                                        cv = int(np.min(cvList)))
# elasticNet.fit(trainingFeatures.T, trainingTargets.T)
# elasticNetEstimation = elasticNet.predict(testFeatures.T)
# csvFormatedOutput('submissionCZElasticNet1.csv', elasticNetEstimation)
# # plot the result
# fig, ax = plt.subplots()
# y = trainingTargets.T
# ax.scatter(y, elasticNet.predict(trainingFeatures.T))
# ax.plot([y.min(), y.max()], [y.min(), y.max()], 'k--', lw=4)
# ax.set_xlabel('Measured')
# ax.set_ylabel('Predicted')
# plt.show()

