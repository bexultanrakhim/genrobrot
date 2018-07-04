function p_dot = chain_rule(p,theta,theta_dot)
%this function uses vector of cartesian coordinates as function of "theta" and by chain rule finds proper differentiation on time
    p_dot = sym(zeros(size(p)));
    for ind = 1:length(theta) 
        p_dot = p_dot + diff(p,theta(ind))*theta_dot(ind);
    end
end
