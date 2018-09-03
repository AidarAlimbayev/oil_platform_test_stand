function [f0 f1 f2 f3 f4 f5 f6 f7]  = read_fsr_eight(out)

    fprintf(out.s, 'R');
    %read values from forse sensor
    readings(1) = fscanf(out.s, '%u');
    readings(2) = fscanf(out.s, '%u');
    readings(3) = fscanf(out.s, '%u');
    readings(4) = fscanf(out.s, '%u');
    readings(5) = fscanf(out.s, '%u');
    readings(6) = fscanf(out.s, '%u');
    readings(7) = fscanf(out.s, '%u');
    readings(8) = fscanf(out.s, '%u');
    
    % map analog inputs to axes
      f0 = readings(1);
      f1 = readings(2);
      f2 = readings(1);
      f3 = readings(2);
      f4 = readings(1);
      f5 = readings(2);
      f6 = readings(1);
      f7 = readings(2);

end
    