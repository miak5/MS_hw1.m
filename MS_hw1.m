
%---------------------------------------------------------------------
% File: MS_hw1.m
% Description: This script plots transient current, steady state current,
% and total current on the same plot with an axis scale of 0<t<0.03 miliseconds.
% Author: Mia Starnes, miak5@ksu.edu,
% (c)2026, Kansas State University. All rights reserved.
% Date: 24 January 2026 (Version 1.00)
% Platform: MATLAB Release R2025b (Version 25.2.0), Macbook Pro.
% Toolboxes: Signal Processing
% Revisions: 8/24/26 – Added comments to everyt line
% Reference: The MathWorks, Inc. Getting Started with MATLAB® 7,
% ©1984–2007, The MathWorks, Inc.,
% 3 Apple Hill Drive, Natick, MA 01760-2098.
%---------------------------------------------------------------------


%PART 1
%---------------------------------------------------------------------
t = 0:0.0000001:0.0003; % 0<t<0.3 milisecond time,
% I prefer lots of time increments as well

steadyState = 15*sin(40000*t); % the iss(t) (steady state) given

transientCurrent = -25*exp(-32000*t).*sin(24000*t); % the it(t) (transient current) given

totalCurrent = steadyState + transientCurrent; % iL(t) (total current) = iss(t) +it(t)

figure; % opening up a plot

grid on; % turning the grid for the background on
hold on; % allowing multiple functions to be plotted on one figure
xlabel('Time (ms)'); %x axis name
ylabel('Current (mA)'); %y axis name
title('RLC Circuit Currents Through Inductor'); %title of figure

plot(t*1e3,steadyState, '-', 'LineWidth', 2); %plots steady state current with solid line
plot (t*1e3, transientCurrent, '--', 'LineWidth', 2); %plots steady state current with dashed line
plot(t*1e3, totalCurrent, ':', 'LineWidth', 2); %plots steady state current with dotted line

legend('Steady State Current', 'Transient Current', 'Total Current'); %legend for the 3 currents
 

%---------------------------------------------------------------------

%PART 2

Capacitor = 1e-6; % capacitor value I chose, in F

Resistor = 10610; % resistor value calculated to make fclp = 15 Hz, in ohms

a = 1 / (Resistor * Capacitor);

f = 1:0.1:1000;

w = 2*pi*f;

Hw = (a^2) ./ (a + j*w).^2

magnitude = 20*log10(Hw);

phase = angle(Hw);

figure;
grid on;
subplot(2,1,1);
semilogx(f, magnitude, '-', 'LineWidth', 2);
ylabel('Magnitude dB');


subplot(2,1,2);
semilogx(f, phase, ':', 'LineWidth', 2);
ylabel('Phase radians');
xlabel('Frequency Hz');




