% Basic speech record and play with matlab
% Chapter 2

clear all;
close all;
clc;

%% Audiorecorder
Fs = 11025;
nBits = 16; 
nChannels = 2;
record_time = 5;

myRecording = audiorecorder(Fs, nBits, nChannels);

disp('Press any key and start to speak'); pause;
disp('Recordings...');
recordblocking(myRecording, record_time);

disp('Press any key to play the audio'); pause;
play(myRecording);


%% get audio data into array and play it as sound
array_myRecording = getaudiodata(myRecording);
plot(array_myRecording);
title('My Audio Signal (double)');

% Scale data to 0~1 and play as sound
soundsc(array_myRecording, Fs);

%% audio write and read
filename = "./chpt2_myRecording.wav";
audiowrite(filename, array_myRecording, Fs);

info = audioinfo(filename);
disp(info);

[myRecording_readed,Fs] = audioread(filename);
soundsc(array_myRecording, Fs);
