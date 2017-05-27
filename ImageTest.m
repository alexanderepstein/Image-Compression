
%clear all;
imagefile = 'nature.jpg';
insert = @(a, x, n)cat(2,  x(1:n), a, x(n+1:end));
showImages = 0;
res = 1;
start = 1;
step = 5;
ending = 300;
count =2;
plotcount =2;

a = 1;


xq = 1:res:ending;
N=linspace(start,ending,ending/step);
C=linspace(start,ending,ending);
y=linspace(start,ending,ending/step);
z=linspace(start,ending,ending);
N = insert(0,N,0);


y = insert(100,y,0);

figure(500);
title(['Image Quality x Singular Values']);
[error , compressedimage] = rgbSVD(imagefile,1,0);
subplot(2,3,1) ,imshow(uint8(compressedimage)), title([num2str(1) ' singular value used']);

sprintf('Stage 1 Complete \n\n')

for i = start:step:ending
    if (mod(a,4) ==0)
        a=1;
        
        if (plotcount+1 <= 6)
            [error , compressedimage] = rgbSVD(imagefile,i-1,0);
            subplot(2,3,plotcount) ,imshow(uint8(compressedimage)), title([num2str(i-1) ' singular values used']);
            plotcount = plotcount +1;
        end
    end
    if mod(i-1,30)==0
        % y(count) = rgbSVD('nature.jpg',i,showImages);
        % if (plotlist) <= 2*5
        %newimage = imread('nature.jpg');
        %[indexedimage,colorMap] = rgb2ind(uint8(newimage),128);
        %subplot(2,5,plotlist),imshow(uint8(indexedimage),uint8(colorMap)),  title(['Compressed Image with '  num2str(i)  ' singular values'])
        %plotlist = plotlist +1;
        y(count) = rgbSVD(imagefile,i,showImages);
    else
        y(count) = rgbSVD(imagefile,i,0);
    end
    
    count=count+1;
    a = a+1;
end

sprintf('Stage 2 Complete \n\n')

count =2;
for i = 1:res:ending
    [z(count) , images] = rgbSVD(imagefile,i,0);
    count = count +1;
    
end

sprintf('Stage 3 Complete \n\n')

C = insert(0,C,0);
subplot(2,3,6) , imshow(imagefile) , title('Original Image');
%z = insert(100,z,0);
%xq = insert(0,xq,0);
vq = interp1(C,z,xq,'PCHIP');
movegui(500,'west');
figure(ending+1);

syms b;
l = vpasolve(vq(1)/b==100,b);
vq = double(vq/l);

plot(xq,vq);
title('Error in compression');
grid on
xlabel('Number of Singular Values used');
ylabel('Percent Error between compressed and original image');
set(gca,'xtick',[0:25:300]);
movegui(ending+1,'east');
p = polyfit(xq,vq,2);

legend([num2str(p(1)) 'x^2  + ' num2str(p(2)) 'x  + 100']);


sprintf('Stage 4 Complete \n\n')