a = arduino('/dev/tty.usbmodemFD111', 'uno');
s = servo(a, 'D4', 'MinPulseDuration', 1000*10^-6,...
    'MaxPulseDuration', 2300*10^-6);
angle = 0;
writePosition(s, angle);
fprintf('Door locked.\n')
pause(1)
clear all;
