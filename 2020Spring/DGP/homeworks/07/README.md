# HW07 Barycentric Coordinates

> 庄涛
>
> SA19001074

## 1. 问题描述

用 mean value coordinate 作为权实现 Tutte's embedding 算法

## 2. 算法原理

![image-20200628011241925](assets/README/image-20200628011241925.png)
$$
\phi_i=\frac{\omega_i}{\sum_{j=1}^n \omega_j}\\
\omega_i=\frac{\tan\frac{\alpha_{i-1}}{2}+\tan\frac{\alpha_i}{2}}{\|v_i-v_0\|}\\
\sum_{i=1}^n\phi_i(v_0)v_i=v_0
$$

## 3. 实现步骤

- [x] 将边界映射到正方形上
- [x] 构建矩阵
- [x] 解方程
- [x] 渲染（线框模式，原网格 + 参数化网格）

## 4. 测试结果

![image-20200628014605066](assets/README/image-20200628014605066.png)

