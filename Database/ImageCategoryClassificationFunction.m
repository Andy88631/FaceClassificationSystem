function [categoryClassifier,class] = ImageCategoryClassificationFunction(imgSets,learningRate)
%% Prepare Training and Validation Image Sets
minSetCount = min([imgSets.Count]); % determine the smallest amount of images in a category

% Use partition method to trim the set.
imgSets = partition(imgSets, minSetCount, 'randomize');

%% The group of image divide to 2 parts, one for training, and the other one for validation (add at 2015/11/15 11:47)
[trainingSets, validationSets] = partition(imgSets, learningRate , 'randomize');

Category = size(trainingSets);
%%
for n=1:Category
    class{n} = read(trainingSets(n),1);
end
%%
bag = bagOfFeatures(trainingSets);

%%
categoryClassifier = trainImageCategoryClassifier(trainingSets, bag);

%%
[confMatrix,KnownLabelIdx,PredictedLabelIdx,rate] = evaluate(categoryClassifier, validationSets);

% Compute average accuracy
mean(diag(confMatrix));
%%
filename = 'trainingData.mat';
save(filename);