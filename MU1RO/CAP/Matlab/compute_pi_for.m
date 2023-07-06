% basic monte carlo method to compute pi. This is the sequential
% version that uses a simple loop. input variable N is the number of
% points we will use to compute pi. Large value of N will result in
% a better approximation of pi,

function piresult = compute_pi_for(N)
tic;
xcoord=gpuArray.rand(N,1);
ycoord=gpuArray.rand(N,1);



sal = arrayfun(@newfor,xcoord,ycoord);


piresult = 4*sum(sal)/N;
toc
fprintf('The computed value of pi is %8.7f.\n',piresult);
end

function total_inside = newfor(x,y)
    total_inside=0;
    if (x^2 + y^2 <= 1)
      total_inside=1;
    end
end