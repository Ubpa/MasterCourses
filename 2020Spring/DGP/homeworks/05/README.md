# HW05 网格参数化 2

> 庄涛
>
> SA19001074

## 1. 问题描述

用 local/global ARAP 进行网格参数化

## 2. 算法原理

假设有 $T$ 个三角形，第 $t$ 个三角形面积为 $A_t$，坐标为 $\mathbf{p}_t=(\mathbf{p}_t^0,\mathbf{p}_t^1,\mathbf{p}_t^2)^\top\in \mathbb{R}^{3\times 3}$（$\mathbf{p}_t^0,\mathbf{p}_t^1,\mathbf{p}_t^2\in\mathbb{R}^3$），在其平面内的等距（isometric）参数化坐标为 $\mathbf{q}_t=(\mathbf{q}_t^0,\mathbf{q}_t^1,\mathbf{q}_t^2)^\top\in \mathbb{R}^{3\times 2}$（$\mathbf{q}_t^0=(x_t^0,y_t^0)^\top$，$\mathbf{q}_t^1=(x_t^1,y_t^1)^\top$，$\mathbf{q}_t^2=(x_t^2,y_t^2)^\top$）

> 由 $\mathbf{p}_t$ 计算 $\mathbf{q}_t$ 
>
> 首先计算出 $\mathbf{n}_t$，然后求将 $\mathbf{n}_t$ 旋转为 $(0,1,0)^\top$ 的变换 $A_t$（用四元数）
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
&=\frac{1}{2}\sum_{t=1}^T\sum_{i=0}^2 \cot \theta_t^i \|(\mathbf{u}_t^i-\mathbf{u}_t^{i+1})-L_t(\mathbf{q}_t^i-\mathbf{q}_t^{i+1})\|^2\\
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

记 $J_t(\mathbf{u})$ 的 signed SVD 分解为 $J_t(\mathbf{u})=U_t\Sigma_t V_t^\top$，要求 $\det UV^\top>0$，则最优 $L_t$ 应为 $U_tV_t^\top$ 

SVD 分解可以直接用“协方差”矩阵替代 $J_t(\mathbf{u})$ 
$$
S_t(\mathbf{u})=\sum_{i=0}^{2}\cot\theta_t^i(\mathbf{u}_t^i-\mathbf{u}_t^{i+1})(\mathbf{q}_t^i-\mathbf{q}_t^{i+1})^\top
$$

### 2.2 Global

> **!!! 原文推导有误 !!!** 

固定 $L$，求 $\mathbf{u}$ 

利用半边结构，将能量改写为
$$
\begin{aligned}
E(\mathbf{u},L) &= \frac{1}{2}\sum_{(i,j)\in he}\cot(\theta_{ij})\|(\mathbf{u}_i-\mathbf{u}_j)-L_{t(i,j)}(\mathbf{q}_{t(i,j)}^i-\mathbf{q}_{t(i,j)}^j)\|^2
\end{aligned}
$$
令梯度为 0，则对 $i=1,\dots,n$，有
$$
\sum_{j\in N(i)}(\cot\theta_{ij}+\cot\theta_{ji})(\mathbf{u}_i-\mathbf{u}_j)=\sum_{j\in N(i)}(\cot\theta_{ij}L_{t(i,j)}(\mathbf{q}_{t(i,j)}^i-\mathbf{q}_{t(i,j)}^j)-\cot\theta_{ji}L_{t(j,i)}(\mathbf{q}_{t(j,i)}^j-\mathbf{q}_{t(j,i)}^i))
$$

> $t(i,j)$ 或 $t(j,i)$ 可能不存在（边界）

该线性系统可写为
$$
A\mathbf{u}=B
$$
相应系数稀疏矩阵只依赖于输入网格，因此该矩阵可以固定，并预分解，从而加快计算 

另外需要**选取一个点固定**（因为上述方程组的系数矩阵秩为 $n-1$，因为将所有 $\mathbf{u}$ 平移仍为最优解），比如固定 $\mathbf{u}_i$，则系数矩阵 $A$ 的第 $i$ 行该处应为 $\mathbf{e}_i^\top$，$B$ 的第 $i$ 行为 $\mathbf{u}_i^\top$（此时 $\mathbf{u}_i$ 不再是变量，因此关于 $\mathbf{u}_i$ 的原约束不应再成立）

> 不应该固定两个点，因为旋转部分已经由 $L$ 确定下来了，global 步骤的最优解并没有旋转的自由度，所以上边说该系数矩阵秩为 $n-1$ 
>
> 虽然最终的结果应该有旋转这一自由度，但其实这被初始化给间接确定下来了

### 2.3 初始参数化

用 Tutte's embedding 算法即可

## 3. 实现步骤

- [x] 用 Tutte's embedding 算法初始化参数坐标
- [x] 求各三角形的平面等距参数化坐标 $\mathbf{q}_t=(\mathbf{q}_t^0,\mathbf{q}_t^1,\mathbf{q}_t^2)^\top\in \mathbb{R}^{3\times 2}$ 
- [x] 选取两固定点，求系数稀疏矩阵，并预分解
- [x] 迭代
  - [x] local
  - [x] global
  - [x] 能量计算（用来确定迭代终止）
- [x] 渲染（线框模式，原网格 + 参数化网格）

## 4. 测试结果

![image-20200627233407206](assets/README/image-20200627233407206.png)

注意，local/global ARAP **不能保证最终都不翻转** 

> *Unfortunately, stitching the triangles using a global Poisson equation may result in some triangles "flipping" their orientation especially for a highly curved surface with compact boundary. We solve this with a final post-processing phase, e.g., the "convex virtual boundary" algorithm of Karni et al. [KGG05]. Since in most cases, there are only a few flips, sprinkled throughout the parameterization, the postprocessing solves the flips without changing much else.*  

从底下往上看的结果如下

![image-20200627233610801](assets/README/image-20200627233610801.png)

可见有部分三角形发生了翻转

其他测试例子

![image-20200627233753322](assets/README/image-20200627233753322.png)

![image-20200627234108611](assets/README/image-20200627234108611.png)

![image-20200627234402762](assets/README/image-20200627234402762.png)

