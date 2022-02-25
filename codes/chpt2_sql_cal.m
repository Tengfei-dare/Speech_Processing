% Basic speech processing with matlab
% Chapter 2

clear all;
close all;
clc;

% audio read
filename = "./chpt2_myRecording";
[myAudio,Fs] = audioread(filename);
myAudio = myAudio / max(myAudio); % normalize
t = (0:length(myAudio)-1)/Fs

