%% 
close all;
clear;
clc;

%% constanst
file = 'videos\sapphire_corridor.mp4';
numberFramesUsed = 300;

%% initalization
% reading video data
obj = VideoReader(file);
% reading number of frames
nframes = get(obj,'NumberOfFrames');
% reading framerate
frameRate = get(obj,'FrameRate');

I = read(obj,1);
output = zeros([size(I,1) size(I,2) 3 nframes], class(I));

%% change stuff
for k=1:numberFramesUsed
    % progress
    display(k/numberFramesUsed*100);
    % read frame
    frame =   read(obj,k);
    % frame normalization
    normalizedFrame = imageNormalizatin(frame);
    
    % feature detection
    %features = featureDetection(frame);
    
    % show image
    % imshow(singleFrame);
    % add to output obj
    output(:,:,:,k)=repmat(normalizedFrame,[1 1 3]);
end
display('done');

%% display stuff
display(nframes);
implay(output,frameRate);
