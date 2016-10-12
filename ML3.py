import numpy as np
from numpy import genfromtxt
#from sklearn.datasets import make_friedman1
from sklearn.feature_selection import RFECV
from sklearn.svm import SVR
import csv

#Retrieve the data from several trainingdata files and testdata files and put them in
#features, testfeatures and labels

dataFile = []
rangenr = 10 #there are 9 data files, this nr is simply to go over all of them
for i in range(1, rangenr):
    dataFile.append(genfromtxt("feature extraction\dataset\clustering\sum up of the feature\sumupCluster_"+ str(i) +"_train_org.csv", delimiter=','))
#dataMatrix = genfromtxt("feature extraction\dataset\clustering\sum up of the feature\sumupCluster_4_train_org.csv", delimiter=',')
featurelength = len(dataFile[0]) -1

tempMatrix = np.array([dataFile[i][0:-1] for i in range(0, rangenr-1) ])
features = tempMatrix.reshape(-1, tempMatrix.shape[-1])
labels = dataFile[0][6]

#Also import the testdata

testdataFile = []
for i in range(1, rangenr):
    testdataFile.append(genfromtxt("feature extraction\dataset\clustering\sum up of the feature\sumupCluster_"+ str(i) +"_test_org.csv", delimiter=','))


testtempMatrix = np.array([testdataFile[i] for i in range(0, rangenr-1) ]) #does nothing
testfeatures = testtempMatrix.reshape(-1, testtempMatrix.shape[-1])

#Recursive feature selection with cross validation, takes a very long time to evaluate
#When you are testing the data, use featurelength = low number
# in the final answer, use all features: featurerange = len(features)
featurerange = 5
X = [[features[i][j] for i in range(0, featurerange )] for j in range(0, len(features[0]))   ] 
y = labels
estimator = SVR(kernel="poly", degree = 3)  #Perhaps we should try a gaussian kernel 
#step is the amount of features to remove in one step, cv has to do with the nr of cross validations
selector = RFECV(estimator, step=1, cv=5) #lower cv if evaluation takes to long
selector = selector.fit(X, y)
selectedBool = selector.support_ 

#Here the model (selector) is used to make prediction for the testdata. 
#The predictions are then written to a file
testData = [[testfeatures[i][j] for i in range(0, featurerange)] for j in range(0, len(testfeatures[0]))   ]
ans = selector.predict(testData)

c = csv.writer(open("submissionjurre3.csv", "wb"))
c.writerow(['ID' , 'Prediction'])
for i in range(0, len(ans)):
    c.writerow([i+1 , ans[i]]) 

