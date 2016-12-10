function [barycentre] = findBarycentre(imageBinaire)
imageLabelisee = bwlabel(imageBinaire);
nbTrouve=max(max(imageLabelisee));
barycentre=zeros(2,nbTrouve);
for i=1:nbTrouve
[x,y]=find(imageLabelisee==i);
bar=[mean(x);mean(y)];
barycentre(:,i)=bar;
end;
figure, imagesc(imageLabelisee);