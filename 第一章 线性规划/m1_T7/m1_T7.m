clc,clear
rng(0)%进行一致性比较，生成相同的随机数
a=randi([0,10],100,150);%a为100*150，0到10之间的随机整数
prob=optimproblem('ObjectiveSense','max');
v=optimvar('v');x=optimvar('x',100,'LowerBound',0);
prob.Objective=v;
prob.Constraints.con1=a'*x>=v;
prob.Constraints.con2=sum(x)==100;
[sol,fval]=solve(prob);v=sol.v





