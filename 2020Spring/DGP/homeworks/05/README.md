# HW04 网格参数化 2

> 庄涛
>
> SA19001074

## 1. 问题描述

用 local/global ARAP 进行网格参数化

## 2. 算法原理

假设有 $T$ 个三角形，第 $t$ 个三角形面积为 $A_t$，坐标为 $\mathbf{p}_t=(\mathbf{p}_t^0,\mathbf{p}_t^1,\mathbf{p}_t^2)^\top\in \mathbb{R}^{3\times 3}$（$\mathbf{p}_t^0,\mathbf{p}_t^1,\mathbf{p}_t^2\in\mathbb{R}^3$），在其平面内的等距（isometric）参数化坐标为 $\mathbf{q}_t=(\mathbf{q}_t^0,\mathbf{q}_t^1,\mathbf{q}_t^2)^\top\in \mathbb{R}^{3\times 2}$（$\mathbf{q}_t^0=(x_t^0,y_t^0)^\top$，$\mathbf{q}_t^1=(x_t^1,y_t^1)^\top$，$\mathbf{q}_t^2=(x_t^2,y_t^2)^\top$）

> 由 $\mathbf{p}_t$ 计算 $\mathbf{q}_t$ 
>
> 首先计算出 $\mathbf{n}_t$，然后求将 $\mathbf{n}_t$ 旋转为 $(0,1,0)^\top$ 的变换 $A_t$ 
>
> 则
> $$
> \begin{aligned}
> \mathbf{q}_t^0&=(0,0)^\top\\
> \mathbf{q}_t^1&=\left(A_t(\mathbf{p}_t^1-\mathbf{p}_t^0)\right)_{1,3}\\
> \mathbf{q}_t^2&=\left(A_t(\mathbf{p}_t^2-\mathbf{p}_t^0)\right)_{1,3}\\
> \end{aligned}
> $$

我们的目标是求整个网格的 2D 参数化，每个三角形的参数化坐标记为 $\mathbf{u}_t=(\mathbf{u}_t^0,\mathbf{u}_t^1,\mathbf{u}_t^2)^\top\in \mathbb{R}^{3\times 2}$（$\mathbf{u}_t^0,\mathbf{u}_t^1,\mathbf{u}_t^2\in\mathbb{R}^2$）

则 $\mathbf{q}_t$ 和 $\mathbf{u}_t$ 间的 Jacobian 矩阵记为 $J_t(\mathbf{u})$ 
> $$
> \begin{aligned}
> J_t(\mathbf{u})
> &=\frac{\partial \mathbf{u}_t}{\partial \mathbf{q}_t}\\
> &=\frac{1}{2A_t}
> \left(\begin{array}{c}
> {(\mathbf{q}_t^0)}^\perp & {(\mathbf{q}_t^1)}^\perp & {(\mathbf{q}_t^2)}^\perp
> \end{array}\right)
> \mathbf{u}_t\\
> &=\frac{1}{2A_t}
> \left(\begin{array}{c}
> y_t^1-y_t^2 & y_t^2-y_t^0 & y_t^0-y_t^1 \\
> x_t^2-x_t^1 & x_t^0-x_t^2 & x_t^1-x_t^0 \\
> \end{array}\right)
> \mathbf{u}_t
> \end{aligned}
> $$

定义辅助的 $L_t\in M \subset \mathbb{R}^{2\times 2}$（$M$ 是旋转变换集合）
$$
M=\left\{
\left(\begin{array}{c}
\cos\theta&\sin\theta\\
-\sin\theta&\cos\theta
\end{array}\right)
\Big|
\theta \in [0,2\pi)
\right\}
$$
定义能量
$$
\begin{aligned}
E(\mathbf{u},L)
&=\sum_{t=1}^T A_t\|J_t(\mathbf{u})-L_t\|^2_F\\
&=\frac{1}{2}\sum_{t=1}^T\sum_{i=0}^2 \cot \theta_t^i \|(\mathbf{u}_t^i-\mathbf{u}_t^{i+1})-L_t(\mathbf{q}_t^i-\mathbf{q}_t^{i+1})\|^2_F\\
\end{aligned}
$$

其中 $\theta_t^i$ 是边 $(\mathbf{q}_t^i,\mathbf{q}_t^{i+1})$ 的对角，上标取 3 模

求解优化问题
$$
\begin{array}{l}
\min_\limits{\mathbf{u},L} & E(\mathbf{u},L)\\
\text{s.t.} & L_t\in M
\end{array}
$$

### 2.1 Local

固定 $\mathbf{u}$，求 $L$ 

记 $J_t(\mathbf{u})$ 的 signed SVD 分解为 $J_t(\mathbf{u})=U_t\Sigma_t V_t^\top$，要求 $\det UV^\top = 1$，则最优 $L_t$ 应为 $U_tV_t^\top$ 

### 2.2 Global

固定 $L$，求 $\mathbf{u}$ 

利用半边结构，将能量改写为
$$
\begin{aligned}
E(\mathbf{u},L) &= \frac{1}{2}\sum_{(i,j)\in he}\cot(\theta_{ij})\|(\mathbf{u}_i-\mathbf{u}_j)-L_{t(i,j)}(\mathbf{q}_i-\mathbf{q}_j)\|^2
\end{aligned}
$$
令梯度为 0，可得
$$
\sum_{j\in N(i)}(\cot\theta_{ij}+\cot\theta_{ji})(\mathbf{u}_i-\mathbf{u}_j)=\sum_{j\in N(i)}(\cot\theta_{ij}L_{t(i,j)}+\cot\theta_{ji}L_{t(j,i)})(\mathbf{q}_i-\mathbf{q}_j)\quad (i=1,\dots,n)
$$
相应系数稀疏矩阵只依赖于输入网格，因此该矩阵可以固定，并预分解，从而加快计算

另外需要选取两个点固定

### 2.3 初始参数化

用 HW4 的算法即可

## 3. 实现步骤

- [ ] 求各三角形的平面等距参数化坐标 $\mathbf{q}_t=(\mathbf{q}_t^0,\mathbf{q}_t^1,\mathbf{q}_t^2)^\top\in \mathbb{R}^{3\times 2}$ 
- [ ] 求系数稀疏矩阵，并预分解
- [ ] 迭代
  - [ ] local
  - [ ] global
  - [ ] 能量计算（用来确定迭代终止）

## 4. 测试结果


