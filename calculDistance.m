function [ matD ] = calculDistance(img,mu,sigma)
nbrePixelsColonne=size(img,2);
nbrePixelsLigne=size(img,1);
Rimg=img(:,:,1);
Gimg=img(:,:,2);
Bimg=img(:,:,3);
matD=zeros(nbrePixelsLigne,nbrePixelsColonne);
inverseSigma=inv(sigma);

for k=1:nbrePixelsColonne
    for j=1:nbrePixelsLigne
        xi=[Rimg(j,k);Gimg(j,k);Bimg(j,k)];
        xi=double(xi);
        matD(j,k)=((xi-mu)')*inverseSigma*(xi-mu);;
    end
end

end

