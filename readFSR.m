function [force] = readFSR(out)
    fprintf(out.s, 'F');
    %read voltages from accelerometer and reorder
    force = fscanf(out.s, '%d');
end