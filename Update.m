function [pop1]=Update(pop,Vt,t,acc,n,L,eye)
pop1=zeros(n,L);
for i=1:n
    for j=1:L
        %Updating the position of dogs
        if(i<=3)
            pop1(i,j)=Vt(i,j)*t(i)+(1/2)*acc(i,j)*(t(i)^2);
        end
        %Updating position of sheep
        if(i>3)
            if eye==1
                pop1(i,j)=Vt(i,j)*t(i)-(1/2)*acc(i,j)*(t(i)^2);
            else
                pop1(i,j)=Vt(i,j)*t(i)+(1/2)*acc(i,j)*(t(i)^2);
            end
        end
    end
end
end