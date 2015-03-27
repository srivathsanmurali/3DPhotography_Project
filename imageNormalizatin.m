function [ outputFrame ] = imageNormalizatin( inputFrame )
%imageNormalization frame normalization and image noise correction
    % convert to gray scale
    grayFrame = rgb2gray(inputFrame);
    % histogram equalization
    histeqFrame  = histeq(grayFrame);
    
    outputFrame = histeqFrame;
end

