clc,clear,a=load('wenti.txt');%将表中的信息放在文本中
c=a(1:end-1,1:end-1);%（行取1到倒数第2，列取1到倒数第2）
e=a(1:end-1,end);d=a(end,1:end-1);%e为产量，d为需求量
prob=optimproblem;%默认最小化
x=optimvar('x',6,8,'LowerBound',0);%决策变量x6*8个，下限为0
prob.Objective=sum(c.*x,"all");%sum(sum(c.*x))目标函数：运价*运送量再求和
%里面的sum求每列的和返回一行值，外面的sum求这一行的和
prob.Constraints.con1=sum(x,1)==d;%第一维按列求和等于需求
prob.Constraints.con2=sum(x,2)<=e;%第二维按行求和大于等于产量
[sol,fval,flag,out]=solve(prob);
fval,xx=sol.x,%显示结果
writematrix(xx,'answer.xlsx')%将xx的数值放到文本中

