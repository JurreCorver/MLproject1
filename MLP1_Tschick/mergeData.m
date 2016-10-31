function [] = mergeData(setType, fileName)

trainFeature = [];
testfeature = [];

if (strcmp(setType, 'train'))
    trainName = ['train_blocklization_edge_', num2str(1),'.csv'];
    trainTemp = csvread(trainName);
    trainFeature = cat(1,trainFeature, trainTemp(1:8,:));
    csvwrite('trainTargets.csv',trainTemp(end,:));
    % data after blocklization
    totalLevel = 3;
    for ii = 1:1:totalLevel
        trainName = ['train_blocklization_edge_', num2str(ii),'.csv'];
        trainTemp = csvread(trainName);
        trainFeature = cat(1,trainFeature, trainTemp(9:end-1,:));
    end;
    csvwrite(fileName, trainFeature);
end;
if (strcmp(setType, 'test'))
    testName = ['test_blocklization_edge_', num2str(1),'.csv'];
    testTemp = csvread(testName);
    testfeature = cat(1, testfeature, testTemp(1:8,:));
    % data after blocklization
    totalLevel = 3;
    for ii = 1:1:totalLevel
        testName = ['test_blocklization_edge_', num2str(ii),'.csv'];
        testTemp = csvread(testName);
        testfeature = cat(1, testfeature, testTemp(9:end,:));
    end;
    csvwrite(fileName, testfeature);
end;
