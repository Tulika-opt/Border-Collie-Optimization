function [lb,ub,dim,fobj] = Func_details(fn)


switch fn
    case 'func1'
        fobj = @func1;
        lb=-100;
        ub=100;
        dim=30;
        
    case 'func2'
        fobj = @func2;
        lb=-10;
        ub=10;
        dim=30;
        
    case 'func3'
        fobj = @func3;
        lb=-100;
        ub=100;
        dim=30;
        
    case 'func4'
        fobj = @func4;
        lb=-100;
        ub=100;
        dim=30;
        
    case 'func5'
        fobj = @func5;
        lb=-30;
        ub=30;
        dim=30;
        
    case 'func6'
        fobj = @func6;
        lb=-100;
        ub=100;
        dim=30;
        
    case 'func7'
        fobj = @func7;
        lb=-1.28;
        ub=1.28;
        dim=30;
        
    case 'func8'
        fobj = @func8;
        lb=-500;
        ub=500;
        dim=30;
        
    case 'func9'
        fobj = @func9;
        lb=-32;
        ub=32;
        dim=30;
        
    case 'func10'
        fobj = @func10;
        lb=-50;
        ub=50;
        dim=30;
        
    case 'func11'
        fobj = @func11;
        lb=-50;
        ub=50;
        dim=30;
        
    case 'func12'
        fobj = @func12;
        lb=-65.536;
        ub=65.536;
        dim=2;
        
    case 'func13'
        fobj = @func13;
        lb=-5;
        ub=5;
        dim=4;
        
        
        
    case 'func14'
        fobj = @func14;
        lb=-2;
        ub=2;
        dim=2;
        
    case 'func15'
        fobj = @func15;
        lb=0;
        ub=1;
        dim=3;
        
    case 'func16'
        fobj = @func16;
        lb=0;
        ub=1;
        dim=6;
        
    case 'func17'
        fobj = @func17;
        lb=0;
        ub=10;
        dim=4;
        
    case 'func18'
        fobj = @func18;
        lb=0;
        ub=10;
        dim=4;
        
    case 'func19'
        fobj = @func19;
        lb=0;
        ub=10;
        dim=4;
end

end

% Function1

function op = func1(x)
op=sum(x.^2);
end

% Function2

function op = func2(x)
op=sum(abs(x))+prod(abs(x));
end

% Function3

function op = func3(x)
dim=size(x,2);
op=0;
for i=1:dim
    op=op+sum(x(1:i))^2;
end
end

% Function4

function op = func4(x)
op=max(abs(x));
end

% Function5

function op = func5(x)
dim=size(x,2);
op=sum(100*(x(2:dim)-(x(1:dim-1).^2)).^2+(x(1:dim-1)-1).^2);
end

% Function6

function op = func6(x)
op=sum(abs((x+.5)).^2);
end

% Function7

function op = func7(x)
dim=size(x,2);
op=sum([1:dim].*(x.^4))+rand;
end

% Function8

function op = func8(x)
op=sum(-x.*sin(sqrt(abs(x))));
end

% Function9

function op = func9(x)
dim=size(x,2);
op=-20*exp(-.2*sqrt(sum(x.^2)/dim))-exp(sum(cos(2*pi.*x))/dim)+20+exp(1);
end

% Function10

function op = func10(x)
dim=size(x,2);
op=(pi/dim)*(10*((sin(pi*(1+(x(1)+1)/4)))^2)+sum((((x(1:dim-1)+1)./4).^2).*...
    (1+10.*((sin(pi.*(1+(x(2:dim)+1)./4)))).^2))+((x(dim)+1)/4)^2)+sum(Ufun(x,10,100,4));
end

% Function11

function op = func11(x)
dim=size(x,2);
op=.1*((sin(3*pi*x(1)))^2+sum((x(1:dim-1)-1).^2.*(1+(sin(3.*pi.*x(2:dim))).^2))+...
    ((x(dim)-1)^2)*(1+(sin(2*pi*x(dim)))^2))+sum(Ufun(x,5,100,4));
end

% Function12

function op = func12(x)
aS=[-32 -16 0 16 32 -32 -16 0 16 32 -32 -16 0 16 32 -32 -16 0 16 32 -32 -16 0 16 32;,...
    -32 -32 -32 -32 -32 -16 -16 -16 -16 -16 0 0 0 0 0 16 16 16 16 16 32 32 32 32 32];

for j=1:25
    bS(j)=sum((x'-aS(:,j)).^6);
end
op=(1/500+sum(1./([1:25]+bS))).^(-1);
end

% Function13

function op = func13(x)
aK=[.1957 .1947 .1735 .16 .0844 .0627 .0456 .0342 .0323 .0235 .0246];
bK=[.25 .5 1 2 4 6 8 10 12 14 16];bK=1./bK;
op=sum((aK-((x(1).*(bK.^2+x(2).*bK))./(bK.^2+x(3).*bK+x(4)))).^2);
end

% Function14

function op = func14(x)
op=(1+(x(1)+x(2)+1)^2*(19-14*x(1)+3*(x(1)^2)-14*x(2)+6*x(1)*x(2)+3*x(2)^2))*...
    (30+(2*x(1)-3*x(2))^2*(18-32*x(1)+12*(x(1)^2)+48*x(2)-36*x(1)*x(2)+27*(x(2)^2)));
end

% Function15

function op = func15(x)
aH=[3 10 30;.1 10 35;3 10 30;.1 10 35];cH=[1 1.2 3 3.2];
pH=[.3689 .117 .2673;.4699 .4387 .747;.1091 .8732 .5547;.03815 .5743 .8828];
op=0;
for i=1:4
    op=op-cH(i)*exp(-(sum(aH(i,:).*((x-pH(i,:)).^2))));
end
end

% Function16

function op = func16(x)
aH=[10 3 17 3.5 1.7 8;.05 10 17 .1 8 14;3 3.5 1.7 10 17 8;17 8 .05 10 .1 14];
cH=[1 1.2 3 3.2];
pH=[.1312 .1696 .5569 .0124 .8283 .5886;.2329 .4135 .8307 .3736 .1004 .9991;...
    .2348 .1415 .3522 .2883 .3047 .6650;.4047 .8828 .8732 .5743 .1091 .0381];
op=0;
for i=1:4
    op=op-cH(i)*exp(-(sum(aH(i,:).*((x-pH(i,:)).^2))));
end
end

% Function17

function op = func17(x)
aSH=[4 4 4 4;1 1 1 1;8 8 8 8;6 6 6 6;3 7 3 7;2 9 2 9;5 5 3 3;8 1 8 1;6 2 6 2;7 3.6 7 3.6];
cSH=[.1 .2 .2 .4 .4 .6 .3 .7 .5 .5];

op=0;
for i=1:5
    op=op-((x-aSH(i,:))*(x-aSH(i,:))'+cSH(i))^(-1);
end
end

% Function18

function op = func18(x)
aSH=[4 4 4 4;1 1 1 1;8 8 8 8;6 6 6 6;3 7 3 7;2 9 2 9;5 5 3 3;8 1 8 1;6 2 6 2;7 3.6 7 3.6];
cSH=[.1 .2 .2 .4 .4 .6 .3 .7 .5 .5];

op=0;
for i=1:7
    op=op-((x-aSH(i,:))*(x-aSH(i,:))'+cSH(i))^(-1);
end
end

% Function19

function op = func19(x)
aSH=[4 4 4 4;1 1 1 1;8 8 8 8;6 6 6 6;3 7 3 7;2 9 2 9;5 5 3 3;8 1 8 1;6 2 6 2;7 3.6 7 3.6];
cSH=[.1 .2 .2 .4 .4 .6 .3 .7 .5 .5];

op=0;
for i=1:10
    op=op-((x-aSH(i,:))*(x-aSH(i,:))'+cSH(i))^(-1);
end
end

function op=Ufun(x,a,k,m)
op=k.*((x-a).^m).*(x>a)+k.*((-x-a).^m).*(x<(-a));
end