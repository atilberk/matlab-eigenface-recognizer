% COMP 408 Assignment 3
% Atılberk Çelebi 29375

clear all
clc

%% DATA
srcTrain = dir('data/train/*.jpg');  % the training data
X = loadData(srcTrain);

%% TRAINING

% off-line training
[efv, efM] = trainFaces(X); % get trained vectors and values
save('eigenfaces.mat', 'efv', 'efM'); % save

%% RECONSTRUCTION TEST

reconstruction_test = true;

if reconstruction_test
    reconstructFace(imread('data/reconstruct.jpg'));  
end

%% DETECTION and RECOGNITION

disp('Starting to test:')
srcTest = dir('data/test/*.jpg');  % the test data
K = length(srcTest);
for i = 1 : K
    filename = strcat('data/test/',srcTest(i).name);
    isFace = detectFace(filename); % detect
    if isFace == 1; 
        recogniseFace(filename, srcTrain); % recognise
    end
end

