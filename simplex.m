function [R,b]=simplex(M)
[m,n]=size(M);
[i,j]=RchoosePivot(M);
b=zeros(n,1);
R=zeros(m,n);
for(k=1:m)
    b(M(k,1),1)=M(k,n)/M(k,M(k,1));
end     
R=M     
if(i>0) 
    %do the pivot operation recursively
    [R,b]=simplex(pivot(M,i,j));
elseif(i==0)
    %final tableau
    return;
else    
    %unbounded
    b(1,1)=-1;
end
