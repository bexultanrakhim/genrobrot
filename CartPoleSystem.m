%test lagrangian 
theta = sym('theta','real'); % pole angle position
theta_dot = sym('theta_dot','real'); % pole angle velocity
x = sym('x','real'); %cart position 
x_dot = sym('x_dot','real');% cart velocity 
g=sym('g','real'); %GRAVITY CONSTANT
m=sym('m',[1,2],'real'); %MASS VECTOR OF BOTH CART AND POLE
l=sym('l','real'); % LENGTH OF POLE
p2 = [x - l*sin(theta);l*cos(theta)]; % position of pole
p1=[x;0]; %position of cart
p1_dot = chain_rule(p1,[x;theta],[x_dot;theta_dot]); %velocity of cart
p2_dot = chain_rule(p2,[x;theta],[x_dot;theta_dot]); % velocity of pole
T = simplify(0.5*m(1)*(p1_dot'*p1_dot) + 0.5*m(2)*(p2_dot'*p2_dot)); % kinetic energy

V = g*l*p2(2); %potential energy 
[M,C,G] = lagrange(T,V,[x;theta],[x_dot;theta_dot]); % inertia matrix, velocity term, gravity term
