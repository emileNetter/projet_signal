function [barycentre] = findBarycentre(imageBinaire)
imageLabelisee = bwlabel(imageBinaire,4);% voir a quoi sert le 4 , pas ce qu'on pense
nbTrouve=max(max(imageLabelisee));
barycentre=zeros(2,nbTrouve);
for i=1:nbTrouve
[x,y]=find(imageLabelisee==i);
bar=[mean(x);mean(y)];
barycentre(:,i)=bar;
end;