%system representation:
J_number = 3;

%joint states
q = sym('q',[J_number,1],'real');
q_dot = sym('q_dot',[J_number,1],'real');

%constants 
m=sym('m',[1,J_number],'real');
%I=sym('J',[3,3*J_number],'real');
g = sym('g','real');
%Pc= sym('lc',[3,J_number],'real');
l = sym('l',[1,J_number],'real');
%DH matrix 
%DHmatrix = sym('Dd',[J_number,4],'real');

%initializing:

DHmatrix = [pi/2  , 0   , 0 ,q(1)+pi/2 ; ...
            -pi/2 , 0   , 0 ,q(2)      ;...
            0     , l(1), 0 ,q(3)           ];
m(1)=0;
I=[[sym('I1xx','real'),0 ,0;0,sym('I1yy','real'),0;0,0,sym('I1zz','real')],...
   [sym('I2xx','real'),0 ,0;0,sym('I2yy','real'),0;0,0,sym('I2zz','real')],...
   [sym('I3xx','real'),0 ,0;0,sym('I3yy','real'),0;0,0,sym('I3zz','real')]];
Pc = [zeros(3,1),[sym('Lc1','real');0;0],[sym('Lc2','real');0;0]];

% Homogenious Transformation matrices 
TT=transformations(DHmatrix);


[Vc,WW] = velocities(TT,Pc,q_dot);
[V,K] = energies(Vc,WW,m,I,Pc,TT,g);
[M,C,G] = lagrange(K,V,q,q_dot);