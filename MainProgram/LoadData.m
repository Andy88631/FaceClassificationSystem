clear all;
outputFolder = fullfile('F:\Dropbox\FaceClassificationSystem\Database','Me');
ImageSet = imageSet(fullfile(outputFolder));

% Total number of images in the data set
ImageSet.Count
% Display a few of the flower images
%helperDisplayImageMontage(flowerImageSet.ImageLocation(1:3:80));

%% training classifier
% Pick a random subset of the flower images
trainingSet = partition(ImageSet, 0.8, 'randomized');

% Create a custom bag of features using the 'CustomExtractor' option
colorBag = bagOfFeatures(trainingSet, ...
 'CustomExtractor', @BagOfFeaturesColorExtractor, ...
 'VocabularySize', 10000);
%colorBag = bagOfFeatures(trainingSet);

ImageIndex = indexImages(ImageSet, colorBag, 'SaveFeatureLocations', false);
% Define a query image
queryImage = read(ImageSet, 47);
figure
imshow(queryImage)

ImageIndex.WordFrequencyRange = [0.4 0.9];
% Search for the top 20 images with similar color content
%[imageIDs, scores] = retrieveImages(queryImage, ImageIndex, 'NumResults',1);
%helperDisplayImageMontage(ImageSet.ImageLocation(imageIDs))
