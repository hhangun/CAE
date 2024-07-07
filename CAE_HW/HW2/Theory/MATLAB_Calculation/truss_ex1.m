%  INPUT FOR 2D-PLANE TRUSS PROBLEM (SI unit)
clear all, close all

%  Information of truss element
ndof=2;  % degree of freedom for each node
npe=2;   % node per element
nmode=2; % number of mode extracted

%   Node data: NODE=[#1 #2 #3]
%   #1: node number, #2: x-coordinate, #3: y-coordinate
NODE=[
1 0  0
2 1  1
3 1  0
4 2  0];
nnode=length(NODE);  % total number of node

%   Element data: ELEM=[#1 #2 #3]
%   #1: element number, #2: node number 1, #3: node number 2
ELEM=[
1 1 2
2 1 3
3 2 3
4 2 4
5 3 4];
nelem=length(ELEM);   % total number of elements

% Area of the cross-section
A=0.0003;   

%  Young's Modulus
E=70E9;

%  mass density
rho=2700;

%  Boundary condition: BC=[#1 #2 #3]
%   #1: node number, #2: x-constraint (0:free, 1:fixed) 
%   #3: y-constraint (0:free, 1:fixed)
BC=[ 
1 1 1
2 0 0 
3 0 0
4 0 1]; % x, y go jeong state

%  External loads: F=[#1 #2 #3]
%   #1: node number, #2: x-directional load, #3: y-directional load
F=[
1 0 0
2 0 0 
3 0 -100000
4 0 0]; % boundary condition

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Plot truss structure
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