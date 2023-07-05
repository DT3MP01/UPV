function [sol] = min_unid(fun,a)
[b,c,a]=triplete_inicial(fun,a);
tol=1e-7;
resphi=2-(1+sqrt(5))/2;
 c = a + (b-a) * resphi;
    d = b - (b-a) * resphi;
    fc = feval(fun,c);
    fd = feval(fun,d);
    while abs(b - a) > tol * (abs(c) + abs(d))
        if (fc < fd)
            b = d;
            d = c;
            c = a + (b-a) * resphi;
            fd = fc;
           fc = feval(fun,c);
        else
            a = c;
            c = d;
            d = b - (b-a) * resphi;
            fc = fd;
            fd = feval(fun,d);
        end
    end
    sol=(a + b) / 2;
    
end

