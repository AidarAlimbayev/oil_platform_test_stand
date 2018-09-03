x = -1:.1:1;
y1 = sin(x);
subplot(2, 1, 1), plot(x, y1)
y2 = log(abs(y1));
subplot(2, 1, 2), plot(x, y2)