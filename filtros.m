% Filtros

IMG = 'lena.jpg';

img1 = im2double(imread(IMG));

r_img1 = imnoise(img1, 'salt & pepper', 0.1);

h1 = fspecial('laplacian', 0);      % kernel do filtro laplaciano

h3 = fspecial('gaussian', 3, 3);    % kernel do filtro gaussiano
h5 = fspecial('gaussian', 5, 3);
h7 = fspecial('gaussian', 7, 3);

% imagem sem ruido
img2 = imfilter(img1,h3,'conv');
img3 = imfilter(img1,h5,'conv');
img4 = imfilter(img1,h7,'conv');

% laplaciano da imagem
img1l = imfilter(img1,h1,'conv');
a = max(img1l(:));
b = min(img1l(:));
img1l = (img1l - b) ./ (a - b);
img2l = imfilter(img2,h1,'conv');
a = max(img2l(:));
b = min(img2l(:));
img2l = (img2l - b) ./ (a - b);
img3l = imfilter(img3,h1,'conv');
a = max(img3l(:));
b = min(img3l(:));
img3l = (img3l - b) ./ (a - b);
img4l = imfilter(img4,h1,'conv');
a = max(img4l(:));
b = min(img4l(:));
img4l = (img4l - b) ./ (a - b);


f1 = figure('name','Imagem Original');
subplot(2,2,1);
imshow(img1);
title('original');
subplot(2,2,2);
imshow(img1l);
title('laplaciano original');
subplot(2,2,3);
hold on;
plot(img1(:,250), 'r');
plot(img1l(:,250), 'b');



f2 = figure('name','Filtro Gaussiano 3x3');
subplot(1,2,1);
imshow(img2);
title('gaussiana 3x3 o=3');
subplot(1,2,2);
imshow(img2l);
title('lapl. gauss. 3x3 o=3');


f3 = figure('name','Filtro Gaussiano 5x5');
subplot(1,2,1);
imshow(img3);
title('gaussiana 5x5 o=3');
subplot(1,2,2);
imshow(img3l);
title('lapl. gauss. 5x5 o=3');


f3 = figure('name','Filtro Gaussiano 7x7');
subplot(1,2,1);
imshow(img4);
title('gaussiana 7x7 o=3');
subplot(1,2,2);
imshow(img4l);
title('lapl. gauss. 7x7 o=3');