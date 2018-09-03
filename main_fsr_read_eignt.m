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

index0 = 1:buf_len0;
index1 = 1:buf_len1;
index2 = 1:buf_len2;
index3 = 1:buf_len3;
index4 = 1:buf_len4;
index5 = 1:buf_len5;
index6 = 1:buf_len6;
index7 = 1:buf_len7;

% create variables for the X axis
f0data = zeros(buf_len0,1);
f1data = zeros(buf_len1,1);
f2data = zeros(buf_len2,1);
f3data = zeros(buf_len3,1);
f4data = zeros(buf_len4,1);
f5data = zeros(buf_len5,1);
f6data = zeros(buf_len6,1);
f7data = zeros(buf_len7,1);


%% 5. Runs a loop that continually reads the accelerometer values
% The accelerometer data is placed in the variable [gx gy gz].

while(get(button, 'UserData'))
         
    
    % Get the new values from the forse
    [f0 f1 f2 f3 f4 f5 f6 f7] = read_fsr_eight(fsr);
    
    cla;
    
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
        
    % Plot for X magnitude
    subplot(5, 5, 11);
    plot(index0, f0data, 'r');
    subplot(5, 5, 7);
    plot(index1, f1data, 'r');
    subplot(5, 5, 3);
    plot(index0, f2data, 'r');
    subplot(5, 5, 9);
    plot(index1, f3data, 'r');
    subplot(5, 5, 15);
    plot(index0, f4data, 'r');
    subplot(5, 5, 19);
    plot(index1, f5data, 'r');
    subplot(5, 5, 23);
    plot(index0, f6data, 'r');
    subplot(5, 5, 17);
    plot(index1, f7data, 'r');
    %hold on;
    %figure; plot(index, gydata, 'b');
    %hold on;
    %figure; plot(index, gzdata, 'm');
    axis([1 buf_len0 0 200]);
    xlabel('time');
    ylabel('Forse of two sensors');
    
    drawnow;
end


