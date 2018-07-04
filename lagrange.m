function [M,C,G]=lagrange(T,V,q,q_dot)
    x = length(q); 
    dTq = gradient(T,q);
    dVq = gradient(V,q);
    dTq_dot= gradient(T,q_dot);
    G = dVq -subs(dTq,q_dot,zeros(3,1));
    M =sym(zeros(x,x));
    C= sym(zeros(x,x));
    for ind = 1:x
        M(:,ind) = diff(dTq_dot,q_dot(ind));
        C(:,ind) = diff(dTq_dot,q(ind));
    end
    C=simplify(C*q_dot-(dTq-subs(dTq,q_dot,zeros(3,1))));
end