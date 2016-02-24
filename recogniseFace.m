function recogniseFace(facefilename, srcTrain)

    if exist('eigenfaces.mat', 'file') ~= 0
        load('eigenfaces.mat'); %load eigen faces
    else
        error('File "eigenfaces.mat" does not exist. Please train first.')
    end
    X = loadData(srcTrain);
    
    img = imread(facefilename);
    img = double(img);
    rep = img / 256;
    rep = rep(:);
    rep = rep' * efM;
    
    R = X * efM;
    diff = bsxfun(@minus, R, rep);
    r = sum(transpose(bsxfun(@rdivide, diff.^2, efv)) , 1);
    [~, idx] = sort(r);
    disp(strcat([' > ', srcTrain(idx(1)).name, ' is the matching face']))
    
end