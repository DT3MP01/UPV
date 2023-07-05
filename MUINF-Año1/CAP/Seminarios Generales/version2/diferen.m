function B=diferen(im_in)
I=double(im_in);
[r,c]=size(I);
B=zeros(r,c);
for i=2:r-1
    for j=2:c-1
        B(i,j)=I(i,j)-I(i-1,j-1)+I(i-1,j)-I(i,j+1);
        if B(i,j)>10
            B(i,j)=0;
        else
            B(i,j)=255;
        end
    end
end




        