a = arduino ('COM9', 'Uno', 'Libraries', 'Pololu/LSM303');   %%Initialization of serial port
%set(a,'DataBits', 8);
%set(a,'StopBits', 1);
%fopen(a);
a.ReadAsyncMode = 'continuous';
%%==============================
storeBuffer = fscanf(s, '%d');     %//Storing buffer in to variable
% ==============================
% For potting  I've  stored variable as [n X m] matrix and plotted with respect to time.
% ==============================
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ax1 = subplot(3,1,1); % top subplot
ax2 = subplot(3,1,2); 
ax3 = subplot(3,1,3);% bottom subplot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
plot(ax1,ax',b','r--')
title(ax1,'Time')
ylabel(ax1,'vibx')
plot(ax2,ax',c','r:')
title(ax2,'Time')
ylabel(ax2,'viby')
plot(ax3,ax',d','k--')
title(ax3,'Time')
ylabel(ax3,'vibz')
axis([ax1 ax2 ax3],[0 inf -inf inf])
drawnow                                       %  //For  Live plotting