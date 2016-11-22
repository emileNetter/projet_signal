clear all
close all

load('modeleColorEtSeuil.mat');
load('modeleMainColorEtSeuil.mat')

videoFinale=VideoWriter( 'videoFinale .avi' );
open(videoFinale);

v=VideoReader('video.mp4');  
N=v.NumberofFrames; 

for w=1:N
    
img1 = read(v,w);   

%Distance de MAHA Picot 

matD=calculDistance(img1,mu,sigma);
%figure, imagesc(matD); 

% Distance de MAHA main :

matD2=calculDistance(img1,muMain,sigmaMain);
%figure, imagesc(matD2);

%Seuillage + binarisation 

imageBinairePicot=binarisation(img1,matD,seuil);
imageBinaireMain=binarisation(img1,matD2,seuilMain);

%Labellisation sur la première image

bar=findBarycentre(imageBinairePicot);

%Organisation barycentre 
if w==1 % organisation image 1 faite à la main
bar1=bar(:,1);
bar2=bar(:,2);
bar3=bar(:,3);
bar4=bar(:,4);
tmp=bar1;
bar1=bar2;
bar2=bar4;
bar4=tmp;
bar=[bar1,bar2,bar3,bar4];
else 
bar=ordonnerBarycentre(refbar,bar); % organisation des images suivantes
end
refbar=bar;% on stocke le barycentre de l'image actuelle pour l'utiliser dans l'image suivante


% Changement image 

newImg=imread('LogoBDS.png');
xPoint=[bar(1,1),bar(1,2),bar(1,3),bar(1,4)];
yPoint=[bar(2,1),bar(2,2),bar(2,3),bar(2,4)];
newFrame=motif2frame(newImg,img1,yPoint,xPoint,1/1.20,imageBinaireMain);

%figure, imagesc(newFrame);

writeVideo(videoFinale,newFrame) %rajoute la frame à la vidéo
end

close(videoFinale); % enregistre la vidéo  