function [V,K] = energies(Vc,WW,m,I,Pc,TT,g)
    n = length(m);
    V=sym('0');
    K=sym('0');
    Phc = [Pc ;ones(1,n)]; 
    Ti =sym(eye(4));
    for ind = 1:n
        Ti=Ti*TT(:,4*ind-3:4*ind);
        Pc0 = Ti*Phc(:,ind);
        V = V+ m(ind)*g*[0,0,1,0]*Pc0;
        K = K + 0.5*( m(ind)*(Vc(:,ind)'*Vc(:,ind)) +WW(:,ind)'*I(:,3*ind-2:3*ind)*WW(:,ind));
        
    end
    V=simplify(V);
    K=simplify(K);
end