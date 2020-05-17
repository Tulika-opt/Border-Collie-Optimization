function [Vt1,acc,t1,r1,l1,tempg,temps]=UpdateV(Vt,n,L,a,t,pop,fit,eye)

%tournament selection for choosing left and right dogs
r1=randi([2,3]);
if r1==2
    l1=3;
else
    l1=2;
end

acc=ones(n,L);
t1=ones(n,1);
Vt1=Vt;
[r,l]=size(a);
a1=zeros(r,l);
f1=fit(1);

%Finding Dg value to choose which sheep to gather and which to stalk
f2=(fit(2)+fit(3))/2;
f=0;
tempg=0;
temps=0;
%setting parameters for eyeing
if eye==1
    if fit(r1)<fit(l1)
        a1(l1,:)=(-1)*a(l1,:);
        f=l1;
    else
        a1(r1,:)=(-1)*a(r1,:);
        f=r1;
    end
end

for i=1:n
    for j=1:L
        %Velocity updation of dogs
        if (i<=3)
            Vt1(i,j)=real(sqrt(Vt(i,j)^2+2*a(i,j)*pop(i,j)));
        end
        %Velocity updation of sheep
        if(i>3)
            %If Eyeing is true
            if eye==1
                Vt1(i,j)=real(sqrt(Vt1(f,j)^2+2*a1(f,j)*pop(i,j)));
            end
            
            if eye~=1
                %Velocity updation of gathered sheep
                if f1-fit(i)>f2-fit(i)
                    Vt1(i,j)=real(sqrt(Vt1(1,j)^2+2*a(1,j)*pop(i,j)));
                    tempg(i)=i;
                end
                
                %Velocity updation of stalked sheep
                if f1-fit(i)<=f2-fit(i)
                    Vt1(i,j)=real(sqrt((Vt1(r1,j)*tan(randi([1,89]))^2)+2*a(r1,j)*pop(r1,j))+sqrt((Vt1(l1,j)*tan(randi([91,179]))^2)+2*a(l1,j)*pop(l1,j)));
                    Vt1(i,j)=Vt1(i,j)/2;
                    temps(i)=i;
                end
            end
            
        end
        
    end
end
%Updation of time and acceleration
for i=1:n
    s=0;
    for j=1:L
        acc(i,j)=abs(Vt1(i,j)-Vt(i,j))/t(i);
        s=s+(Vt1(i,j)-Vt(i,j))/acc(i,j);
    end
    t1(i)=abs(mean(s));
end
end