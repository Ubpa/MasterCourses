# 最优化理论 作业 4

> SA19001074
>
> 庄涛

## Ex 1

![image-20200617143815910](assets/hw4/image-20200617143815910.png)

(a)

$\forall x_1,x_2\in C,0\le \theta \le 1$，记 $x=\theta x_1+(1-\theta)x_2$，则
$$
\begin{aligned}
   & x^\top A x+b^\top x+c\\
  =& \theta({x_1}^\top A x_1 + b^\top x_1+c)+(1-\theta)({x_2}^\top A x_2+b^\top x_2+c)+x^\top A x+b^\top x-\theta {x_1}^\top A x_1-(1-\theta){x_2}^\top A x_2\\
\le& x^\top A x+b^\top x-\theta {x_1}^\top A x_1-(1-\theta){x_2}^\top A x_2\\
  =& \theta^2 {x_1}^\top A x_1+(1-\theta)^2 {x_2}^\top A x_2+2\theta(1-\theta){x_1}^\top A x_2-\theta {x_1}^\top A x_1-(1-\theta){x_2}^\top A x_2\\
  =& \theta(\theta-1)({x_1}^\top A x_1+{x_2}^\top A x_2-2{x_1}^\top A x_2)\\
  =& \theta(\theta-1)(\sqrt{A} x_1-\sqrt{A}x_2)^\top(\sqrt{A}x_1-\sqrt{A}x_2)\\
  \le& 0
\end{aligned}
$$
因此 $x\in C$，即 $C$ 是凸集

(b) 

类似 (a)，只需证 $g^\top x+h=0$ 且  ${x_1}^\top A x_1+{x_2}^\top A x_2-2{x_1}^\top A x_2\ge 0$ 
$$
\begin{aligned}
 & g^\top x+h\\
=& g^\top (\theta x_1+(1-\theta)x_2) +h\\
=& \theta (g^\top x_1+h) + (1-\theta)(g^\top x_2+h)\\
=& 0
\end{aligned}
$$

$$
\begin{aligned}
    & {x_1}^\top A x_1+{x_2}^\top A x_2-2{x_1}^\top A x_2 \\
  = & {x_1}^\top (A+\lambda gg^\top) x_1+{x_2}^\top (A+\lambda gg^\top) x_2 + 2{x_1}^\top (A+\lambda gg^\top) x_2 \\
    & -\lambda {x_1}^\top gg^\top x_1-\lambda {x_2}^\top gg^\top x_2 + 2{x_1}^\top gg^\top x_2 \\
\xlongequal[]{B=\sqrt{A+\lambda gg^\top}}
    & (Bx_1-Bx_2)^\top(Bx_1-Bx_2)-\lambda h^2 - \lambda h^2+2\lambda h^2 \\
  = & (Bx_1-Bx_2)^\top(Bx_1-Bx_2) \\
\ge & 0

\end{aligned}
$$

## Ex 2

![image-20200617165556490](assets/hw4/image-20200617165556490.png)

对 $X$ 进行特征值分解 $X=Q\Lambda Q$，其中 $Q$ 是正交矩阵，且
$$
\begin{aligned}
\Lambda &= \operatorname{diag}(\lambda_1(X),\lambda_2(X),\dots,\lambda_n(X))\\
Q       &= \begin{array}{c}[q_1 & q_2 & \dots & q_n]\end{array}
\end{aligned}
$$
取 $V^*\in \mathbb{R}^{n\times k}$ 为
$$
V^*=\begin{array}{c}[q_1 & q_2 & \dots & q_k]\end{array}
$$
则 $(V^*)^\top V^* =I_k$，$\operatorname{tr}(P_k^\top X P_k)=\sum_{i=1}^k \lambda_i(X)$ 

取 $\forall V\in \mathbb{R}^{n\times k}\ \text{s.t.}\ V^\top V=I_k$，记 $V=\begin{array}{c}[v_1 & v_2 & \dots & v_k]\end{array}$，有
$$
\begin{aligned}
\operatorname{tr}(V^\top X V)
&=\sum_{j=1}^n\sum_{i=1}^k\lambda_j(X)({v_i}^\top q_j)^2\\
&=\sum_{j=1}^n\lambda_j(X)\sum_{i=1}^k({v_i}^\top q_j)^2
\end{aligned}
$$
可对 $V$ 扩充成正交阵 $V_+=[\begin{array}{c}v_1 & v_2 & \dots & v_k & v_{k+1} & \dots & v_n\end{array}]$，则
$$
1=q_j^\top q_j = q_j^\top V_+^\top V_+ q_j=\sum_{i=1}^n(v_i^\top q_j)\ge \sum_{i=1}^k(v_i^\top q_j)
$$
另一方面
$$
k=\operatorname{tr}(VV)=\operatorname{tr}(V^\top QQV)=\sum_{j=1}^n\sum_{i=1}^k (v_i^\top q_j)^2
$$
故优化问题
$$
\begin{array}{l}
\max        & \sum_{j=1}^n a_j\lambda_j(X)\\
\text{s.t.} & \sum_{j=1}^n a_j = k\\
            & a_j \in [0,1]
\end{array}
$$
的最优值显然为 $\sum_{i=1}^k \lambda_j(X)$，此时 $V=V^*$ 

因此
$$
\sum_{i=1}^k \lambda_j(X)=\sup\{\operatorname{tr}(V^\top X V)|V\in \mathbb{R}^{n\times k}, V^\top V = I\}
$$
由于 $\operatorname{tr}(V^\top X V)$ 是关于 $X$ 的线性函数，故 $\operatorname{tr}(V^T X V)$ 是关于 $X$ 的凸函数

$\sum_{i=1}^k \lambda_j(X)$ 是关于 $X$ 的凸函数的集合的上界，故 $\sum_{i=1}^k \lambda_j(X)$ 是凸函数

## Ex 3

![image-20200617183207038](assets/hw4/image-20200617183207038.png)

Lagrange 函数为
$$
L(x,\lambda,\mu)=c^\top x+\lambda^\top (Gx-h)+\mu^\top(Ax-b)
$$
其中 $\lambda \ge 0$ 

对偶函数为
$$
\begin{aligned}
   g(\lambda,\mu)
&= \min_x L(x,\lambda,\mu)\\
&= \min_x c^\top x+\lambda^\top (Gx-h)+\mu^\top(Ax-b)\\
&= \min_x (c^\top+\lambda^\top G+\mu^\top A)x-\lambda^\top h-\mu^\top b\\
&= \left\{
\begin{array}{l}-\lambda^\top h-\mu^\top b & \text{if}\ c^\top+\lambda^\top G+\mu^\top A=0\\
-\infty                                    & \text{otherwise}
\end{array}\right.
\end{aligned}
$$
故对偶问题为
$$
\begin{array}{rl}
\max        & -\lambda^\top h-\mu^\top b\\
\text{s.t.} & c^\top+\lambda^\top G+\mu^\top A = 0\\
            & \lambda \ge 0
\end{array}
$$

## Ex 4

![image-20200617205823735](assets/hw4/image-20200617205823735.png)

Lagrange 函数为
$$
L(x,\mu)=\|Ax-b\|_2^2 + \mu^\top (Gx-h)
$$
则
$$
\nabla_x L(x,\mu)=2A^\top(Ax-b)+G^\top \mu
$$
故 KKT 条件为
$$
\left\{
\begin{array}{l}
2A^\top(Ax-b)+G^\top \mu = 0\\
Gx=h
\end{array}
\right.
$$
由于 $\operatorname{rank} A=n$，则 $A^\top A$ 可逆，则
$$
\begin{aligned}
2A^\top(Ax-b)+G^\top \mu &= 0\\
2A^\top A x              &= 2A^\top b-G^\top \mu\\
x                        &= (A^\top A)^{-1}\left(A^\top b-\frac{1}{2}G^\top\mu\right)
\end{aligned}
$$
代入 $Gx=h$ 得
$$
\begin{aligned}
G(A^\top A)^{-1}\left(A^\top b-\frac{1}{2}G^\top\mu\right) &= h \\
\frac{1}{2}G(A^\top A)^{-1}G^\top\mu                   &= G(A^\top A)^{-1}A^\top b-h\\
\end{aligned}
$$
由于 $\operatorname{rank} G=p$，则 $G(A^\top A)^{-1} G^\top$ 可逆，则
$$
\mu = 2\left(G(A^\top A)^{-1}G^\top\right)^{-1}\left(G(A^\top A)^{-1}A^\top b-h\right)
$$
则
$$
x=(A^\top A)^{-1}\left(A^\top b-G^\top\left(G(A^\top A)^{-1}G^\top\right)^{-1}\left(G(A^\top A)^{-1}A^\top b-h\right)\right)
$$

## Ex 5

![image-20200617211152481](assets/hw4/image-20200617211152481.png)

KKT 条件为
$$
\left\{
\begin{array}{l}
\nabla f(x)+2A^\top Q(Ax-b)+A^\top \mu =0\\
Ax=b
\end{array}
\right.
$$
则
$$
\left[\begin{array}{cc}
\nabla^{2} f(x) + 2A^\top QA & A^{\top} \\
A & 0
\end{array}\right]
\left[\begin{array}{c}
\delta \\
\mu
\end{array}\right]
=
\left[\begin{array}{c}
-\nabla f(x) \\
0
\end{array}\right]
$$
又 $A\delta=0$，则上式等价于
$$
\left[\begin{array}{cc}
\nabla^{2} f(x) & A^{\top} \\
A & 0
\end{array}\right]
\left[\begin{array}{c}
\delta \\
\mu
\end{array}\right]
=
\left[\begin{array}{c}
-\nabla f(x) \\
0
\end{array}\right]
$$
同于原问题的牛顿步相应方程

## Ex 6

![image-20200617212621931](assets/hw4/image-20200617212621931.png)

(a)

> 归纳法

当 $k=0$ 时，成立

假设 $k$ 时成立，即 $a_i^\top x^{(k)}=b_i$ 

牛顿步 $\delta_x^{(k)}$ 满足
$$
\left[\begin{array}{cc}
\nabla^{2} f(x^{(k)}) & A^{\top} \\
A & 0
\end{array}\right]\left[\begin{array}{c}
\delta_{x}^{(k)} \\
\mu^{(k)}
\end{array}\right]=-\left[\begin{array}{c}
\nabla f(x^{(k)}) \\
A x^{(k)}-b
\end{array}\right]
$$
其中 $A=\left[\begin{array}{c}a_1 & \dots & a_p\end{array}\right]^\top$ 

方程中有一关系 $a_i^\top \delta_x^{(k)}=-(a_i^\top x^{(k)}-b_i)=0$，故
$$
a_i^\top x^{(k+1)}=a_i^\top (x^{(k)}+\delta_x^{(k)})=b_i
$$
即 $k+1$ 时也成立

综上，由归纳法知，对 $\forall k\ge 0$，有 $a_i^\top x^{(k)}=b_i$ 

(b)

牛顿步 $\delta_x^{(k-1)}$ 满足
$$
\left[\begin{array}{cc}
\nabla^{2} f(x^{(k-1)}) & A^{\top} \\
A & 0
\end{array}\right]\left[\begin{array}{c}
\delta_{x}^{(k-1)} \\
\mu^{(k-1)}
\end{array}\right]=-\left[\begin{array}{c}
\nabla f(x^{(k-1)}) \\
A x^{(k-1)}-b
\end{array}\right]
$$
则有 $A\delta_x^{(k-1)}=-(Ax^{(k-1)}-b)$，即 $A(x^{(k-1)}+\delta_x^{(k-1)})=b$，其中包含关系 $a_i^\top (x^{(k-1)}+\delta_x^{(k-1)})=b_i$ 

由题设知 $a_i^\top x^{(k)}=b_i$，又 $x^{(k)}=x^{(k-1)}+\alpha \delta_x^{(k-1)}$，则
$$
\begin{aligned}
a_i^\top(x^{(k-1)}+\alpha \delta_x^{(k-1)})&=b_i\\
a_i^\top (x^{(k-1)}+\delta_x^{(k-1)})&=b_i
\end{aligned}
$$
由于 $\delta_x^{(k-1)}\neq 0$，则 $\alpha=1$，故
$$
Ax^{(k)}=b
$$
即所有等式约束被满足

## Ex 7

![image-20200617214648433](assets/hw4/image-20200617214648433.png)

由题意知
$$
\tilde{\phi}(x)=-\sum_{i=1}^m \log (-f_i(x)) - \log(R^2 -x^\top x)
$$
则
$$
\nabla \tilde{\phi}(x)=\sum_{i=1}^m\frac{\nabla f_i(x)}{-f_i(x)}+\frac{2x}{R^2-x^\top x}\\
\nabla^2\tilde{\phi}(x)=\sum_{i=1}^m\frac{\nabla f_i(x){\nabla f_i(x)}^\top}{f_i^2(x)}+\sum_{i=1}^m\frac{\nabla^2 f_i(x)}{-f_i(x)}+\frac{4xx^\top}{(R^2-x^\top x)^2}+\frac{I}{R^2-x^\top x}
$$
前三项是半正定的，$\nabla^2 tf_0(x)$ 也是半正定的，故

$\forall v \in \mathbb{R}^n$，
$$
v^\top \nabla^2(tf_0(x)+\tilde{\phi}(x))v\ge \frac{v^\top v}{R^2-x^\top x}\ge a v^\top v
$$
则
$$
a\le \min_\limits{x}\frac{1}{R^2-x^\top x}=\frac{1}{R^2}
$$
故取 $a=\frac{1}{R^2}$ 即可

## Ex 8

![image-20200617220136269](assets/hw4/image-20200617220136269.png)

对 $\forall u > p^*$，$z^*(u)$ 满足 KKT 条件
$$
\left\{
\begin{aligned}
&\frac{\nabla f_0(z^*(u)) }{u-f_0(z^*(u))}+\sum_{i=1}^m\frac{\nabla f_i(z^*(u))}{-f_i(z^*(u))}+A^\top \nu=0\\
&Az^*(u)=b
\end{aligned}
\right.
$$
令 $t=\frac{1}{u-f_0(z^*(u))}$，则上式可变为 $x^*(t)$ 所满足的 KKT 条件

对 $\forall t >0$，$x^*(t)$ 满足 KKT 条件
$$
\left\{
\begin{aligned}
&t\nabla f_0(x^*(t))+\sum_{i=1}^m\frac{\nabla f_i(x^*(t))}{-f_i(x^*(t))}+A^\top \nu=0\\
&Ax^*(t)=b
\end{aligned}
\right.
$$
令 $u=\frac{1}{t}+f_0(x^*(t))$，则上式可变为 $z^*(u)$ 所满足的 KKT 条件