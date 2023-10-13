Ia=imread('rooster.jpg');
Ib=imread('elephant.png');
Ic=imread('woods.png');
Id=imread('boxes.pgm');
%Excercise 1:
I1 = fspecial("average",5);
I2 = fspecial("average",25);
box5=ones(5,5)./(5^2);
box25=ones(25,25)./(25^2);
%Make rooster image greyscale:
Ia2 = rgb2gray(Ia);
%Convolve
convolveda5 = conv2(Ia2, box5,'same');
convolveda25 = conv2(Ia2, box25,'same');
convolvedd5 = conv2(Id, I1,'same');
convolvedd25 = conv2(Id, I2,'same');

convolveda5(297,220)
convolveda25(297,220)
convolvedd5(10,78)
convolvedd25(10,78)

%Excercise 2:
g1 = fspecial("Gaussian",9,1.5);
g2 = fspecial("Gaussian",60,10);
c1 = conv2(Ia2,g1,'same');
c2 = conv2(Ia2,g2,'same');
c3 = conv2(Id,g1,'same');
c4 = conv2(Id,g2,'same');

c1(334,213)
c2(334,213)
c3(4,47)
c1(4,47)
