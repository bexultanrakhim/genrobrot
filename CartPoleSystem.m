%test lagrangian 
theta = sym('theta','real');
theta_dot = sym('theta_dot','real');
x = sym('x','real');
x_dot = sym('x_dot','real');
g=sym('g','real');
m=sym('m',[1,2],'real');
l=sym('l','real');
p2 = [x - l*sin(theta);l*cos(theta)];
p1=[x;0];
p1_dot = chain_rule(p1,[x;theta],[x_dot;theta_dot]);
p2_dot = chain_rule(p2,[x;theta],[x_dot;theta_dot]);
T = simplify(0.5*m(1)*(p1_dot'*p1_dot) + 0.5*m(2)*(p2_dot'*p2_dot));

V = g*l*p2(2);
[M,C,G] = lagrange(T,V,[x;theta],[x_dot;theta_dot]);