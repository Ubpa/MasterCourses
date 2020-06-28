# HW12 Optimal Delaunay Triangulation

> 庄涛
>
> SA19001074

## 1. 问题描述

实现 Optimal Delaunay Triangulation 算法

## 2. 算法原理

### 2.1 Lawson Flip algorithm

当凸位置上存在四个点的非 Delaunay 次三角划分（subtriangulation）时，则用这四个点的另一个三角划分代替

> 由于圆的内接四边形对角互补，则可通过角度判断次三角划分是否为 Delaunay

### 2.2 Update Vertices

![image-20200628210144790](assets/README/image-20200628210144790.png)

$\hat{u}(\mathbf{x})$ 就是三角化 $\mathcal{T}$ 在 $u(\mathbf{x})=\|\mathbf{x}\|_2^2$ 上的分片投影，我们希望它尽量贴近 $\mathbf{u}(\mathbf{x})$ 

改写 $E$ 为
$$
\begin{aligned}
E
&=\sum_{T_j\in\mathcal{T}}\int|\hat{u}(\mathbf{x})-u(\mathbf{x})|\mathbb{d}\mathbf{x}\\
&=\sum_{T_j\in\mathcal{T}}\int\hat{u}(\mathbf{x})-u(\mathbf{x})\mathbb{d}\mathbf{x}\\
&=\sum_{T_j\in\mathcal{T}}\int\hat{u}(\mathbf{x})\mathbb{d}\mathbf{x}-\sum_{T_j\in\mathcal{T}}\int u(\mathbf{x})\mathbb{d}\mathbf{x}\\
&=\sum_{T_j\in\mathcal{T}}\int\hat{u}(\mathbf{x})\mathbb{d}\mathbf{x}+C\\
&=\frac{1}{3}\sum_{T_j\in\mathcal{T}}|T_j|\left(u(\mathbf{p}_{T_j}^0)+u(\mathbf{p}_{T_j}^1)+u(\mathbf{p}_{T_j}^2)\right)+C
\end{aligned}
$$
则
$$
\nabla_{\mathbf{p}_i} E=\frac{1}{3}\sum_{{T_j}\in\Omega(i)}\nabla|{T_j}|\left(u(\mathbf{p}_i)+u(\mathbf{p}_j)+u(\mathbf{p}_k)\right)+\frac{|\Omega(i)|}{3}\nabla u(\mathbf{p}_i)=0
$$
其中 $\Omega(i)$ 是 $\mathbf{p}_i$ 的邻接三角形集合，$|\Omega(i)|$ 是三角形面积和

由于 $\sum_{{T_j}\in\Omega(i)}\nabla|{T_j}| u(\mathbf{p}_i)=0$，则
$$
\nabla u(\mathbf{p}_i)=-\frac{1}{|\Omega(i)|}\sum_{T_j\in \Omega(i)}\nabla |T_j|(u(\mathbf{p}_j)+u(\mathbf{p}_k))
$$
其中
$$
\begin{aligned}
\nabla u(\mathbf{p}_i)&=2\mathbf{p}_i
\end{aligned}
$$
则
$$
\mathbf{p}_i^*=-\frac{1}{2|\Omega(i)|}\sum_{T_j\in\Omega(i)}\nabla |T_j|(u(\mathbf{p}_j)+u(\mathbf{p}_k))
$$
经过一定推导，可知
$$
\mathbf{p}_i^*=\frac{1}{|\Omega(i)|}\sum_{T_j\in\Omega(i)}|T_j|\mathbf{c}_j
$$
其中 $\mathbf{c}_j$ 是 $T_j$ 的外心

用 Gauss-Seidel 迭代（每一步必然减少能量）

## 3. 实现步骤

- [x] 获取初始三角化（为了简便，直接用参数化结果）
- [x] 迭代
  - [x] 更新三角化
  - [x] 更新顶点位置
  - [x] 能量计算（用于判断收敛）
- [x] 渲染（线框模式，原三角化 + 最优三角化）

## 4. 测试结果

![image-20200629002703125](assets/README/image-20200629002703125.png)

