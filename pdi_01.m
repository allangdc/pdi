%PDI - Componentes RGB

%windows size
XSIZE=1300;
YSIZE=900;

%filename image
IMG = "tigre.jpg";

pkg load image

img = im2double( imread(IMG) );
[lin, col, ch] = size(img);

r = img(:,:,1);
g = img(:,:,2);
b = img(:,:,3);
media_aritmetica = ( (r + g + b)./ 3.0 );
soma_simetrica = (r .* g .* b) ./ (1.0-r-g-b+(r.*g)+(r.*b)+(g.*b));
rgb_to_gray = rgb2gray(img);


figure('Name', 'Figura Original');
imshow(img);
figure('Name', 'Componentes RGB', 'Position', [0 0 XSIZE YSIZE]);
subplot(2,3,1)
imshow(r);
subplot(2,3,4)
hist(r(:), 32);

subplot(2,3,2)
imshow(g);
subplot(2,3,5)
hist(g(:), 32);

subplot(2,3,3)
imshow(b);
subplot(2,3,6)
hist(b(:), 32);

figure('Name', 'Media Aritmética', 'Position', [0 0 XSIZE YSIZE]);
subplot(1,2,1)
imshow(media_aritmetica);
subplot(1,2,2)
hist(media_aritmetica(:), 32);

figure('Name', 'RGB2GRAY', 'Position', [0 0 XSIZE YSIZE]);
subplot(1,2,1)
imshow(rgb_to_gray);
subplot(1,2,2)
hist(rgb_to_gray(:), 32);

figure('Name', 'Soma Aritmética', 'Position', [0 0 XSIZE YSIZE]);
subplot(1,2,1)
imshow(soma_simetrica);
subplot(1,2,2)
hist(soma_simetrica(:), 32);

pause;
