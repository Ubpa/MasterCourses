function [d, s] = DeBoorPoints(p)
if size(p,1) <= 1
    d = p;
    s = 0;
    return;
end

% k0, ..., kn
n = sum(p(:,3)) - 1;
s = zeros(n+1,1);
r = 1;
for i = 1 : size(p,1)
    m = p(i,3);
    s(r:r+m-1) = repmat(i-1, [m,1]);
    r = r + m;
end

t = [s(1);s(1);s(1);s;repmat(s(size(s,1)), [3,1])];% t0, ..., tn + 6 for N

% d0, ..., dn+2
A = zeros(n+3,n+3);
b = zeros(n+3,2);

% begin
if p(1,3)==1 % C2
    A(1,1) = 1;
    b(1,:) = p(1,1:2);

    A(2,1) = 1;
    A(2,2) = -2;
    A(2,3) = 1;
elseif p(1,3)==2 % 直线
	A(1,1) = 1;
    b(1,:) = p(1,1:2);

    A(2,1) = 1;
    A(2,2) = -2;
    A(2,3) = 1;
    
	A(3,3) = 1;
    b(3,:) = p(1,1:2);
else % 尖点
	A(1,1) = 1;
    b(1,:) = p(1,1:2);

    A(2,1) = 1;
    A(2,2) = -2;
    A(2,3) = 1;
    
	A(3,3) = 1;
    b(3,:) = p(1,1:2);
	A(4,4) = 1;
    b(4,:) = p(1,1:2);
end

% inner
r = 2 + p(1,3);
for i = 2:size(p,1)-1
    if p(i,3)==1 % C2
        A(r,r-1) = N(t,r-1,4,s(r-1));
        A(r,r) = N(t,r,4,s(r-1));
        A(r,r+1) = N(t,r+1,4,s(r-1));
        b(r,:) = p(i,1:2);
        r = r+1;
    elseif p(i,3)==2 % 直线
        if p(i-1,3) ~= 2
            % begin
            if p(i+1,3) ~= 2
                % 单直线点
                A(r, r) = 1;
                b(r,:) = p(i,1:2);
            else
                A(r, r) = 1;
                A(r, r+1) = -2;
                A(r, r+2) = 1;
            end
            
            A(r+1, r+1) = 1;
            b(r+1,:) = p(i,1:2);
        elseif p(i+1,3) ~= 2
            % end
            A(r, r) = 1;
            b(r,:) = p(i,1:2);
            
            A(r+1, r-1) = 1;
            A(r+1, r) = -2;
            A(r+1, r+1) = 1;
        else
            % inner
            A(r, r) = 1;
            A(r+1, r+1) = 1;
            b(r,:) = p(i,1:2);
            b(r+1,:) = p(i,1:2);
        end
        r = r+2;
	else % 尖点
        A(r, r-1) = 1;
        A(r, r) = -2;
        A(r, r+1) = 1;
        
        A(r+1, r+1) = 1;
        b(r+1, :) = p(i,1:2);
        
        A(r+2, r+1) = 1;
        A(r+2, r+2) = -2;
        A(r+2, r+3) = 1;
        r = r+3;
    end
end

% end
if p(size(p,1),3)==1 % C2
    A(n+2, n+1)=1;
    A(n+2, n+2)=-2;
    A(n+2, n+3)=1;

    A(n+3,n+3) = 1;
    b(n+3,:) = p(size(p,1),1:2);
elseif p(size(p,1),3)==2 % 直线
    A(n+1,n+1) = 1;
    b(n+1,:) = p(size(p,1),1:2);
    
    A(n+2, n+1)=1;
    A(n+2, n+2)=-2;
    A(n+2, n+3)=1;

    A(n+3,n+3) = 1;
    b(n+3,:) = p(size(p,1),1:2);
else
    A(n,n) = 1;
    b(n,:) = p(size(p,1),1:2);
    
    A(n+1,n+1) = 1;
    b(n+1,:) = p(size(p,1),1:2);
    
    A(n+2, n+1)=1;
    A(n+2, n+2)=-2;
    A(n+2, n+3)=1;

    A(n+3,n+3) = 1;
    b(n+3,:) = p(size(p,1),1:2);
end

d = A\b;

end