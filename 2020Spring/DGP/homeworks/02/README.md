# HW02 曲率

> 庄涛
>
> SA19001074

## 1. 问题描述

用 colorbar 可视化三角网格的平均曲率、平均曲率的绝对值和高斯曲率

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

- [x] 读取 obj
- [x] 半边结构
- [x] 计算各顶点的平均曲率、平均曲率绝对值和高斯曲率
- [x] 计算平均曲率、平均曲率绝对值和高斯曲率的偏移与缩放因子（范围变到区间 $[0,1]$ 上）
- [x] 渲染网格
  - color bar
  - 顶点色
  - 可视化平均曲率、平均曲率绝对值和高斯曲率

## 4. 测试结果

模型为

![image-20200626012741626](assets/README/image-20200626012741626.png)

colorbar

![image-20200626013209810](assets/README/image-20200626013209810.png)

渲染结果

- 平均曲率

  ![image-20200626014202738](assets/README/image-20200626014202738.png)

  兔耳处明显，外侧红色，说明曲率为正，内侧偏蓝，说明曲率为负

- 平均曲率绝对值

  ![image-20200626013309429](assets/README/image-20200626013309429.png)

  大部分区域为蓝色，说明曲率接近 0，兔耳处偏红色，说明有较大曲率

- 高斯曲率

  ![image-20200626013355386](assets/README/image-20200626013355386.png)

  耳根处和耳朵处明显

