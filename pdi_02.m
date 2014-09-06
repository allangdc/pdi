%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                               %
%   Trabalho Processamento Digital de Imagens   %
%                                               %
%   Allan Galdino - 0322961                     %
%                                               %
%   Walberto Fagner                             %
%                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

XSIZE = 1024;
YSIZE = 768;
IMG = 'leao.jpg';

pkg load image % necessario para Octave. pode comentar para Matlab

imgRGB = imread(IMG);
img = im2double( rgb2gray(imgRGB) );

x=XSIZE;
y=YSIZE;
f1 = figure('Name', sprintf('Imagem %s',IMG), 'Position', [0 0 XSIZE YSIZE]);
f2 = figure('Name', sprintf('Histograma %s',IMG), 'Position', [0 0 XSIZE YSIZE]);
for i=1:6
    pic = imresize(img, [y x]);
    pic = imresize(pic, [192 256]);
    figure(f1);
    subplot(3, 2, i )
    imshow( pic );
    title(sprintf('Figura Resolução %dx%d',x,y))
    figure(f2);
    subplot(3, 2, i )
    hist( pic(:) , 20, 1.0);
    title(sprintf('Histograma Resolução %dx%d',x,y))
    x=x/2;
    y=y/2;
endfor;

pause;





