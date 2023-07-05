function sol_opt=minimo_global_snl
valmin=f_sistema_norm([0;0;0;0]);
for i=1:24
    for j=1:4
        x=-240+i*20;
        y=-100+j*20;
        [sol,iter]=mini_steep('f_sistema_norm',[x;1;1;y]);
        val=f_sistema_norm(sol)
        if (val<valmin)
            sol_opt=sol;
            valmin=val;
        end    
    end   
end


end
function [ out ] = f_sistema_norm( x )
%p2=x(1), Q=x(2), Q_1=x(3)
f(1)=2.35*exp(-3)*((x(2)).^1.75)-75+x(1);
f(2)=4.67*exp(-3)*(x(3).^1.75)+20-x(1);
f(3)=3.72*exp(-2)*(x(4).^1.75)+15-x(1);
f(4)=x(2)-x(3)-x(4);
out=norm(f);
end