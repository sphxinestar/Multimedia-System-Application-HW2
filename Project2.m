close 'all';
clear 'all'; %�M�����e���ܼ�

image1 = imread('image1.jpg');  
image2 = imread('image2.png'); %Ū����i�Ϥ���

image1_gray = rgb2gray(image1);
image2_gray = rgb2gray(image2); %�N�Ϥ��ন�Ƕ��v��

figure(1)
subplot(2, 2, 1)
imshow(image1_gray)  %�e�쥻���ɮ�
subplot(2, 2, 2)
imhist(image1_gray)         %�쥻�ɮת������
subplot(2, 2, 3)
image1_gray_his = histeq(image1_gray);   
imshow(image1_gray_his)          %�N���ɧ��Ť�
subplot(2, 2, 4)
imhist(image1_gray_his)          %���Ťƫ᪺�����

figure(2)
subplot(2, 2, 1)
imshow(image2_gray)  %�e�쥻���ɮ�
subplot(2, 2, 2)
imhist(image2_gray)         %�쥻�ɮת������
subplot(2, 2, 3)
image2_gray_his = histeq(image2_gray);   
imshow(image2_gray_his)          %�N���ɧ��Ť�
subplot(2, 2, 4)
imhist(image2_gray_his)          %���Ťƫ᪺�����

%    Sobel�����l
%   x = |-1 -2 -1 |
%       | 0  0  0 |
%       | 1  2  1 |
%   y = |-1  0  1 |
%       |-2  0  2 |
%       |-1  0  1 |

image1_gray_dou = im2double(image1_gray);
image2_gray_dou = im2double(image2_gray); %�N�Ϯ����ܦ�����׭�

% �쥻�O�Ϊ���ϹL�᪺�ƭȦA�������
% ���o�{�Ϸ|�ܼҽk(?

for i = 1 : (size(image1_gray_dou, 1) - 2) %218
    for j = 1 : (size(image1_gray_dou, 2) -2) %404
        sobelx = ((image1_gray_dou(i + 2, j) + 2 * image1_gray_dou(i + 2, j + 1) + image1_gray_dou(i + 2, j + 2)) - (image1_gray_dou(i, j) + 2 * image1_gray_dou(i, j + 1) + image1_gray_dou(i, j + 2)));
        sobely = ((image1_gray_dou(i, j + 2) + 2 * image1_gray_dou(i + 1, j + 2) + image1_gray_dou(i + 2, j + 2)) - (image1_gray_dou(i, j) + 2 * image1_gray_dou(i + 1, j) + image1_gray_dou(i + 2, j)));
        magnitude = abs(sobelx) + abs(sobely);
        sobelxy(i, j) = magnitude;
    end
end

figure(3);
subplot(2, 2, 1)
imshow(image1);         
subplot(2, 2, 2)
imshow(sobelxy);  

clear sobelxy

for i = 1 : (size(image2_gray_dou, 1) - 2)
    for j = 1 : (size(image2_gray_dou, 2) -2)
        sobelx = ((image2_gray_dou(i + 2, j) + 2 * image2_gray_dou(i + 2, j + 1) + image2_gray_dou(i + 2, j + 2)) - (image2_gray_dou(i, j) + 2 * image2_gray_dou(i, j + 1) + image2_gray_dou(i, j + 2)));
        sobely = ((image2_gray_dou(i, j + 2) + 2 * image2_gray_dou(i + 1, j + 2) + image2_gray_dou(i + 2, j + 2)) - (image2_gray_dou(i, j) + 2 * image2_gray_dou(i + 1, j) + image2_gray_dou(i + 2, j)));
        magnitude = abs(sobelx) + abs(sobely);
        sobelxy(i, j) = magnitude;
    end
end

figure(3);
subplot(2, 2, 3)
imshow(image2);    
subplot(2, 2, 4)
imshow(sobelxy);      