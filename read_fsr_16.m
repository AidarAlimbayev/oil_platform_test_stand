function [f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12 f13 f14 f15]  = read_fsr_16(out)

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
    readings(9) = fscanf(out.s, '%u');
    readings(10) = fscanf(out.s, '%u');
    readings(11) = fscanf(out.s, '%u');
    readings(12) = fscanf(out.s, '%u');
    readings(13) = fscanf(out.s, '%u');
    readings(14) = fscanf(out.s, '%u');
    readings(15) = fscanf(out.s, '%u');
    readings(16) = fscanf(out.s, '%u');
    
    
    % map analog inputs to axes
      f0 = readings(1);
      f1 = readings(2);
      f2 = readings(3);
      f3 = readings(4);
      f4 = readings(5);
      f5 = readings(6);
      f6 = readings(7);
      f7 = readings(8);
      f8 = readings(9);
      f9 = readings(10);
      f10 = readings(11);
      f11 = readings(12);
      f12 = readings(13);
      f13 = readings(14);
      f14 = readings(15);
      f15 = readings(16);

end
    