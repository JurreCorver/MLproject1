function sourceToFeature(dataDir, targetName, setType, fileName)
% This function implements the feature extraction on the given directory of
% the data and the type of data (e.g., set train or set test)
% input
% dataDir: the directory of the data
% fileName: a string to indicate output file name with the extension of csv
% output
% write the extracted features into a csv file with the given fileName

% input check
% if nargin < 3 || nargin > 4
%     error('Mismatch of number of input variables')
% end;
% 
% if nargin == 3 && ~strcmp(setType, 'test')
%     error('Mismatch of input variable and data type');
% end;
% 
% if nargin == 4 && ~strcmp(setType, 'train')
%     error('Mismatch of input variable and data type');
% end;

addpath(dataDir);
% addpath('.\Dataset importer\')  %the toolbox to read to the fMRI

% load the test data
dataDirectory = dataDir;
if strcmp(setType, 'test')
    data = dataLoader('test', dataDirectory);
    blocklization(data, 2);
end;
if strcmp(setType, 'train')
    trainTargetName = targetName;
    data = dataLoader('train', dataDirectory, trainTargetName);
    blocklization(data, 1);
end;

% extract the empirical statistical value as features with the blocklization
% the test data (3 levels of blocklization)
blocklization(data, 2);  %2 is the indication value of test set
% merge all 3 levels of data
mergeData(setType, fileName);

