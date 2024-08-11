I = imread('rooster.jpg');
Id = im2double(I);
%Create gaussians:
gc=fspecial('gaussian',15,2.35);
gs=fspecial('gaussian',15,2.35);
%Yellow channel:
Y=mean(Id(:,:,1:2),3);
IaBY=conv2(Y,gc,'same')-conv2(Id(:,:,3),gs,'same');
imagesc(IaBY)
%Output
IaBY(241,10)
IaBY(119,278)

