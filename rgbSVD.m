% function that takes in an image, N is how many singular values to use,
% and the show boolean should be defaulted to off but I use it in
% ImageTest.m to create a figure
function[error,finalImage] = rgbSVD(image,N,show)

clc

image=imread(image);

doubleR = zeros(size(image,1));
doubleG = zeros(size(image,1));
doubleB = zeros(size(image,1));
 
finalImage= repmat(0,[size(image,1) size(image,2) 3]);

for i = 1:size(image,1)
    for j = 1:size(image,2)
        doubleR(i,j) = image(i,j,1);
        doubleG(i,j) = image(i,j,2);
        doubleB(i,j) = image(i,j,3);
    end
end


doubleR=im2double(doubleR);
doubleG=im2double(doubleG);
doubleB=im2double(doubleB);
%read the image and store it as matrix B, convert the image to a grayscale  
%photo and convert the image to a class 'double'  
[U,S,V]=svd(doubleR);   
S(N+1:end,:)=0;  
S(:,N+1:end)=0;
D=U*S*V';    
finalImage(: , : , 1)=D;
 %Use singular value decomposition on the image doubleB, create a new matrix  
 %C (for Compression diagonal) and zero out all entries above N, (which in  
 %this case is 100). Then construct a new image, D, by using the new  
 %diagonal matrix C. 
    
[U,S,V]=svd(doubleG);
S(N+1:end,:)=0;  
S(:,N+1:end)=0;  
D=U*S*V';  
finalImage(: , : , 2)=D;

[U,S,V]=svd(doubleB);
S(N+1:end,:)=0;  
S(:,N+1:end)=0;  
D=U*S*V';  
finalImage(: , : , 3)=D;

if show ==1
    if N ~= 1
        figure(N-1);
    else
        figure(N);
    end
    
    imshow(uint8(finalImage));  
    title(['Compressed Image with '  num2str(N)  ' singular values']);
    
end
%size(finalImage,(1))
%errordenom=size(finalImage,1)*size(finalImage,2)*3*256;
errordenom = 0;
errornum=0;
error = 0;
for i = 1:size(finalImage,1)
    for j = 1:size(finalImage,2)
        for k = 1:3
 
           errornum = double(errornum + abs((double(finalImage(i,j,k))-double(image(i,j,k)))));
           errordenom = (256-double(image(i,j,k))) + errordenom;
           error = errornum/errordenom + error;
        end
    end
end
error = error * 100;

end
