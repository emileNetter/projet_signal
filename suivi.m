clear all
close all

load('modeleColorEtSeuil.mat');
load('modeleMainColorEtSeuil.mat')


v=VideoReader('video.mp4');  
N=v.NumberofFrames; 

for w=56:60
    
img1 = read(v,w);  %mettre read(v,1) dans la version 2014 !!!   Faire une boucle avec img(v,w) quand on aura tout r�ussi,
%ca sert a rien de refaire sur la 1.

%Pas utile ici :
%imshow(img1); 
% [x,y]=ginput(2);
% imgInteret=img1(min(y):max(y),min(x):max(x),:);
% imshow(imgInteret);
 
%%%Distance de MAHA Picot : Trouver comment la rendre plus rapide 

matD=calculDistance(img1,mu,sigma);
%figure, imagesc(matD);

%%% Distance de MAHA main :

matD2=calculDistance(img1,muMain,sigmaMain);
%figure, imagesc(matD2);


%Seuillage + binarisation , cr�ation d'une section pour effectuer les tests de seuillage


imageBinairePicot=binarisation(img1,matD,seuil)
imageBinaireMain=binarisation(img1,matD2,seuilMain)

%Labellisation sur la premi�re image

bar=findBarycentre(imageBinairePicot);

% Plus besoin de ca on l'a dans la fonction
% imageLabelisee = bwlabel(imageBinairePicot,4);% voir a quoi sert le 4 , pas ce qu'on pense
% [x1,y1]=find(imageLabelisee==1);
% [x2,y2]=find(imageLabelisee==2);
% [x3,y3]=find(imageLabelisee==3);
% [x4,y4]=find(imageLabelisee==4);

%figure, imagesc(imageLabelisee);


%calcul barycentres image 1

% bar1=[mean(x1);mean(y1)];
% bar2=[mean(x2);mean(y2)];
% bar3=[mean(x3);mean(y3)];
% bar4=[mean(x4);mean(y4)];

bar1=bar(:,1);
bar2=bar(:,2);
bar3=bar(:,3);
bar4=bar(:,4);

%Organisation barycentre image 1 
if w==56
tmp=bar1;
bar1=bar2;
bar2=bar4;
bar4=tmp;
bar=[bar1,bar2,bar3,bar4];
else 
bar=ordonnerBarycentre(refbar,bar);
end
refbar=bar;% on stocke le barycentre de l'image pour l'utiliser dans l'image suivante
% Faire fonction pour ordonner les barycentres d'une image � l'autre


% Changement image 

newImg=imread('LogoBDS.png');
xPoint=[bar(1,1),bar(1,2),bar(1,3),bar(1,4)];
yPoint=[bar(2,1),bar(2,2),bar(2,3),bar(2,4)];
newFrame=motif2frame(newImg,img1,yPoint,xPoint,1,imageBinaireMain);

figure, imagesc(newFrame);


end








    