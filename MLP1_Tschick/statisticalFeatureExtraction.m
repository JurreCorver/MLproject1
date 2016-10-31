function [extractedFeature] = statisticalFeatureExtraction(inputMRI)
% --------------------------------------------------
% % From paper: BRAIN TUMOR MRI IMAGE CLASSIFICATION
% % WITH FEATURE SELECTION AND EXTRACTION
% % USING LINEAR DISCRIMINANT ANALYSIS
% % V.P.Gladis Pushpa Rathi and Dr.S.Palani
% --------------------------------------------
% function [extractedFeature] = statisticalFeatureExtraction(inputMRI)
% Intensity features – Mean, Variance, Standard Variance, Median Intensity, Skewness,
% and Kurtosis
% input
% inputMRI: normalized ([0,1]) intensity of the MRI
% Each column of the input stands for 1 point
% label: the correponding age of the patient whose MRI is used.
% output
% extractedFeature:
% The statistical value that are selected:
% mean
% variance
% standard variance
% median
% skewness
% Ex. Kurtosis
% % 
% The last row is the label: AGE
% 

% load data and set the parameters
% load('trainData.mat');
% numberExample = size(trainData.age, 1);



numberExample = size(inputMRI, 2);
extractedFeature = zeros(8, numberExample);
% label = trainData.age;
% numberPoint = size(inputMRI,2);
% if nargin == 1
% %     label = repmate(-1,1,numberExample);
%     extractedFeature = zeros(6, numberExample);
% else
%     extractedFeature = zeros(7, numberExample);
% end;

for ii =1:1:numberExample
%     inputMRI = reshape(trainData.values{ii,1}, [], 1);
%     temp = intensityNormalizer(inputMRI);
    temp = inputMRI;
    temp = double(temp);
    extractedFeature(1,ii) = mean(temp);  %MEAN
    extractedFeature(2,ii) = var(temp);  %VARIANCE
    extractedFeature(3,ii) = std(temp);  %STD VARIANCE
    extractedFeature(4,ii) = median(temp);    %MEDIAN    
    extractedFeature(5,ii) = moment(temp,3)/(eps+ std(temp)^3);  %skewness
    extractedFeature(6,ii) = moment(temp,4)/(eps+ std(temp)^4);  %kurtosis
    extractedFeature(7,ii) = moment(temp,3);
    extractedFeature(8,ii) = moment(temp,4);
%     extractedFeature(7,ii) = (label(ii));   %AGE 
end;

% [~, minIndex] = min(abs(reshape(extractedFeature, [],1)));
% zeroIndex = find(extractedFeature == 0);
% extractedFeature(ind2sub(size(extractedFeature),zeroIndex)) = (extractedFeature(ind2sub(size(extractedFeature), minIndex)) + eps)./10;
