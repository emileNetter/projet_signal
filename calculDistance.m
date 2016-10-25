function [ d ] = calculDistance(xi,mu,sigma )
xi=double(xi);
inverseSigma=inv(sigma);
d=((xi-mu)')*inverseSigma*(xi-mu);
end

