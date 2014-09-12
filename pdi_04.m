
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

iterations = 100;

pkg load image

img = im2double( imread(IMG) );
img = rgb2gray(img);

[lin, col, ch] = size(img);
imgSoma = zeros(lin, col);
imgMedia = zeros(lin, col);
ErrQuadSoma = zeros(lin, col);

verro=zeros(iterations);
item=0;

f1 = figure('Name', sprintf('Imagem %s',IMG), 'Position', [0 0 XSIZE YSIZE]);
figure(f1);
for i=1:iterations;
    n = imnoise(img, 'gaussian', 0.02);
    imgSoma = imgSoma + n;
    imgMedia = imgSoma ./ i;
    erro = MSE(img, imgMedia);
    verro(i) = erro;
    
    if i==1 | i==10 | i==20 | i==100
        item++;
        subplot(2,2,item);
        imshow(imgMedia);
        title(sprintf('Iteracao=%d , Erro=%f',i,erro));
    end
endfor;

erro
f2 = figure('Name', sprintf('Grafico'), 'Position', [0 0 XSIZE YSIZE]);
figure(f2);
plot(verro)

pause;