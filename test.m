actuel=[288.8155 148.5814 297.6092 153.7380 ; 175.8326 189.2605 380.1877 386.4192];
ref=[147.967592592593 153.137931034483 297.418604651163 288.545064377682;189.254629629630 386.314655172414 380.100775193798 175.828326180258];

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
