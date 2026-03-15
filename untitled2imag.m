
img=imread('IM-0001-0080.png');%读取处理好的图片，必须是严格坐标轴线为边界的图片
img=imread('IM-0001-0001.png');%读
img=imresize(img, [64, 64]);
img1=rgb2gray(img);           %灰度变化,彩色变灰色
img2 = im2double(img1);     %归一化
[pp,qq]=size(img2);

% kernel = fspecial('gaussian',7,5)  %高斯模糊
% blurred_img = filter2(kernel, img2, 'same')


r=86;%参数
for i=1:150
for j=1:pp
if abs(i-j)<=r
A(i,j)=(1/(1*sqrt(2*pi)))*exp((-(i-j)^2)/(2*(1^2)));
end
end
end
%%%%%%%%%%
l=86;
for i=1:150
for j=1:pp
if abs(i-j)<=l
B(i,j)=1/(2*l-1);
end
end
end
A_1=kron(A,B);
A=A_1;%高斯模糊矩阵

X1=img2;%原始数据归一化
X2 = reshape(X1,[],1); % 将原始矩阵转换为一列拉直
% B1 = reshape(b,[],100)%还原

b=A*X2;%经过高斯模糊

bb = im2uint8(reshape(b,[150,150]));
% imshow(bb)

q=15;
seita=1;
[time1,xk1,t1,k1]=rrs_imag1(A,b,X2,q)
[time2,xk2,t2,k2]=rgrs_imag1(A,b,X2,q,seita)
[time3,xk3,t3,k3]=rrs_imag1(A,b,X2,q)
[time4,xk4,t4,k4]=rgrs_imag1(A,b,X2,q,seita)
[time5,xk5,t5,k5]=rrs_imag1(A,b,X2,q)
[time6,xk6,t6,k6]=rgrs_imag1(A,b,X2,q,seita)

xkk1=im2uint8(reshape(xk1,[64,64]));
bbb1 = xkk1;
psnr(img1,xkk1)
 ssim(img2,im2double(bbb1))

 xkk2=im2uint8(reshape(xk2,[64,64]));
bbb2 = xkk2;
psnr(img1,xkk2)
 ssim(img2,im2double(bbb2))

xkk3=im2uint8(reshape(xk3,[64,64]));
bbb3 = xkk3;
psnr(img1,xkk3)
 ssim(img2,im2double(bbb3))

xkk4=im2uint8(reshape(xk4,[64,64]));
bbb4 = xkk4;
psnr(img1,xkk4)
 ssim(img2,im2double(bbb4))

xkk5=im2uint8(reshape(xk5,[64,64]));
bbb5 = xkk5;
psnr(img1,xkk5)
 ssim(img2,im2double(bbb5))

xkk6=im2uint8(reshape(xk6,[64,64]));
bbb6 = xkk6;
psnr(img1,xkk6)
 ssim(img2,im2double(bbb6))

subplot(2, 4, 1);
imshow(img2);
colormap jet
title('Original');
set(gca, 'Position', [0.1 0.62 0.23 0.23]);

subplot(2, 4, 2);
imshow(bb);
colormap jet
 title('Blurred'); %显示图片
 text(33, 70, '', 'HorizontalAlignment', 'center');
set(gca, 'Position', [0.3 0.62 0.23 0.23]);

subplot(2, 4, 3);
imshow(bbb1);
colormap jet
 title('RRS(5)'); %显示图片
 text(33, 70, '', 'HorizontalAlignment', 'center');
set(gca, 'Position', [0.5 0.62 0.23 0.23]);

subplot(2, 4, 4);
imshow(bbb2);
colormap jet
 title('RRGRS(5)'); %显示图片
 text(33, 70, '', 'HorizontalAlignment', 'center');
set(gca, 'Position', [0.7 0.62 0.23 0.23]);

subplot(2, 4, 5);
imshow(bbb3);
colormap jet
 title('RRS(10)'); %显示图片
 text(33, 70, '', 'HorizontalAlignment', 'center');
set(gca, 'Position', [0.1 0.30 0.23 0.23]);

subplot(2, 4, 6);
imshow(bbb4);
colormap jet
 title('RRGRS(10)'); %显示图片
 text(33, 70, '', 'HorizontalAlignment', 'center');
set(gca, 'Position', [0.3 0.30 0.23 0.23]);

subplot(2, 4, 7);
imshow(bbb5);
colormap jet
 title('RRS(15)'); %显示图片
 text(33, 70, '', 'HorizontalAlignment', 'center');
set(gca, 'Position', [0.5 0.30 0.23 0.23]);

subplot(2, 4, 8);
imshow(bbb6);
colormap jet
 title('RRGRS(15)'); %显示图片
 text(33, 70, '', 'HorizontalAlignment', 'center');
set(gca, 'Position', [0.7 0.30 0.23 0.23]);




xkk=im2uint8(reshape(xk,[64,64]));
bbb = xkk;
 psnr(img1,xkk)

 ssim(img2,im2double(bbb5))