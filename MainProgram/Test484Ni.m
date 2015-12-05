close all;
clear cam;
cam=webcam(1);  

while(1)
img=snapshot(cam); %photo
%img= rgb2hsv(img); 

[imageIDs, scores] = retrieveImages(img, ImageIndex, 'NumResults',1);

figure(1)
imagesc(img); 
scores = scores*100;
title(num2str(scores(:,1)));

if (scores >= 0.9)
    figure(2)
    imshow('94NI68.png')
    pause(2) %pause for 2 seconds.
    break
elseif(scores < 0.01)
    figure(3)
    imshow('94NI886.png')
    title('Please try again!');
end

end

