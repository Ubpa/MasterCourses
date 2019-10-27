# 1

## 题

给定以下三次多项式曲线
$$
P ( u ) = - \left( \begin{array} { c } { 7 / 8 } \\ { 5 / 8 } \end{array} \right) u ^ { 3 } + \left( \begin{array} { c } { 9 } \\ { 15 / 4 } \end{array} \right) u ^ { 2 } - \left( \begin{array} { c } { 57 / 2 } \\ { 9 / 2 } \end{array} \right) u + \left( \begin{array} { c } { 30 } \\ { - 1 } \end{array} \right)
$$

1. 计算 $P(u)$ 的极形式及其在区间 $[2,4]$ 内的 Bezier 控制多边形的顶点 $P_0,P_1,P_2,P_3$，并大致勾勒出该控制多边形；
2. 用 de Casteljau 算法计算在采样点 $u=\{4/2,3,7/2\}$ 处的多项式曲线 $P(u)$，并在 1.  图中画出；
3. 用 2. 中结果将曲线在 $u=3$ 处细分，再将右边部分曲线在中点 $u=7/2$ 处细分。将控制多边形在 1. 图中画出，并画出 $P(u)$ 表示的曲线。

## 解

![image-20191027164238208](assets/image-20191027164238208.jpg)

- 红色的是 1. 的控制多边形
- 蓝色圆点是 2. 的三个采样点
- 绿色的多边形是 $u=3$ 处细分曲线的左部分的控制多边形，黄色和洋红色的多边形是右部分在中点细分的两曲线的控制多边形
- 青色的是曲线 $P(u)$ 

### 1

$$
q(u_1,u_2,u_3)=
- \left( \begin{array} { c } { 7 / 8 } \\ { 5 / 8 } \end{array} \right) u_1 u_2 u_3
+ \left( \begin{array} { c } { 9 } \\ { 15 / 4 } \end{array} \right) \frac{u_1u_2+u_2u_3+u_1u_3}{3}
- \left( \begin{array} { c } { 57 / 2 } \\ { 9 / 2 } \end{array} \right) \frac{u_1+u_2+u_3}{3}
+ \left( \begin{array} { c } { 30 } \\ { - 1 } \end{array} \right)
$$

$$
\begin{aligned}
P_0&=q(2,2,2)=\left( \begin{array} { c } { 2 } \\ { 0 } \end{array} \right)\\
P_1&=q(2,2,4)=\left( \begin{array} { c } { 0 } \\ { 2 } \end{array} \right)\\
P_2&=q(2,4,4)=\left( \begin{array} { c } { 3 } \\ { 4 } \end{array} \right)\\
P_3&=q(4,4,4)=\left( \begin{array} { c } { 4 } \\ { 1 } \end{array} \right)\\
\end{aligned}
$$

### 2

```matlab
t = 0.75
P00=[2,0];
P01=[0,2];
P02=[3,4];
P03=[4,1];

P10=(1-t)*P00 + t*P01
P11=(1-t)*P01 + t*P02
P12=(1-t)*P02 + t*P03

P20=(1-t)*P10 + t*P11
P21=(1-t)*P11 + t*P12

P30=(1-t)*P20 + t*P21
```

$$
P^{(k)}_i(u)=\frac{4-u}{4-2}P_i^{(k-1)}+\frac{u}{4-2}P^{(k-1)}_{i+1}\quad(k=1,\dots,3,\ i=0,\dots3-k)\\
$$

#### u = 4/2

$$
\begin{aligned}
P^{(1)}_0&=1\cdot P_0^{(0)}+0\cdot P^{(0)}_{1}=\left( \begin{array} { c } { 2 } \\ { 0 } \end{array} \right)\\
P^{(1)}_1&=1\cdot P_1^{(0)}+0\cdot P^{(0)}_{2}=\left( \begin{array} { c } { 0 } \\ { 2 } \end{array} \right)\\
P^{(1)}_2&=1\cdot P_2^{(0)}+0\cdot P^{(0)}_{3}=\left( \begin{array} { c } { 3 } \\ { 4 } \end{array} \right)\\
P^{(2)}_0&=1\cdot P_0^{(1)}+0\cdot P^{(1)}_{1}=\left( \begin{array} { c } { 2 } \\ { 0 } \end{array} \right)\\
P^{(2)}_1&=1\cdot P_1^{(1)}+0\cdot P^{(1)}_{2}=\left( \begin{array} { c } { 0 } \\ { 2 } \end{array} \right)\\
P^{(3)}_0&=1\cdot P_0^{(2)}+0\cdot P^{(2)}_{1}=\left( \begin{array} { c } { 2 } \\ { 0 } \end{array} \right)\\
\end{aligned}
$$

#### 3

$$
\begin{aligned}
P^{(1)}_0&=0.5\cdot P_0^{(0)}+0.5\cdot P^{(0)}_{1}=\left( \begin{array} { c } { 1 } \\ { 1 } \end{array} \right)\\
P^{(1)}_1&=0.5\cdot P_1^{(0)}+0.5\cdot P^{(0)}_{2}=\left( \begin{array} { c } { 1.5 } \\ { 3 } \end{array} \right)\\
P^{(1)}_2&=0.5\cdot P_2^{(0)}+0.5\cdot P^{(0)}_{3}=\left( \begin{array} { c } { 3.5 } \\ { 2.5 } \end{array} \right)\\
P^{(2)}_0&=0.5\cdot P_0^{(1)}+0.5\cdot P^{(1)}_{1}=\left( \begin{array} { c } { 1.25 } \\ { 2 } \end{array} \right)\\
P^{(2)}_1&=0.5\cdot P_1^{(1)}+0.5\cdot P^{(1)}_{2}=\left( \begin{array} { c } { 2.5 } \\ { 2.75 } \end{array} \right)\\
P^{(3)}_0&=0.5\cdot P_0^{(2)}+0.5\cdot P^{(2)}_{1}=\left( \begin{array} { c } { 1.875 } \\ { 2.375 } \end{array} \right)\\
\end{aligned}
$$

#### 7/2

$$
\begin{aligned}
P^{(1)}_0&=0.25\cdot P_0^{(0)}+0.75\cdot P^{(0)}_{1}=\left( \begin{array} { c } { 0.5 } \\ { 1.5 } \end{array} \right)\\
P^{(1)}_1&=0.25\cdot P_1^{(0)}+0.75\cdot P^{(0)}_{2}=\left( \begin{array} { c } { 2.25 } \\ { 3.5 } \end{array} \right)\\
P^{(1)}_2&=0.25\cdot P_2^{(0)}+0.75\cdot P^{(0)}_{3}=\left( \begin{array} { c } { 3.75 } \\ { 1.75 } \end{array} \right)\\
P^{(2)}_0&=0.25\cdot P_0^{(1)}+0.75\cdot P^{(1)}_{1}=\left( \begin{array} { c } { 1.8125 } \\ { 3 } \end{array} \right)\\
P^{(2)}_1&=0.25\cdot P_1^{(1)}+0.75\cdot P^{(1)}_{2}=\left( \begin{array} { c } { 3.375 } \\ { 2.1875 } \end{array} \right)\\
P^{(3)}_0&=0.25\cdot P_0^{(2)}+0.75\cdot P^{(2)}_{1}=\left( \begin{array} { c } { 2.984375 } \\ { 2.390625 } \end{array} \right)\\
\end{aligned}
$$

### 3

在 $u=3$ 处细分的两条 Bezier 曲线的控制点分别为 $\left\{P_0^{(0)},P_0^{(1)},P_0^{(2)},P_0^{(3)}\right\}$ 和 $\left\{P_0^{(3)},P_1^{(2)},P_2^{(1)}, P_3^{(0)}\right\}$ 

右部曲线细分后的两条 Bezier 曲线的控制点分别为
$$
\left\{
\left(\begin{matrix}
1.875\\
2.375
\end{matrix}\right),

\left(\begin{matrix}
2.1875\\
2.5625
\end{matrix}\right),

\left(\begin{matrix}
2.59375\\
2.59375
\end{matrix}\right),

\left(\begin{matrix}
2.984375\\
2.390625
\end{matrix}\right)
\right\}
$$

$$
\left\{
\left(\begin{matrix}
2.984375\\
2.390625
\end{matrix}\right),

\left(\begin{matrix}
3.375\\
2.1875
\end{matrix}\right),

\left(\begin{matrix}
3.75\\
1.75\\
\end{matrix}\right),

\left(\begin{matrix}
4\\
1
\end{matrix}\right)
\right\}
$$

# 2

## 题

给定以下三次多项式曲线
$$
F ( u ) = \left( \begin{array} { c } { 15 } \\ { - 6 } \end{array} \right) u ^ { 3 } + \left( \begin{array} { c } { 27 } \\ { 10 } \end{array} \right) u ^ { 2 } - \left( \begin{array} { l } { 9 } \\ { 9 } \end{array} \right) u
$$
及参数区间 $[0,1]$ 

1. 计算 $F$ 的一阶和二阶导数；

2. 计算 $F$ 的极形式 $f(u_1,u_2,u_3)$ 及导数 $F^\prime$ 和 $F^{\prime\prime}$ 的极形式，证明它们分别等于 $3f(u_1,u_2,\hat{1})$ 和 $6f(u_1,\hat{1},\hat{1})$。

   注：$f \left( u _ { 1 } , u _ { 2 } , \hat { 1 } \right) = f \left( u _ { 1 } , u _ { 2 } , 1 \right) - f \left( u _ { 1 } , u _ { 2 } , 0 \right)$ 

## 解

# 3

## 题

给定由一下四点及结点向量 $[0,1,2,3,4,5]$ 定义的均匀 B 样条
$$
P _ { 0 } = \left( \begin{array} { c } { - 2 } \\ { - 10 } \end{array} \right) , \quad P _ { 1 } = \left( \begin{array} { c } { - 4 } \\ { 2 } \end{array} \right) , \quad P _ { 2 } = \left( \begin{array} { c } { 6 } \\ { 5 } \end{array} \right) , \quad P _ { 3 } = \left( \begin{array} { c } { 4 } \\ { - 7 } \end{array} \right)
$$

1. 用 de Boor 算法计算曲线在 $t=2.5$ 处的位置。勾勒出控制多边形和此算法构造出的相关点；
2. 对于 1. 中的 B 样条，计算能表示同一曲线的相应 Bezier 控制顶点。在 1. 图中画出控制顶点和 Bezier 曲线

## 解

