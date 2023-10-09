Ia=imread('rooster.jpg');
Ib=imread('elephant.png');
Ic=imread('woods.png');

%To change the value at position in an image:%
Ib(403,404)=1;
%To do larger parts of an image, use 'colon' operator:%
Ib(401:end,401:end)=255;
figure(1), clf
imagesc(Ib); colormap('gray')
%We can go further and use this technique to create entirely synthetic
%images:
Isyn=zeros(201,201);
Isyn(51:150,51:150)=1;
Isyn(81:120,:)=0.5;
Isyn(:,81:120)=0.75;
figure(2), clf, imagesc(Isyn); colormap('gray')

%Resizing, or scaling, an image can be done with the command imresize:%
Ibsmall1=imresize(Ib,0.5);
Iblarge1=imresize(Ib,2);
figure(3), clf
subplot(2,2,1), imagesc(Ibsmall1); title('Half size')
subplot(2,2,2), imagesc(Iblarge1); title('Double size')
%We can use different methods to scale the image (demosaicing: bilennear
%and nearest):%
Iblarge2=imresize(Ib,2,'bilinear');
Ibsmall2=imresize(Ib,0.5,'nearest');

%Sometimes we might want to resize an image by padding or cropping: adding
%or removing rows and columns of pixels around the borders of the image:%
Ibpad=padarray(Ib,[10,50]);
Ibcrop=imcrop(Ib,[250,50,120,300]);
subplot(2,2,3), imagesc(Ibpad); title('Padded')
subplot(2,2,4), imagesc(Ibcrop); title('Cropped')
%Note, for padarray the second argument defines how many rows and columns
%will be added to the image, while for imcrop the second argument defines the rectangular region that will be taken from the original image, defined as: [xmin ymin width height].%
Isynv=Isyn(:);
Isynv(1:202:end)=1;
Isyn=reshape(Isynv,201,201);
figure(4), clf, imagesc(Isyn); colormap('gray')
%Excercise 1:
Ibsmall2(250,235)
Ib(250,235)
Iblarge2(250,235)
Ib(500,470)
Iblarge2(1000,940)

%Convert elephant from uint8 to double:%
Ibd=im2double(Ib);
%We then calculate the differences in intensity values between pixels that
%are vertical neighbours. To do this we take all the rows of the image that have a neighbour vertically below them, subtract that neighbour's value, and show the result:%
Ibdiffv=Ibd(1:end-1,:)-Ibd(2:end,:);
figure(4), clf, imagesc(Ibdiffv);colormap('gray');colorbar
%We calculate the differences in intensity values between pixels that are
%horizontal neighbours, using an analogous method:%
Ibdiffh=Ibd(:,1:end-1)-Ibd(:,2:end);
figure(5), clf, imagesc(Ibdiffh);colormap('gray');colorbar
%We can combine the vertical and horizontal difference images into a single
%image showing (using positive pixel values) large changes in the intensity in both the vertical and horizontal directions, by calculating the L2-norm (or Euclidean-norm):%
Ibdiff=sqrt(Ibdiffh(1:end-1,:).^2+Ibdiffv(:,1:end-1).^2);
figure(6), clf, imagesc(Ibdiff); colormap('gray'); colorbar
%We can convert this to a binary image (using one of the conversion methods mentioned in last week's MATLAB exercise), and display it, as follows:
bw=im2bw(Ibdiff,0.075);
figure(7), clf, imagesc(bw); colormap('gray'); colorbar
%Excercise 2:
Ibdiffv(498,400)
Ibdiffh(498,400)
Ibdiff(498, 400)
bw(498,400)

%Excercise 3:
Ibcorr=corr2(Ib, Ibdiffv)
figure(7), imagesc(Icorr)
