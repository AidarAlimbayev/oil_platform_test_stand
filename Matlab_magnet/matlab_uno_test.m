a = arduino('COM9', 'Uno', 'Libraries', 'Pololu/LSM303')
compass = addon(a, 'Pololu/LSM303')
acc = readAcceleration(compass);
fprintf('Acceleration: %+.3f(X) %+.3f(Y) %+.3f(Z) (m/s^2)\n', acc(1), acc(2), acc(3));
mag = readMagneticField(compass);
heading = (atan2(mag(2), mag(1))*180)/pi;
if heading < 0
    heading = heading + 360; % normalize to 0-360
end
fprintf('Magnetic field strength: %+.3f(X) %+.3f(Y) %+.3f(Z) (uT)    Heading: %.1f (degrees)\n', ...
    mag(1), mag(2), mag(3), heading);
clear compass
clear a