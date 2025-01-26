clc,clear,format long g
prob=optimproblem('ObjectiveSense','max');
x=optimvar('x',4,5,'LowerBound',0);
prob.Objective=1.15*x(1,4)+1.25*x(2,3)+1.4*x(3,2)+1.06*x(4,5);
con1=[x(1,1)+x(4,1)==100000 %最初十万第一年投完
    x(1,2)+x(3,2)+x(4,2)==1.06*x(4,1) %后一年投资等于前一年剩余
    x(1,3)+x(2,3)+x(4,3)==1.15*x(1,1)+1.06*x(4,2)
    x(1,4)+x(4,4)==1.15*x(1,2)+1.06*x(4,3)
    x(4,5)==1.15*x(1,3)+1.06*x(4,4)];
con2=[x(2,3)<=40000
    x(3,2)<=30000];%条件约束
prob.Constraints.con1=con1;
prob.Constraints.con2=con2;
[sol,fval,flag,out]=solve(prob);
fval,x=sol.x,format
% clc, clear,format long g
% prob=optimproblem('ObjectiveSense','max');
% x=optimvar('x', 5, 4, 'LowerBound', 0);
% prob.Objective=1.15 *x(4, 1)+1.4*x(2, 3)+1.25 *x(3, 2)+1.06 *x(5, 4);
% con1= [x(1, 1)+x(1, 4)==100000
% x(2, 1)+x(2, 3)+x(2, 4)==1.06 *x(1, 4)
% x(3, 1)+x(3, 2)+x(3, 4)==1.15*x(1, 1)+1.06*x(2, 4)
% x(4, 1)+x(4, 4)==1.15 *x(2, 1)+1.06 *x(3, 4)
% x(5, 4)==1.15*x(3, 1)+1.06 *x(4, 4)];
% con2= [x(3, 2)<=40000;x(2,3)<=30000];
% prob.Constraints.con1=con1;
% prob.Constraints.con2=con2;
% [sol,fval,flag,out]=solve(prob);
% fval,x=sol.x,format