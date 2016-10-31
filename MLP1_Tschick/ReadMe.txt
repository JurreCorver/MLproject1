Part I Team Information
Team name: 
Tschick
Team member: 
Jurre Corver(Legi Nr.: 15-945-090), 
Mei-Chih Chang (Legi Nr.: 09-909-680), 
Caifa Zhou (Legi Nr.: 15-900-293)
(We decided that each of us is responsible for the summary and preparation for the submission once. 
Caifa Zhou is responsible for the first the course project. Each member is equally contributed to the course project.) 

Part II: General Model
The general procedures of the proposed the model for the age prediction from the brain fMRI consist of:
(i) feature extraction
    -- Using the nibabel/NIfTI tools to read the intensity of fMRI image, and take each 3D fMRI as a data point. 
    -- Blocklizing each fMRI by 0 to 3 levels. It means that we blocklize the 3D fMRI to 8*8*8 blocks by 
        dichotimizing along the 3 axis for 3 times.
    -- According to the intensity of each we proposed to compute the empirical statistical features of the intensity for 
        each image. There are in total eight different statistical calculated for each block including mean, variance, 
        standard deviation, median, kurtosis, skewness, 3 and 4 order moment. 
    -- In total there are (1 + 8 + 8*8 + 8*8*8)*8 (in total is 4680) features extracted for each training and testing fMRI
(ii) regression model
    -- Applying LASSO with LARS (LASSOLARS) using 10 fold cross validation with maximal 5000 times iteration for search for the optimal hyperparameter, i.e. lambda, for the model. We used the sklearn package.

(iii) integerization and cutoff the regression result
    -- According the targets given for the training set, we assume that the range of targets, i.e. age of the brain, is
        represented by the given training target. From this perspective, we found out that the range age should in [18, 96].
        So that we integerization the regression result of LASSOLARS and cutoff the predicted ages which are not in the range,
        i.e., set the age smaller than 18 as 18 and set the age larger than 96 as 96.

(iv) submitted file
    -- The file that submitted on Kaggle is named as: 'SubmissionCZLassoLarsFinal.csv'

Part II Run Instructions
(i) Prerequisites
-- MATLAB and Python must be executable from the command line window. We test the final version on Mac OS with Matlab 2015Rb and Python 3.4.
-- dataset directory: please put all the input for training and testing into the dataset directory named as 'set_train', 'targets.csv' and 'set_test' respectively. This is the same as the way provided on the Kaggle.
(ii) How to run
-- for the OS based on linux/unix kernel and mac OS, please run: 'prediect_final_mac.sh'.
-- for the windows OS, please run: 'predict_final_windows.sh'
(iii) Comments
--The reason why we submit the the shell script is we use matlab for feature extraction and python for Lasso with LARS respectively.
-- The shell script of 'prediect_final_mac.sh' is tested on Euler and mac OS.
