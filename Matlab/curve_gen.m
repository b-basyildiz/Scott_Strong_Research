%generators curve for given initial conditions and curvature + torsion. 
function [C,T,N,B] = curve_gen(C0,T0,N0,B0,k,tau,s_span,iter,p)
%tangent generation and s initialization
s = linspace(s_span(1),s_span(2),iter);
s_dist = s(2) - s(1);
[T,N,B] = tan_gen(T0,N0,B0,k,tau,s);

%curve creation
x = zeros(1,iter);
y = zeros(1,iter);
z = zeros(1,iter);
x(1) = C0(1);
y(1) = C0(2);
z(1) = C0(3);
for i=2:iter
    x(i) = T(i -1,1)*s_dist+x(i - 1);
    y(i) = T(i -1,2)*s_dist+y(i - 1);
    z(i) = T(i -1,3)*s_dist+z(i - 1);
end
C = [x;y;z]';
%plotting
%
if p == 1
    plot3(x,y,z)
    xlabel('x')
    ylabel('y')
    zlabel('z')
    title('Curve over given timespan')
end


