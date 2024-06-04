function processImageSet(imgSetIndex, totalImages, imgSets, bag, path)
    % Process images in an image set using common image processing steps
    
    for k = 1 : totalImages
        img = read(imgSets(imgSetIndex), k);
        % Convert to grayscale
        grey_image = rgb2gray(img);
        % Image enhancement
        enhanced_image = adapthisteq(grey_image);
        % Noise reduction
        denoised_image = imnlmfilt(enhanced_image);
        % Encode and write to Excel
        xlswrite(path, encode(bag, denoised_image), num2str(imgSetIndex), sprintf('A%d', k));
    end
    
    end
    