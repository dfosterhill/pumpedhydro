%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% This mfile will compute the flow rates and turbomachine powers for
% an example 'pumped storage' situation.
%
% David Hill, Oregon State University
% dfh@oregonstate.edu
% 2022
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
clc

% Geometric properties
dz = 50;    %difference in free surface elevation between reservoirs in m
l = 250;    %length of pipe in m.
d = 0.1;    %diameter of pipe in m
ep = 0.00026;   %pipe roughness height in m

% Fluid properties
rho=1000;   %water density in kg/m^3
g=9.81;     %gravity in m/s^2
gam=rho*g;  %water specific weight in N/m^3

% Pump characteristics. We assume a pump performance curve like:
%
% hp = A - B*Q^2, where A and B are constants
A = 100;
B = 400000;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Equations for the case of the water moving uphill

%first solve the fully-turbulent Haaland equation for friction factor f

f=(1/(-1.8*log10((ep/d)^(1.11))))^2;

%next, combined the energy equation, the pump performance equation, and the
%Darcy-Weisbach equation to solve for Q (cubic meters per second)

disp(['Here are the results for the case of pumping water uphill:'])
disp(' ')

Q1=sqrt((A-dz)/(B+f*l/d/2/g/(pi/4*d^2)^2));
disp(['The pump flowrate (cubic meters per sec) is ' num2str(Q1)])

%with this solved for, use pump performance curve to get the pump head (m)

hp=A-B*Q1^2;
disp(['The pump head (meters) supplied is ' num2str(hp)])

%next, get the pump power in kilowatts

P=gam*hp*Q1/1000;
disp(['The theoretical pump power (kilowatts) is ' num2str(P)])
disp(' ')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Equations for the case of the water moving downhill

%note that the friction factor does not change.

%next, combine the energy equation, the pump performance equation, and the
%Darcy-Weisbach equation to solve for Q (cubic meters per second). The only
%change to the energy equation is that we now have ht = dz - hf

disp(['Here are the results for the case of water flowing downhill:'])
disp(' ')

Q2=sqrt((A-dz)/(B-f*l/d/2/g/(pi/4*d^2)^2));
disp(['The turbine flowrate (cubic meters per sec) is ' num2str(Q2)])

%with this solved for, use pump performance curve to get the pump head (m)

ht=A-B*Q2^2;
disp(['The turbine head (meters) extracted is ' num2str(ht)])

%next, get the pump power in kilowatts

P=gam*ht*Q2/1000;
disp(['The theoretical turbine power (kilowatts) is ' num2str(P)])
disp(' ')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot the operating points on the performance curve

q=0:.0001:.02;
figure(1)
plot(q,A-B*q.^2);
axis([min(q) max(q) 0 max(A-B*q.^2)])
xlabel('Q (cms)'); ylabel('hp / ht (m)');
hold on
plot(Q1,hp,'ro')
plot(Q2,ht,'go')

legend('Turbomachine Perfomance Curve','Pump operating point','Turbine operating point')
