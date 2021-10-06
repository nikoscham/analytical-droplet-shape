%%%
%%% Analytical droplet shape calculator
%%% Started by nikoscham (2021)
%%%

Vdroplet = input ("Define droplet's volume (ul): "); %%% Droplet volume (ul)
Vdroplet = Vdroplet*1e-9; %%% Convert to m3
ThetaY = input ("Define Young's contact angle (deg): "); %%% Young's contact angle (deg)
ThetaY = ThetaY * pi / 180; %%% Convert to rad

%%%
%%% Calculate the point where the droplet touches the solid surface (ro)
%%%
ro = (Vdroplet/(2*pi/(3*tan(pi-ThetaY)^3)+pi/tan(pi-ThetaY)+2*pi*sqrt(1/(tan(pi-ThetaY))^2+1)^3/3))^(1/3);

%%%
%%% Calculate the z-cordinate of the center of the circle (zc)
%%%
zc = ro/tan(pi-ThetaY);

%%%
%%% Calculate the radius of the circle (R)
%%%
R = sqrt(zc^2+ro^2);

%%% Convert to mm
ro = ro * 1000;
zc = zc * 1000;
R = R *1000;

%%%
%%% Plot results
%%%
set(0, "defaulttextfontsize", 24) %%% Title
set(0, "defaultaxesfontsize", 24) %%% Axes labels
set(0, "defaultlinelinewidth", 4) 
t = linspace(0,2*pi,100)'; 
circsx = R.*cos(t);
circsz = R.*sin(t) + zc; 
plot(circsx,circsz); 
title (["ThetaY = "  ,num2str(ThetaY*180/pi), " deg, Vdroplet = " ,num2str(Vdroplet/1e-9), " ul"]);
xlabel ("x (mm)");
ylabel ("z (mm)");
axis ([-2, 2, 0, 4], "square");
grid on;
