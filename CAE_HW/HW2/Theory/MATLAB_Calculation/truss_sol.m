%  Construct system matrix and solve 2D-plane truss problem
%  Zerorize matrices
GK=zeros(ndof*nnode,ndof*nnode);
GF=zeros(ndof*nnode,1);
GU=zeros(ndof*nnode,1);
GKK=zeros(ndof*nnode,ndof*nnode);
GFF=zeros(ndof*nnode,1);

%  Construct element stiffness matrix
for l=1:nelem
   %  Element stiffness matrix
   dx=NODE(ELEM(l,3),2)-NODE(ELEM(l,2),2);
   dy=NODE(ELEM(l,3),3)-NODE(ELEM(l,2),3);
   L=sqrt(dx^2+dy^2);                     % element length
   Ca=dx/L;              Sa=dy/L;         % cos & sin (theta)

   T=[Ca Sa 0 0;-Sa Ca 0 0;0 0 Ca Sa;0 0 -Sa Ca];     % transform matrix
   SKE1=E*A/L*[1 0 -1 0;0 0 0 0;-1 0 1 0;0 0 0 0];    % element stiffness matrix
   SKE=T'*SKE1*T; % equation 6          % element stiffness matrix in global coordinate
 
   %  Assemble global stiffness matrix
   for i=1:npe
      for j=1:npe
           ii=ndof*ELEM(l,i+1)-ndof+1; jj=ndof*ELEM(l,j+1)-ndof+1;
           GK(ii:ii+ndof-1,jj:jj+ndof-1)=GK(ii:ii+ndof-1,jj:jj+ndof-1) ...
              +SKE(ndof*i-ndof+1:ndof*i,ndof*j-ndof+1:ndof*j);
      end
   end
end

%  Print assembled stiffness matrix 
    fprintf('\n  GK: Assembled stiffness matrix')
    GK(:,:)

%  Save global stiffness matrix GKK for future use
for i=1:ndof*nnode, for j=1:ndof*nnode
    GKK(i,j)=GK(i,j);
end, end

%  Apply boundary conditions and generate reduced stiffness matrix
    lambda=1e6*GK(1,1);
for i=1:nnode, for j=1:ndof
   if BC(i,j+1)==1
       ii=ndof*(i-1)+j;
       GK(:,ndof*(i-1)+j)=0;  GK(ndof*(i-1)+j,:)=0;
       GK(ii,ii)=lambda;
   end
   GF(ndof*(i-1)+j,1)=F(i,j+1);
end,end

% Solve static truss problem
% GK : global stiffness, GU : displacement computed
GU=inv(GK)*GF;

% Print nodal displacements and reaction forces 
   fprintf('\n  GU: Displacement computed')
   GU(:)
   GFF=GKK*GU;
   fprintf('\n  GFF: Reaction force computed')
   GFF(:)