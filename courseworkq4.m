%Create DoG mask:
% g1 = fspecial('gaussian', 36, 6);
% g2 = fspecial('gaussian', 18, 3);
% dog = g1 - g2;

% Create LoG Mask with standard deviation 3.0
gaussian_mask_3 = fspecial('gaussian', 18, 3.0);
laplacian_mask = [-1/8, -1/8, -1/8; -1/8, 1, -1/8; -1/8, -1/8, -1/8];
log_mask = conv2(gaussian_mask_3, laplacian_mask, 'same');
log_mask = log_mask ./ max(log_mask(:)); % Normalize LoG mask

best_similarity_measure = Inf; % Initialize with a large value

% Loop through different standard deviations for the two Gaussians
for std_dev1 = 0.1:0.1:20 % Vary std_dev1 from 0.1 to 10 in steps of 0.10
    for std_dev2 = 0.1:0.1:20 % Vary std_dev2 from 0.1 to 10 in steps of 0.10
        
        % Create DoG mask with current standard deviations
        g1 = fspecial('gaussian', 18, std_dev1);
        g2 = fspecial('gaussian', 18, std_dev2);
        g2_resized = imresize(g2, [18,18]);
        dog_mask = g1 - g2_resized;
        dog_mask = dog_mask - mean(dog_mask(:)); % Normalize DoG mask
        
        % Resize DoG mask to match the size of LoG mask
        dog_resized = imresize(dog_mask, [18, 18]);
        
        % Calculate similarity measure between DoG and LoG masks
        similarity_measure = sqrt(sum(sum((dog_resized - log_mask).^2)));
        
        % Update best similarity measure and standard deviations if current measure is smaller
        if similarity_measure < best_similarity_measure
            best_similarity_measure = similarity_measure;
            best_std_dev1 = std_dev1;
            best_std_dev2 = std_dev2;
        end
    end
end

disp(['Best Standard Deviation for Gaussian 1: ', num2str(best_std_dev1)]);
disp(['Best Standard Deviation for Gaussian 2: ', num2str(best_std_dev2)]);
disp(['Best Similarity Measure: ', num2str(best_similarity_measure)]);



% % Initialize variables for best match and corresponding standard deviations
% best_match_distance = Inf;
% best_sigma1 = NaN;
% best_sigma2 = NaN;
% 
% % Iterate over possible standard deviations for both Gaussians
% for sigma1 = 1.0:0.1:6.0
%     for sigma2 = 1.0:0.1:sigma1-0.1
% 
%         % Create DoG Mask
%         gaussian1 = fspecial('gaussian', [15, 15], sigma1);
%         gaussian2 = fspecial('gaussian', [15, 15], sigma2);
%         dog_mask = gaussian1 - gaussian2;
% 
%         % Scale masks to have the same amplitude
%         log_mask_scaled = log_mask ./ max(log_mask(:));
%         dog_mask_scaled = dog_mask ./ max(dog_mask(:));
% 
%         % Calculate Euclidean distance between masks
%         distance = sqrt(sum(sum((dog_mask_scaled - log_mask_scaled).^2)));
% 
%         % Check if the current distance is the best match
%         if distance < best_match_distance
%             best_match_distance = distance;
%             best_sigma1 = sigma1;
%             best_sigma2 = sigma2;
%         end
%     end
% end
% 
% fprintf('Smaller standard deviation = %.4f\n', best_sigma2);
% fprintf('Larger standard deviation = %.4f\n', best_sigma1);
