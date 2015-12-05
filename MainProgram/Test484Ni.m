close all;
clear cam;
cam      = webcam(1);  
Detector = vision.CascadeObjectDetector();

while(1)
img=snapshot(cam); %photo
%img= rgb2hsv(img); 

bbox     = step(Detector, img);
videoOut = insertObjectAnnotation(img,'rectangle',bbox,'Face');
figure(1)
imshow(videoOut),
title('Detected face');

[imageIDs, scores] = retrieveImages(img, ImageIndex, 'NumResults',1);
scores   = scores*100;
title(num2str(scores(:,1)));

if (scores >= 2)
    figure(2)
    imshow('94NI68.png')
    pause(2) %pause for 2 seconds.
    break
elseif(scores < 0.1)
    figure(3)
    imshow('94NI886.png')
    title('Please try again!');
    pause(2)
    close(figure(3))
end

end