function [ outputFrame ] = imageNormalizatin( inputFrame )
%imageNormalization frame normalization and image noise correction
    % convert to gray scale
    grayFrame = rgb2gray(inputFrame);
    grayFrame = grayFrame(1:2:end,1:2:end);
    grayFrame = medfilt2(grayFrame);
    % edge detection
    canny_thresh = [0.1 0.2]; % you might need to
    canny_sigma = 5; % change these for your image
    outputFrame = edge(grayFrame,'canny',canny_thresh,canny_sigma);
       
end

