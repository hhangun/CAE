%  Construct system matrix and solve 2D-beam problem
%  Zerorize Global stiffness, displacement, force matrix
GK=zeros(ndof*nnode,ndof*nnode);
GU=zeros(ndof*nnode,1);
GF=zeros(ndof*nnode,1);
GKK=zeros(ndof*nnode,ndof*nnode);
GFF=zeros(ndof*nnode,1);

for l=1:nelem
   %  Element stiffness matrix
   L=NODE(ELEM(l,3),2)-NODE(ELEM(l,2),2); % element length
   
   SKE=zeros(4,4);
   SKE(1,1)=12*E*Izz/L^3;  SKE(1,2)=6*E*Izz/L^2;   SKE(1,3)=-12*E*Izz/L^3;  SKE(1,4)=6*E*Izz/L^2;
   SKE(2,1)=6*E*Izz/L^2;   SKE(2,2)=4*E*Izz/L;     SKE(2,3)=-6*E*Izz/L^2;   SKE(2,4)=2*E*Izz/L;
   SKE(3,1)=-12*E*Izz/L^3; SKE(3,2)=-6*E*Izz/L^2;  SKE(3,3)=12*E*Izz/L^3;   SKE(3,4)=-6*E*Izz/L^2;
   SKE(4,1)=6*E*Izz/L^2;   SKE(4,2)=2*E*Izz/L;     SKE(4,3)=-6*E*Izz/L^2;   SKE(4,4)=4*E*Izz/L;

   %  Assembe global stiffness matrix
   for i=1:npe
      for j=1:npe
           ii=ndof*ELEM(l,i+1)-ndof+1; jj=ndof*ELEM(l,j+1)-ndof+1;
           GK(ii:ii+ndof-1,jj:jj+ndof-1)=GK(ii:ii+ndof-1,jj:jj+ndof-1) ...
              +SKE(ndof*i-ndof+1:ndof*i,ndof*j-ndof+1:ndof*j);
      end
   end
end

% Print assembed stiffness matrix
fprintf('\n  GK: Assembled Global Stiffness Matrix')
GK(:,:)

% Savet GKK for future use
for i=1:ndof*nnode, for j=1:ndof*nnode
        GKK(i,j)=GK(i,j);
    end, end

% Apply boundary conditions and generate reduced stiffness matrix
lambda=1e6*GK(1,1);
for i=1:nnode, for j=1:ndof
   if BC(i,j+1)==1
       ii=ndof*(i-1)+j;
       GK(:,ndof*(i-1)+j)=0;  GK(ndof*(i-1)+j,:)=0;
       GK(ii,ii)=lambda;
   end
   GF(ndof*(i-1)+j,1)=F(i,j+1);
end,end

% Solve static beam problem
   GU=inv(GK)*GF;
   
% Print nodal displacements and reaction forces  
   fprintf('\n  GU: Displacement')
   GU(:)
   GFF=GKK*GU;
   fprintf('\n  GFF: Reaction force')
   GFF(:)
