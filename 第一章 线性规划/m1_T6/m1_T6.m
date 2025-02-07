clc,clear
p=[24,15];c=[20,12,8];
mlimt1=[600,750,625];mlimt2=[600,800];
prob=optimproblem("ObjectiveSense","max");
x=optimvar('x',2,3,'LowerBound',0);
A=sum(x,1);B=sum(x,2);
prob.Objective=sum(B.*p')-sum(A.*c);
prob.Constraints.con1=[%别用除法
    B(1)*0.5<=x(1,1)
    B(1)*0.25<=x(1,2)
    x(1,3)<=0.1*B(1)
    x(2,1)<=0.4*B(2)
    x(2,2)<=0.4*B(2)
    B(2)*0.15<=x(2,3)];
prob.Constraints.con2=A(1:3)<=mlimt1;%原料限制
prob.Constraints.con3=B(1:2)>=mlimt2';%需求量限制
[sol,fval]=solve(prob);
fval,x=sol.x