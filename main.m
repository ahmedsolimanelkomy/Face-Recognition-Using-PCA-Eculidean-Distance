clear all
close all
clc

Training_Path = 'D:\EELU\semester 7\Project 1\project\Face-Recognition-Using-PCA\TrainDatabase';  %Set your directory for training data file
Testing_Path = 'D:\EELU\semester 7\Project 1\project\Face-Recognition-Using-PCA\TestDatabase';    %Set your directory for testing data file

disp('Pick a Testing Photo From TestDatabase please')
[filename, pathname] = uigetfile({'*.jpg'},'Pick a Testing Photo From TestDatabase please');
disp('Hold a second for recognition')
TestImage = [pathname, filename];
im = imread(TestImage);

Training_Data = ReadFace(Training_Path);
[m, A, Eigenfaces] = EigenfaceCore(Training_Data);
OutputName = Recognition(TestImage, m, A, Eigenfaces);

SelectedImage = strcat(Training_Path,'\',OutputName);
SelectedImage = imread(SelectedImage);

Visualize_Eigenface(Eigenfaces,128,128);

figure('name','Recognition Result')
subplot(1,2,1);
imshow(im)
title('Test Image');

subplot(1,2,2);
imshow(SelectedImage);
title('Recognition Result');
disp('Done')
