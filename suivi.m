clear global
close all

load('modeleColorEtSeuil.mat');

v=VideoReader('video.mp4');  
img1 = read(v,1); %mettre read(v,1) dans la version 2014 !!!
imshow(img1);
[x,y]=ginput(2);
imgInteret=img1(min(y):max(y),min(x):max(x),:);
imshow(imgInteret);

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

%Labellisation sur la premi�re image

imageLabelisee = bwlabel(imageBinaire,4);
[x1,y1]=find(imageLabelisee==1);
[x2,y2]=find(imageLabelisee==2);
[x3,y3]=find(imageLabelisee==3);
[x4,y4]=find(imageLabelisee==4);


%calcul barycentres image 1

bar1=[mean(x1);mean(y1)];
bar2=[mean(x2);mean(y2)];
bar3=[mean(x3);mean(y3)];
bar4=[mean(x4);mean(y4)];












    