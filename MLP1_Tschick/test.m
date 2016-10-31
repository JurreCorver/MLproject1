function [] = test(systemType)

if strcmp(systemType, 'windows')
    % trainDir = '.\dataset\set_train\';
    % testDir = '.\dataset\set_test\';
    % targetName = '.\dataset\targets.csv';
end;

if strcmp(systemType, 'mac')
    trainDir = './dataset/set_train/';
    testDir = './dataset/set_test/';
    targetName = './dataset/targets.csv';
end;
sourceToFeature(trainDir, targetName, 'train','./trainFeature.csv');
sourceToFeature(testDir,[],'test','./testFeature.csv');