

a=size(actuel,2);
ordActuel=zeros(2,4);
for i=1:a
    distancemin=realmax;%(ref(1,1)-actuel(1,i))^2+(ref(2,1)-actuel(2,i)^2)+1;
    for j=1:a
    distance=(ref(1,j)-actuel(1,i))^2+(ref(2,j)-actuel(2,i))^2;
    if distance<distancemin
        distancemin=distance;
        indice=j; % on trouve le numéro du barycentre correspondant
    end
    end
    ordActuel(:,indice)=actuel(:,i);
end
