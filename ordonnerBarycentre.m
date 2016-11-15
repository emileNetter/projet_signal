function [ordActuel]=ordonnerBarycentre(ref, actuel)
% distancemin=(ref(1,1)-actuel(1,1))^2+(ref(2,1)-actuel(2,1)^2);
% ordBar=zeros(2,4);
% for i=1:4
%     for j=1:4
%     distance=(ref(1,j)-actuel(1,i))^2+(ref(2,j)-actuel(2,i)^2);
%     if distance<distancemin
%         distancemin=distance;
%         indice=j; % on trouve le numéro du barycentre correspondant
%     end
%     end
%     ordBar(:,indice)=actuel(:,i);
%     actuel=(realmax;realmax);
%     distancemin=(ref(1,1)-actuel(1,1))^2+(ref(2,1)-actuel(2,1)^2);
% end

matDistances = zeros(4,size(actuel,1));
ordActuel=zeros(4,2);
distanceMin = (ref(1,1)-actuel(1,1))^2+(ref(2,1)-actuel(2,1)^2);
matTmp=zeros(4,size(actuel,1);

for i=1:4
    for j=1:size(actuel,1)
        matDistances(i,j)=(ref(1,j)-actuel(1,i))^2+(ref(2,j)-actuel(2,i)^2);
    end
end

for i=1:4
    for j=1:size(actuel,1)
        if matDistances(i,j)<distanceMin
            distanceMin = matDistances(i,j); % on détecte la plus petite valeur sur chaque ligne
            matTmp(i,j)=distanceMin;           
        end
        
    end
    ordActuel(:,i)=actuel(:,j);
end
            
            
        
        


        