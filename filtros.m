% Filtros

IMG = 'lena.jpg';

img1 = im2double(imread(IMG));

%img1 = imnoise(img1, 'salt & pepper', 0.02);

h1 = fspecial('laplacian', 0);      % kernel do filtro laplaciano

h3 = fspecial('gaussian', 3, 3);    % kernel do filtro gaussiano
h5 = fspecial('gaussian', 5, 3);
h7 = fspecial('gaussian', 7, 3);

% gaussiana da imagem
img2 = imfilter(img1,h3,'conv');
img3 = imfilter(img1,h5,'conv');
img4 = imfilter(img1,h7,'conv');

% laplaciano da imagem
img1l = imfilter(img1,h1,'conv');

% laplaciano da gaussiana da imagem (LoG)
img2l = imfilter(img2,h1,'conv');
img3l = imfilter(img3,h1,'conv');
img4l = imfilter(img4,h1,'conv');


% laplaciano normalizado entre 0 e 255
a = max(img1l(:));
b = min(img1l(:));
img1ln = (img1l - b)/(a - b);
a = max(img2l(:));
b = min(img2l(:));
img2ln = (img2l - b)/(a - b);
a = max(img3l(:));
b = min(img3l(:));
img3ln = (img3l - b)/(a - b);
a = max(img4l(:));
b = min(img4l(:));
img4ln = (img4l - b)/(a - b);

% cruzamento por zero
cross1 = edge(img1l,'zerocross');
cross2 = edge(img2l,'zerocross');
cross3 = edge(img3l,'zerocross');
cross4 = edge(img4l,'zerocross');


% plotando as figuras
f1 = figure('name','Imagem Original');
subplot(2,2,1);
imshow(img1);
title('original');
subplot(2,2,2);
imshow(img1l);
title('laplaciano original');
subplot(2,2,3);
imshow(cross1);
title('cruzamento por zero');
subplot(2,2,4);
imshow(img1ln);
title('laplaciano entre 0 e 255');


f2 = figure('name','Filtro Gaussiano 3x3');
subplot(2,2,1);
imshow(img2);
title('gaussiana 3x3 o=3');
subplot(2,2,2);
imshow(img2l);
title('lapl. gauss. (LoG) 3x3 o=3');
subplot(2,2,3);
imshow(cross2);
title('cruzamento por zero');
subplot(2,2,4);
imshow(img2ln);
title('laplaciano entre 0 e 255');

f3 = figure('name','Filtro Gaussiano 5x5');
subplot(2,2,1);
imshow(img3);
title('gaussiana 5x5 o=3');
subplot(2,2,2);
imshow(img3l);
title('lapl. gauss. (LoG) 5x5 o=3');
subplot(2,2,3);
imshow(cross3);
title('cruzamento por zero');
subplot(2,2,4);
imshow(img3ln);
title('laplaciano entre 0 e 255');


f3 = figure('name','Filtro Gaussiano 7x7');
subplot(2,2,1);
imshow(img4);
title('gaussiana 7x7 o=3');
subplot(2,2,2);
imshow(img4l);
title('lapl. gauss. (LoG) 7x7 o=3');
subplot(2,2,3);
imshow(cross4);
title('cruzamento por zero');
subplot(2,2,4);
imshow(img4ln);
title('laplaciano entre 0 e 255');