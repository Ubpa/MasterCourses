# HW02 曲率

## 1. 问题描述

用 color bar 可视化三角网格的平均曲率、平均曲率的绝对值和高斯曲率

## 2. 算法原理

cot Laplace 算子
$$
\Delta f(v_i)=\frac{1}{2A_i}\sum_{j\in\Omega(i)}(\cot \alpha_{ij}+\cot\beta_{ij})(f_j-f_i)
$$
平均曲率（空间上曲面上某一点任意两个相互垂直的正交曲率的平均值）
$$
\Delta \mathbf{x}=-2H\mathbf{n}
$$
绝对值
$$
H_i=\frac{1}{2}\|\Delta \mathbf{x}\|
$$
高斯曲率（空间上曲面上某一点任意两个相互垂直的正交曲率的乘积）
$$
K_i=\frac{1}{A_i}\left(2\pi -\sum_{j\in\Omega(i)}\theta_j\right)
$$

## 3. 实现步骤

- [ ] 读取 obj
- [ ] 半边结构
- [ ] 计算各顶点的平均曲率、平均曲率绝对值和高斯曲率
- [ ] 计算平均曲率、平均曲率绝对值和高斯曲率的偏移与缩放因子（范围变到区间 $[0,1]$ 上）
- [ ] 渲染网格
  - color bar
  - 顶点色
  - 可视化平均曲率、平均曲率绝对值和高斯曲率
- [ ] 渲染 color bar

## 4. 测试结果



## 5. 总结

