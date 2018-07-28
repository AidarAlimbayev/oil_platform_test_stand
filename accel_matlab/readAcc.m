function [gx gy gz] = readAcc(out,calCo)

%     fprintf(out.s, 'R');
%     
%     readings(1) = fscanf(out.s, '%u');
%     readings(2) = fscanf(out.s, '%u');
%     readings(3) = fscanf(out.s, '%u');
    gx = acc(1);
    gy = acc(2);
    gz = acc(3);
    
end
    
    