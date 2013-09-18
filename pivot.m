
function R=pivot(M,i,j)
[m,n]=size(M);
pivotNum=M(i,j);%get the pivot number
pivotCoe=M(1:m,j)/pivotNum;
pivotCoe(i)=0;
pivotMat=pivotCoe*M(i,2:n);
R(1:m,1)=M(1:m,1);
R(1:m,2:n)=M(1:m,2:n)-pivotMat ;
R(i,1)=j;
