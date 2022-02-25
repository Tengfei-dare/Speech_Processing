% MATLAB basic introduction
% Chapiter 1

clear all;
close all;
clc;

%% Dialog box
% params for dialog box
dialog_prompt = {'How old are you?','What''s your name?'};
dialog_title = 'A test dialog window';
numlines = 1;
defaultanswer = {'', ''};
options.Resize = 'on';
options.WindowStyle = 'normal';

% create a dialog box to get answer
answers = inputdlg(dialog_prompt,dialog_title,...
    numlines,defaultanswer,options);

% create a dialog box to show answer
icon = 'help';
msgbox(answers, dialog_title, icon);

%% FFT sinus signal 

% params for sinus signal
fs = 100; % freq sampling
N = 128;
n = 0:N-1;
t = n/fs;
f0 = 10; % freq signal
Nf = 2^nextpow2(4*N); % Nf-point fft, padded

% create signal
sinus_signal = sin(2*pi*f0*t);

% fft
sinus_signal_fft = fft(sinus_signal, Nf);
sinus_signal_fft_mag = abs(sinus_signal_fft);
freq_ax = (0: fs*1/Nf : fs*(Nf-1)/Nf);

% ifft
sinus_signal_ifft = ifft(sinus_signal_fft);
sinus_signal_ifft_mag = real(sinus_signal_ifft);
t_ifft = (0:length(sinus_signal_ifft_mag)-1)/fs;

% plot
figure('name','Test FFT and IFFT');

subplot(131);
plot(t, sinus_signal);
xlim([0,max(t)]);
xlabel('time(s)');
ylabel('amp');
title('sinus signal in time domain');
grid on;

subplot(132);
plot(freq_ax, sinus_signal_fft_mag);
xlim([0,max(freq_ax)/2]);
xlabel('frequency(Hz)');
ylabel('amp');
title('sinus signal in frequency domain');
grid on;

subplot(133);
plot(t_ifft, sinus_signal_ifft_mag);
xlim([0,max(t)]);
xlabel('time(s)');
ylabel('amp');
title('sinus signal after ifft');
grid on;


%% FFT noise signal

% params for noise signal
fs = 100; % freq sampling
N = 200;
n = 0:N-1;
t = n/fs;

Nf = 2^nextpow2(4*N); % Nf-point fft, padded

% create signal
noise_signal = rand(1,N);

noise_signal_fft = fft(noise_signal, Nf);
noise_signal_fft_mag = abs(noise_signal_fft);
freq_ax = (0: fs*1/Nf : fs*(Nf-1)/Nf);

% ifft
noise_signal_ifft = ifft(noise_signal_fft);
noise_signal_ifft_mag = real(noise_signal_ifft);
t_ifft = (0:length(noise_signal_ifft_mag)-1)/fs;

% plot
figure('name','Test FFT and IFFT');

subplot(131);
plot(t, noise_signal);
xlim([0,max(t)]);
xlabel('time(s)');
ylabel('amp');
title('Noise signal in time domain');
grid on;

subplot(132);
plot(freq_ax, noise_signal_fft_mag);
xlim([0,max(freq_ax)/2]);
xlabel('frequency(Hz)');
ylabel('amp');
title('Noise signal in frequency domain');
grid on;

subplot(133);
plot(t_ifft, noise_signal_ifft_mag);
xlim([0,max(t)]);
xlabel('time(s)');
ylabel('amp');
title('Noise signal after ifft');
grid on;



    
    
    