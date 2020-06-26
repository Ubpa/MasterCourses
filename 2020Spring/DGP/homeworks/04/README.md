# HW04 网格参数化 1

> 庄涛
>
> SA19001074

## 1. 问题描述

使用 Tutte's barycentric mapping 进行参数化，要求

- 边界与圆盘同胚
- 内部点参数坐标是周围点的凸组合（可简单使用均值 Laplacian）

## 2. 算法原理

记边界点集为 $\mathcal{B}$，边界点位置固定

均值 Laplacian，则有
$$
\mathbf{p}_i = \frac{1}{N_i}\sum_{j\in N(i)}\mathbf{p}_j,\quad v_i\notin \mathcal{B}
$$
这构成一个线性方程组，记为
$$
AX = B
$$
其中 $A$ 是一个满秩稀疏方阵

## 3. 实现步骤

- [x] 将边界映射到正方形上
- [x] 构建矩阵
- [x] 解方程
- [x] 渲染（线框模式，原网格 + 参数化网格）

## 4. 测试结果

![image-20200626213118581](assets/README/image-20200626213118581.png)

