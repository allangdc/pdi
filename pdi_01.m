%PDI - Componentes RGB

XSIZE=1300;
YSIZE=900;
IMG = "/home/allan/Pictures/tigre.jpg";

pkg load image

img = imread(IMG);
[lin, col, ch] = size(img);

r = img(:,:,1);
g = img(:,:,2);
b = img(:,:,3);
ar = cast(r, 'double');
ag = cast(g, 'double');
ab = cast(b, 'double');
media_aritmetica = cast((ar + ag + ab)/3, 'uint8');
soma_simetrica = zeros(lin, col);
for l=1:lin
    for c=1:col
        pa = ar(l, c);
        pb = ag(l, c);
        pc = ab(l, c);
        den = (1-pa-pb-pc+ pa*pb + pa*pc + pb*pc);
        num=(pa*pb*pc);
        if(den~=0)
            ma = num/den;
        else
            ma = num;
        endif
        soma_simetrica(l, c) = cast(ma, 'uint8');
    endfor
endfor

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

r(150,150)
g(150,150)
b(150,150)
soma_simetrica(150,150)

pause;
