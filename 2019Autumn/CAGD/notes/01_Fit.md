# 1. 拟合

> 插值 interpolation 和逼近 approximation

![1570682612844](assets/1570682612844.jpg)

## 1.1 插值

### 1.1.1 一般形式

给定函数空间 $B=\text{span}\{b_1,\dots,b_n:b_i:\Omega\mapsto \mathbb{R}^b,\Omega\subseteq \mathbb{R}^a\}$，和一些点对 $\{(x_1,y_1),\dots,(x_n,y_n):(x_i,y_i)\in \Omega\times\mathbb{R}^b\}$，求 $\lambda=\begin{pmatrix} \lambda_1 \\ \dots \\ \lambda_n\end{pmatrix}$ 使得 $f_\lambda(x)\triangleq\sum_\limits{k=0}^n \lambda_i b_i(x)$ 满足 $\forall i\in\{1,\dots,n\},f_\lambda(x_i)=y_i$。写成矩阵行形式
$$
\left( \begin{array} { c c c } { b _ { 1 } \left( x _ { 1 } \right) } & { \cdots } & { b _ { n } \left( x _ { 1 } \right) } \\ { \vdots } & { \ddots } & { \vdots } \\ { b _ { 1 } \left( x _ { n } \right) } & { \cdots } & { b _ { n } \left( x _ { n } \right) } \end{array} \right) \left( \begin{array} { c } { \lambda _ { 1 } } \\ { \vdots } \\ { \lambda _ { n } } \end{array} \right) = \left( \begin{array} { c } { y _ { 1 } } \\ { \vdots } \\ { y _ { n } } \end{array} \right)
$$
左边的系数矩阵简记为
$$
\left( \begin{array} { c c c } { b _ { 1 } \left( x _ { 1 } \right) } & { \cdots } & { b _ { n } \left( x _ { 1 } \right) } \\ { \vdots } & { \ddots } & { \vdots } \\ { b _ { 1 } \left( x _ { n } \right) } & { \cdots } & { b _ { n } \left( x _ { n } \right) } \end{array} \right)=A\left(\begin{array}{c c c} x_1 & \dots & x_n\\b_1 & \dots & b_n\end{array}\right)=\{b_j(x_i)\}_{i,j=1}^n
$$

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

\left( \begin{array} { c } { \lambda _ { 1 } } \\ { \vdots } \\ { \lambda _ { n } } \end{array} \right)

= \left( \begin{array} { c } { y _ { 1 } } \\ { \vdots } \\ { y _ { n } } \end{array} \right)
$$
其中 $\left( \begin{array} { c c c }{ 1 } & { \cdots } & { x_1^{n-1} } \\{ \vdots } & { \ddots } & { \vdots } \\{ 1 } & { \cdots } & { x_n^{n-1} }
\end{array} \right)$ 是 Vandermonde 矩阵，行列式记为 $V(x_1,\dots,x_n)$。

#### 1.1.2.2 病态问题

**多项式插值问题** 

- 系数矩阵稠密
- 依赖于基函数选取，矩阵可能病态，导致难于求解（求逆）

**病态问题** 
输入数据的细微变化导致输出的剧烈变化

将线性方程看成直线（超平面）的话，当系统病态时，直线变为近似平行，求解（即直线求交）变得困难、不精确

**条件数** 
$$
\kappa(A)=\frac{\max_{x\neq 0}\frac{\|Ax\|}{\|x\|}}{\min_{x\neq 0}\frac{\|Ax\|}{\|x\|}}
$$
等于最大特征值和最小特征值之间比例，条件数大意味着基元之间有太多相关性

多项式插值问题是病态的，范德蒙矩阵条件数随 n 指数级增长

因为函数之间的差别随着次数增加而减小

![1570694521074](assets/1570694521074.jpg)

**拉格朗日多项式** 

可以不求逆直接得到多项式插值函数，方法是拉格朗日多项式
$$
f(x)=\sum_{i=0}^n y_il_i(x)\\
l_i(x)=\frac{\prod_{j\neq i}(x-x_j)}{\prod_{j\neq i}(x_i-x_j)}
$$
与求线性方程组的方法所得结果相同

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

Weierstrass 定理指出多项式函数空间在 $C([a,b])$ 上稠密

### 1.2.1 Berstein 多项式

可以用 Bernstein 多项式来逼近
$$
B_n(f,x)=\sum_{i=0}^n f(x_i)b_{n,i}(x)\\
b_{n,i}(x)=C_n^ix^i(1-x)^{n-i}
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

在 B 张成的空间中那个函数 $f(x)=\sum_{i=1}^n\lambda_ib_i(x)\in \text{span}(B)$ 对数据逼近最好？

最小二乘逼近为
$$
\begin{align}

&\mathop{\arg\min}_\limits{f\in \text{span}(B)}\sum_{j=1}^m(f(x_j)-y_j)^2\\

=&\mathop{\arg\min}_\limits{\lambda\in \mathbb{R}^n} \sum _ { j = 1 } ^ { m } \left( \sum _ { i = 1 } ^ { n } \lambda _ { i } b _ { i } \left( x _ { j } \right) - y _ { j } \right) ^ { 2 }\\
=&\mathop{\arg\min}_\limits{\lambda\in \mathbb{R}^n} ( M \lambda - y ) ^ { T } ( M \lambda - y )\\
=&\mathop{\arg\min}_\limits{\lambda\in \mathbb{R}^n} \lambda ^ { T } M ^ { T } M \lambda - y ^ { T } M \lambda - \lambda ^ { T } M ^ { T } y + y ^ { T } y \\
=&\mathop{\arg\min}_\limits{\lambda\in \mathbb{R}^n} \lambda ^ { T } M ^ { T } M \lambda - 2 y ^ { T } M \lambda + y ^ { T } y

\end{align}
$$
其中 $M=\left( \begin{array} { c c c } { b _ { 1 } \left( x _ { 1 } \right) } & { \cdots } & { b _ { n } \left( x _ { 1 } \right) } \\ { \vdots } & { \ddots } & { \vdots } \\ { b _ { 1 } \left( x _ { m } \right) } & { \cdots } & { b _ { n } \left( x _ { m } \right) } \end{array} \right)$ 

这是一个关于 $\lambda$ 的二次多项式
$$
\lambda ^ { T } M ^ { T } M \lambda - 2 y ^ { T } M \lambda + y ^ { T } y
$$
最小解满足
$$
M^\top M\lambda=M^\top y
$$
即
$$
\lambda=(M^\top M)^{-1}M^\top y
$$

