function [imageBinaire]= binarisation (img, matDistanceMaha,seuil )
nbrePixelsColonne=size(img,2);
nbrePixelsLigne=size(img,1);

imageBinaire=zeros(nbrePixelsLigne,nbrePixelsColonne);
for k=1:nbrePixelsColonne
    for j=1:nbrePixelsLigne
        if matDistanceMaha(j,k)<seuil
            imageBinaire(j,k)=1;
        end
    end
end
%figure, imagesc(imageBinaire),colorbar,colormap(gray(256)); %affichage en noir et blanc