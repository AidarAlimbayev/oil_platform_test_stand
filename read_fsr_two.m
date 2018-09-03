function [f1 f2]  = read_fsr_two(out)

    fprintf(out.s, 'R');
    %read values from forse sensor
    readings(1) = fscanf(out.s, '%u');
    readings(2) = fscanf(out.s, '%u');
    
    % map analog inputs to axes
      f1 = readings(1);
      f2 = readings(2);

end
    