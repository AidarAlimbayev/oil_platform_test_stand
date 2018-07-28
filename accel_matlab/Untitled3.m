figure
ax = axes;
ax.YGrid = 'on';
ax.YLim = [-12 12];
cmap = ax.ColorOrder;
h1 = animatedline('Color', cmap(1,:));
h2 = animatedline('Color', cmap(2,:));
h3 = animatedline('Color', cmap(3,:));
legend(('acc_x', 'acc_y', 'acc_z'))

tic
while toc < 20
    
    acc = readAcceleration(sensor);
    t = datetime('now');
    