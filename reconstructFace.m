function reconstructFace(original)

    if exist('eigenfaces.mat', 'file') ~= 0
        load('eigenfaces.mat'); %load eigen faces
    else
        error('File "eigenfaces.mat" does not exist. Please train first.')
    end
    representatiton = double(original(:)') / 256 * efM;
    reconstruction = representatiton * efM' * 256;

    reconstruction_error = sum(sum((double(original(:)')-reconstruction).^2)) / size(original(:),1);

    figure('name', 'original vs reconstructed')

    subplot(1,2,1)
    imshow(original)
    title('original image')

    subplot(1,2,2)
    imshow(reshape(uint8(reconstruction), size(original)))
    title(sprintf('reconstructed (%d eigenfaces, %.2f mse)', size(efM,2), reconstruction_error))
end