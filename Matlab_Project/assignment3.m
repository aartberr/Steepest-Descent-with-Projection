clc
%Creating f
syms f(x1,x2) 
f(x1,x2) = 1/3*(x1^2)+3*(x2^2);

%1ο θέμα
fprintf("Μέθοδος μέγιστης καθόδου:\n")
fprintf("Θέμα 1:\n")
gk1=[0.1 0.3 3 5];
e1=0.001;
xstart1=[1 2]; 
for j=1:size(gk1,2)
    xk1=steepestdecentmethod3(f,xstart1(1,:),e1,gk1(j));
    n1=size(xk1,1);  %αριθμός επαναλήψεων
    fprintf("Για γ=%f η μέθοδος συγκλίνει στο σημείο [%f, %f] μετά από %d επαναλήψεις.\n",gk1(j), xk1(n1,1),xk1(n1,2),n1)
end

fprintf("\n")
%2ο θέμα
a=[-10 -8];
b=[5 12];

fprintf("Μέθοδος μέγιστης καθόδου με προβολή:\n")
gk=[0.5 0.1 0.2];
sk=[5 15 0.1];
e=0.01;
xstart=[5 -5; -5 10; 8 -10];

fprintf("Θέμα 2:\n")
i=1;
xk2=steepestdecentmethodwprojection(f,xstart(i,:),e,gk(i),sk(i),a,b);
n=size(xk2,1);
if n==101
    n=n-1;
end
fprintf("Για γ=%f η μέθοδος συγκλίνει στο σημείο [%f, %f] μετά από %d επαναλήψεις.\n",gk(i), xk2(n,1),xk2(n,2),n)
figure(i+1)
clf
hold on
plot(xk2(1:n,:))
hold off

fprintf("\n")
%3ο θέμα

fprintf("Θέμα 3:\n")
i=2;
xk3=steepestdecentmethodwprojection(f,xstart(i,:),e,gk(i),sk(i),a,b);
n=size(xk3,1);
if n==101
    n=n-1;
end
fprintf("Για γ=%d η μέθοδος συγκλίνει στο σημείο [%f, %f] μετά από %d επαναλήψεις.\n",gk(i), xk3(n,1),xk3(n,2),n)
figure(i+1)
clf
hold on
plot(xk3(1:n,:))
hold off

fprintf("\n")
%4ο θέμα
fprintf("Θέμα 4:\n")
i=3;
xk4=steepestdecentmethodwprojection(f,xstart(i,:),e,gk(i),sk(i),a,b);
n=size(xk4,1);
if n==101
    n=n-1;
end
fprintf("Για γ=%d η μέθοδος συγκλίνει στο σημείο [%f, %f] μετά από %d επαναλήψεις.\n",gk(i), xk4(n,1),xk4(n,2),n)
figure(i+1)
clf
hold on
plot(xk4(1:n,:))
hold off