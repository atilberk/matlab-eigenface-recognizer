function X = loadData( src )

    % take first for extracting lengths and sizes
    filename = strcat('data/training/',src(1).name);
    K = length(src);
    I = imread(filename);
    n = size(I,1);
    m = size(I,2);
    
    X = zeros(K, n*m);
    for i = 1 : K
        filename = strcat('data/training/',src(i).name);
        J = imread(filename);
        J = double(J);
        J = J ./ 256;
        X(i,:) = J(:)';
    end
end