function [ordActuel]=ordonnerBarycentre(ref, actuel)
ordActuel=zeros(2,4);
for i=1:size(actuel)
    indice=1;
    distancemin=(ref(1,1)-actuel(1,i))^2+(ref(2,1)-actuel(2,i)^2)+1;
    for j=2:size(actuel)
    distance=(ref(1,j)-actuel(1,i))^2+(ref(2,j)-actuel(2,i)^2);
    if distance<distancemin
        distancemin=distance;
        indice=j; % on trouve le num�ro du barycentre correspondant
    end
    end
    ordActuel(:,indice)=actuel(:,i);
end

% matBar = zeros(4,4);

% for i=1:4