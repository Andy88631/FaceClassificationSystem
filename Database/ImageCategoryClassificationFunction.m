%%
function [categoryClassifier,class] = ImageCategoryClassificationFunction(imgSets,learningRate)
{ imgSets.Description } % display all labels on one line
[imgSets.Count]         % show the corresponding count of images
%% Prepare Training and Validation Image Sets
minSetCount = min([imgSets.Count]); % determine the smallest amount of images in a category

% Use partition method to trim the set.
imgSets = partition(imgSets, minSetCount, 'randomize');

% Notice that each set now has exactly the same number of images.
[imgSets.Count];

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
%img = read(imgSets(1), 1);
%featureVector = encode(bag, img);
% Plot the histogram of visual word occurrences
% figure
% bar(featureVector)
% title('Visual word occurrences')
% xlabel('Visual word index')
% ylabel('Frequency of occurrence')
%%
categoryClassifier = trainImageCategoryClassifier(trainingSets, bag);

%% Evaluate Classifier Performance
confMatrix = evaluate(categoryClassifier, trainingSets);

%%
[confMatrix,KnownLabelIdx,PredictedLabelIdx,rate] = evaluate(categoryClassifier, validationSets);

% Compute average accuracy
mean(diag(confMatrix));