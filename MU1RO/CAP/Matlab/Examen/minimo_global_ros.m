function sol_opt=minimo_global_ros
valmin=rosenb([0;0]);

    for i=1:24
        for j=1:20
            x=-10+i*2;
            y=-10+j*2;
            [sol,iter]=mini_steep(@rosenb,[x;y]);
            val=rosenb(sol)
            if (val<valmin)
                sol_opt=sol;
                valmin=val;
            end    
        end   
    end
    end


function s=rosenb(x)
s=(1-x(1))^2+100*(x(2)-x(1).^2)^2;
end
