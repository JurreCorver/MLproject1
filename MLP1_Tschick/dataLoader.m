function [dataMat] = dataLoader(typeOfData, directory, target)

% To load the source data
% [dataMat] = dataLoader(typeOfData, directory, target)
% input parameters:
%   typeOfData: a string of 'train' or 'test' to indicate the type of data
%   directory: the dir of the dataset
%   target: the target file name of the target label of the training
%   dataset in the case that typeOfData is 'train'
% Output:
%   dataMat.values: the img values of the MR picture;
%   dataMat.age: the labelled age of the MR picture of the training
%   examples. The element is only available in the case of 'train'

% Author: CZ
% Date: 27.09.2016
% Status: Finished 

    if nargin < 2 || nargin > 3
        error('The number of inputs does not match!');
    end;
    
    if nargin == 2
        if ~strcmp(typeOfData, 'test')
            error('The data type does not match!');
        end;
    end;
    
    if nargin == 3
        if ~strcmp(typeOfData, 'train')
            error('The data type does not match!');
        end;
    end;
    dataMat = [];
    
    fileIndex = 0;
    fileDir = dir(directory);
    for ii = 1:1:size(fileDir, 1)
        if ~ (fileDir(ii).isdir)
            fileIndex = fileIndex + 1;
            dataFileName{fileIndex, 1} = fileDir(ii).name;        
        end;
    end;
    
    numberFile = size(dataFileName,1);
    
    if strcmp(typeOfData, 'train')
        trainTarget = load(target);
    end;
    
    if strcmp(typeOfData, 'train')
        startIndex = 7;
    else
        startIndex = 6;
    end;

    for ii =1:1:numberFile
        temp = [];
        str = dataFileName{ii,1};           
        targetIndex = str2num(str(startIndex : end-4));
        tempFileName = [directory, dataFileName{ii,1}];
        temp = load_nii(tempFileName);
        dataMat.values{targetIndex, 1} = temp.img;
        
        if strcmp(typeOfData, 'train')
            dataMat.age(targetIndex, 1) = trainTarget(targetIndex);
        end;       
    end;
    
end