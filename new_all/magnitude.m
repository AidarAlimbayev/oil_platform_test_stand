%=================================================================
%=========== Accelerometer Magnitude Skeleton Code ===============
%=================================================================

%% 1. Specifies the COM port that the Arduino board is connected to
comPort = 'com9';

%% 2. Initialize the Serial Port - setupSerial()

% connect MATLAB to the accelerometer
if(~exist('serialFlag', 'var'))
    [accelerometer.s, serialFlag] = setupSerial(comPort);
end

%% 3. Run a calibration routine if needed - calibrate()

% if accelerometer is not calibrated, calibrate now
if(~exist('calCo', 'var'))
    calCo = calibrate(accelerometer.s);
end

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
    button = uicontrol('Style', 'pushbutton', 'String', 'Stop', ...
        'pos', [0 0 50 25], 'parent', h,...
        'Callback', 'stop_call_magnitude', 'UserData', 1);
end

% Keep in mind the 'close_call_' function that this button calls
% everytime it is pressed

if(~exist('button2', 'var'))
    button2 = uicontrol('Style', 'pushbutton', 'String', ...
        'Close Serial Port', 'pos', [250 0 150 25], 'parent', h,...
        'Callback', 'closeSerial', 'UserData', 1);
end

%% 5. Initializing the Rolling Plot
% The rolling plot works like vector code. Set it up in the same manner.

buf_len = 100;
index = 1:buf_len;
% create variables for the X axis
gxdata = zeros(buf_len,1);
gydata = zeros(buf_len,1);
gzdata = zeros(buf_len,1);


%% 6. Data Collection and Plotting/

% While the figure window is open.
while(get(button, 'UserData'))
    
    % Get the new values from the accelerometer
    [gx gy gz] = readAcc(accelerometer, calCo);
    
    %Update the rolling plot. Append the new reading to the end of the 
    % rolling plot data. Drop the first value
    gxdata = [gxdata(2:end); gx];
    %gydata = [gydata(2:end); gy];
    %gzdata = [gzdata(2:end); gz];
    
    % Plot for X magnitude
    plot(index, gxdata, 'r');
    %hold on;
    %figure; plot(index, gydata, 'b');
    %hold on;
    %figure; plot(index, gzdata, 'm');
    axis([1 buf_len -3.5 3.5]);
    xlabel('time');
    ylabel('Magnitude of X axis acceleration');
    
    drawnow;
end