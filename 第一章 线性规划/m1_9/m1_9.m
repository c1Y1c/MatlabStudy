%模型一
clc,clear,close all
prob=optimproblem('ObjectiveSense','max');
x=optimvar('x',5,1,'LowerBound',0);%投资量
c=[0.05,0.27,0.19,0.185,0.185];%银行加投资净收益率
Aeq=[1,1.01,1.02,1.045,1.065];%1+费用率
prob.Objective=c*x;M=10000;
prob.Constraints.con1=Aeq*x==M;%投资额等号约束
q=[0.025,0.015,0.055,0.026]';%风险损失率
a=0;aa=[];QQ=[];XX=[];hold on%使图像叠加而不是消除,hoid off取消
while a<0.05%结束条件
    prob.Constraints.con2=q.*x(2:end)<=a*M;%最大风险>=每个风险
    [sol,Q,flag,out]=solve(prob);
    aa=[aa;a];QQ=[QQ,Q];%;将a添加到此列下方50*1,,将Q添加到此行右方1*50
    XX=[XX;sol.x'];a=a+0.001;
end
plot(aa,QQ,'*k')%二维绘图,plot(横坐标,纵坐标，星号标记黑色black)
xlabel('$a$','Interpreter','Latex')%给坐标轴设置名称，Interpreter用于指定Latex解释器
ylabel('$Q$','Interpreter','Latex','Rotation',0)%Rotation，0，防止y轴名称翻转
%模型二
clc,clear,close all,format long g%长浮点数表示，结尾format恢复默认
M=10000;prob=optimproblem;%求最小值
x=optimvar('x',6,1,'LowerBound',0);%x(6)为风险损失的最大值
r=[0.05,0.28,0.21,0.23,0.25];%收益率
p=[0,0.01,0.02,0.045,0.065];%交易费率
q=[0,0.025,0.015,0.055,0.026]';%风险损失率
%w=0:0.1:1
w=[0.766,0.767,0.810,0.811,0.824,0.825,0.962,0.963,1.0];
V=[];%风险初始化
Q=[];%收益初始化
X=[];%最优解初始化
prob.Constraints.con1=(1+p)*x(1:end-1)==M;%投资额
prob.Constraints.con2=q(2:end).*x(2:end-1)<=x(end);%x(6)为最大值
for i=1:length(w)
    prob.Objective=w(i)*x(end)-(1-w(i))*(r-p)*x(1:end-1);%最大风险-收益
    [sol,fval,flag,out]=solve(prob);
    xx=sol.x;V=[V,max(q.*xx(1:end-1))];%风险
    Q=[Q,(r-p)*xx(1:end-1)];X=[X;xx];
    plot(V,Q,'*-');grid on%显示坐标网格线
end
xlabel('风险/元');ylabel('收益/元')
V,Q,format
%模型三
clc,clear,close all
prob=optimproblem('ObjectiveSense','min');
c=[0.05,0.27,0.19,0.185,0.185];
q=[0.025,0.015,0.055,0.026];
Aeq=[1,1.01,1.02,1.045,1.065];
x=optimvar('x',6,1,'LowerBound',0);
prob.Objective=x(6);M=10000;
prob.Constraints.con1=Aeq*x(1:end-1)==M;
prob.Constraints.con2=q'.*x(2:end-1)<=x(6);
k=0.05;kk=[];QQ=[];XX=[];hold on
while k<0.26
    prob.Constraints.con3=c*x(1:end-1)>=k*M;
    [sol,fval,flag,out]=solve(prob);
    kk=[kk;k];QQ=[QQ;fval];XX=[XX;sol.x];
    k=k+0.005;
end
plot(kk,QQ,"*-k")
xlabel('$k$','Interpreter','latex');
ylabel('风险/元');




