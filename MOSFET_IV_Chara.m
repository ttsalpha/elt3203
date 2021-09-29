
%MOSFET
%I-V Characteristics

clear all, close all,

kn=1e-3; vt=1.5;
Vds=0:0.5:12;
Vgs=4:1:8;
m=length(Vds);
n=length(Vgs);
for i=1:n
    for j=1:m
        if Vgs(i) < vt % turn-off
            Id(i,j)=0;
        elseif Vds(j) >= (Vgs(i) - vt)
            Id(i,j)=kn * (Vgs(i) - vt)^2;
        elseif Vds(j) < (Vgs(i) - vt)
            Id(i,j)= kn*(2*(Vgs(i)-vt)*Vds(j) - Vds(j)^2);
        end
    end
end

figure(1), hold on, grid on,
%hl1 = plot(Vds,Id(1,:),'b'),
%hl2 = plot(Vds,Id(2,:),'m'),
%hl3 = plot(Vds,Id(3,:),'r'),

for i=1:n
    plot(Vds,Id(i,:))
end 

xlabel('Vds, V')
ylabel('Drain Current, A')
title('I-V Characteristics of a MOSFET')
text(10,0.008,'Vgs=4 V')
text(10,0.022,'Vgs=6 V')
text(10,0.044,'Vgs=8 V')
