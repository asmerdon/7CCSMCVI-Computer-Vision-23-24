I1=rand(1000,1000);
I2=rand(1000,1000);
Isum=I1+I2;

ImultA=I1*I2;
ImultB=I1.*I2;

Ia=imread('rooster.jpg');
Ib=imread('elephant.png');
whos
%This displays the image of the rooster which you read from a file
%earlier.%

figure(1), subplot(2,2,1), imagesc(Ia); title('RGB image');

%This displays the intensities of the individual R, G, and B channels that
%make up the image. You will notice that the rooster's crest and neck feathers have high intensity in the red channel, while the grass has high intensity in the green channel.%
subplot(2,2,2), imagesc(Ia(:,:,1)); title('red channel'); colorbar
subplot(2,2,3), imagesc(Ia(:,:,2)); title('green channel'); colorbar
subplot(2,2,4), imagesc(Ia(:,:,3)); title('blue channel'); colorbar

%This will change the colours used to represent the intensity values in the
%red, green, and blue channels%
colormap('gray')

%This displays the elephant image. The colour map shows dark pixels as blue
%and light pixels as yellow.%
figure(2), imagesc(Ib); colorbar
%Grayscales colour map.%
colormap('gray')
%Turns axis on or off:%
figure(2), axis('off')
%Removes numbers labelling the axes:%
axis('equal')

%To see the raw numerical values, tyle Ib.%
%To be more selective, specify (3rd row):%
Ib(3,:)
%3rd column:%
Ib(:,3)
%First 6 rows of the first 4 colums:%
Ib(1:6,1:4)
%Specifying the colour is done by adding an extra number (1 for red):%
Ia(1:6,1:4,1)
%2 for green:%
Ia(1:6,1:4,2)
%To obtain the value at row 3, column 4:"
Ib(3,4)
%Excercise 2:
Ib(209,309)

%Excercise 3:
IaIntensity=rgb2gray(Ia);
IaDouble=im2double(IaIntensity);
IaDouble(149,30)
save('week1labs.mat');
imwrite(IaDouble, 'rooster_grey.jpg','jpg')