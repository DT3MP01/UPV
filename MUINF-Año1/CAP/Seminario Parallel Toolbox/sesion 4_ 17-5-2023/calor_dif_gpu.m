function calor_dif_gpu(nx)
dz=0.05;
dt=0.005;
q=2;
alpz=0.01;
tfin=30;
conc=gpuArray(zeros(nx+2,nx+2));
conc(2,2)=q;
conaux=conc;
iter=0;
tim=0;
tiempo_calculo=0;
rows=gpuArray((1:nx+2)');
cols=gpuArray(1:nx+2);
    function concd =funaux(row,col)
        rowU=max(1,row-1);rowD=min(nx+2,row+1);
            colL=max(1,col-1);colR=min(nx+2,col+1);
            concd=conaux(row,col)+dt*(conaux(rowU,col)+conaux(row,colL)-...
                4*conaux(row,col)+conaux(rowD,col)+conaux(row,colR))*alpz/(dz*dz);
    end
while tim<tfin
    tim=tim+dt;
    conaux=conc;
    tic
 
    conc=arrayfun(@funaux,rows,cols)
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


