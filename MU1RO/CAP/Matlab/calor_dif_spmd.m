function calor_dif_spmd(nx)
dz=0.05;
dt=0.005;
q=2;
alpz=0.01;
tfin=30;
conc=zeros(nx+2,nx+2);
concd=zeros(nx+2,nx+2);
conc(2,2)=q;
conaux=conc;
iter=0;
tim=0;
tiempo_calculo=0

while tim<tfin
    tim=tim+dt;
    conaux=conc;
    tic
    spmd
        trozo= (nx+2)/numlabs;
        ini=(labindex-1)*trozo+1;
        fin=labindex*trozo;
        %Este es el doble bucle que hay que paralelizar
        for row=ini:fin
            for col=1:nx+2
                rowU=max(1,row-1);rowD=min(nx+2,row+1);
                colL=max(1,col-1);colR=min(nx+2,col+1);
                concd(row,col)=conaux(row,col)+dt*(conaux(rowU,col)+conaux(row,colL)-4*conaux(row,col)+conaux(rowD,col)+conaux(row,colR))*alpz/(dz*dz);
            end
        end
    end
    
    for i=1:numel(ini)
        init=ini{i}
        fint=fin{i};
        aux=concd{i};
        conc(init:fint,:)=aux(init:fint,:);
    end
    
    % fin del doble bucle
    tiempo_calculo=tiempo_calculo+toc;
    
    if tim<10
        conc(2,2)=q;
    end
    iter=iter+1;
    if rem(iter,500)==1
        contourf(conc(1:nx+1,:))
        colorbar
        tim
        pause
    end
end
tiempo_calculo
end