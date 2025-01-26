clc,clear
f=[-4,-3];%求最大值将f变号，以及结果的值变号
A=[2,1;1,1;0,1];b=[10,8,7];
lb=zeros(2,1);%两行一列的零矩阵
[x,y]=linprog(f,A,b,[],[],lb);%无等号约束用空矩阵
x,W=-y %输出结果


%第二种方法
clc,clear
prob=optimproblem('ObjectiveSense','max');%创建目标函数最大化的优化问题
f=[4,3];A=[2,1;1,1;0,1];b=[10;8;7];%换成了列向量
x=optimvar('x',2,'LowerBound',0);%决策变量
prob.Objective = f*x;%目标函数，矩阵乘法
prob.Constraints.con=A*x<=b;%约束条件
[sol,fval,flag,out]=solve(prob);%fval返回最优值
sol.x,fval, %显示结果