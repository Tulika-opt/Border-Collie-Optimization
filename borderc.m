%Border Collie Optimization

clear all;

%Population size
n=30;

%maximum no. of iterations
gen=200;

%Optimization function name
fname='func19';

%Retrieve function details(fobj), dimension(L), lower bound(lb) and upper bound(ub) of
%function
[lb,ub,L,fobj]=Func_details(fname);

%Intialize the population(initP-Population,acc-acceleration of each individual)
[initP,acc]=Generate(n,L,ub,lb);

%Vt=velocity of each individuals
Vt=(zeros(n,L));

%t=time of each individual
t=rand(n,1);

%Max. Fitness values
fopt=inf;

%Variable to store fitness
fit=zeros(1,n);

pop=initP;

%k=counter variable for iterations required for Eyeing mechanism
k=1;
fopt1=zeros(gen,1);

for g=1:gen
    %Calculate fitness of individuals
    [fit,maxf,pos]=Fitness(pop,n,L,ub,lb,fobj);
    eye=0;
    if g==1
        fopt=maxf;
    end
    %finding the optimum fitness value
    if fopt>maxf
        fopt=maxf;
    end
    
    fopt1(g)=fopt;
    
    if(g>1)
        if(fopt1(g)<fopt1(g-1))
            k=k+1;
            if (k>5)
                eye=1;
                k=0;
            end
        end
    end
    
    %Sorting the dogs and sheep
    [pop,Vt,fit,acc,t]=Herding(pop,Vt,fit,n,L,acc,t);
    
    %Updating velocity, acceleration and time of the population
    [Vt,acc,t,r1,l1,tempg,temps]=UpdateV(Vt,n,L,acc,t,pop,fit,eye);
    
    %Updating positions of population
    [pop]=Update(pop,Vt,t,acc,n,L,eye);
    
    %Checking the range of the population is maintained
    [pop,acc,t,Vt]=check(pop,n,L,ub,lb,acc,Vt,t);
    fprintf('\n\nfopt %f\t maxf %f\tgen %d',fopt,maxf,g);
    
end