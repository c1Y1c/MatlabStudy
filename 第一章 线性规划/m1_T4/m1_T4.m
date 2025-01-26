clc,clear
%货物i送到舱j中i=1,2,3,4;j=1,2,3
c=[3100,3800,3500,2850];%利润
mlimt1=[18,15,23,12];v=[480,650,580,390];
mlimt2=[10,16,8];vlimt=[6800,8700,5300];
prob=optimproblem("ObjectiveSense","max");
x=optimvar('x',4,3,'LowerBound',0);
A=sum(x,1);%货舱所放货物的吨数
B=sum(x,2);%运送每个货物的吨数
prob.Objective=B'*c';%总利润
prob.Constraints.con1=B'<=mlimt1;%货物吨数限制
prob.Constraints.con2=A<=mlimt2;%货舱吨数限制
prob.Constraints.con3=v*x<=vlimt;%货舱体积限制
prob.Constraints.con4=[%质量比例限制
    A(1)/5==A(2)/8
    A(2)/2==A(3)];
[sol,fval,flag,out]=solve(prob);
fval,x=sol.x


