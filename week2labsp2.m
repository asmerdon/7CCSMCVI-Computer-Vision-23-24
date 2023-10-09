help corr2
corr2(Ib,Ib)
Ia=imread('rooster.jpg');
Ib=imread('elephant.png');
Ic=imread('woods.png');
%Excercise 3:%
Iblarge1=imresize(Ib,5);
figure(1), imagesc(Iblarge1);