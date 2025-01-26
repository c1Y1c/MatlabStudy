clc,clear,format long g %整数规划
prob=optimproblem("ObjectiveSense","max");
x = optimvar('x',9,'Type','integer','LowerBound',0);%所有解是整数，x(10)=x(9)
prob.Objective=(x(1)+x(2))+x(8)*1.65+x(9)*2.3-...%换行用...
(5*x(1)+10*x(6))*0.05-(7*x(2)+9*x(7)+12*x(9))*0.0321-...
(6*x(3)+8*x(8))*250/4000-(4*x(4)+11*x(9))*783/7000-x(5)*0.35;
prob.Constraints.con1=[x(1)+x(2)==x(3)+x(4)+x(5)
    x(6)+x(7)==x(8)];%每种刚好够
prob.Constraints.con2=[5*x(1)+10*x(6)<=6000
    7*x(2)+9*x(7)+12*x(9)<=10000
    6*x(3)+8*x(8)<=4000
    4*x(4)+11*x(9)<=7000
    7*x(5)<=4000];%不能超过机器有效时长
[sol,fval,flag]=solve(prob);
x=fval,sol.x,format





