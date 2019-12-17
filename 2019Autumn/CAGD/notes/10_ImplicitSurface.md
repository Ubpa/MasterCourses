# 10. 隐式曲面

## 10.1 基础

可微分函数 $f:\mathbb{R}^d\to \mathbb{R}$（$d$ 维标量场），物体 $S=\{\pmb{x}\in \mathbb{R}^d|f(\pmb{x})=0\}$，常用于表示 $d-1$ 维流形

$f(\pmb{x}^{(0)})=0$，且 $\frac{\part}{\part x_d}f(\pmb{x}^{(0)})\neq 0$，则高度场 $g:N_\epsilon\left(\pmb{x}^{(0)}\right)\to\mathbb{R}$，其中 $N_\epsilon\left(\pmb{x}^{(0)}\right)\triangleq\{\pmb{x}\in \mathbb{R}^{d-1}|\|\pmb{x}-(x^{(0)}_1,\dots,x^{(0)}_{d-1})\|\}\subseteq \mathbb{R}^{d-1}$，满足
$$
f(x_1,\dots,x_{d-1},x_d)=0 \Leftrightarrow x_d=g(x_1,\dots,x_{d-1})
$$
高度场 $g$ 是一个可微分的 $d-1$ 维流形，法向共线于 $f$ 的梯度（最大增大方向） 
$$
\pmb{n}(\pmb{x})=\text{normalize}(\nabla f(\pmb{x}))
$$
因此为了建模曲面，考虑

- $f$ 应该可微分，定义域在 $\mathbb{R}^3$ 中
- 梯度不消失

类型

- 一般：在 0 值附近梯度非零
- 符号：内负外正，实体造型
- 符号距离：$|f(\pmb{x})|$ 为 $\pmb{x}$ 到曲面的距离，内负外正，常数模长 1（$\|\nabla f(\pmb{x})\|=1$），中轴不可微
- 平方距离：$f(\pmb{x})$ 为 $\pmb{x}$ 到曲面的平方距离，最小二次优化，适合噪声

平均曲率 $H(\pmb{x})=-\frac{1}{2}\nabla\cdot \pmb{n}(\pmb{x})$ 

体积积分 $\Omega_f=\{\pmb{x}|f(\pmb{x})\le 0\}$ 
$$
\int_{\Omega_f}g(\pmb{x})\mathrm{d}\pmb{x}=\int_{\mathbb{R}^3} g(\pmb{x})(1-\text{step}(f(\pmb{x})))\mathrm{d}\pmb{x}
$$
曲面积分 $S_f=\{\pmb{x}|f(\pmb{x})=0\}$ 
$$
\int_{S_f}g(\pmb{x})\mathrm{d} \pmb{x}=\int_{\mathbb{R}^3}g(\pmb{x})\delta(f(\pmb{x}))\|\nabla f(\pmb{x})\|\mathrm{d}\pmb{x}
$$

## 10.2 数值离散

### 10.2.1 格

- 均匀，带
- 自适应 / 层级

$$
b(\pmb{x})=e^{\lambda\|\pmb{x}\|^2}\\b_{\pmb{\mu}}=b(\pmb{x}-\pmb{\mu})\\f(\pmb{x})=\sum_{\pmb{\mu}}\lambda_{\pmb{\mu}}b_{\pmb{\mu}}(\pmb{x})
$$

### 10.2.2 RBF

粒子 $\pmb{x}_i$，RBF $b_i(\pmb{x})=b(\pmb{x}-\pmb{x}_i)$，则
$$
f(\pmb{x})=\sum_{i}\lambda_ib_i(\pmb{x})
$$

## 10.3 等值面提取

### 10.3.1 Marching Cubes

![image-20191217162045544](assets/image-20191217162045544.png)

二义性 ![image-20191217162118096](assets/image-20191217162118096.png)

### 10.3.2 粒子

施力

- 到曲面
- 分散

## 10.4 实体造型

两个符号隐式函数 $f_A,f_B$ 对应物体 $A$ 和 $B$，则

![image-20191217162541542](assets/image-20191217162541542.png)

## 10.5 数据拟合

### 10.5.1 平面混合

**初始数据点** 

![image-20191217162720104](assets/image-20191217162720104.png)

**法向估计** 

![image-20191217162740828](assets/image-20191217162740828.png)

**符号距离函数** 

![image-20191217162754828](assets/image-20191217162754828.png)

![image-20191217162915225](assets/image-20191217162915225.png)

**Marching Cubes** 

![image-20191217162826562](assets/image-20191217162826562.png)

**最终网格** 

![image-20191217162841581](assets/image-20191217162841581.png)

### 10.5.2 薄平面样条

![image-20191217163222448](assets/image-20191217163222448.png)

