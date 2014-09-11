
function retval = MSE(imgReal, imgNoised)
    mat = (imgReal - imgNoised) .* (imgReal - imgNoised)
endfunction;

%windows size
XSIZE=1300;
YSIZE=900;

%filename image
IMG = "tigre.jpg";

pkg load image

img = im2double( imread(IMG) );
img = rgb2gray(img);

[lin, col, ch] = size(img);
imgSoma = zeros(lin, col);
imgMedia = zeros(lin, col);
ErrQuadSoma = zeros(lin, col);

for i=1:5
    n = imnoise(img, 'gaussian');
    imgSoma = imgSoma + n;
    imgMedia = imgSoma ./ i;
    ErrQuadSoma = ErrQuadSoma + ((img - imgMedia) .* (img - imgMedia));
    MSE = ErrQuadSoma ./ i;
endfor;

imshow(imgMedia);
MSE

pause;