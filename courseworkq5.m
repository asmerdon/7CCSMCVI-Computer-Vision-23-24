% Import woods image:
I = imread("woods.png");
Id = im2double(I);

% Create Gaussian:
g = fspecial("Gaussian", 9, 1.5);

% Compute Laplacian pyramid
laplacian1 = Id - conv2(Id, g, "same");
downsampled1 = imresize(Id, 0.5, 'nearest');
laplacian2 = downsampled1 - conv2(downsampled1, g, "same");
downsampled2 = imresize(downsampled1, 0.5, 'nearest');
laplacian3 = downsampled2 - conv2(downsampled2, g, "same");

% Display the images in the pyramid as subplots
figure;
subplot(2,2,1), imshow(Id), title('Original Image');
subplot(2,2,2), imshow(laplacian1), title('Level 1 Laplacian');
subplot(2,2,3), imshow(laplacian2), title('Level 2 Laplacian');
subplot(2,2,4), imshow(laplacian3), title('Level 3 Laplacian');

%Answers:
laplacian3(1,9)
laplacian3(5,8)