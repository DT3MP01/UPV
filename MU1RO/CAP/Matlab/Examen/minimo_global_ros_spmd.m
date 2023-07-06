function sol_opt_coop=minimo_global_ros_spmd
valmin=rosenb([0;0]);

spmd
    trozo= floor(24/numlabs);
    ini=(labindex-1)*trozo+1;
    fin=labindex*trozo;
    for i=ini:fin
        for j=1:20
            x=-10+i*2;
            y=-10+j*2;
            [sol,iter]=mini_steep(@rosenb,[x;y]);
            val=rosenb(sol);
            if (val<valmin)
                sol_opt=sol;
                valmin=val;
            end    
        end   
    end
end

valmin_coop=valmin{1};
sol_opt_coop=sol_opt{1};

for i=1:numel(ini)
    if (valmin{i}<valmin_coop)
        sol_opt_coop=sol_opt{i};
        valmin_coop= valmin{i};
    end
end


end




function s=rosenb(x)
s=(1-x(1))^2+100*(x(2)-x(1).^2)^2;
end
