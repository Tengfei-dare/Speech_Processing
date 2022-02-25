% Basic speech processing with matlab
% Chapter 2

clear all;
close all;
clc;

% audio read
filename = "./chpt2_myRecording.wav";
[myAudio,Fs] = audioread(filename);
myAudio = myAudio / max(myAudio(:)); % normalize
t = (0:length(myAudio)-1)/Fs;

% noise create
noise = 0.05*rand(length(myAudio), 1);

% linear sum
myAudio_noisy_linear = myAudio + noise;
snr_linear = snr(myAudio_noisy_linear, noise);
% convolution sum
myAudio_noisy_conv = conv(myAudio, noise, 'same');
snr_conv = snr(myAudio_noisy_conv, noise);
% resample
myAudio_2_resampled = resample(myAudio, 2, 1); % output 2 times more samples
t_2 = (0:length(myAudio_2_resampled)-1)/(2/1*Fs); 
myAudio_0_5_resampled = resample(myAudio, 1, 2); % output a half less samples
t_0_5 = (0:length(myAudio_0_5_resampled)-1)/(1/2*Fs);


%% plot
figure('name','speech edit test');
subplot(411);
plot(t, myAudio,'*'); hold on;
plot(t_2, myAudio_2_resampled,'o'); hold on;
plot(t_0_5, myAudio_0_5_resampled,'x'); hold off;
title('audio');
legend('Original','resampled 2 times','resampled 1/2 times')

subplot(412);
plot(t, noise);
title('noise')

subplot(413);
plot(t, myAudio_noisy_linear);
% snr(myAudio_noisy_linear, noise); % plots spectrum
title(['noisy audio with linear added noise, snr = ' num2str(snr_linear)]);

subplot(414);
plot(t, myAudio_noisy_conv);
% snr(myAudio_noisy_conv, noise); % % plots spectrum
title(['noisy audio with noise by convolution, snr = ' num2str(snr_conv)]);

linkaxes();

%% audio play
choice = input('Choose a number to play, 9 to quit\n');

while choice ~= 9
    switch choice
        case 1
            soundsc(myAudio, Fs);
        case 2
            soundsc(noise, Fs);
        case 3
            soundsc(myAudio_noisy_linear, Fs);
        case 4
            soundsc(myAudio_noisy_conv, Fs);
        case 5
            soundsc(myAudio_2_resampled, Fs);
        case 6
            soundsc(myAudio_0_5_resampled, Fs);
        otherwise
            disp('Not found, try anonther number')
    end
    
    choice = input('Choose a number to play, 9 to quit\n');
end






