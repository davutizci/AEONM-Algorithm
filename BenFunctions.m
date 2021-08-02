
function Fit=BenFunctions(X,FunIndex,Dim)


 switch FunIndex
     
   %%%%%%%%%%%%%%%%%%%%%%%%%%unimodal function%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
  
%Sphere
case 1
Fit=sum(X.^2);

%Schwefel 2.22
case 2 
Fit=sum(abs(X))+prod(abs(X));

%Schwefel 1.2
case 3
    Fit=0;
    for i=1:Dim
    Fit=Fit+sum(X(1:i))^2;
    end

%Schwefel 2.21
case 4
    Fit=max(abs(X));

%Rosenbrock
case 5
    Fit=sum(100*(X(2:Dim)-(X(1:Dim-1).^2)).^2+(X(1:Dim-1)-1).^2);

%Step
case 6
    Fit=sum(floor((X+.5)).^2);

%Quartic
case 7
    Fit=sum([1:Dim].*(X.^4))+rand;


%%%%%%%%%%%%%%%%%%%%%%%%%%multimodal function%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Schwefel
case 8
    Fit=sum(-X.*sin(sqrt(abs(X))));

%Rastrigin
case 9
    Fit=sum(X.^2-10*cos(2*pi.*X))+10*Dim;

%Ackley
case 10
    Fit=-20*exp(-.2*sqrt(sum(X.^2)/Dim))-exp(sum(cos(2*pi.*X))/Dim)+20+exp(1);

%Griewank
case 11
    Fit=sum(X.^2)/4000-prod(cos(X./sqrt([1:Dim])))+1;

%Penalized
case 12
  a=10;k=100;m=4;
  Dim=length(X);
  Fit=(pi/Dim)*(10*((sin(pi*(1+(X(1)+1)/4)))^2)+sum((((X(1:Dim-1)+1)./4).^2).*...
        (1+10.*((sin(pi.*(1+(X(2:Dim)+1)./4)))).^2))+((X(Dim)+1)/4)^2)+sum(k.*...
        ((X-a).^m).*(X>a)+k.*((-X-a).^m).*(X<(-a)));

%Penalized2
case 13
  a=10;k=100;m=4;
  Dim=length(X);
  Fit=.1*((sin(3*pi*X(1)))^2+sum((X(1:Dim-1)-1).^2.*(1+(sin(3.*pi.*X(2:Dim))).^2))+...
        ((X(Dim)-1)^2)*(1+(sin(2*pi*X(Dim)))^2))+sum(k.*...
        ((X-a).^m).*(X>a)+k.*((-X-a).^m).*(X<(-a)));
end

