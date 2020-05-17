function [pop1,Vt1,fit1,a1,t1]=Herding(pop,Vt,fit,n,L,a,t)
[fit1,idx]=sort(fit);
pop1=zeros(n,L);
Vt1=zeros(n,L);
a1=zeros(n,L);
t1=zeros(n,L);
for i=1:n
    pop1(i,:)=pop(idx(i),:);
    Vt1(i,:)=Vt(idx(i),:);
    a1(i,:)=a(i,:);
    t1(i)=t(i);
end
end