function [gx gy gz] = readAcc(out, calCo)

    fprintf(out.s, 'R');
    
    %read values from accelerometer
    readings(1) = fscanf(out.s, '%u');
    readings(2) = fscanf(out.s, '%u');
    readings(3) = fscanf(out.s, '%u');
    
    %determine what offset and gain values to use
    offset = calCo.offset;
    gain = calCo.g;
    accel = (readings - offset) ./ gain;
    
    % map analog inputs to axes
    gx = accel(1);
    gy = accel(2);
    gz = accel(3);
end
    
    