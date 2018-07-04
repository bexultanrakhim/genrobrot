function p_dot = chain_rule(p,theta,theta_dot)
    p_dot = sym(zeros(size(p)));
    for ind = 1:length(theta) 
        p_dot = p_dot + diff(p,theta(ind))*theta_dot(ind);
    end
end