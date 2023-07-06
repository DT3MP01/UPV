% basic monte carlo method to compute pi. This is the sequential
% version that uses a simple loop. input variable N is the number of
% points we will use to compute pi. Large value of N will result in
% a better approximation of pi,

function piresult = compute_pi_for(N)
tic;
spmd    
trozo=floor(N/numlabs);
xcoord=rand(trozo,1);
ycoord=rand(trozo,1);
total_inside=0;
    for i=1:trozo
        if (xcoord(i)^2 + ycoord(i)^2 <= 1)
            total_inside=total_inside +1;
        end
    end

    if(labindex ~=1)
        total_inside=total_inside+labReceive(labindex-1);
    end
    
     if(labindex ~= numlabs)
    labSend(total_inside,labindex+1)
    
     end
   
end


% for i=1:numel(total_inside)
%     aux=aux+total_inside{i};
% end
    
piresult = 4*total_inside{6}/N;
toc
fprintf('The computed value of pi is %8.7f.\n',piresult);
