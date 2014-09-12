
function retval = MSE(imgReal, imgNoised)       % funcao para calcular o erro de
    [l, c, chan] = size(imgReal);               %     uma imagem em relacao a original
    err = (imgReal - imgNoised) .* (imgReal - imgNoised);
    retval = sum( sum(err) ) / (l*c);
endfunction;

%windows size
XSIZE=1300;
YSIZE=900;

%filename image
IMG = 'leao.jpg';      %imagem a ser carregada

iterations = 100;       %numero de iteracoes a serem executadas

pkg load image %Necessario somente para Octave, tem que comentar para Matlab

img = im2double( imread(IMG) );
img = rgb2gray(img);

[lin, col, ch] = size(img);
imgSoma = zeros(lin, col);
imgMedia = zeros(lin, col);

verro=zeros(iterations);        %inicializa vetor de erros
item=0;                         %variavel auxiliar para plotar o grafico

f1 = figure('Name', sprintf('Imagem %s',IMG), 'Position', [0 0 XSIZE YSIZE]);
for i=1:iterations;
    n = imnoise(img, 'gaussian', 0.01); %Inserir ruido gaussiano
    imgSoma = imgSoma + n;              %Somatorio das Imagens
    imgMedia = imgSoma ./ i;            %Media das Imagens
    erro = MSE(img, imgMedia);          %Erro da Imagem(i)
    verro(i) = erro;                    %Adiciona erros ao vetor de erros
    
    figure(f1);
    if i==1 | i==10 | i==20 | i==100
        item++;
        subplot(2,2,item);
        imshow(imgMedia);
        title(sprintf('Iteracao=%d , Erro=%f',i,erro));
    end
endfor;

f2 = figure('Name', sprintf('Grafico'), 'Position', [0 0 XSIZE YSIZE]);
figure(f2);
plot(verro)

pause;