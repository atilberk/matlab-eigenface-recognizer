function isFace = detectFace(testfilename)

    % parameter to fiddle
    face_threshold = 555;

    if exist('eigenfaces.mat', 'file') ~= 0
        load('eigenfaces.mat'); %load eigen faces
    else
        error('File "eigenfaces.mat" does not exist. Please train first.')
    end
    img = imread(testfilename);
    img = double(img);
    n = size(img,1);
    m = size(img,2);
    
    rep = img / 256;
    rep = rep(:);
    rep = rep' * efM;
    rec = rep * efM';
    rec = rec * 256;
    rec = reshape(rec, size(img));
    sq_error = sum(sum((img-rec).^2)) / (n*m);
    
    [pathstr,name,ext] = fileparts(testfilename);
    
    if sq_error < face_threshold;
        disp(strcat([name, ext, ' in ', pathstr,' is a face!']))
        isFace = 1;
    else
        disp(strcat([name, ext, ' in ', pathstr,' is a NOT face!']))
        isFace = 0;
    end
    
end