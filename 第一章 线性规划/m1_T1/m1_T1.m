clc,clear
%一
f=[3,-1,-1];
A=[1,-2,1;4,-1,-2];b=[11;-3];
Aeq=[-2,1];
prob=optimproblem('ObjectiveSense','max');
x=optimvar('x',3,'LowerBound',0);
prob.Objective=f*x;
prob.Constraints.con1=A*x<=b;
prob.Constraints.con2=Aeq*[x(1);x(3)]==1;
[sol,fval,flag,out]=solve(prob);
fval,sol.x
%二
% f=[-3,1,1];
% A=[1,-2,1;4,-1,-2];b=[11;-3];
% Aeq=[-2,0,1];beq=1;
% lb=zeros(3,1);
% [x,y]=linprog(f,A,b,Aeq,beq,lb);
% fval=-y,x