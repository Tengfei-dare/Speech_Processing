% SPL calculation with matlab
% Chapter 2

clear all;
close all;
clc;

% audio read
filename = "./chpt2_myRecording.wav";
[myAudio,Fs] = audioread(filename);
myAudio = myAudio(:,1); % choose only one channel
myAudio = myAudio / max(myAudio(:)); % normalize
n_sample = length(myAudio);

% compute SPL
t_win = 30 / 1000; % compute for each window of 30ms
n_win = floor(t_win*Fs); % number of samples
i_win = 1:n_win:n_sample-n_win; % start index

spl = zeros(length(i_win),1);
index = 1;
for i = i_win
    spl(index) = spl_cal(myAudio(i:i+n_win));
    index = index + 1;
end

%% plot audio and its spl by window
figure('name','SPL compute');
plot(myAudio,'r'); hold on;
plot(i_win, spl,'b'); hold off;
legend('Audio','SPL');
ylabel('SPL[dB] & Amplitude');

%% Plot ISO 226:2003 Normal equal-loudness-level contours
phons = 20:10:80;
[spl,f] = iso226(phons,[],true);

% plot
figure('name','ISO 226:2003 Normal equal-loudness-level contours'); 
semilogx(f,spl);
set(gca,'xlim',[min(f(:)) max(f(:))]);
legend(num2str(phons'),'location','southwest');
title('Equal loudness contours for different loudness levels (in phons)');
xlabel('Frequency [Hz]');
ylabel('SPL [dB]');













