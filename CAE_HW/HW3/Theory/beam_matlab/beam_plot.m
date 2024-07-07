%  Post process of 2D_beam structures
%  Displacement: U[#1,#2,#3]
%   #1: node number, #2: y-directional displacement
%   #3: z-directional rotation
for i=1:nnode 
   U(i,1)=i;
   for j=1:ndof
      U(i,j+1)=GU(ndof*(i-1)+j);
   end
end

% Plot deformed shape
figure(2)
mag=20;
for i=1:nelem
   x1=NODE(ELEM(i,2),2);
   y1=NODE(ELEM(i,2),3);
   x2=NODE(ELEM(i,3),2);
   y2=NODE(ELEM(i,3),3);
   X=[x1,x2];  Y = [y1,y2];

   dx1=NODE(ELEM(i,2),2);
   dy1=NODE(ELEM(i,2),3)+mag*U(ELEM(i,2),2);
   dx2=NODE(ELEM(i,3),2);
   dy2=NODE(ELEM(i,3),3)+mag*U(ELEM(i,3),2);
   dX=[dx1,dx2];  dY = [dy1,dy2]; 

   figure(2)
   plot(X,Y,'-b',dX,dY,'-r'),hold on
   legend('undeformed shape','deformed shape')
   text((x1+x2)/2,(y1+y2)/2,int2str(ELEM(i,1)));
end
title('deformed and undeformed shape'), axis equal
hold off