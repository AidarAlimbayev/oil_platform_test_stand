%=================================================================
%============= Accelerometer Vector Skeleton Code ================
%=================================================================

%% 1. Specifies the COM port that the Arduino board is connected to
comPort = 'com5';

%% 2. Initialize the Serial Port - setupSerial()

% connect MATLAB to the accelerometer
if(~exist('serialFlag', 'var'))
    [fsr.s, serialFlag] = setupSerial(comPort);
end

% %% 3. Run a calibration routine if needed - calibrate()
% 
% % if accelerometer is not calibrated, calibrate now
% if(~exist('calCo', 'var'))
%     calCo = calibrate(fsr.s);
% end

%% 4. Open a new figure - add start/stop and close serial buttons

% initialize the figure that we will plot in if it does not exist
if(~exist('h', 'var')|| ~ishandle(h))
    h = figure(1);
    ax = axes('box', 'on');
end

% add a start/stop and close serial buttone inside the figure
% Keep in mind the 'stop_call_wk3' function that this button calls
% everytime it is pressed

if(~exist('button', 'var'))
    button = uicontrol('Style', 'pushbutton', 'String', 'Stop', 'pos', [0 0 50 25], 'parent', h,...
        'Callback', 'closeSerial', 'UserData', 1);
end
%% 4.1 Initializing the Rolling Plot
% The rolling plot works like vector code. Set it up in the same manner.

buf_len0 = 100;
buf_len1 = 100;
buf_len2 = 100;
buf_len3 = 100;
buf_len4 = 100;
buf_len5 = 100;
buf_len6 = 100;
buf_len7 = 100;
buf_len8 = 100;
buf_len9 = 100;
buf_len10 = 100;
buf_len11 = 100;
buf_len12 = 100;
buf_len13 = 100;
buf_len14 = 100;
buf_len15 = 100;

index0 = 1:buf_len0;
index1 = 1:buf_len1;
index2 = 1:buf_len2;
index3 = 1:buf_len3;
index4 = 1:buf_len4;
index5 = 1:buf_len5;
index6 = 1:buf_len6;
index7 = 1:buf_len7;
index8 = 1:buf_len8;
index9 = 1:buf_len9;
index10 = 1:buf_len10;
index11 = 1:buf_len11;
index12 = 1:buf_len12;
index13 = 1:buf_len13;
index14 = 1:buf_len14;
index15 = 1:buf_len15;

% create variables for the X axis
f0data = zeros(buf_len0,1);
f1data = zeros(buf_len1,1);
f2data = zeros(buf_len2,1);
f3data = zeros(buf_len3,1);
f4data = zeros(buf_len4,1);
f5data = zeros(buf_len5,1);
f6data = zeros(buf_len6,1);
f7data = zeros(buf_len7,1);
f8data = zeros(buf_len8,1);
f9data = zeros(buf_len9,1);
f10data = zeros(buf_len10,1);
f11data = zeros(buf_len11,1);
f12data = zeros(buf_len12,1);
f13data = zeros(buf_len13,1);
f14data = zeros(buf_len14,1);
f15data = zeros(buf_len15,1);


%% 5. Runs a loop that continually reads the accelerometer values
% The accelerometer data is placed in the variable [gx gy gz].

%% 5.1 Create new file for save all data

% fid = fopen('all_data.txt','w');
% fprintf(fid,' f0       f1       f2       f3       f4       f5       f6       f7       f8       f9      f10      f11      f12      f13    vibro X    vibroY\r\n'); 
%fprintf(fid,'vibro_1 = %.2f\r\n', f7);  

all_data_forse = 'forse_data.xlsx';
A = {'f0_forse', 'f1_forse', 'f2_forse', 'f3_forse', 'f4_forse', 'f5_forse', 'f6_forse', 'f7_forse', 'f8_forse', 'f9_forse', 'f10_forse', 'f11_forse', 'f12_forse', 'f13_forse', 'vibro X', 'vibro Y'};

xlswrite(all_data_forse,A)



while(get(button, 'UserData'))
         
    
    % Get the new values from the forse
    [f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12 f13 f14 f15] = read_fsr_16(fsr);
    
    cla;
    % Remapping range 1023 to 20 kg, then to N (Newtons)
    f0 = (f0 * 0.0222222222) * 9.81;
    f1 = (f1 * 0.0222222222) * 9.81;
    f2 = (f2 * 0.0222222222) * 9.81;
    f3 = (f3 * 0.0222222222) * 9.81;
    f4 = (f4 * 0.0222222222) * 9.81;
    f5 = (f5 * 0.0222222222) * 9.81;
    f6 = (f6 * 0.0222222222) * 9.81;
    f7 = (f7 * 0.0222222222) * 9.81;
    f8 = (f8 * 0.0222222222) * 9.81;
    f9 = (f9 * 0.0222222222) * 9.81;
    f10 = (f10 * 0.0222222222) * 9.81;
    f11 = (f11 * 0.0222222222) * 9.81;
    f12 = (f12 * 0.0222222222) * 9.81;
    f13 = (f14 * 0.0222222222) * 9.81;
    f14 = (f14 * 0.0222222222) * 9.81;
    f15 = (f15 * 0.0222222222) * 9.81;
    
%     f0 = (f0 * 0.0195503421) * 9.81;
%     f1 = (f1 * 0.0195503421) * 9.81;
%     f2 = (f2 * 0.0195503421) * 9.81;
%     f3 = (f3 * 0.0195503421) * 9.81;
%     f4 = (f4 * 0.0195503421) * 9.81;
%     f5 = (f5 * 0.0195503421) * 9.81;
%     f6 = (f6 * 0.0195503421) * 9.81;
%     f7 = (f7 * 0.0195503421) * 9.81;
%     f8 = (f8 * 0.0195503421) * 9.81;
%     f9 = (f9 * 0.0195503421) * 9.81;
%     f10 = (f10 * 0.0195503421) * 9.81;
%     f11 = (f11 * 0.0195503421) * 9.81;
%     f12 = (f12 * 0.0195503421) * 9.81;
%     f13 = (f14 * 0.0195503421) * 9.81;
%     f14 = (f14 * 0.0195503421) * 9.81;
%     f15 = (f15 * 0.0195503421) * 9.81;
     
    
    
    %Update the rolling plot. Append the new reading to the end of the 
    % rolling plot data. Drop the first value
    f0data = [f0data(2:end); f0];
    f1data = [f1data(2:end); f1];
    f2data = [f2data(2:end); f2];
    f3data = [f3data(2:end); f3];
    f4data = [f4data(2:end); f4];
    f5data = [f5data(2:end); f5];
    f6data = [f6data(2:end); f6];
    f7data = [f7data(2:end); f7];
    f8data = [f8data(2:end); f8]; 
    f9data = [f9data(2:end); f9];
    f10data = [f10data(2:end); f10];
    f11data = [f11data(2:end); f11];
    f12data = [f12data(2:end); f12];
    f13data = [f13data(2:end); f13];
    f14data = [f14data(2:end); f14];
    f15data = [f15data(2:end); f15];
        
    % Plot for X magnitude
    subplot(8, 8, 33);
    plot(index0, f0data, 'r');
    axis([1 buf_len0 0 200]);
    
    subplot(8, 8, 25);
    plot(index1, f1data, 'r');
    axis([1 buf_len1 0 200]);
    
    subplot(8, 8, 18);
    plot(index3, f2data, 'r');
    axis([1 buf_len2 0 200]);
    
    subplot(8, 8, 11);
    plot(index4, f3data, 'r');
    axis([1 buf_len3 0 200]);
    
    subplot(8, 8, 4);
    plot(index5, f4data, 'r');
    axis([1 buf_len4 0 200]);
    
    subplot(8, 8, 5);
    plot(index6, f5data, 'r');
    axis([1 buf_len5 0 200]);
    
    subplot(8, 8, 14);
    plot(index0, f6data, 'r');
    axis([1 buf_len6 0 200]);
    
    subplot(8, 8, 32);
    plot(index7, f7data, 'r');
    axis([1 buf_len7 0 200]);
    
    subplot(8, 8, 40);
    plot(index8, f8data, 'r');
    axis([1 buf_len8 0 200]);
    
    subplot(8, 8, 54);
    plot(index9, f9data, 'r');
    axis([1 buf_len9 0 200]);
    
    subplot(8, 8, 61);
    plot(index10, f10data, 'r');
    axis([1 buf_len10 0 200]);
    
    subplot(8, 8, 60);
    plot(index11, f11data, 'r');
    axis([1 buf_len11 0 200]);
    
    subplot(8, 8, 51);
    plot(index12, f12data, 'r');
    axis([1 buf_len12 0 200]);
    
    subplot(8, 8, 42);
    plot(index13, f13data, 'r');
    axis([1 buf_len13 0 200]);
    %ylabel('Vibro sensor X');
    
    subplot(8, 8, 21);
    plot(index14, f14data, 'b');
    axis([1 buf_len14 0 8]);
    ylabel('Vibro sensor X');
    
    subplot(8, 8, 45);
    plot(index15, f15data, 'b');
    axis([1 buf_len15 0 8]);
    ylabel('Vibro sensor Y');

            % subplot(2, 1, 1);
            % plot(index7, f7data, 'b');
            % axis([1 buf_len7 0 1200]);
            % subplot(2, 1, 2);
            % plot(index8, f8data, 'b');
            % axis([1 buf_len8 0 1200]);

%save('vibro1.mat', 'f7data', 'index7');
%save('vibro2.mat', 'f8data', 'index8');

    %hold on;
    %figure; plot(index, gydata, 'b');
    %hold on;
    %figure; plot(index, gzdata, 'm');
    %axis([1 buf_len0 0 200]);
    %xlabel('time');
    %ylabel('Forse of two sensors');
    %fprintf(fid,'f0     f1    f2    f3    f4    f5    f6    f7    f8    f9    f10    f11    f12    f13\r\n');
    %save(fid, f0data, f1data, f2data, f3data, '-append')
    %formatSpec = 'f0 = %.2f N, f1 = %.2f N \r\n';
    %fprintf(formatSpec, f0data, f1data)
     %fprintf(fid,'%.2f  |  %.2f  |  %.2f  |  %.2f  |  %.2f  |  %.2f  |  %.2f  |  %.2f  |  %.2f  |  %.2f  |  %.2f  |  %.2f  |  %.2f  |  %.2f  |  %.2f  |  %.2f\r\n', f0data, f1data, f2data, f3data, f4data, f5data, f6data, f7data, f8data, f9data, f10data, f11data, f12data, f13data, f14data, f15data);   
     
    F = [f0data f1data f2data f3data f4data f5data f6data f7data f8data f9data f10data f11data f12data f13data f14data f15data]; 
    sheet = 1;
    xlRange = 'A2';
    xlswrite(all_data_forse, F, sheet, xlRange);
        
    drawnow;
end

fclose(fid);

