% Filtros

IMG = 'lena.jpg';

img1 = im2double(imread(IMG));

r_img1 = imnoise(img1, ‘salt & pepper’, 0.1);

h1 = fspecial('laplacian', 0);

h3 = fspecial('gaussian', 3, 3);
h5 = fspecial('gaussian', 5, 3);
h7 = fspecial('gaussian', 7, 3);

img2 = conv2(img1, h3);
img3 = conv2(img1, h5);
img4 = conv2(img1, h7);


img1l = conv2(img1, h1);
img2l = conv2(img2, h1);
img3l = conv2(img3, h1);
img4l = conv2(img4, h1);


f1 = figure('name','Imagem Original');
subplot(1,2,1);
imshow(img1);
title('original');
subplot(1,2,2);
imshow(img1l);
title('laplaciano original');


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