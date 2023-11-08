clc; clear; close all;

%%%%%%%%%%%%%% Load the acoustic signal data %%%%%%%%%%%%%%
directory1 = 'E:\docker\updated_dataset\original_dataset\L7cm_50mJ_90d';
data = readmatrix(fullfile(directory1, 'original_tek0584CH1.csv'));

figure;
plot (data,'linewidth',1);
xlabel('Time(s)')
ylabel('Voltage(V)')
title ('Actual Time domain plot')
%ylim ([-6,6]) %%%change
grid on

%%%%%%%%%%%%%% Frequency domain plot:1 %%%%%%%%%%%%%%
dt = 1e-8; %sampling interval
Fs = 1/dt; %2.5e9 %1/dt
t_f = fft(data);
t_f_10ms = fftshift(abs(t_f));
m = length(t_f);
freq = (-m/2:(m/2-1))*Fs/(m-1);
figure;
plot (freq,t_f_10ms,'lineWidth',1);
title ('FFT method 1')
xlim ([0,4.8e5])
grid on

%%%%%%%%%%%%%% Frequency domain plot:2 %%%%%%%%%%%%%%
fft_data = fft(data);
freq_axis = linspace(0, Fs, size(data, 1));
figure;
plot(freq_axis, abs(fft_data));
title('FFT method 2');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
xlim([15e0, 480e3]);


y2 = ifft(t_f);
figure;
plot (y2,'lineWidth',1);
title ('IFFT 1')
%xlim ([-2e-5,10e-3])
grid on

y3 = ifft(fft_data);
figure;
plot (y3,'lineWidth',1);
title ('IFFT 2')
%xlim ([-2e-5,10e-3])
grid on