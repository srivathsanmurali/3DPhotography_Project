function [ outputFrame ] = imageNormalizatin( inputFrame )
%imageNormalization frame normalization and image noise correction
    % convert to gray scale
    grayFrame = rgb2gray(inputFrame);
    
    %median filter
    medianFrame = medfilt2(grayFrame);

    % sharpen image
    sharpenedImage = imsharpen(medianFrame);

    % edge detection
    outputFrame = edge(sharpenedImage,'Prewitt');
    
end

