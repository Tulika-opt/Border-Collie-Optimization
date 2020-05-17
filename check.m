function [pop1,acc1,t1,Vt1]=check(pop,n,L,ub,lb,acc,Vt,t)
pop1=pop;
acc1=acc;
t1=t;
Vt1=Vt;
for i=1:n
    for j=1:L
        
        if(pop(i,j)>=ub || pop(i,j)<=lb || pop(i,j)==0)
            pop1(i,j)=rand*(ub-lb)+lb;
            acc1(i,j)=rand;
            t1(i)=rand;
        end
    end
end
for i=1:n
    for j=1:L
        if(isnan(acc(i,j))==1 || acc(i,j)==0)
            pop1(i,j)=rand*(ub-lb)+lb;
            acc1(i,j)=rand;
            t1(i)=rand;
        end
    end
end
for i=1:n
    for j=1:L
        if(isnan(Vt(i,j))==1 || Vt(i,j)==0)
            pop1(i,j)=rand*(ub-lb)+lb;
            acc1(i,j)=rand;
            t1(i)=rand;
        end
    end
end
for i=1:n
    for j=1:L
        if(isnan(t1(i))==1 || t1(i)==0)
            pop1(i,j)=rand*(ub-lb)+lb;
            acc1(i,j)=rand;
            t1(i)=rand;
        end
    end
end
end