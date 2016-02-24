function [eigenvals, eigenfaces] = trainFaces(X)

    % parameter to fiddle
    ratio_threshold = 0.999;
    
    C =  (X * X') / size(X,1);
    [V, D] = eig(C);
    
    d = sum(D,1);
    [ds, order] = sort(d,'descend');
    
    V = X' * V;
    L = sum(V.^2, 1);
    L = sqrt(L);
    V = bsxfun(@rdivide, V, L);
    Vs = V(:,order);
        
    M = size(ds,2);
    for m = 1:size(ds,2)
        ratio = sum(ds(1:m)) / sum(ds(:));
        if ratio > ratio_threshold
            M = m;
            break
        end
    end

    eigenvals = ds(1:M);
    eigenfaces = Vs(:,1:M);

end