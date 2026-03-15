%%randomized kaczmarz method    RRK + grk 100  md method  
function [time,xk,t,k]=rgrs_imag1(A,b,X2,q,seita)
% q=5;
[p, q1]=size(A);
%  tol=1e-5;
%   x0=lsqr(A,b);
  x0=X2;
% x0=lsqnonneg(A,b);%欠定最小范数解
k=0;
xk=zeros(q1,1);
 xkk=zeros(q1,1);
t=10;
j=1;
% seita=1;
maxtime=60;
c1=norm(A,'fro')^2;
for m=1:p
   s(m)=norm(A(m,:));
end

tic
while (toc<maxtime&&k<2000000)
    for j=1:q-1
     r=b-A*xk(:,j);
     r1=r./s';
%       r1(find(isnan(r1)==1))=0;
      r1(isnan(r1)) = 0;
      r1(isinf(r1)) = 0;
%      r2=abs(r1);
     [B,index]=sort(abs(r1),'descend');
     BB=B.*B;
     cc=norm(r)^2/c1;
      eps=seita*BB(1)+(1-seita)*cc;
%       eps=seita*B(1);
     [i0,]=find(BB>=eps);
     ik=datasample(index(1:size(i0,1)),1,1);
%     r0=b(ik)-A(ik,:)*xk(:,j);
    r0=r(ik);
    r1=r0/norm(A(ik,:))^2;
    xk(:,j+1)= xk(:,j)+2*r1*(A(ik,:)');
    end
    xk=mean(xk,2);
    k=k+1;
     t=(norm(xk-x0)^2)/(norm(xkk-x0)^2);
%     t=(norm(xk-x0)^2);
    h(1,k)=t;
   
end
time=toc
% k;
% t;
% plot(semilogy(h))
end