function [Vc,W] = velocities(TT,Pc,theta_dot)
    W=sym(zeros(3,length(theta_dot)));
    V=sym(zeros(3,length(theta_dot)));
    Vc=sym(zeros(3,length(theta_dot)));
    W(:,1) = theta_dot(1)*[0;0;1];
    V(:,1) = [0;0;0];
    RR = TT(1:3,1:3);
    Vc(:,1)=RR*(cross(W(:,1),Pc(:,1)));
    for ind = 1:(length(theta_dot)-1)
        P = TT(1:3,ind*4+4);
        Rinv = TT(1:3,4*(ind)+1:4*ind+3)';
        RR=RR*Rinv';
        W(:,ind+1) = Rinv*W(:,ind) + theta_dot(ind+1)*[0;0;1];
        V(:,ind+1) = Rinv*(V(:,ind) + cross(W(:,ind),P));
        Vc(:,ind+1) = RR*(V(:,ind+1) + cross(W(:,ind+1),Pc(:,ind+1)));
    end
    Vc=simplify(Vc);
    W=simplify(W);
end