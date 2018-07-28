clc;
close all;
clear all;

% 1. Specifies the COM port that Arduino board is connected to
comPort = 'COM5'; %This can be found out using the device manager
% connect MATLAB to the accelerometer
if (~exist('serialFlag', 'var'))
    [fsr.s,serialFlag] = setupSerial(comPort);
end

%initialize the figure and buttons that we will plot in if does not exist
if(~exist('h', 'var') || ~ishandle(h))
    h = figure(1);
end
if(~exist('text1', 'var'))
    text1 = uicontrol('Style', 'text', 'String', 'X: 0 degrees','pos',[450 100 100 25], 'parent', h);
end
if(~exist('text2', 'var'))
    text2 = uicontrol('Style', 'text', 'String', 'Y: 0 degrees','pos',[450 75 100 25], 'parent', h);
end
if(~exist('button', 'var'))
    button = uicontrol('Style', 'togglebutton','String', 'Stop & Close Serial Port','pos',[0 0 200 25], 'parent', h);
end

% Calibrate the sensor
weights = [0 20 50 70 100 120 150 170 200 220 250];
m1 = zeros (length(weights), 1)';
% Read the values for each weight and assign it
for i = 2:length(weights)
    mbox = msgbox(['Place' num2str(weights(i))])
    m1(i) = readFSR(fsr)
    
    while (m1(i) < m1(i - 1)) || m1(i) == 0;
        m1(i) = readFSR(fsr)
    end
end
m = m1;

%%
% weight = [0 10 20 50 100 150 200];
% m = [0 30 60 100 350 700 1800]

P1 = polyfit(m, weights, 2); %Setup the curve fitting

% Setup  the graph
myaxes = axes('xlim', [-20, 20], 'ylim', [-20, 20], 'zlim', [0 250]);
view(3);
grid on;
axis equal;
hold on;

%Draw the 3d sphere
[xsphere ysphere zsphere] = sphere();
h(1) = surface(xsphere, ysphere, zsphere);

% Add the 3d sphere to the figure
combinedobject = hgtransform('parent', myaxes);
set(h, 'parent', combinedobject)
drawnow

%%Acquire data and plot

while (get(button, 'value') == 0)
    [voltage] = readFSR(fsr) % Read data from the FSR
    mass = polyval(P1, voltage) % In grams
    
    if (mass > 0)
        force = mass * 9.81; % In Newton
        
        % Update the readouts on the figure
        set(text1, 'String', ['Mass: ' num2str(round(mass)) ' grams'])
        set(text2, 'String', ['Forse: ' num2str(round(mass)) ' N' ])
        
        %Move sphere along z axis
        translation = makehgtform('translate', [0 0 mass]);
        set(combinedobject, 'matrix', translation);
        
        %Scale sphere to 1/10 th of the mass
        scaling = makehgtform('scale', mass/10);
        set(combinedobject, 'matrix', scaling);
        
        % Set the translation and scaling to the sphere
        set(combinedobject, 'matrix', translation * scaling);
        
    end
    
    % Pause
    pause(0.1);
end

%when graph closed, close serial

closeSerial;
        
    
    
    
    
    
    
    
    
    
    
