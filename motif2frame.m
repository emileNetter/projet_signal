function frame=motif2frame(motif,frame,x,y,scale,mask)
% motif : image 'source' (couleur indexée ou vraie couleur)
% frame : image 'destination' (vraie couleur)
% x,y   : coordonnées des 4 sommets de la 'source' dans la 'destination', vecteurs lignes
% scale : paramètre d'échelle (exemple : 1)  
% mask  : masque 'destination' des pixels à ne pas modifier, (exemple :  matrice de 0) = main

[hIn,wIn,dIn]=size(motif);
xIn=[1 wIn wIn 1];
yIn=[1 1 hIn hIn];
xIn=wIn/2+scale*(xIn-wIn/2);
yIn=hIn/2+scale*(yIn-hIn/2);
tForm=cp2tform([xIn' yIn'],[x' y'],'projective');
motif=double(motif);
for p=1:3
    if dIn == 1
        [motifTransform,xData,yData]=imtransform(motif(:,:),tForm,'Fill',-1);
    else
        [motifTransform,xData,yData]=imtransform(motif(:,:,p),tForm,'Fill',-1);
    end
    [hOut,wOut]=size(motifTransform);
    xOut=fix(xData(1));
    yOut=fix(yData(1));
    dxOut=xOut:xOut+wOut-1;
    dyOut=yOut:yOut+hOut-1;
    pos=find(mask(dyOut,dxOut)==1);
    if (length(pos))
        motifTransform(pos)=-1;
    end
    pos=find(motifTransform~=-1);
    frameCut=frame(dyOut,dxOut,p);
    if (length(pos))
        frameCut(pos)=uint8(motifTransform(pos));
    end
    frame(dyOut,dxOut,p)=frameCut;    
end
end