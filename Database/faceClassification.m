clear cam;
cam = webcam(1);  
for n=1:10
   img=snapshot(cam); %photo
   Limg = rgb2lab(img); %RGB=>lab
   Himg = rgb2hsv(img); %RGB=>hsv   
   Gimg = rgb2gray(img); %RGB=>gray   
   Gimg = uint8(Gimg);
   Eimg = edge(Gimg,'canny'); 
   figure
   subplot(3,2,1);
   imagesc(img);
   subplot(3,2,2);
   imagesc(Limg);
   subplot(3,2,3);
   imagesc(Himg);
   subplot(3,2,4);
   imagesc(Gimg);
   subplot(3,2,5);
   imagesc(Eimg);
%    imwrite(img,strcat('/Users/Apple/Dropbox/Coworking/RGB/AMenRGB',num2str(n),'.png'));
%    imwrite(Limg,strcat('/Users/Apple/Dropbox/Coworking/LAB/AMenLab',num2str(n),'.png'));
%    imwrite(Himg,strcat('/Users/Apple/Dropbox/Coworking/HSV/AMenHsv',num2str(n),'.png'));
%    imwrite(Gimg,strcat('/Users/Apple/Dropbox/Coworking/Gray/AMenGray',num2str(n),'.png'));
%    imwrite(Eimg,strcat('/Users/Apple/Dropbox/Coworking/Edge/AMenEdge',num2str(n),'.png'));
end
%% If you want build data, execute it.
%[categoryClassifier,class] = ImageCategoryClassificationFunction(imgSets,0.3); %(learning rate change at 2015/11/15 11:48)
%% If you want classify image, execute it.
load('trainingData.mat');
%% image root
rootFolder = fullfile('F:\Dropbox\FaceClassificationSystem', ...
                      'Database');

imgSets = [imageSet(fullfile(rootFolder, 'Me')) ...
           imageSet(fullfile(rootFolder, 'Cats')), ...
           imageSet(fullfile(rootFolder, 'Dolphin'))]; 
          %imageSet(fullfile('F:\Picture', 'YiFan'))];

%% Try the Newly Trained Classifier on Test Images
    %just test the pictures from third to seventh,
    %cause sometimes the images at begining isn't good.(change at 2015/11/14)
for n = 3:7  
    img = imread(fullfile(rootFolder, strcat('A',num2str(n),'.png')));
    
    [labelIdx, scores] = predict(categoryClassifier, img);
    
    categoryClassifier.Labels(labelIdx) % Display the string label
    
    if(labelIdx==1)
        imwrite(img,strcat('F:\Dropbox\FaceClassificationSystem\Database\Me\pass',num2str(n),'.png'));
    end
end

