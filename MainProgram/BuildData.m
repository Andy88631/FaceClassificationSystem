clear cam;
cam = webcam(1);  
for n=1:90
   img=snapshot(cam); %photo
   imagesc(img);
   Limg = rgb2lab(img); %RGB=>lab
   Himg = rgb2hsv(img); %RGB=>hsv   
   Gimg = rgb2gray(img); %RGB=>gray   
   Gimg = uint8(Gimg);
   Eimg = edge(Gimg,'canny'); 

   imwrite(img,strcat('/Users/Apple/Dropbox/Coworking/RGB/AMenRGB',num2str(n),'.png'));
   imwrite(Limg,strcat('/Users/Apple/Dropbox/Coworking/LAB/AMenLab',num2str(n),'.png'));
   imwrite(Himg,strcat('/Users/Apple/Dropbox/Coworking/HSV/AMenHsv',num2str(n),'.png'));
   imwrite(Gimg,strcat('/Users/Apple/Dropbox/Coworking/Gray/AMenGray',num2str(n),'.png'));
   imwrite(Eimg,strcat('/Users/Apple/Dropbox/Coworking/Edge/AMenEdge',num2str(n),'.png'));
end