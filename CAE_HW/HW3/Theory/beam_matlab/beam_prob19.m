%
%  INPUT FOR 2D-BEAM PROBLEM
clear all, close all

%  Information of frame element
ndof=2;  % degree of freedom for each node
npe=2;   % node per element

%   Node data: NODE=[#1 #2 #3]
%   #1: node number, #2: x-coordinate
%
nelem=2;        % number of element
nnode=nelem+1;  % total number of node
BEAML=8;        % length of beam  
NODE=zeros(nnode,3);
NODE=[
      1 0 0
      2 4 0
      3 8 0];

%    Element data: ELEM=[#1 #2 #3]
%   #1: element number, #2: node number1, #3: node number 2
  ELEM=[
      1 1 2
      2 2 3];

% Area of the cross-section and second moment of the area
A=4e-4;   
Izz=3e-4;

%  Young's Modulus
E=70E9;

%    Boundary conditio; BC=[#1 #2 #3]
%   #1: node number, #2: y-constraint (0:free, 1:fixed)
%   #3: z-rotation (0:free, 1:fixed)
BC=zeros(nnode,3);
for i=1:nnode, BC(i,1)=i;, end
%
BC(1,2)=1; BC(1,3)=1;
BC(2,2)=1;
 
%   External loads; F=[#1 #2 #3]
%   #1: node number, #2: y-directional load, shear load
%   #3: z-rotation, moment
F=zeros(nnode,3);
for i=1:nnode, F(i,1)=i;, end
F(2,2)=-16000;  F(3,2)=-16000;
F(2,3)=-10670;  F(3,3)=10670;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Plot structure
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)
plot(NODE(:,2),NODE(:,3),'ro'), hold on
text(NODE(:,2)+0.02*max(NODE(:,2)),NODE(:,3),int2str(NODE(:,1)));
for i=1:nelem
   x1=NODE(ELEM(i,2),2);
   y1=NODE(ELEM(i,2),3);
   x2=NODE(ELEM(i,3),2);
   y2=NODE(ELEM(i,3),3);

   X=[x1,x2];  Y = [y1,y2];
   figure(1)
   plot(X,Y)
   text((x1+x2)/2,(y1+y2)/2,int2str(ELEM(i,1)));
end
title('original shape of the structure'), axis equal
hold off