%  Post process of 2D-plane truss structures%
%  Displacement: U[#1,#2,#3]
%  #1: node number, #2: x-directional displacement
%  #3: y-directional displacement
for i=1:nnode 
   U(i,1)=i;
   for j=1:ndof
      U(i,j+1)=GU(ndof*(i-1)+j);
   end
end

%  Plot deformed shape
figure(2)
mag=20;
for i=1:nelem
   x1=NODE(ELEM(i,2),2);
   y1=NODE(ELEM(i,2),3);
   x2=NODE(ELEM(i,3),2);
   y2=NODE(ELEM(i,3),3);
   X=[x1,x2];  Y = [y1,y2];

   dx1=NODE(ELEM(i,2),2)+mag*U(ELEM(i,2),2);
   dy1=NODE(ELEM(i,2),3)+mag*U(ELEM(i,2),3);
   dx2=NODE(ELEM(i,3),2)+mag*U(ELEM(i,3),2);
   dy2=NODE(ELEM(i,3),3)+mag*U(ELEM(i,3),3);
   dX=[dx1,dx2];  dY = [dy1,dy2];

   figure(2)
   plot(X,Y,'-b',dX,dY,'-r'),hold on
   legend('undeformed shape','deformed shape')
   text((x1+x2)/2,(y1+y2)/2,int2str(ELEM(i,1)));
end
title('deformed and undeformed shape'), axis equal
hold off

%  Computation of axial stress
%  Axial stress: sigma[#1,#2]
%  #1: node number, #2: axial stress
for l=1:nelem
   sigma(l,1)=l;
   %  Element stiffness matrix
   dx=NODE(ELEM(l,3),2)-NODE(ELEM(l,2),2);
   dy=NODE(ELEM(l,3),3)-NODE(ELEM(l,2),3);
   L=sqrt(dx^2+dy^2);                     % element length
   Ca=dx/L;              Sa=dy/L;         % cos & sin (alpha)
   T1=[-Ca -Sa Ca Sa];                    % transform matrix
   for i=1:2*ndof
      DU(1,1)=U(ELEM(l,2),2);
      DU(2,1)=U(ELEM(l,2),3);
      DU(3,1)=U(ELEM(l,3),2);
      DU(4,1)=U(ELEM(l,3),3);
   end
   sigma(l,2)=E/L*T1*DU/1e6;              % Stress in MPa
end

figure(3)
bar(sigma(:,2))
xlabel('element number')
ylabel('stress (MPa)')
title('stress at each element')