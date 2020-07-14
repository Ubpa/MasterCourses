# 05. Sparse Modeling and Sparse Optimization

## 05.1 压缩感知

### 05.1.1 概述

![image-20200714203510464](assets/05_Sparse/image-20200714203510464.png)
$$
\begin{array}{l}
(P_0) & \min_{\mathbf{x}}\|\mathbf{x}\|_0 \\
\text{s.t.} & A\mathbf{x}=\mathbf{b}
\end{array}
$$
其中 $A\in\mathbb{R}^{m\times n}(m<<n)$ 是行满秩矩阵

矩阵 $A$ 的 spark 是线性相关的最小列数

如果 $A\mathbf{x}=\mathbf{b}$ 的一个解 $\mathbf{x}$ 满足 $\|\mathbf{x}\|_0<\operatorname{spark}(A)/2$，则 $\mathbf{x}$ 是最稀疏的解

矩阵 $A$ 的==互相关== mutual coherence 是规范化列间的最大内积，记第 $k$ 列为 $\mathbf{a}_k$，则互相关为
$$
\mu(A)=\max_{1\le i\neq j\le n}|\bar{\mathbf{a}}_i^\top\bar{\mathbf{a}}_j|
$$
其中 $\bar{\mathbf{a}}_i=\operatorname{normalize}(\mathbf{a}_i)$ 

对于一个矩阵 $A$，都满足 $\operatorname{spark}(A)\ge 1+\frac{1}{\mu(A)}$ 

如果 $A\mathbf{x}=\mathbf{b}$ 的一个解 $\mathbf{x}$ 满足 $\|\mathbf{x}\|_0<(1+1/\mu(A))/2$，则 $\mathbf{x}$ 是最稀疏的解

### 05.1.2 贪婪算法

> pursuit algorithms

$P_0$ 问题经常用贪婪算法解决

下边是 Orthogonal Matching Pursuit (OMP) 算法

![image-20200714205324262](assets/05_Sparse/image-20200714205324262.png)

### 05.1.3 凸松弛

> convex relaxation

$l_p$ 范数的几何直观如下

![image-20200714205512191](assets/05_Sparse/image-20200714205512191.png)

可见 $l_1$ 和 $l_0$ 与平面的交点是相同的

将 $(P_0)$ 改为 $l_1$ 范数
$$
\begin{array}{l}
(P_1) & \min_{\mathbf{x}}\|W\mathbf{x}\|_1 \\
\text{s.t.} & A\mathbf{x}=\mathbf{b}
\end{array}
$$
其中 $W$ 是对角半正定矩阵

如果 $A\mathbf{x}=\mathbf{b}$ 存在一个满足 $\|\mathbf{x}\|_0<(1+1/\mu(A))/2$ 的解，则 OMP 算法（$\epsilon_0=0$）可以找到该最优解

如果 $A\mathbf{x}=\mathbf{b}$ 存在一个满足 $\|\mathbf{x}\|_0<(1+1/\mu(A))/2$ 的解，则该解都是 $(P_1)$ 和 $(P_0)$ 的唯一解

### 05.1.4 近似

error-tolerant 版本的 $(P_0)$ 如下
$$
\begin{array}{l}
(P_0^\epsilon) & \min_{\mathbf{x}}\|\mathbf{x}\|_0 \\
\text{s.t.} & \|b-A\mathbf{x}\|\le \epsilon
\end{array}
$$
如果一个系数向量 $\mathbf{x}_0$ 是可行解且满足 $\|\mathbf{x}_0\|_0<(1+1/\mu(A))/2$，则任何解满足
$$
\|\mathbf{x}_0^\epsilon-\mathbf{x}_0\|_2^2\le \frac{4\epsilon^2}{1-\mu(A)(2\|\mathbf{x}_0\|_0-1)}
$$
error-tolerant 版本的 $(P_1)$ 如下
$$
\begin{array}{l}
(P_1^\epsilon) & \min_{\mathbf{x}}\|\mathbf{x}\|_1 \\
\text{s.t.} & \|b-A\mathbf{x}\|\le \epsilon
\end{array}
$$
如果一个系数向量 $\mathbf{x}_0$ 是可行解且满足 $\|\mathbf{x}_0\|_0<(1+1/\mu(A))/4$，则任何解满足
$$
\|\mathbf{x}_0^\epsilon-\mathbf{x}_0\|_2^2\le \frac{4\epsilon^2}{1-\mu(A)(4\|\mathbf{x}_0\|_0-1)}
$$

### 05.1.5 Restricted Isometry Property

一个矩阵 $A$ 满足 $RIP(\delta;s)$，如果 $A$ 的任何 $s$ 列组成的子矩阵的特征值在 $1+\delta$ 和 $1-\delta$ 之间。

如果 $A\in\operatorname{RIP}(\sqrt{2}-1;2s)$，则 $(P_1)$ 和 $(P_0)$ 在 $s$-sparse 向量上有相同的解。

> 示例
>
> ![image-20200714213536544](assets/05_Sparse/image-20200714213536544.png)
>
> $l_1$ 完全准确，而 $l_2$ 很糟糕

## 05.2 稀疏建模

## 05.3 稀疏优化

### 05.3.1 稀疏优化模型

### 05.3.2 稀疏优化算法

#### 05.3.2.1 shinkage

$$
\min_{\mathbf{x}}\|\mathbf{x}\|_1+\frac{1}{2\tau}\|\mathbf{x}-\mathbf{z}\|_2^2
$$

结果为
$$
(\operatorname{shrink}(\mathbf{z},\tau))_i=\left\{
\begin{array}{l}
z_i-\tau & z_i>\tau\\
0 & -\tau\le z_i\le \tau\\
z_i+\tau & z_i<-\tau
\end{array}
\right.
$$
![image-20200714214252094](assets/05_Sparse/image-20200714214252094.png)

Moreau-Yosida regularization
$$
\min_{\mathbf{x}}r(\mathbf{x})+\frac{1}{2\tau}\|\mathbf{x}-\mathbf{z}\|_2^2
$$
若 $r(\mathbf{x})=\|\mathbf{x}\|_2$，则最优解为 $\mathbf{x}_{\text{opt}}=\max\{\|\mathbf{z}\|_2-\tau,0\}\operatorname{normalize}(\mathbf{z})$ 

nuclear norm optimazation
$$
\min_{X}\|X\|_*+\frac{1}{2\tau}\|X-Z\|_F^2
$$
令 $Z=U\Sigma V^\top$ 是 $Z$ 的奇异值分解，令 $\hat{\Sigma}$ 为对角阵，且对角元素满足
$$
\operatorname{diag}(\hat{\Sigma})=\operatorname{shrink}(\operatorname{diag}(\Sigma),\tau)
$$
则，最优解为
$$
X_{\text{opt}}=U\hat{\Sigma} V^\top
$$

#### 05.3.2.2 prox-linear algorithm

考虑问题
$$
\min_{\mathbf{x}}r(\mathbf{x})+f(\mathbf{x})
$$
其中 $r$ 是正则函数，$f$ 是数据保真度函数，则
$$
\mathbf{x}^{k+1}=\arg\min_\mathbf{x} r(\mathbf{x})+f(\mathbf{x}^k)+\langle\nabla f(\mathbf{x}^k),\mathbf{x}-\mathbf{x}^k\rangle+\frac{1}{2\delta_k}\|\mathbf{x}-\mathbf{x}^k\|_2^2
$$
等价于
$$
\mathbf{x}^{k+1}=\arg\min_\mathbf{x} r(\mathbf{x})+\frac{1}{2\delta_k}\|\mathbf{x}-(\mathbf{x}^k-\delta_k\nabla f(\mathbf{x}^k))\|_2^2
$$

#### 05.3.2.3 alternating direction method of multipliers (ADMM)

$$
\min_{X\in C^{n\times T}}\mu\|X\|_p+\|AX-B\|_q
$$

取 $T=1$，则
$$
\min_{\mathbf{x}\in C^{n}}\mu\|\mathbf{x}\|_p+\|A\mathbf{x}-\mathbf{b}\|_q
$$
变量代换，可得
$$
\begin{array}{l}
\min & \mu\|\mathbf{z}\|_p+\|\mathbf{y}\|_q \\
\text{s.t.} & A\mathbf{x}-\mathbf{y}=\mathbf{b}
\end{array}
$$
乘子罚函数为
$$
\begin{aligned}
L(\mathbf{x},\mathbf{y},\mathbf{z},\lambda_y,\lambda_z,\rho)=&\mu\|\mathbf{z}\|_p+\|\mathbf{y}\|_q+Re(\lambda_z^\top(\mathbf{x}-\mathbf{z})+\lambda_y^\top(A\mathbf{X}-\mathbf{y}-\mathbf{b}))\\
&+\frac{\rho}{2}(\|\mathbf{x}-\mathbf{z}\|_2^2+\|A\mathbf{x}-\mathbf{y}-\mathbf{b}\|_2^2)
\end{aligned}
$$
更新步为
$$
\left\{\begin{array}{l}
\mathbf{x}^{k+1}:=\arg \min \frac{1}{2}\left(\left\|\mathbf{x}-\mathbf{z}^{k}+\mathbf{u}_{z}^{k}\right\|_{2}^{2}+\left\|A \mathbf{x}-\mathbf{y}^{k}-\mathbf{b}+\mathbf{u}_{y}^{k}\right\|_{2}^{2}\right) \\
\mathbf{y}^{k+1}:=\arg \min \|\mathbf{y}\|_{q}+\frac{\rho}{2}\left\|\mathbf{y}-\left(A \mathbf{x}^{k+1}-\mathbf{b}\right)-\mathbf{u}_{y}^{k}\right\|_{2}^{2} \\
\mathbf{z}^{k+1}:=\arg \min \mu\|\mathbf{z}\|_{p}+\frac{\rho}{2}\left\|\mathbf{z}-\mathbf{x}^{k+1}-\mathbf{u}_{z}^{k}\right\|_{2}^{2}
\end{array}\right.
$$
解决完上述子问题后，更新 Lagrange 乘子
$$
\left\{\begin{array}{l}
\mathbf{u}_{z}^{k+1}=\mathbf{u}_{z}^{k}+\gamma\left(\mathbf{x}^{k+1}-\mathbf{z}^{k+1}\right) \\
\mathbf{u}_{y}^{k+1}=\mathbf{u}_{y}^{k}+\gamma\left(A \mathbf{x}^{k+1}-\mathbf{y}^{k+1}-\mathbf{b}\right)
\end{array}\right.
$$
其中 $\mathbf{u}_{\mathbf{y}}=\frac{1}{\rho}\lambda_y$，$\mathbf{u}_{\mathbf{z}}=\frac{1}{\rho}\lambda_{\mathbf{z}}$，$\gamma > 0$ 是步长

