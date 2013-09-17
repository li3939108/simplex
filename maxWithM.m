function [max,I]=maxWithM(V)
[m,n]=size(V);
max=0;
I=0;
for(i=1:n)
    if(imag(V(i)) > imag(max))
        %if the coefficient of M
        %i.e. the imagery part of V(i)
        %is more than that of the current max,
        %replace the max with V(i)
        max=V(i);
        I=i;
    elseif(imag(V(i))==imag(max))
        %if the coefficient of M equals that of the current max
        %compare the real part the V(i) and that of the current max
        if(real(V(i))>real(max))
            %if the real part of V(i) is more than that of the current max
            %replace the max with V(i)
            max=V(i);
            I=i;
        end
    end
end 
