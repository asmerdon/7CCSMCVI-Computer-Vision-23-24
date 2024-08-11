I=imread("elephant.png");
%Convert to double:
Id = im2double(I);
%Create gabors:

g1 = gabor2(3,0.1,0,0.75,90);
g2 = gabor2(3,0.1,15,0.75,90);
g3 = gabor2(3,0.1,30,0.75,90);
g4 = gabor2(3,0.1,45,0.75,90);
g5 = gabor2(3,0.1,60,0.75,90);
g6 = gabor2(3,0.1,75,0.75,90);
g7 = gabor2(3,0.1,90,0.75,90);
g8 = gabor2(3,0.1,105,0.75,90);
g9 = gabor2(3,0.1,120,0.75,90);
g10 = gabor2(3,0.1,135,0.75,90);
g11 = gabor2(3,0.1,150,0.75,90);
g12 = gabor2(3,0.1,165,0.75,90);

%Convolve
c1 = conv2(Id, g1, "valid");
c2 = conv2(Id, g2, "valid");
c3 = conv2(Id, g3, "valid");
c4 = conv2(Id, g4, "valid");
c5 = conv2(Id, g5, "valid");
c6 = conv2(Id, g6, "valid");
c7 = conv2(Id, g7, "valid");
c8 = conv2(Id, g8, "valid");
c9 = conv2(Id, g9, "valid");
c10 = conv2(Id, g10, "valid");
c11 = conv2(Id, g11, "valid");
c12 = conv2(Id, g12, "valid");
%Combine
c = c1+c2+c3+c4+c5+c6+c7+c8+c9+c10+c11+c12;
m = max(cat(3, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12), [], 3);
figure, clf
subplot(2,2,1), imagesc(m)
subplot(2,2,2), imagesc(c)

m(64,65)
m(280,258)
