function [ordBar]=ordonnerBarycentre(ref, actuel)
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

matBar = zeros(4,4);

for i=1:4