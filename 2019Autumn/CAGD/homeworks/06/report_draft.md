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

