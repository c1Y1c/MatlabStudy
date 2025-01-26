f=[-2,-3,5];
A=[-2,5,-1;1,3,1];b=[-10,12];%每一个不等式的系数是一行
Aeq=ones(1,3);Beq=7;
lb=zeros(3,1);
[x,y]=linprog(f,A,b,Aeq,Beq,lb);
x,y=-y