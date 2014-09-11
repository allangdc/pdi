
function retval = MSE(imgReal, imgNoised)
    [l, c, chan] = size(imgReal);
    err = (imgReal - imgNoised) .* (imgReal - imgNoised);
    retval = sum( sum(err) ) / (l*c);
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

for i=1:1000
    n = imnoise(img, 'gaussian');
    imgSoma = imgSoma + n;
    imgMedia = imgSoma ./ i;
    erro = MSE(img, imgMedia);
endfor;

imshow(imgMedia);
erro

pause;