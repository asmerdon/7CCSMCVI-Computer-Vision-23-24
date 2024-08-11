% Given Laplacian mask
laplacian_mask = [-1/8, -1/8, -1/8; -1/8, 1, -1/8; -1/8, -1/8, -1/8];
gaussian_mask_1p5 = fspecial('gaussian', 9, 1.5);
gaussian_mask_5 = fspecial('gaussian', 30, 5);
% Convolve Laplacian mask with Gaussian masks to obtain LoG masks
LoG_mask_1p5 = conv2(gaussian_mask_1p5, laplacian_mask, 'same');
LoG_mask_5 = conv2(gaussian_mask_5, laplacian_mask, 'same');

%Import woods image:
I = imread("woods.png");
Id = im2double(I);

% Convolve the woods image with the LoG masks
result_1p5 = conv2(Id, LoG_mask_1p5, 'same');
result_5 = conv2(Id, LoG_mask_5, 'same');

%Results
result_1p5(2,127)
result_1p5(151,62)

result_5(2,127)
result_5(151,62)

% Plot LoG mask with standard deviation 1.5 in subplot(2,2,1)
subplot(2,2,1);
mesh(LoG_mask_1p5);
title('LoG Mask (\sigma = 1.5)');
xlabel('X');
ylabel('Y');
zlabel('Amplitude');

% Plot LoG mask with standard deviation 5 in subplot(2,2,2)
subplot(2,2,2);
mesh(LoG_mask_5);
title('LoG Mask (\sigma = 5)');
xlabel('X');
ylabel('Y');
zlabel('Amplitude');

% Plot the result of convolution with LoG mask (sigma = 1.5) in subplot(2,2,3)
subplot(2,2,3);
imagesc(result_1p5);
colormap('gray');
title('Convolution with LoG (\sigma = 1.5)');
axis equal;
axis tight;

% Plot the result of convolution with LoG mask (sigma = 5) in subplot(2,2,4)
subplot(2,2,4);
imagesc(result_5);
colormap('gray');
title('Convolution with LoG (\sigma = 5)');
axis equal;
axis tight;