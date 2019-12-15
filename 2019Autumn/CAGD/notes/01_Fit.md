# 1. 拟合

> 插值 interpolation 和逼近 approximation

![1570682612844](assets/1570682612844.jpg)

## 1.1 插值

> 理论基础参考：[《样条函数与逼近论》第三章 线性插值](../../SplineApproximation/notes/03_LinearInterpolation.md) 

### 1.1.1 一般形式

给定函数空间 $B=\text{span}\{b_1,\dots,b_n|b_i:\Omega\mapsto \mathbb{R}^b,\Omega\subseteq \mathbb{R}^a\}$，和一些点对 $\{(x_1,y_1),\dots,(x_n,y_n)|(x_i,y_i)\in \Omega\times\mathbb{R}^b\}$，求 $\pmb{c}=\begin{pmatrix} c_1 \\ \dots \\ c_n\end{pmatrix}$ 使得 $f_{\pmb{c}}\triangleq\sum_\limits{k=0}^n c_i b_i(x)$ 满足 $\forall i\in\{1,\dots,n\},f_{\pmb{c}}(x_i)=y_i$。写成矩阵行形式
$$
\left( \begin{array} { c c c } { b _ { 1 } \left( x _ { 1 } \right) } & { \cdots } & { b _ { n } \left( x _ { 1 } \right) } \\ { \vdots } & { \ddots } & { \vdots } \\ { b _ { 1 } \left( x _ { n } \right) } & { \cdots } & { b _ { n } \left( x _ { n } \right) } \end{array} \right) \left( \begin{array} { c } { c _ { 1 } } \\ { \vdots } \\ { c _ { n } } \end{array} \right) = \left( \begin{array} { c } { y _ { 1 } } \\ { \vdots } \\ { y _ { n } } \end{array} \right)
$$
左边的系数矩阵简记为
$$
\left( \begin{array} { c c c } { b _ { 1 } \left( x _ { 1 } \right) } & { \cdots } & { b _ { n } \left( x _ { 1 } \right) } \\ { \vdots } & { \ddots } & { \vdots } \\ { b _ { 1 } \left( x _ { n } \right) } & { \cdots } & { b _ { n } \left( x _ { n } \right) } \end{array} \right)=A\left(\begin{array}{c c c} x_1 & \dots & x_n\\b_1 & \dots & b_n\end{array}\right)=\{b_j(x_i)\}_{i,j=1}^n
$$

> 每行是一个插值条件，插值条件个数要等于基函数个数，基函数要线性无关

### 1.1.2 多项式插值

#### 1.1.2.1 幂基

基 $B=\{1,x,\dots,x^{n-1}\}$ 

求解线性方程组
$$
\left( \begin{array} { c c c }
{ 1 } & { \cdots } & { x_1^{n-1} } \\

{ \vdots } & { \ddots } & { \vdots } \\

{ 1 } & { \cdots } & { x_n^{n-1} }
\end{array} \right)

\left( \begin{array} { c } { c _ { 1 } } \\ { \vdots } \\ { c _ { n } } \end{array} \right)

= \left( \begin{array} { c } { y _ { 1 } } \\ { \vdots } \\ { y _ { n } } \end{array} \right)
$$
其中 $\left( \begin{array} { c c c }{ 1 } & { \cdots } & { x_1^{n-1} } \\{ \vdots } & { \ddots } & { \vdots } \\{ 1 } & { \cdots } & { x_n^{n-1} }
\end{array} \right)$ 是 Vandermonde 矩阵，行列式记为
$$
\begin{aligned}
V(x_1,\dots,x_n)=\prod_\limits{1\le j<i\le n}(x_i-x_j)=
&(x_2-x_1)\\
&(x_3-x_2)(x_3-x_1)\\
&\dots\\
&(x_n-x_{n-1})\dots(x_n-x_1)
\end{aligned}
$$

#### 1.1.2.2 病态问题

**多项式插值问题** 

- 系数矩阵稠密
- 依赖于基函数选取，矩阵可能病态，导致难于求解（求逆）

**病态问题** 
输入数据的细微变化导致输出的剧烈变化

将线性方程看成直线（超平面）的话，当系统病态时，直线变为近似平行，求解（即直线求交）变得困难、不精确

**条件数** 
$$
\kappa(A)=\frac{\max_{x\neq 0}\frac{\|Ax\|}{\|x\|}}{\min_{x\neq 0}\frac{\|Ax\|}{\|x\|}}=\left|\frac{\lambda_{\max}}{\lambda_{\min}}\right|
$$
等于最大特征值和最小特征值（绝对值意义下）之间比例，条件数大意味着基元之间有太多相关性

多项式插值问题是病态的，范德蒙矩阵条件数随 n 指数级增长

因为函数之间的差别随着次数增加而减小

![1570694521074](assets/1570694521074.jpg)

**拉格朗日多项式** 

可以不求逆直接得到多项式插值函数，方法是拉格朗日多项式
$$
f(x)=\sum_{i=1}^n y_il_i(x)\\
l_i(x)\in \mathcal{P}_{n},\ l_i(x_k)=\delta_{ik}
$$
可推得
$$
l_i(x)=\frac{\prod_{j\neq i}(x-x_j)}{\prod_{j\neq i}(x_i-x_j)}
$$
与求线性方程组的方法所得结果相同

> **证明** 
>
> $l_i(x)$ 有根 $x_1,\dots,x_{i-1},x_{i+1},\dots,x_n$，则设
> $$
> l_i(x)=C\prod_{j\neq i}(x-x_j)
> $$
> 则
> $$
> l_i(x_i)=C\prod_{j\neq i}(x_i-x_j)=1
> $$
> 即
> $$
> C=\frac{1}{\prod_{j\neq i}(x_i-x_j)}
> $$
> 故
> $$
> l_i(x)=\frac{\prod_{j\neq i}(x-x_j)}{\prod_{j\neq i}(x_i-x_j)}
> $$
>
> ---
>
> **示例** 
>
> $(1,2),(2,-3),(4,\frac{1}{2})$ 
>
> ![image-20191215204529896](assets/image-20191215204529896.png)
>
> 则
> $$
> \begin{aligned}
> P_0(x)&=\frac{(x-2)(x-4)}{3}\\
> P_1(x)&=-\frac{(x-1)(x-4)}{2}\\
> P_2(x)&=\frac{(x-1)(x-2)}{6}\\
> \end{aligned}
> $$
> 则
> $$
> P(x)=2P_0(x)-3P_1(x)+\frac{1}{2}P_2(x)
> $$
> ![image-20191215204941573](assets/image-20191215204941573.png)

#### 1.1.2.3 插值结果

振荡（龙格 Runge）现象，对插值点数的高度敏感性

![1570696025891](assets/1570696025891.jpg)

### 1.1.3 总结

多项式插值不稳定

> 控制点的微小变化可导致完全不同的结果

振荡(Runge)现象

> 多项式随着插值点数(可以是细微)增加而摆动

需要更好的基函数来做插值

> 分片多项式的结果会好很多

## 1.2 逼近

数据点可能含有噪声（采样），更紧凑的表示，计算简单。

常用逼近函数有多项式、有理函数（多项式商）、三角函数。

> 《样条函数与逼近论》这门课有更多的关于逼近的存在性，唯一性，距离等的理论阐述

Weierstrass 定理指出多项式函数空间在 $C[a,b]$ 上稠密

### 1.2.1 Bernstein 多项式

可以用 Bernstein 多项式来逼近
$$
B_n(f,x)=\sum_{i=0}^n f(x_i)B^n_i(x)\\
B^n_i(x)=\mathrm{C}_n^ix^i(1-x)^{n-i}
$$

其中 $x_i$ 是 $[0,1]$ 上的等距采样点

误差为
$$
|f(x)-B_n(f,x)|<\frac{9}{4}m_{f,n}
$$
其中
$$
m_{f,n}=\min_{|x_i-x_j|<\frac{1}{\sqrt{n}},i\neq j}|f(x_i)-f(x_j)|
$$

> 示例
>
> ![1570697461254](assets/1570697461254.jpg)

评价

- 逼近结果优秀，但需要高阶
- 计算昂贵
- 容易带来误差

> 示例
>
> ![1570697613037](assets/1570697613037.jpg)
>
> 可以看到 500 阶时还是有点差距

### 1.2.2 最小二乘逼近

给定一组线性无关的基函数 $B=\{b_1,\dots,b_n\}$ 和一组数据 $\{(x_1,y_1),\dots,(x_m,y_m)\}$。

在 B 张成的空间中哪个函数 $f(x)=\sum_{i=1}^nc_ib_i(x)\in \text{span}(B)$ 对数据逼近最好？

最小二乘逼近为
$$
\begin{align}

&\mathop{\arg\min}_\limits{f\in \text{span}(B)}\sum_{j=1}^m(f(x_j)-y_j)^2\\

=&\mathop{\arg\min}_\limits{c\in \mathbb{R}^n} \sum _ { j = 1 } ^ { m } \left( \sum _ { i = 1 } ^ { n } c _ { i } b _ { i } \left( x _ { j } \right) - y _ { j } \right) ^ { 2 }\\
=&\mathop{\arg\min}_\limits{c\in \mathbb{R}^n} ( M c - y ) ^ { \top } ( M c - y )\\
=&\mathop{\arg\min}_\limits{c\in \mathbb{R}^n} c ^ { \top } M ^ { \top } M c - y ^ { \top } M c - c ^ { \top } M ^ { \top } y + y ^ { \top } y \\
=&\mathop{\arg\min}_\limits{c\in \mathbb{R}^n} c ^ { \top } M ^ { \top } M c - 2 y ^ { \top } M c + y ^ { \top } y

\end{align}
$$
其中 $M=\left( \begin{array} { c c c } { b _ { 1 } \left( x _ { 1 } \right) } & { \cdots } & { b _ { n } \left( x _ { 1 } \right) } \\ { \vdots } & { \ddots } & { \vdots } \\ { b _ { 1 } \left( x _ { m } \right) } & { \cdots } & { b _ { n } \left( x _ { m } \right) } \end{array} \right)$ 

这是一个关于 $c$ 的二次多项式
$$
c ^ { \top } M ^ { \top } M c - 2 y ^ { \top } M c + y ^ { \top } y
$$
> 最小化 $x^\top Ax+b^\top x+c$，$A$ 是正定矩阵，充分必要条件为 $2Ax=-b$ 

最小解满足
$$
M^\top Mc=M^\top y
$$
即
$$
c=(M^\top M)^{-1}M^\top y
$$

如果 $M$ 是可逆方阵，则
$$
c=M^{-1}y
$$

