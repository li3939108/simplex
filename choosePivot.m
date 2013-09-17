function [i,j]=choosePivot(M)
[m,n]=size(M);
coZ=M(1,2);%get the coefficient of Z
firstRow=M(1,3:n-1);
lastCol=M(2:m,n);
[num,J]=maxWithM(-firstRow/coZ);
%maxWithM for big M method
%built-in matlab function max() for no-M simplex method
if(real(num)<=0 && imag(num) <= 0)
    %for no-M simplex method, just test if num <= 0
    %if true, first row has no positive numbers
    %and we get the final tab
    i=0;
    j=0;
    return;
else
    %if false, we can get the pivot column
    J=J+2;
end
pivotCol=lastCol./M(2:m,J);
%No M in the remaining rows other than the first row
for (i=1:size(pivotCol))
    if(sign(M(i+1,J)) == -1)
        pivotCol(i)=inf;
        %replace negative number with infinity
    end
end
[num,I]=min(pivotCol);
%get the pivot row
if(num == inf)
    %unbounded i.e. no number is positive
    i=-1;
    j=-1;
    return;
else
    I=I+1;
    %plus 1 for the first row
end
i=I;j=J;
