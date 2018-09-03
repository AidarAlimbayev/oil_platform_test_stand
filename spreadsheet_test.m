% load patients.mat
% T = table(LastName,Age,Weight,Smoker);
% %T(1:2,:)
% 
% filename = 'patientdata.xlsx';
% writetable(T,filename,'Sheet',1,'Range','D1');


% filename = 'testdata.xlsx';
% A = [12.7 5.02 -98 63.9 0 -.2 56];
% xlswrite(filename,A)

filename = 'testdata.xlsx';
A = {'Time','Temperature'; 12,98; 13,99; 14,97};
sheet = 2;
xlRange = 'E1';
xlswrite(filename,A,sheet,xlRange)
