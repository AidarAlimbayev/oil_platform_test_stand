%=================================================================
%============= Accelerometer Vector Skeleton Code ================
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
    button = uicontrol('Style', 'pushbutton', 'String', 'Stop', 'pos', [0 0 50 25], 'parent', h,...
        'Callback', 'closeSerial', 'UserData', 1);
end

%% 5. Runs a loop that continually reads the accelerometer values
% The accelerometer data is placed in the variable [gx gy gz].

while(get(button, 'UserData'))
    
    % read accelerometer output
    [gx gy gz] = readAcc(accelerometer, calCo);
    
    cla;
    
    % plot X acceleration vector
    line([0 gx], [0 0], 'Color', 'r', 'LineWidth', 2, 'Marker', 'o');
    
    % limit plot to +/- 1.25 g in all directions and make axis square
    limits = 2.5;
    axis([-limits limits -limits limits]);
    axis square;
    grid on
    xlabel('X-axis acceleration')
    
    % calculating the angle of the result acceleration vector and print
    %theta = atand(gy/gx);
    title(['Forse tilt angle: ' num2str(theta, '%.0f')]);
    
    % forse MATLAB to redraw the figure
    drawnow;
end


