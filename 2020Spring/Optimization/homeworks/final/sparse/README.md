# 编程作业（一）文档

> 庄涛
>
> SA19001074

## 1. 优化问题描述

$$
\min_\limits{\mathbf{x}\in \mathbb{R}^n} \mu \|\mathbf{x}\|_p  + \|A\mathbf{x} - \mathbf{b}\|_q
$$

其中 $A \in \mathbb{R}^{m\times n}$，$\mathbf{b}\in \mathbb{R}^{m}$，$p=1,2$，$q=1,2$  

## 2. 算法原理

使用 **Alternating Direction Method of Multipliers (ADMM) 算法**求解该优化问题

引入变量 $\mathbf{z}\in \mathbb{R}^{n}$ 和 $\mathbf{y}\in \mathbb{R}^m$，问题改写为
$$
\begin{array}{l}
\min        & \mu \|\mathbf{z}\|_p + \|\mathbf{y}\|_q\\
\text{s.t.} & \mathbf{x}-\mathbf{z}= \mathbf{0}\\
            & A\mathbf{x}-\mathbf{y}= \mathbf{b}
\end{array}
$$
增广 Lagrange 罚函数为
$$
\begin{aligned}
L(\mathbf{x},\mathbf{y},\mathbf{z},\lambda_y,\lambda_z+\rho)
=& \mu \|\mathbf{z}\|_p + \|\mathbf{y}\|_q\\
&+ \lambda_{\mathbf{z}}^\top(\mathbf{x}-\mathbf{z}) + \lambda_{\mathbf{y}}^\top(A\mathbf{x}-\mathbf{y})\\
&+\frac{\rho}{2}(\|\mathbf{x}-\mathbf{z}\|_2^2+\|A\mathbf{x}-\mathbf{y}-\mathbf{b}\|_2^2)
\end{aligned}
$$
其中 $\lambda_{\mathbf{y}}\in \mathbb{R}^n$，$\lambda_{\mathbf{z}}\in \mathbb{R}^m$ 是 Lagrange 乘子，$\rho > 0$ 是罚因子

变量的迭代为
$$
\left\{\begin{array}{l}
\mathbf{x}^{k+1}:=\arg \min \frac{1}{2}\left(\left\|\mathbf{x}-\mathbf{z}^{k}+\mathbf{u}_{z}^{k}\right\|_{2}^{2}+\left\|\mathbf{A} \mathbf{x}-\mathbf{y}^{k}-\mathbf{b}+\mathbf{u}_{y}^{k}\right\|_{2}^{2}\right) \\
\mathbf{y}^{k+1}:=\arg \min \|\mathbf{y}\|_{q}+\frac{\rho}{2}\left\|\mathbf{y}-\left(\mathbf{A} \mathbf{x}^{k+1}-\mathbf{b}\right)-\mathbf{u}_{y}^{k}\right\|_{2}^{2} \\
\mathbf{z}^{k+1}:=\arg \min \mu\|\mathbf{z}\|_{p}+\frac{\rho}{2}\left\|\mathbf{z}-\mathbf{x}^{k+1}-\mathbf{u}_{z}^{k}\right\|_{2}^{2}
\end{array}\right.
$$

> **子问题** 
>
> **① 求 $\mathbf{x}^{k+1}$** 
> $$
> \mathbf{x}^{(k+1)}=(I+A^\top A)^{-1}(\mathbf{z}^k-\mathbf{u}_{\mathbf{z}}+A^\top(\mathbf{y}^k+\mathbf{b}-\mathbf{u}_{\mathbf{y}}))
> $$
> **② 求 $\mathbf{y}^{k+1}$** 
>
> 令 $\mathbf{s} = \left(\mathbf{A} \mathbf{x}^{k+1}-\mathbf{b}\right)+\mathbf{u}_{y}^{k}$，有
> $$
> \mathbf{y}^{k+1}=
> \left\{
> \begin{array}{l}
> \operatorname{shrink}(\mathbf{s},1/\rho), & \text{if} \quad q = 1\\
> \max\{\|\mathbf{s}-1/\rho\|_2, 0\} \cdot(\mathbf{s}/\|\mathbf{s}\|_2) & \text{if} \quad q=2
> 
> \end{array}
> \right.
> $$
> **③ 求 $\mathbf{z}^{k+1}$** 
>
> 令 $\mathbf{s} = \mathbf{x}^{k+1}+\mathbf{u}_{z}^{k}$，有
> $$
> \mathbf{z}^{k+1}=\left\{\begin{array}{l}\operatorname{shrink}(\mathbf{s},\mu/\rho), & \text{if} \quad q = 1\\\max\{\|\mathbf{s}-\mu/\rho\|_2, 0\} \cdot(\mathbf{s}/\|\mathbf{s}\|_2) & \text{if} \quad q=2\end{array}\right.
> $$

解决完上述子问题后，更新 Lagrange 乘子
$$
\left\{\begin{array}{l}
\mathbf{u}_{z}^{k+1}=\mathbf{u}_{z}^{k}+\gamma\left(\mathbf{x}^{k+1}-\mathbf{z}^{k+1}\right) \\
\mathbf{u}_{y}^{k+1}=\mathbf{u}_{y}^{k}+\gamma\left(\mathbf{A} \mathbf{x}^{k+1}-\mathbf{y}^{k+1}-\mathbf{b}\right)
\end{array}\right.
$$
其中 $\mathbf{u}_{\mathbf{y}}=\frac{1}{\rho}\lambda_y$，$\mathbf{u}_{\mathbf{z}}=\frac{1}{\rho}\lambda_{\mathbf{z}}$，$\gamma > 0$ 是步长

记 $c^k=\sqrt{\|\mathbf{x}^{k}-\mathbf{z}^{k}\|_2^2+\|A\mathbf{x}^{k}-\mathbf{y}^{k}-\mathbf{b}^{k}\|}$

算法步骤

1. 给定初始点 $(\mathbf{x}^{0},\mathbf{y}^{0},\mathbf{z}^0)$ 和 $\mathbf{u}_\mathbf{y}^0$ 和 $\mathbf{u}_\mathbf{z}^0$，给定罚因子 $\rho >0$，常数 $\alpha>1$ 和 $0<\beta<1$ 及容许误差 $\epsilon >0$，令 $k:= 0$ 
2. 求 $(\mathbf{x}^{k+1},\mathbf{y}^{k+1},\mathbf{z}^{k+1})$ 
3. 若 $c^{k+1}<\epsilon$，则停止迭代并取 $\mathbf{x}^{k+1}$ 作为原问题的近似最优解；否则，计算  $\mathbf{u}_\mathbf{y}^{k+1}$ 和 $\mathbf{u}_\mathbf{z}^{k+1}$ 
4. 如果 $\frac{c^{k+1}}{c^k}\ge \beta$，则置 $\rho = \alpha \rho$。令 $k:=k+1$，返回第 1 步

## 3. 程序使用指南

- 使用 CMake 搭建项目（勾选 `Ubpa_BuildSparseTest`）

- 在 VS2019 中

  - 执行项目 Sparse_test_02_ADMM 可求解给定问题

  - 执行项目 Sparse_test_03_ADMM_CMD 可从控制台输入数据并求解

    > **输入数据说明** 
    >
    > ```
    > 1
    > 1
    > 2
    > 2
    > epsilon 0.0001
    > KEY_END
    > ```
    >
    > 具体而言
    >
    > 第一个数字是 $n$，第二个数字是 $m$ 
    >
    > 然后给出 $A$ 矩阵的元素
    >
    > 然后给出 $\mathbf{b}$ 向量的元素
    >
    > 然后再设定一些参数，如 $\mu,\rho,\gamma,\alpha,\beta,\epsilon,p,q$ 等
    >
    > 最后以 `KEY_END` 结尾

## 4. 程序测试

项目 Sparse_test_02_ADMM 提供了一个给定的问题
$$
\min |x|  + |2x - 2|
$$
显然最优解为 $x=1$，最优值为 $1$ 

程序运行结果如下

![image-20200621213510495](assets/README/image-20200621213510495.png)

## 5. 结论

Eigen 用起来很舒服，C++ 天下第一

以为作业会很难，但其实我发现我脑子还没报废，还可以写

只用了小例子简单验证了正确性，也不知道咋构造一个好问题来详细验证

我爱凸优化！

