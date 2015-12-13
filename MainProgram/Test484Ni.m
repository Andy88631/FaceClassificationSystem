close all;
clear cam;
cam      = webcam(1);  
Detector = vision.CascadeObjectDetector();
a = arduino('/dev/tty.usbmodemFD111', 'uno');
s = servo(a, 'D4', 'MinPulseDuration', 1000*10^-6,...
    'MaxPulseDuration', 2300*10^-6);
angle = 0;
writePosition(s, angle);

while(1)
img=snapshot(cam); %photo
%img= rgb2hsv(img); 

bbox     = step(Detector, img);
videoOut = insertObjectAnnotation(img,'rectangle',bbox,'Face');
figure(1)
imshow(videoOut),

[imageIDs, scores] = retrieveImages(img, ImageIndex, 'NumResults',1);
scores   = scores*100;
title(num2str(scores(:,1)));

if (scores >= 0.8)   
    for angle = 0:0.5:1
        writePosition(s, angle);
        current_pos = readPosition(s);
        current_pos = current_pos*180;
        fprintf('Current motor position is %d degrees\n', current_pos);
        pause(1);
    end
    clear s a
    break
elseif(scores < 0.1)
    figure(3)
    imshow('94NI886.png')
    title('Please try again!');
    pause(2)
    close(figure(3))
end

end