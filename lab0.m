%% Task 1
clear all; close all; clc
Fs=48000;   %48kHz, sample rate
L=100;  %100, number of samples
f=[2300 23000 36000];   %2.3kHz, 23kHz, 36kHz

%sinusoids
n=0:(1/Fs):((L/Fs)-(1/Fs));
x1=sin(2*pi*f(1)*n);
x2=sin(2*pi*f(2)*n);
x3=sin(2*pi*f(3)*n);

figure;
subplot(3,1,1);
plot(n,x1); title('f_1=2.3kHz'); ylabel('x_1'); xlabel('n');
subplot(3,1,2);
plot(n,x2); title('f_2=23kHz'); ylabel('x_2'); xlabel('n');
subplot(3,1,3);
plot(n,x3); title('f_3=36kHz'); ylabel('x_3'); xlabel('n');

figure;
subplot(3,1,1);
stem(n,x1); title('f_1=2.3kHz'); ylabel('x_1'); xlabel('n');
subplot(3,1,2);
stem(n,x2); title('f_2=23kHz'); ylabel('x_2'); xlabel('n');
subplot(3,1,3);
stem(n,x3); title('f_3=36kHz'); ylabel('x_3'); xlabel('n');

%% task 1 test 1
t=0:(1/Fs):((L/Fs)-(1/Fs));
x1=sin(2*pi*f(1)*t);
figure;
stem(t,x1)

%% task 1 test 2
w=[2*pi*f(1) 2*pi*f(2) 2*pi*f(3)];  %w=2*pi*f rad/s
n=0:1/Fs:((L/Fs)-(1/Fs));
figure;
stem(n,sin(n*w(1)))

%% task 1 test 3
Fs = 48000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 100;             % Length of signal
t = (0:L-1)*T;        % Time vector

signal=sin(2*pi*f(1)*t);
stem(t,signal)
%concl.: all same methods

%% Task 2 test
clear all; close all; clc
Fs=48000;   %48kHz, sample rate
L=100;  %100, number of samples
f=[2300 23000 36000];   %2.3kHz, 23kHz, 36kHz

%sinusoids
n=0:(1/Fs):((L/Fs)-(1/Fs));
x1=sin(2*pi*f(1)*n);
x2=sin(2*pi*f(2)*n);
x3=sin(2*pi*f(3)*n);
x=x1+x2+x3;

%signals x1, x2, x3
%L=64;  %look here
X=fft(x,64);    %64point-fft
P2=abs(X/L);
P1=P2(1:L/2+1);
P1(2:end-1)=2*P1(2:end-1);
freq = Fs*(0:(L/2))/L;
plot(freq,P1);
%xlim([0 4000]);

%mapping (0-48000) to (0-2pi)

%% Task 2 fft() in frequency
clear all; close all; clc
Fs=48000;   %48kHz, sample rate
L=100;  %100, number of samples
f=[2300 23000 36000];   %2.3kHz, 23kHz, 36kHz

%sinusoids
n=0:(1/Fs):((L/Fs)-(1/Fs));
x1=sin(2*pi*f(1)*n);
x2=sin(2*pi*f(2)*n);
x3=sin(2*pi*f(3)*n);

N=64;

X1=fft(x1,N);
X2=fft(x2,N);
X3=fft(x3,N);

P1=X1.*conj(X1)/N;
P2=X2.*conj(X2)/N;
P3=X3.*conj(X3)/N;
f=Fs*(0:0.5*N)/N;

figure;
subplot(3,1,1);
plot(f,P1(1:0.5*N+1)); title('FFT (f_1=2.3kHz)'); ylabel('X_1'); xlabel('frequency');
subplot(3,1,2);
plot(f,P2(1:0.5*N+1)); title('FFT (f_2=23kHz)'); ylabel('X_2'); xlabel('frequency');
subplot(3,1,3);
plot(f,P3(1:0.5*N+1)); title('FFT (f_3=36kHz)'); ylabel('X_3'); xlabel('frequency');

%% Task 2 fft() in radians
clear all; close all; clc
Fs=48000;   %48kHz, sample rate
L=100;  %100, number of samples
f=[2300 23000 36000];   %2.3kHz, 23kHz, 36kHz

%sinusoids
n=0:(1/Fs):((L/Fs)-(1/Fs));
x1=sin(2*pi*f(1)*n);
x2=sin(2*pi*f(2)*n);
x3=sin(2*pi*f(3)*n);

N=64;

X1=fft(x1,N);
X2=fft(x2,N);
X3=fft(x3,N);

P1=X1.*conj(X1)/N;
P2=X2.*conj(X2)/N;
P3=X3.*conj(X3)/N;
f=Fs*(0:0.5*N)/N;
%rad=f*2*pi/size(f,2);
rad=linspace(0,2*pi,size(f,2)); %# of rad points = # freq points

figure;
subplot(3,1,1);
plot(rad,P1(1:0.5*N+1)); title('FFT (f_1=2.3kHz)'); ylabel('X_1'); xlabel('frequency');
set(gca,'XTick',0:pi/2:2*pi) 
set(gca,'XTickLabel',{'0','pi/2','pi','3*pi/2','2*pi'})
subplot(3,1,2);
plot(rad,P2(1:0.5*N+1)); title('FFT (f_2=23kHz)'); ylabel('X_2'); xlabel('frequency');
set(gca,'XTick',0:pi/2:2*pi) 
set(gca,'XTickLabel',{'0','pi/2','pi','3*pi/2','2*pi'})
subplot(3,1,3);
plot(rad,P3(1:0.5*N+1)); title('FFT (f_3=36kHz)'); ylabel('X_3'); xlabel('frequency');
set(gca,'XTick',0:pi/2:2*pi) 
set(gca,'XTickLabel',{'0','pi/2','pi','3*pi/2','2*pi'})
%% Task 2 FFT(x1+x2+x3) in frequency
clear all; close all; clc
Fs=48000;   %48kHz, sample rate
L=100;  %100, number of samples
f=[2300 23000 36000];   %2.3kHz, 23kHz, 36kHz

%sinusoids
n=0:(1/Fs):((L/Fs)-(1/Fs));
x1=sin(2*pi*f(1)*n);
x2=sin(2*pi*f(2)*n);
x3=sin(2*pi*f(3)*n);
x=x1+x2+x3;

N=64;   %64 point-fft
x=x1+x2+x3;
X=fft(x,N);    %N point-fft
Pxx=X.*conj(X)/N;
f=Fs*(0:0.5*N)/N;
figure;
plot(f,Pxx(1:0.5*N+1));
title('FFT (in frequency)'); xlabel('frequency (Hz)'); ylabel('X=fft(x_1+x_2+x_3)');

%% Task 5
clear all; close all; clc
Fs=48000;   %48kHz, sample rate
L=100;  %100, number of samples
f=[2300 23000 36000];   %2.3kHz, 23kHz, 36kHz

%sinusoids
n=0:(1/Fs):((L/Fs)-(1/Fs));
x1=sin(2*pi*f(1)*n);
x2=sin(2*pi*f(2)*n);
x3=sin(2*pi*f(3)*n);

%% write to WAV file
filename1='signal_1.wav';
audiowrite(filename1,x1,Fs);

filename2='signal_2.wav';
audiowrite(filename2,x2,Fs);

filename3='signal_3.wav';
audiowrite(filename3,x3,Fs);

% on linux terminal run:
% gcc -lm -o skeleton Lab0.c $(pkg-config sndfile --cflags --libs)
% ./skeleton signal_1.wav output_1.wav

%% read output file into MATLAB
[y1,Fs1] = audioread('output_1.wav');
[y2,Fs2] = audioread('output_2.wav');
[y3,Fs3] = audioread('output_3.wav');

% plot
figure;
subplot(3,1,1);
plot(n,x1); hold on;
plot(n,y1);title('f_1=2.3kHz'); ylabel('amplitude'); xlabel('n');
legend('x1','y1'); hold off;
subplot(3,1,2);
plot(n,x2); hold on;
plot(n,y2); title('f_2=23kHz'); ylabel('amplitude'); xlabel('n');
legend('x2','y2'); hold off;
subplot(3,1,3);
plot(n,x3); hold on;
plot(n,y3); title('f_3=36kHz'); ylabel('amplitude'); xlabel('n');
legend('x3','y3'); hold off;


%% example time domain
%http://matlab.izmiran.ru/help/techdoc/ref/fft.html
t = 0:0.001:0.6;
x = sin(2*pi*50*t)+sin(2*pi*120*t);
y = x + 2*randn(size(t));
plot(1000*t(1:50),y(1:50))
title('Signal Corrupted with Zero-Mean Random Noise')
xlabel('time (milliseconds)')

%% example frequency domain
Y = fft(y,512);
Pyy = Y.* conj(Y) / 512;
f = 1000*(0:256)/512;
plot(f,Pyy(1:257))
title('Frequency content of y')
xlabel('frequency (Hz)')