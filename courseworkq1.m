%Setup woods image.
I = imread("woods.png");
Id = im2double(I);
%Create DoG mask.
g1 = fspecial("Gaussian",15,2.5);
g2 = fspecial("Gaussian",15,1);
DoG = g2-g1;
%Convolve.
IdDoG = conv2(Id, DoG, 'same');
imagesc(IdDoG)
disp('Image with DoG mask:')
IdDoG(3,110)
% Initialize arrays to store correlation coefficients and shift values.
correlation_coefficients = zeros(1, 31);
shift_values = 0:30;

for k = 1:length(shift_values)
    % Shift the image vertically.
    shifted_image = circshift(IdDoG, [shift_values(k), 0]);
    
    % Calculate correlation coefficient between the shifted image and original DoG convolved image.
    correlation_coefficients(k) = corr2(IdDoG, shifted_image);
end

% Plot the correlation coefficients against shift values.
plot(shift_values, correlation_coefficients, '-o');
xlabel('Vertical Shift (Pixels)');
ylabel('Correlation Coefficient');
title('Correlation Coefficients vs Vertical Shift');
grid on;