function [outputBlock] = blocklization(inputData, flag)

%%
% 3 levels
% for training data
% load('trainData.mat');
if flag == 1
    trainData = inputData;
    numExamples = length(trainData.values);
    trainFeature = [];
    for jj = 1:1:numExamples
        outputFeature = [];
        % three levels blocklization
        outputBlock = (singleLevelBlocklization(singleLevelBlocklization(singleLevelBlocklization(trainData.values{jj}))));

        % compute the statistical features for each block
        % 0 blocklization
        outputFeature = cat(1, outputFeature, statisticalFeatureExtraction(reshape(trainData.values{jj},[],1)));

        % after blocklizing
        for ii = 1:1:length(outputBlock)
            outputFeature = cat(1, outputFeature, statisticalFeatureExtraction(reshape(outputBlock{ii},[],1)));
        end;

        outputFeature = cat(1, outputFeature, trainData.age(jj));

    %     
        trainFeature = cat(2, trainFeature, outputFeature);
    end;

    csvwrite('./train_blocklization_edge_3.csv',trainFeature);   
end;


% for testing data
% load('testData.mat');
if flag == 2
    testData = inputData;
    numTest = length(testData.values);
    testFeature = [];
    for jj = 1:1:numTest
        outputFeature = [];
        % three levels blocklization
        outputBlock = (singleLevelBlocklization(singleLevelBlocklization(singleLevelBlocklization(testData.values{jj}))));

        % compute the statistical features for each block
        % 0 blocklization
        outputFeature = cat(1, outputFeature, statisticalFeatureExtraction(reshape(testData.values{jj},[],1)));

        % after blocklizing
        for ii = 1:1:length(outputBlock)
            outputFeature = cat(1, outputFeature, statisticalFeatureExtraction(reshape(outputBlock{ii},[],1)));
        end;

        testFeature = cat(2, testFeature, outputFeature);
    end;

    csvwrite('./test_blocklization_edge_3.csv',testFeature);    
end;



%%
% % 2 levels
% % for training data
if flag == 1
    trainData = inputData;
    numExamples = length(trainData.values);
    trainFeature = [];
    for jj = 1:1:numExamples
        outputFeature = [];
        % three levels blocklization
        outputBlock = ((singleLevelBlocklization(singleLevelBlocklization(trainData.values{jj}))));

        % compute the statistical features for each block
        % 0 blocklization
        outputFeature = cat(1, outputFeature, statisticalFeatureExtraction(reshape(trainData.values{jj},[],1)));

        % after blocklizing
        for ii = 1:1:length(outputBlock)
            outputFeature = cat(1, outputFeature, statisticalFeatureExtraction(reshape(outputBlock{ii},[],1)));
        end;

        outputFeature = cat(1, outputFeature, trainData.age(jj));

    %     
        trainFeature = cat(2, trainFeature, outputFeature);
    end;

    csvwrite('./train_blocklization_edge_2.csv',trainFeature);   
end;
% % for testing data
if flag == 2
    testData = inputData;
    numTest = length(testData.values);
    testFeature = [];
    for jj = 1:1:numTest
        outputFeature = [];
        % three levels blocklization
        outputBlock = ((singleLevelBlocklization(singleLevelBlocklization(testData.values{jj}))));

        % compute the statistical features for each block
        % 0 blocklization
        outputFeature = cat(1, outputFeature, statisticalFeatureExtraction(reshape(testData.values{jj},[],1)));

        % after blocklizing
        for ii = 1:1:length(outputBlock)
            outputFeature = cat(1, outputFeature, statisticalFeatureExtraction(reshape(outputBlock{ii},[],1)));
        end;

        testFeature = cat(2, testFeature, outputFeature);
    end;

    csvwrite('./test_blocklization_edge_2.csv',testFeature);    
end;
% %%
% % for training data
% % 1 level
if flag == 1
    trainData = inputData;
    numExamples = length(trainData.values);
    trainFeature = [];
    for jj = 1:1:numExamples
        outputFeature = [];
        % three levels blocklization
        outputBlock = (((singleLevelBlocklization(trainData.values{jj}))));

        % compute the statistical features for each block
        % 0 blocklization
        outputFeature = cat(1, outputFeature, statisticalFeatureExtraction(reshape(trainData.values{jj},[],1)));

        % after blocklizing
        for ii = 1:1:length(outputBlock)
            outputFeature = cat(1, outputFeature, statisticalFeatureExtraction(reshape(outputBlock{ii},[],1)));
        end;

        outputFeature = cat(1, outputFeature, trainData.age(jj));

    %     
        trainFeature = cat(2, trainFeature, outputFeature);
    end;

    csvwrite('./train_blocklization_edge_1.csv',trainFeature);   
end;
% 
% % for testing data
if flag == 2
    testData = inputData;
    numTest = length(testData.values);
    testFeature = [];
    for jj = 1:1:numTest
        outputFeature = [];
        % three levels blocklization
        outputBlock = (((singleLevelBlocklization(testData.values{jj}))));

        % compute the statistical features for each block
        % 0 blocklization
        outputFeature = cat(1, outputFeature, statisticalFeatureExtraction(reshape(testData.values{jj},[],1)));

        % after blocklizing
        for ii = 1:1:length(outputBlock)
            outputFeature = cat(1, outputFeature, statisticalFeatureExtraction(reshape(outputBlock{ii},[],1)));
        end;

        testFeature = cat(2, testFeature, outputFeature);
    end;

    csvwrite('./test_blocklization_edge_1.csv',testFeature);    
end;
