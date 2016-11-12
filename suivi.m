clear all
close all

load('modeleColorEtSeuil.mat');
load('modeleMainColorEtSeuil.mat')


v=VideoReader('video.mp4');  
N=v.NumberofFrames; 

for w=1:1
    
img1 = read(v,w);  %mettre read(v,1) dans la version 2014 !!!   Faire une boucle avec img(v,w) quand on aura tout réussi,
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


%Seuillage, création d'une section pour effectuer les tests de seuillage
%% Creer une fonction Binarisation pour plus de clarté 

imageBinairePicot=binarisation(img1,matD,seuil)
imageBinaireMain=binarisation(img1,matD2,seuilMain)


%Labellisation sur la première image

imageLabelisee = bwlabel(imageBinairePicot,4);% voir a quoi sert le 4 , pas ce qu'on pense
[x1,y1]=find(imageLabelisee==1);
[x2,y2]=find(imageLabelisee==2);
[x3,y3]=find(imageLabelisee==3);
[x4,y4]=find(imageLabelisee==4);

%figure, imagesc(imageLabelisee);


%calcul barycentres image 1

bar1=[mean(x1);mean(y1)];
bar2=[mean(x2);mean(y2)];
bar3=[mean(x3);mean(y3)];
bar4=[mean(x4);mean(y4)];

%Organisation barycentre image 1 
tmp=bar1;
bar1=bar2;
bar2=bar4;
bar4=tmp;

% Faire fonction pour ordonner les barycentres d'une image à l'autre

% Changement image 

newImg=imread('LogoBDS.png');
xPoint=[bar1(1),bar2(1),bar3(1),bar4(1)];
yPoint=[bar1(2),bar2(2),bar3(2),bar4(2)];
newFrame=motif2frame(newImg,img1,yPoint,xPoint,1,imageBinaireMain);

figure, imagesc(newFrame);


end








    