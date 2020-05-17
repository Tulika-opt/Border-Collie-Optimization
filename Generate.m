function [M,x]=Generate(n,L,ub,lb)
Boundary_no= size(ub,2); % number of boundaries
a=zeros(n,L);
% If the boundaries of all variables are equal and user enter a signle
% number for both ub and lb

    
if Boundary_no==1
    a=rand(n,L).*(ub-lb)+lb;
% for i=1:n
% 
% a(i,:)=(randi([-100,100]));
% end
end

% If each variable has a different lb and ub
if Boundary_no>1
    for i=1:L
        ub_i=ub(i);
        lb_i=lb(i);
        Positions(:,i)=rand(n,1).*(ub_i-lb_i)+lb_i;
    end
end

x=rand(n,L);
M=a;
end