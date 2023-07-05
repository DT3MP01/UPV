function piresult = compute_pi_arrayfun(N)
tic;
xcoord = gpuArray.rand(N,1);
ycoord = gpuArray.rand(N,1);
total=arrayfun(@mif,xcoord,ycoord);
total_inside=gather(sum(total));
piresult = 4*total_inside/N;
toc
fprintf('The computed value of pi is %8.7f.\n',piresult);
end

function sal=mif(x,y)
  sal=(x^2+y^2<=1);
end  

