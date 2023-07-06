function [a,b,c] = triplete_inicial(fun,x0)
%a=0;
b=x0;
fb=feval(fun,b);
a=x0-0.01;
fa=feval(fun,a);
c=x0+0.01;
fc=feval(fun,c);
if (fb<fa)&&(fb<fc)
    return
else % busca hacia abajo desde a hacia b
    dir =b-a;
    if (fa<fb)%intercambia roles para ir hacia abajo
        x=a;
        a=b;
        b=x;
        fx=fa;
        fa=fb;
        fb=fx;
        dir=-dir;
    end    

b=a+dir;
fb=feval(fun,b);
c=a+dir*2;
fc=feval(fun,c);
while fc<fb
    a=b;
    b=c;
    fb=fc;
    c=c+dir;
    fc=feval(fun,c);
end
end
end

