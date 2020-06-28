# HW09 网格简化

> 庄涛
>
> SA19001074

## 1. 问题描述

用 QEM 算法简化网格

## 2. 算法原理

点 $\mathbf{p}$ 到三角形平面 $f_i$（法向为 $\mathbf{n}_i$，其上有一点 $\mathbf{p}_i$）的距离平方为
$$
\operatorname{dist}^2(\mathbf{p},f_i)=(\mathbf{n}_i^\top\mathbf{p}-\mathbf{d}_i)^2\\
d_i=\mathbf{n}_i^\top \mathbf{p}_i
$$
记 $\bar{\mathbf{p}}=\left(\begin{array}{c}\mathbf{p}\\ 1\end{array}\right)$，$\bar{\mathbf{n}}_i=\left(\begin{array}{c}\mathbf{n}_i\\ -d_i\end{array}\right)$，$Q^f_i=\bar{\mathbf{n}}_i\bar{\mathbf{n}}_i^\top$，则
$$
\operatorname{dist}^2(\mathbf{p},f_i)=(\bar{\mathbf{n}}_i^\top\bar{\mathbf{p}})^2=\bar{\mathbf{p}}^\top\bar{\mathbf{n}}_i\bar{\mathbf{n}}_i^\top\bar{\mathbf{p}}=\bar{\mathbf{p}}^\top Q^f_i\bar{\mathbf{p}}
$$
定义
$$
Q_i^v=\sum_{j\in \Omega_v(i)}Q_j\\
Q_{(i,j)}^e=Q^v_i+Q^v_j
$$
在 $(i,j)$ 上求最优点
$$
\mathbf{p}^*=\mathop{\arg\min}_\limits{\mathbf{p}}\bar{\mathbf{p}}^\top Q^e_{(i,j)}\bar{\mathbf{p}}
$$
记
$$
Q^e_{(i,j)} = \left(\begin{array}{c}B & \mathbf{w}\\ \mathbf{w} & d^2\end{array}\right)
$$
则
$$
\begin{aligned}
\mathbf{p}^*
&=\mathop{\arg\min}_\limits{\mathbf{p}}\bar{\mathbf{p}}^\top Q^e_{(i,j)}\bar{\mathbf{p}}\\
&=\mathop{\arg\min}_\limits{\mathbf{p}}\left(\begin{array}{c}\mathbf{p}^\top & 1\end{array}\right)\left(\begin{array}{c}B & \mathbf{w}\\ \mathbf{w}^\top & d^2\end{array}\right)\left(\begin{array}{c}\mathbf{p} \\ 1\end{array}\right)\\
&=\mathop{\arg\min}_\limits{\mathbf{p}}\mathbf{p}^\top B \mathbf{p}+2\mathbf{w}^\top\mathbf{p}+d^2\\
&=-B^{-1}\mathbf{w}
\end{aligned}
$$
若 $B$ 不可逆，则取中点

新点的 $Q^v$ 即为原 $Q^e$ 

多次进行以上步骤则可简化网格

## 3. 实现步骤

- [x] 求 $Q^f$ 
- [x] 求 $Q^v$ 
- [x] 求 $Q^e$ 
- [x] 求 $\mathbf{p}^*$ 和相应 cost
- [x] 迭代
  - [x] collapse 最小 cost 的 edge`
  - [x] 更新新顶点的 $Q^v$ 
  - [x] 更新所有新点的相邻面，点，边的 $Q^f,Q^v,Q^e, \mathbf{p}^*$ 和相应 cost

## 4. 测试结果

![image-20200628112713136](assets/README/image-20200628112713136.png)

