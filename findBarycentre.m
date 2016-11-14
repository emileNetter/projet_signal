function [barycentre] = findBarycentre(imageBinaire)
imageLabelisee = bwlabel(imageBinaire,4);% voir a quoi sert le 4 , pas ce qu'on pense

[x1,y1]=find(imageLabelisee==1);
[x2,y2]=find(imageLabelisee==2);
[x3,y3]=find(imageLabelisee==3);
[x4,y4]=find(imageLabelisee==4);

bar1=[mean(x1);mean(y1)];
bar2=[mean(x2);mean(y2)];
bar3=[mean(x3);mean(y3)];
bar4=[mean(x4);mean(y4)];

barycentre=[bar1,bar2,bar3,bar4];