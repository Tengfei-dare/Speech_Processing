clear all; 
clc; 
close all;

N = 150; % total time samples
fs = 8000;
dt = 1/fs;
x = zeros(1,N);

N1 = 50;
N2 = 20;

x(1:N1) = 0.5*(1-cos(pi*((1:N1)/(N1))));
x(N1+1:N1+N2) = cos(pi*(1:N2)/(2*N2));
X = fft(x);

pos = get(gcf,'Position');
set(gcf,'Position',[pos(1), pos(2)-100, pos(3)+200, (pos(4)-100)]);


subplot 121; 
plot(1:N,x,'k'); ylim([-0.2 1.2]);
line([0 N],[0 0],'color','b'); % reference line x=0
hold on; % line() will not delect the previous graph but plot() do
plot([N1,N1],[0,x(N1)],'--k'); % reference line x=N1
hold on; 
plot([0,N1],[x(N1),x(N1)],'--k'); % reference line y=x(N1)
text(N1,0,['N_1'],'color','k') % a point
text(N1+N2,0,['N_1+N_2'],'color','k') % a point
ylabel('g(n)'); xlabel('t');

subplot 122;
plot((1:N1+N2+1)/10,20*log10(abs(X(1:N1+N2+1))),'k');
line([0 4],[0 0],'color','b'); % reference line x=0
axis([0 4 -35 35]);
ylabel('20logG/dB');
xlabel('f/kHz');