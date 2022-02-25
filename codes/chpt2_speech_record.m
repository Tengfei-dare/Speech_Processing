% Basic speech processing with matlab
% Chapter 2

clear all;
close all;
clc;

%% Wavrecord
% use PC-based audio input device
Fs = 1024;
t = 5;
sounds = wavrecord(t*Fs, Fs);
wavplay(sounds, Fs);
