%%randomized kaczmarz method    RRK + grk  method  rrs image
function [time,xk,t,k]=rrs_imag1(A,b,X2,q)
% q=5;
[p, q1]=size(A);
 
% x0=lsqnonneg(A,b);

%   x0=lsqr(A,b);%超定% lsqminnorm(A,b)
  x0=X2;
% x0=lsqnonneg(A,b);%欠定最小范数解
% A=randn(p,q);
% x0=zeros(q,1);
% b=A*x0;
% A=randn(p,q);
% b=randn(p,1);
maxtime=60;
k=0;
xk=zeros(q1,1);
xkk=zeros(q1,1);
t=10;
s0=1:p;
j=1;
c=norm(A,'fro')^2;

for m=1:p
    s(m)=(norm(A(m,:))^2/c);
end

tic
while (toc<maxtime&&k<19000000)
    for j=1:q-1
    ik=randsrc(1,1,[s0;s]);
    r=b(ik)-A(ik,:)*xk(:,j);
    r1=r/norm(A(ik,:))^2;
    xk(:,j+1)= xk(:,j)+2*r1*(A(ik,:)');
    end
    xk=mean(xk,2);
    k=k+1;
     t=(norm(xk-x0)^2)/(norm(xkk-x0)^2);
%     t=(norm(xk-x0)^2);
    h(1,k)=t;
end 

time=toc
k
t
plot(log(h))
end