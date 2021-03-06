function [ordActuel]=ordonnerBarycentre(ref, actuel)

a=size(actuel,2);
ordActuel=zeros(2,4);
for i=1:a
    distancemin=realmax;%(ref(1,1)-actuel(1,i))^2+(ref(2,1)-actuel(2,i)^2)+1;
    %indice=1;
    for j=1:4%on sait que ref n'a que 4 barycentres
    distance=(ref(1,j)-actuel(1,i))^2+(ref(2,j)-actuel(2,i))^2;
    if distance<distancemin
        distancemin=distance;
        indice=j; % on trouve le num�ro du barycentre correspondant
    end
    end
    if ordActuel(:,indice)~= [0;0];% Si il y a d�ja un barycentre correspondant � la m�me colonne, on compare les distances afin d'�liminer le mauvais barycentre
        distanceBarPresent=(ref(1,indice)-ordActuel(1,indice))^2+(ref(2,indice)-ordActuel(2,indice))^2;
        if distancemin<distanceBarPresent
            ordActuel(:,indice)=actuel(:,i);
        end
    else
        ordActuel(:,indice)=actuel(:,i);
    end
end
              
end
