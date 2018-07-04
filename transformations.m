function TT = transformations(DHmatrix)
    n = size(DHmatrix,1);
    TT =sym(zeros(4,4*n));
    for ind = 1:n
        TT(:,(4*(ind-1)+1):(4*ind)) = T4(DHmatrix(ind,1),DHmatrix(ind,2),DHmatrix(ind,3),DHmatrix(ind,4));
    end
end