function [ matD ] = calculDistance(img,mu,sigma)


invSigma=inv(sigma);
Rimg=double(img(:,:,1));
Gimg=double(img(:,:,2));
Bimg=double(img(:,:,3));

xR=reshape(Rimg,1,[])-mu(1); % on met tout les pixels Rouge - la moyenne de rouge dans une matrice à une ligne
xG=reshape(Gimg,1,[])-mu(2);
xB=reshape(Bimg,1,[])-mu(3);

vectGlob=[xR;xG;xB]; % on stocke ca dans un vecteur 3,n avec n=nbre de Pixels

distMaha=vectGlob.*(invSigma*vectGlob); % on applique la formule de la distance de Maha 

distMaha=sum(distMaha,1); % on somme les 3 lignes d'une même colonne pour obtenir la distance de Maha exacte

matD=reshape(distMaha,size(img,1),size(img,2)); % on transforme la matrice en une matrice à la même taille de l'image pour pouvoir appliquer le reste du traitement

%figure,imagesc(matD);