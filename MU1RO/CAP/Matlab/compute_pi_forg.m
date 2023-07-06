% basic monte carlo method to compute pi. This is the sequential
% version that uses a simple loop. input variable N is the number of
% points we will use to compute pi. Large value of N will result in
% a better approximation of pi,

function piresult = compute_pi_for(N)
tic;
xcoord=rand(N,1);
ycoord=rand(N,1);
total_inside=0;




sal=arrayfun(@compute_pi_forg,A,B);
piresult = 4*total_inside/N;
toc
fprintf('The computed value of pi is %8.7f.\n',piresult);
end