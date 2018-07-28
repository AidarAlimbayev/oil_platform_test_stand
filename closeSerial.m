
clear all
if ~isempty(instrfind)
    fclose(instrfind);
    delete(instrfind);
end
close all
disp('Serial Port Closed')