clear cam;
cam=webcam(1);  
for n=1:10
   img=snapshot(cam); %photo
   frame = getframe(gcf);
   imagesc(img);   
   imwrite(img,strcat( 'A',num2str(n),'.png'));  
end
%%
[categoryClassifier,class] = ImageCategoryClassificationFunction(imgSets,0.7);

rootFolder = fullfile('/Users/Apple/Dropbox/FaceClassificationSystem', ...
'Database');

imgSets = [imageSet(fullfile(rootFolder, 'Me')) ...
    imageSet(fullfile(rootFolder, 'Cats')), ...
    imageSet(fullfile(rootFolder, 'Dolphin'))]; 
    %imageSet(fullfile('F:\Picture', 'YiFan'))];

%% Try the Newly Trained Classifier on Test Images
for n = 1:10
img = imread(fullfile(rootFolder, strcat('A',num2str(n),'.png')));
[labelIdx, scores] = predict(categoryClassifier, img);
% Display the string label
categoryClassifier.Labels(labelIdx)

displayEndOfDemoMessage(mfilename)
end
