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

% noise create
noise = 0.05*rand(1, length(myAudio));

% linear sum
myAudio_noisy_linear = myAudio + noise;
snr_linear = snr(myAudio_noisy_linear, noise);
% convolution sum
myAudio_noisy_conv = conv(myAudio, noise, 'same');
snr_conv = snr(myAudio_noisy_conv, noise);
% resample
myAudio_2_resampled = resample(myAudio, 2, 1) % output 2 times more samples
t_2 = (0:length(myAudio_2_resampled)-1)/(2/1*Fs) 
myAudio_0_5_resampled = resample(myAudio, 1, 2) % output a half less samples
t_0_5 = (0:length(myAudio_2_resampled)-1)/(1/2*Fs) 


%% plot
figure('name','speech edit test');
subplot(611);
plot(t, myAudio);
title('orginal audio');

subplot(612);
plot(t, noise);
title('noise')

subplot(613);
plot(t, myAudio_noisy_linear);
% snr(myAudio_noisy_linear, noise); % plots spectrum
title('noisy audio with linear added noise' + 'snr = ' + snr_linear);

subplot(614);
plot(t, myAudio_noisy_conv);
% snr(myAudio_noisy_conv, noise); % % plots spectrum
title('noisy audio with noise by convolution' + 'snr = ' + snr_conv);

subplot(615);
plot(t_2, myAudio_2_resampled);
title('noisy audio resampled 2 times');

subplot(616);
plot(t_0_5, myAudio_0_5_resampled);
title('noisy audio resampled 1/2 times');


%% audio play
while choice != 0
    choice = input('Choose a number to play, 0 to quit');
    
    switch choice
    case 1
        soundsc(myAudio);
    case 2
        soundsc(noise);
    case 3
        soundsc(myAudio_noisy_linear);
    case 4
        soundsc(myAudio_noisy_conv);
    case 5
        soundsc(myAudio_2_resampled);
    case 6
        soundsc(myAudio_0_5_resampled);
    otherwise
        disp('Not found, try anonther number')
    end
    
end






