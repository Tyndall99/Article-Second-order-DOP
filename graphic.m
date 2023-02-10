%% White LED fitting parameters: extracted from .sfit files 
 a1 =      0.4753;
 b1 =       629.3;
 c1 =     19.97;
 a2 =        0.4385;
 b2 =      652;
 c2 =      33.89;
 a3 =        0.4658;
 b3 =      614.2;
 c3 =       13.33;
 a4 =        -0.01141;
 b4 =     640.5;
 c4 =      2.274;
 a5 =        0.1039;
 b5 =     681.3;
 c5 =      64.43;
 a6 =        0.2149;
 b6 =     603.7;
 c6 =      8.916;

%% Red LEd fitting parameters extracted from .sfit files 
d1 =      0.4061;
e1 =       637.7;
f1 =       6.021;
d2 =     0.05436;
e2 =       612.4;
f2 =       10.56;
d3 =      0.5835;
e3 =       633.9;
f3 =       13.64;
d4 =     0.03589;
e4 =       626.8;
f4 =       55.31;


syms x w
%Función de la densidad espectral de potencia LED blanco
f(x) =   a1*exp(-((x-b1)/c1)^2) + a2*exp(-((x-b2)/c2)^2) + a3*exp(-((x-b3)/c3)^2) + a4*exp(-((x-b4)/c4)^2) + a5*exp(-((x-b5)/c5)^2) + a6*exp(-((x-b6)/c6)^2);

%Función de la densidad espectral de potencia LED rojo
g(x) = d1*exp(-((x-e1)/f1)^2) + d2*exp(-((x-e2)/f2)^2) + d3*exp(-((x-e3)/f3)^2) + d4*exp(-((x-e4)/f4)^2);

%Funcion de coherencia - Wierner kinchine theorem
F(w) = fourier(f); %Blanco
G(w) = fourier(g); %Rojo

y = linspace(0,4,200).';
%First-order DOP
%z1=double(abs(F(0.026*y)));%White LED  
%z2=double(abs(G(0.021*y)));%Red LED

%Second-order DOP
a = 0.9;
b = 0.05;
z1 = double(abs(F(0.026*y)).*sqrt(a - b.*sin(2.*(9.2*y+0.75)))); %White LED
z2 = double(abs(G(0.020*y)).*sqrt(a - b.*sin(2.*(5.1*y-0.78)))); %Red LED

%z1 = (z1-min(z1))/(max(z1)-min(z1));
%z2 = (z2-min(z2))/(max(z2)-min(z2));

z1 = z1/max(z1);
z2 = z2/max(z2);

h(w) = abs(F(0.026*w))*exp(1i*(9.2*w+2.35));
H(x) = fourier(h);

%Depolarization Data

data1 = readtable('red_LED_depolarization_data.xlsx','PreserveVariableNames',true); %Read csv as table
data2 = readtable('white_LED_depolarization_data.xlsx','PreserveVariableNames',true); %Read csv as table

data1 = cell2mat(table2cell(data1)); %convert table to data matrix
data2 = cell2mat(table2cell(data2)); %convert table to data matrix

x1 = data1(:,1)/1000;
y1 = (data1(:,2)-1.8)/100; %we add "-1.8" for the calibration of the polarimeter measurement

x2 = data2(:,1)/1000;
y2 = (data2(:,2)+1.8)/100;

%--------------------graphics------------------------------%

figure
hold on
plot(x1,y1,'Marker','d','MarkerSize',4,'MarkerEdgeColor',[0.6350,0.0780,0.1840])
plot(x2,y2,'Marker','d','MarkerSize',4,'MarkerEdgeColor',[0,0.4470,0.7410])
plot(y,z1,'LineWidth',2,'color','b')
plot(y,z2,'LineWidth',2,'color','r');

title('DOP vs $\Delta n l$ (Second-Order DOP $P_1$)','interpreter','latex','FontSize',20)
xlabel('Optical path difference $\Delta n l$ $[\mu m]$','interpreter','latex','FontSize',20)
ylabel('Degree of Polarization (DOP)','interpreter','latex','FontSize',20)