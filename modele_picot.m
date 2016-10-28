clear global
close all

v=VideoReader('video.mp4');  
img1 = readFrame(v); %mettre read(v,1) dans la version 2014 !!!
imshow(img1);
[x,y]=ginput(2);
imgInteret=img1(min(y):max(y),min(x):max(x),:);
imshow(imgInteret);

%calcul de � moyenne
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
sigma11=mean((vectR-moyenneR).^2);%verifier mean mean
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
inverseSigma=inv(sigma);
nbrePixelsColonne=size(img1,2);
nbrePixelsLigne=size(img1,1);
Rimg1=img1(:,:,1);
Gimg1=img1(:,:,2);
Bimg1=img1(:,:,3);
matD=zeros(nbrePixelsLigne,nbrePixelsColonne);

for k=1:nbrePixelsColonne
    for j=1:nbrePixelsLigne
        xi=[Rimg1(j,k);Gimg1(j,k);Bimg1(j,k)];
        matD(j,k)=calculDistance(xi,mu,sigma);
    end
end
figure, imagesc(matD);

%Seuillage, cr�ation d'une section pour effectuer les tests de seuillage
%%
imageBinaire=zeros(nbrePixelsLigne,nbrePixelsColonne);
seuil=500;
for k=1:nbrePixelsColonne
    for j=1:nbrePixelsLigne
        if matD(j,k)<seuil
            imageBinaire(j,k)=1;
        end
    end
end
figure, imagesc(imageBinaire),colorbar,colormap(gray(256)); %affichage en noir et blanc

%Sauvegarde des param�tres
%save('modeleColorEtSeuil.mat','mu','sigma','seuil');







