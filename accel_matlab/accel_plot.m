close all
clear all 

a = arduino('COM9', 'Uno', 'Libraries', 'Pololu/LSM303')
compass = addon(a, 'Pololu/LSM303')
acc = readAcceleration(compass);

buf_len = 100;
index = 1:buf_len;

i = 0;
n = 1000;

while n > i
    i = i + 1; 
    
    gxdata = [acc(1) acc(2) acc(3)];
    
    plot(gxdata, 'r');
   % axis()
% fprintf('Acceleration: %+.3f(X) %+.3f(Y) %+.3f(Z) (m/s^2)\n', acc(1), acc(2), acc(3));
% mag = readMagneticField(compass);
% heading = (atan2(mag(2), mag(1))*180)/pi;
% if heading < 0
%     heading = heading + 360; % normalize to 0-360
% end
% fprintf('Magnetic field strength: %+.3f(X) %+.3f(Y) %+.3f(Z) (uT)    Heading: %.1f (degrees)\n', ...
%     mag(1), mag(2), mag(3), heading);
end
clear compass
clear a