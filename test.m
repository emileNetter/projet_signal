% ref=[310.521072796935 296.603053435115 152.931034482759 168.890350877193;194.137931034483 399.564885496183 391.202586206897 193.333333333333]
% actuel=[175.500 174.3347 315.8281 151.7787;175 194.7161 199.8035 392.400]
% 
% a=size(actuel,2);
% ordActuel=zeros(2,4);
% for i=4:4
%     distancemin=realmax;%(ref(1,1)-actuel(1,i))^2+(ref(2,1)-actuel(2,i)^2)+1;
%     for j=1:a
%     distance=(ref(1,j)-actuel(1,i))^2+(ref(2,j)-actuel(2,i))^2;
%     if distance<distancemin
%         distancemin=distance;
%         indice=j; % on trouve le numéro du barycentre correspondant
%     end
%     end
%     ordActuel(:,indice)=actuel(:,i);
% end
load('imageBinaire.mat')
imageBinaire=imageBinairePicot;
imageLabelisee = bwlabel(imageBinaire,4);% voir a quoi sert le 4 , pas ce qu'on pense


[x1,y1]=find(imageLabelisee==1);
[x2,y2]=find(imageLabelisee==2);
[x3,y3]=find(imageLabelisee==3);
[x4,y4]=find(imageLabelisee==4);

bar1=[mean(x1);mean(y1)];
bar2=[mean(x2);mean(y2)];
bar3=[mean(x3);mean(y3)];
bar4=[mean(x4);mean(y4)];

barycentrebis=[bar1,bar2,bar3,bar4];

nbTrouve=max(max(imageLabelisee));
barycentre=zeros(2,nbTrouve);
for i=1:nbTrouve
[x,y]=find(imageLabelisee==i);
bar=[mean(x);mean(y)];
barycentre(:,i)=bar;
end;