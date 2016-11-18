clear global
close all

v=VideoReader('video.mp4');  
img1 = read(v,1); %mettre read(v,1) dans la version 2014 !!!
imshow(img1);
[x,y]=ginput(2);
imgInteret=img1(min(y):max(y),min(x):max(x),:);
imshow(imgInteret);

%calcul de µ moyenne
R=imgInteret(:,:,1);
G=imgInteret(:,:,2);
B=imgInteret(:,:,3);
vectR=R(:);
vectG=G(:);
vectB=B(:);
moyenneR=mean(vectR);
moyenneG=mean(vectG);
moyenneB=mean(vectB);
mu=[moyenneR;moyenneG;moyenneB];

%calcul de sigma matrice de covariance
sigma11=mean((vectR-moyenneR).^2);
sigma12=mean((vectR-moyenneR).*(vectG-moyenneG));
sigma13=mean((vectR-moyenneR).*(vectB-moyenneB));
sigma21=sigma12;
sigma22=mean((vectG-moyenneG).^2);
sigma23=mean((vectG-moyenneG).*(vectB-moyenneB));
sigma31=sigma13;
sigma32=sigma23;
sigma33=mean((vectB-moyenneB).^2);

sigma=[sigma11 sigma12 sigma13; sigma21 sigma22 sigma23; sigma31 sigma32 sigma33];

%Distance de MAHA

matD=calculDistance(img1,mu,sigma);

%Seuillage, création d'une section pour effectuer les tests de seuillage
%%
seuil=500;
imageBinaire=binarisation(img1,matD,seuil);




%Sauvegarde des paramètres pour les utiliser dans le reste du programme
%save('modeleColorEtSeuil.mat','mu','sigma','seuil');













