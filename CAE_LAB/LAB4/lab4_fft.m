clc; clear all; close all;

% 폴더 경로 지정
folder_path = 'C:\Users\skrua\Desktop\CAE machine\LAB4\Experiment_data - 복사본'; % 폴더 경로를 실제 폴더 경로로 바꿔주세요.

% 폴더 내 모든 파일 읽어오기
file_list = dir(fullfile(folder_path, '*.txt'));

% 파일별로 데이터 읽어와서 플로팅
for i = 1:length(file_list)
    file_path = fullfile(folder_path, file_list(i).name);
    
    % 파일 읽어오기
    data = importdata(file_path);

    % 주파수와 값 추출
    frequency = data(:, 1);
    amplitude = data(:, 2);

    % 플롯
    figure;
    plot(frequency, amplitude)
    
    % 파일명을 타이틀로 추가
    [~, aluminium_cantilever_fft, ~] = fileparts(file_list(i).name);
    title([ aluminium_cantilever_fft ]);
   
    xlabel('frequencie (Hz)');
    ylabel('siganl');
    grid on;
 end 

 t = -3:0.01:3;
%  impulse_signal = (t == 0);
%  plot(t, impulse_signal)

% % % % % Step 1: Create an impulse signal
% % % %impulse_length = 1000;
% % % % impulse_signal = zeros(1, impulse_length);
% % % % impulse_signal(1) = 1;
% % % % 
% % % % % Step 2: Compute FFT
% % % % fft_result = fft(impulse_signal);
% % % % 
% % % % % Step 3: Plot the magnitude spectrum
% % % %Fs = 1000; % Sample rate, you can adjust this as needed
% % % %frequencies = linspace(0, Fs, impulse_length);
% % % % 
% % % % figure;
% % % % 
% % % % plot(frequencies, abs(fft_result));
% % % % title('Impulse');
% % % % xlabel('Frequency (Hz)');
% % % % ylabel('Magnitude');

%------ unit step(time domain) ------%
%unit_step = fft((t>=0));
%plot(frequencies, abs(unit_step))
% ylim([0,1.2]);
% 
% t1 = linspace(-20,20,5000);



% % Create a unit step function
% unit_step_signal = ones(1, 512); % Length of 512 samples
% 
% % Compute FFT
% fft_result_unit_step = fft(unit_step_signal);
% 
% % Compute frequency axis
% fs_unit_step = 1000; % Set your sampling frequency
% frequencies_unit_step = (0:length(fft_result_unit_step)-1) * fs_unit_step / length(fft_result_unit_step);
% 
% % Plot the magnitude spectrum
% figure;
% plot(frequencies_unit_step, abs(fft_result_unit_step));
% title('FFT of Unit Step Signal');
% xlabel('Frequency (Hz)');
% ylabel('Magnitude');
% grid on;
% 
% % Display only the positive half of the spectrum
% xlim([0, fs_unit_step/2]);
% 
% % Optionally, you can also plot the phase spectrum
% % figure;
% % plot(frequencies_unit_step, angle(fft_result_unit_step));
% % title('Phase Spectrum');
% % xlabel('Frequency (Hz)');
% % ylabel('Phase');
% % grid on;



% % Set parameters for the sinusoidal signal
% f = 5; % Frequency of the sinusoidal signal in Hz
% fs = 1000; % Sampling frequency in Hz
% t = 0:1/fs:1; % Time vector from 0 to 1 second
% 
% % Create the sinusoidal signal
% sinusoidal_signal = sin(2*pi*f*t);
% 
% % Compute FFT
% fft_result_sinusoidal = fft(sinusoidal_signal);
% 
% % Compute frequency axis
% frequencies_sinusoidal = (0:length(fft_result_sinusoidal)-1) * fs / length(fft_result_sinusoidal);
% 
% % Plot the magnitude spectrum
% figure;
% plot(frequencies_sinusoidal, abs(fft_result_sinusoidal));
% title('FFT of Sinusoidal Signal');
% xlabel('Frequency (Hz)');
% ylabel('Magnitude');
% grid on;

% Display only the positive half of the spectrum
% xlim([0, fs/2]);

% Optionally, you can also plot the phase spectrum
% figure;
% plot(frequencies_sinusoidal, angle(fft_result_sinusoidal));
% title('Phase Spectrum');
% xlabel('Frequency (Hz)');
% ylabel('Phase');
% grid on;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
% Set parameters for the sinusoidal signal
% f = 3; % Frequency of the sinusoidal signal in Hz
% 
% a=sin(f*t);
% 
% % Plot the sinusoidal signal in the time domain
% figure;
% plot(t, a);
% grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % Define the unit step function
% t = linspace(-5, 5, 1000);  % Adjust the time range as needed
% u = heaviside(t);
% 
% % Compute the FFT
% U = fft(u);
% 
% % Compute the frequency axis
% Fs = 1 / (t(2) - t(1));  % Sampling frequency
% f = linspace(0, Fs, length(U));
% 
% 
% 
% plot(f, abs(U));
% title('FFT of Unit Step Function');
% xlabel('Frequency (Hz)');
% 
% ylim([-0 50]);
% xlim([-1 30]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % Parameters
% f = 6;  % Frequency of the sine wave in Hz
% Fs = 100;  % Sampling frequency
% T = 1 / Fs;  % Sampling period
% t = 0:T:1;  % Time vector from 0 to 1 second
% 
% % Create a sine wave
% x = sin(2 * pi * f * t);
% 
% % Compute the FFT
% X = fft(x);
% 
% % Compute the frequency axis
% frequencies = linspace(0, 100, length(X));
% 
% % Plot the results
% subplot(2, 1, 1);
% plot(t, x);
% title('Sine Wave');
% 
% subplot(2, 1, 2);
% plot(frequencies, abs(X));
% title('FFT of Sine Wave');
% xlabel('Frequency (Hz)');
