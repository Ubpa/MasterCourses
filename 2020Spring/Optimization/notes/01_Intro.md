# 1. 导论

[TOC]

## 1.1 最优化基本概念

### 1.1.1 最优化

实际问题解不唯一，往往通过制定目标准则选出最好的解

### 1.1.2 概述

最优化讨论：模型化和方法，过程如下

- 以最优化形式描述问题（给定约束下目标函数的最值）
- 用严密算法求解

### 1.1.3 数学描述

**最优化** optimization 一般是指在某种条件下作出最好的决策。这种问题经常用下面的数学模型描述：

在给定的**约束条件** constraint 下，找出一个**决策变量** decision variable 的值，使得被称为**目标函数** objective function 的表达愿望尺度的函数值达到最小或最大。

### 1.1.4 最优化模型

一般来说决策变量有多个，因此用 $n$ 维向量 $\pmb{x}=(x_1,\dots,x_n)^\top$ 来表示，于是问题写成如下形式
$$
\begin{aligned}
&\min f(\pmb{x})\\
&s.t. \pmb{x}\in \mathcal{S}\subset \mathbb{R}^n
\end{aligned}
$$
其中目标函数 $f$ 是定义在包含 $\mathcal{S}$ 的适当集合上的实值函数，$\mathcal{S}$ 是该问题变量 $\pmb{x}$ 的可取值集合，称为问题的**可行域** feasible region

### 1.1.5 最优化模型的分类

若 $\mathcal{S}=\mathbb{R}^n$，则称为**无约束最优化问题**：
$$
\min_\limits{\pmb{x}\in\mathbb{R}^n}f(\pmb{x})
$$

带约束最优化问题**通常**可写为：
$$
\begin{aligned}
&\min & &f(\pmb{x})&\\
&\text{s}.\text{t}. & &c_i(\pmb{x})=0,& &i\in \mathcal{E}&\\
&& &c_j(\pmb{x})\ge 0,& &j\in \mathcal{I}&
\end{aligned}
$$
这里 $c_i(\pmb{x})$ 是约束函数，$\mathcal{E}$ 和 $\mathcal{I}$ 分别是等式约束的指标集合不等式约束的指标集

当 $f$ 和 $c_i$ 均为线性函数时，问题成为**线性规划** Linear Programming，否则称为**非线性规划** Nonlinear Programming

### 1.1.6 最优化问题的解

满足 $\pmb{x} \in \mathcal{S}$ 的 $\pmb{x}$ 称为问题的**可行解** feasible solution

若 $\pmb{x}^*\in \mathcal{S}$ 满足
$$
f(\pmb{x}^*)\le f(\pmb{x})\quad \forall \pmb{x}\in\mathcal{S}
$$
则称 $\pmb{x}^*$ 为**全局最优解** global optimal solution

若 $\pmb{x}\in \mathcal{S}$ 在适当邻域 $U(\pmb{x})$ 满足
$$
f(\pmb{x}^*)\le f(\pmb{x})\quad \forall \pmb{x}\in U(\pmb{x}^*)
$$
则称 $\pmb{x}^*$ 为**局部最优解** local optimal solution

###  1.1.7 最优性条件

最优性条件：问题的最优解所满足的**必要**或者**充分**条件

**无约束问题的极值条件** 

- 一阶必要条件：$\pmb{\bar{x}}$ 极小点 $\Rightarrow$ $\nabla f(\pmb{\bar{x}})=0$ 
- 二阶必要条件： $\pmb{\bar{x}}$ 极小点 $\Rightarrow$ $\nabla f(\pmb{\bar{x}})=0$，$\nabla^2 f(\pmb{\bar{x}})\ge 0$ 
- 二阶充分条件：$\nabla f(\pmb{\bar{x}})=0$，$\nabla^2 f(\pmb{\bar{x}})> 0$ $\Rightarrow$ $\pmb{\bar{x}}$ 极小点 
- 充要条件：设 $f(\pmb{x})$ 为可微凸函数，则 $\pmb{\bar{x}}$ 极小点 $\Leftrightarrow$ $\nabla f(\pmb{\bar{x}})=0$ 

> $\nabla f(\pmb{\bar{x}})$ 是**梯度** 
> $$
> \nabla f(\pmb{\bar{x}})=\left[\begin{array}{c}
> \frac{\part}{\part x_1}\\
> \vdots\\
> \frac{\part}{\part x_n}
> \end{array}\right]
> $$
> $\nabla^2 f(\pmb{\bar{x}})$ 是 **Hesse 矩阵** 
> $$
> \nabla^2 f(\pmb{\bar{x}})=\nabla f(\pmb{\bar{x}})(\nabla f(\pmb{\bar{x}}))^\top=
> \left[\begin{array}{c}
> \frac{\part^2 f}{\part x_1\part x_1} && \dots && \frac{\part^2 f}{\part x_1\part x_n}\\
> \vdots && \dots && \vdots\\
> \frac{\part^2 f}{\part x_n\part x_1} && \dots && \frac{\part^2 f}{\part x_n\part x_n}\\
> \end{array}\right]
> $$
>
> ---
>
> 从二维来理解，$\nabla f(\pmb{\bar{x}})=0$ 意味着周围是平的，$\nabla^2 f(\pmb{\bar{x}})\ge 0$ 意味着开口朝上

**约束问题的最优性条件** 

> 后边有解释

Kuhn-Tucker 必要条件

$\exist \lambda_i\ge 0(i\in \mathcal{I}_e),\mu_i(i\in\mathcal{E})$ 使得
$$
\nabla f(\pmb{\bar{x}})-\sum_{i\in\mathcal{I}_e}\lambda_i c_i(\pmb{\bar{x}})-\sum_{i\in \mathcal{E}}\mu_i c_i(\pmb{\bar{x}})=0
$$
其中 $\mathcal{I}_e=\{i\in \mathcal{I} | c_i(\pmb{\bar{x}})=0\}$ 

> 其他条件
>
> - $f$ 和 $c_i(i\in\mathcal{I}_e)$ 在 $\pmb{\bar{x}}$ 可微
> - $c_i(i\in\mathcal{I}\backslash \mathcal{I}_e)$ 在点 $\bar{\pmb{x}}$ 连续
> - $c_i(i\in\mathcal{E})$ 在 $\pmb{\bar{x}}$ 连续可微
> - $\{\nabla c_i(\pmb{\bar{x}})\ |\ i\in\mathcal{E}\cup\mathcal{I}_e\}$ 线性无关

定义 Lagrange 函数 $L(\pmb{x},\pmb{\lambda},\pmb{\mu})=f(\pmb{x})-\sum_{i\in\mathcal{I}}\lambda_i\nabla c_i(\pmb{\bar{x}})-\sum_{i\in \mathcal{E}}\mu_i\nabla c_i(\pmb{\bar{x}})$，若 $\pmb{\bar{x}}$ 是局部最优解，则 $\exist \pmb{\bar{\lambda}}\ge 0,\pmb{\bar{\mu}}$ 使得
$$
\nabla_{\pmb{x}} L(\pmb{x},\pmb{\lambda},\pmb{\mu})=0
$$
上述条件可表达为
$$
(K-T)\left\{
\begin{aligned}
&\nabla_{\pmb{x}} L(\pmb{x},\pmb{\lambda},\pmb{\mu})=0\\
&c_i(\pmb{x})=0 & i\in\mathcal{E}\\
&c_i(\pmb{x})\ge 0 & i\in\mathcal{I}\\
&\lambda_ic_i(\pmb{x})=0 & i\in \mathcal{I}\\
&\lambda_i\ge 0 & i\in \mathcal{I}
\end{aligned}
\right.
$$
其中 $\lambda_ic_i(\pmb{x})=0(i\in \mathcal{I})$ 为互补松弛条件

## 1.2 非线性规划基础理论

同于 [1.1.4 最优化模型](#1.1.4 最优化模型)，可分为

- 连续变量
- 离散变量（组合优化问题）

非线性规划属于**连续型**最优化问题

改下符号
$$
\begin{aligned}
&\min & &f(\pmb{x})&\\
&\text{s}.\text{t}. & &g_i(\pmb{x})\ge0,& &i=1,\dots,m&\\
&& &h_j(\pmb{x})= 0,& &j=1,\dots,l&
\end{aligned}
$$
> $f,g,h$ 至少有一个是非线性的

研究分两方面

- 研究最优解的性质
- 设计有效算法来求解

### 1.2.1 约束问题的最优性条件

> 最优性条件：问题的最优解所满足的**必要或充分**条件

**可行方向** 

设 $\pmb{\bar{x}}\in \mathcal{S}$，$\pmb{d}\in\mathbb{R}^n$ 是非零向量。若 $\exist \delta >0$ 使得
$$
\pmb{\bar{x}}+\lambda\pmb{d}\in\mathcal{S},\forall \lambda\in(0,\delta)
$$
则称 $\pmb{x}$ 是$\mathcal{S}$ 在 $\pmb{\bar{x}}$ 处的**可行方向**，记所有可行方向集合为 $F(\pmb{\bar{x}},\mathcal{S})$ 

**下降方向** 

设 $f(\pmb{x})$ 是 $\mathbb{R}^n$ 上的实函数，$\pmb{\pmb{x}}\in\mathbb{R}^n$，$\mathbb{d}$ 是非零向量。若 $\exist\delta>0$ 使得
$$
f(\pmb{\bar{x}}+\lambda\pmb{d})<f(\pmb{\bar{x}}),\forall \lambda\in (0,\delta)
$$
则称 $\pmb{d}$ 是 $f(\pmb{x})$ 在 $\pmb{\bar{x}}$ 处的下降方向

**下降方向集的子集** 

若 $f(\pmb{x})$ 可微，且 $\nabla f(\pmb{\bar{x}})^\top \pmb{d}<0$，则 $\pmb{d}$ 是下降方向。记这样的方向集合为 
$$
D(\pmb{\bar{x}},f)=\{\pmb{d}\ |\ \nabla f(\pmb{\bar{x}})^\top\pmb{d}<0\}
$$

> **证明** 
> $$
> f(\pmb{x})\approx f(\bar{\pmb{x}})+{\nabla f(\pmb{x})}^\top(\pmb{x}-\bar{\pmb{x}})\\
> f(\pmb{x}+\lambda\pmb{d})-f(\bar{\pmb{x}})=\lambda{\nabla f(\pmb{x})}^\top\pmb{d}<0
> $$

---

必要条件
$$
F(\pmb{\bar{x}},\mathcal{S})\cap D(\pmb{\bar{x}},f)=\empty
$$

---

记 $\mathcal{I}_e(\pmb{\bar{x}})=\{i\in\{1,\dots,m\}|g_i(\pmb{\bar{x}})=0\}$（起作用的不等式约束），
$$
\begin{aligned}
&D_f=D(\pmb{\bar{x}},f)=\{\pmb{d}\ |\ \nabla f(\pmb{\bar{x}})^\top\pmb{d}<0\}\\
&F_g=F(\pmb{\bar{x}},g)=\{\pmb{d}\ |\ \nabla g_i(\pmb{\bar{x}})^\top\pmb{d}>0,i\in \mathcal{I}_e(\pmb{\bar{x}})\}\\
&F_h=F(\pmb{\bar{x}},h)=\{\pmb{d}\ |\ \nabla h_j(\pmb{\bar{x}})^\top\pmb{d}=0,j=1,\dots,l\}\\
\end{aligned}
$$
则必要条件为
$$
D_f\cap F_g \cap F_h=\empty
$$

> 其他条件
>
> - $f$ 和 $g_i(i\in I_e)$ 在 $\pmb{\bar{x}}$ 可微
> - $g_i(i\notin \mathcal{I}(\pmb{\bar{x}})$ 在 $\pmb{\bar{x}}$ 连续
> - $h_j$ 在 $\pmb{\bar{x}}$ 连续可微
> - $\{\nabla h_j(\pmb{\bar{x}})\}^l_{j=1}$ 线性无关
>
> ---
>
> $F_g \cap F_h$  是可行方向集（$g$ 不变负，$h$ 保持等式），则 $D_f\cap F_g \cap F_h$ 是可行下降集

**Fritz-John 条件** 

存在不全为 0 的数 $\lambda_0,\lambda_i(i\in I_e(\pmb{\bar{x}}))$ 和 $\mu_j(j=1,\dots,l)$ 使得
$$
\lambda_0\nabla f(\pmb{\bar{x}})-\sum_{i\in\mathcal{I}_e(\pmb{\bar{x}})}\lambda_i\nabla g_i(\pmb{\bar{x}})-\sum_{j=1}^l\mu_j\nabla h_j(\pmb{\bar{x}})=0
$$
其中 $\lambda_0\ge 0,\lambda_i\ge 0,i\in \mathcal{I}(\pmb{x})$ 

> 其他条件
>
> - $f$ 和 $g_i(i\in I_e)$ 在 $\pmb{\bar{x}}$ 可微
> - $g_i(i\notin \mathcal{I}(\pmb{\bar{x}})$ 在 $\pmb{\bar{x}}$ 连续
> - $h_j$ 在 $\pmb{\bar{x}}$ 连续可微
>
> ---
>
> 证明
>
> ![image-20200509224703346](assets/01_Intro/image-20200509224703346.png)
>
> ![image-20200509230628286](assets/01_Intro/image-20200509230628286.png)
>
> ![image-20200509230704221](assets/01_Intro/image-20200509230704221.png)
>
> ![image-20200509230710755](assets/01_Intro/image-20200509230710755.png)
>
> > **即为结论** 
>
> ![image-20200509232226996](assets/01_Intro/image-20200509232226996.png)
>
> > $\mathcal{S}_1$ 是 (21) 式左侧，$\mathcal{S}_2$ 是 (21) 式右侧，无解就是交集为空
>
> ![image-20200509232420567](assets/01_Intro/image-20200509232420567.png)
>
> ![image-20200509233448483](assets/01_Intro/image-20200509233448483.png)
>
> > $0\ge\pmb{p}_1^\top\pmb{y}_1$，若 $\pmb{p}_1$ 含有负项，则让 $\pmb{y}_1$ 该项负无穷， 右边为正，矛盾
>
> ![image-20200509233621581](assets/01_Intro/image-20200509233621581.png)
>
> > 将 $\pmb{d}$ 代入不等式可得 $-\|A\pmb{p}_1+B\pmb{p}_2\|^2=\pmb{0}$ 

**Kuhn-Tucker 条件** 

已在 [1.1.7 最优性条件](#1.1.7 最优性条件) 表述过一次，下边更换下符号再表述一遍

存在 $\lambda_i\ge 0(i\in\mathcal{I}_e(\pmb{\bar{x}}))$ 和 $\mu_j$ 使得
$$
\nabla f(\pmb{\bar{x}})-\sum_{i\in\mathcal{I}_e(\pmb{\bar{x}})}\lambda_i\nabla g_i(\pmb{\bar{x}})-\sum_{j=1}^l\mu_j\nabla h_j(\pmb{\bar{x}})=0
$$

> 其他条件
>
> - $f$ 和 $g_i(i\in\mathcal{I}_e(\pmb{\bar{x}}))$ 在 $\pmb{\bar{x}}$ 可微
> - $g_i(i\in\mathcal{I}\backslash \mathcal{I}_e(\pmb{\bar{x}}))$ 在点 $\bar{\pmb{x}}$ 连续
> - $h_j$ 在 $\pmb{\bar{x}}$ 连续可微
> - $\{\nabla g_i(\pmb{\bar{x}})\ |\ i\in\mathcal{I}_e\}\cup \{h_j(\pmb{\bar{x}})\}^l_{j=1}$ 线性无关
>
> ---
>
> 由 **Fritz-John 条件** 可知，当 $\lambda_0=0$ 时，等式成立则意味着 $\{\nabla g_i(\pmb{\bar{x}})\ |\ i\in\mathcal{I}_e\}\cup \{h_j(\pmb{\bar{x}})\}^l_{j=1}$ 线性相关，矛盾，故 $\lambda_0\neq 0$，等式除以 $\lambda_0$ 即为 KT 条件
>
> ---
>
> 直观理解（3D）
>
> **梯度方向位于约束曲面的法向上** 
>
> - 约束流形
>   - 可微连续
>   - 等式约束的**雅克比矩阵满秩**（等式约束线性无关）
> - 法向
>   - **等式约束平面的法向** 
>   - **不等式约束半空间的负法向** 

定义 Lagrange 函数 $L(\pmb{x},\pmb{\lambda},\pmb{\mu})=f(\pmb{x})-\sum_{i=1}^m\lambda_ig_i(\pmb{x})-\sum_{j=1}^l \mu_jh_j(\pmb{x})$ 

若 $\pmb{\bar{x}}$ 是局部最优解，则 $\exist \pmb{\bar{\lambda}}\ge 0,\pmb{\bar{\mu}}$ 使得
$$
\nabla_{\pmb{x}}L(\pmb{\bar{x}},\pmb{\bar{\lambda}},\pmb{\bar{\mu}})=0
$$
可表达为
$$
(K-T)\left\{
\begin{aligned}
&\nabla_{\pmb{x}} L(\pmb{x},\pmb{\lambda},\pmb{\mu})=0\\
&g_i(\pmb{x})\ge0 & i=1,\dots,m\\
&\lambda_ig_i(\pmb{x})= 0 & i=1,\dots,m\\
&\lambda_i\ge 0 & i=1,\dots,m\\
&h_j(\pmb{x})=0 & j=1,\dots,l\\
\end{aligned}
\right.
$$

> $g$ 中非等式部分可取相应 $\lambda$ 为 0，从而化为 KT 条件

### 1.2.2 下降算法

**算法映射** 

算法 $\mathcal{A}$ 是定义在空间 $X$ 上的点到**集**的映射，即对每个点 $\pmb{x}^{(k)}\in X$，经算法 $\mathcal{A}$ 作用后产生一个点集 $\mathcal{A}(\pmb{x}^{(k)})\subset X$，任意选择一个点 $\pmb{x}^{(k+1)}\in \mathcal{A}(\pmb{x}^{(k)})$ 作为 $\pmb{x}^{(k)}$  的后续点

***闭映射** 

设 $X$ 和 $Y$ 分别是空间 $\mathbb{E}^p$ 和 $\mathbb{E}^q$ 中的非空闭集，$\mathcal{A}:X\to Y$ 为点到集的映射。如果 $\pmb{x}^{(k)}\to \pmb{x},y^{(k)}\in \mathcal{A}(\pmb{x}^{(k)}),y^{(k)}\to y$ 蕴含着 $\pmb{y}\in \mathcal{A}(\pmb{x})$，则称映射 $\mathcal{A}$ 在 $\pmb{x}\in X$ 处是闭的

**解集合** 

> 全局最优解难求，所以退而求其次只求满足**必要条件**的点

无约束优化问题可定义解集合为
$$
\Omega =\{\pmb{\bar{x}}\ |\ \|\nabla f(\pmb{\bar{x}})\|=0\}
$$
约束优化问题可定义解集合为
$$
\Omega=\{\pmb{\bar{x}}\ |\ \pmb{\bar{x}}\ \text{是 K - T 点}\}
$$
**下降函数** 

设 $\Omega\subset X$ 为解集合，$\mathcal{A}$ 为 $X$ 上的一个算法映射，$\psi(\pmb{x})$ 是定义在 $X$ 上的连续实函数，若

- 当 $\pmb{x}\notin \Omega$ 且 $\pmb{y}\in \mathcal{A}(\pmb{x})$ 时，$\psi(\pmb{y})<\psi(\pmb{x})$ 
- 当 $\pmb{x}\in \Omega$ 且 $\pmb{y}\in \mathcal{A}(\pmb{x})$ 时，$\psi(\pmb{y})\le\psi(\pmb{x})$ 

则称 $\psi$ 是关于解集合 $\Omega$ 和算法 $\mathcal{A}$ 的下降函数

> 解集之外，$\psi$ 可引导向算法**走入解集** 
>
> 解集之内，$\psi$ 保证算法**不离开解集** 

**算法收敛性** 

> 存在下降函数的算法是有效的

设 $\Omega$ 为解集合，$\mathcal{A}$ 为 $X$ 上的算法映射。若以任意初始点 $\pmb{x}^{(0)}\in Y\subset X$ 出发，算法产生的序列的任一收敛子列的极限属于解集合，则称算法映射 $\mathcal{A}$ 在 $Y$ 上收敛于解集合 $\Omega$ 

![image-20200305152622024](assets/01_Intro/image-20200305152622024.png)

> 证明略（过于复杂）

**实用收敛准则** 

![image-20200305152749574](assets/01_Intro/image-20200305152749574.png)

**收敛速度** 

![image-20200305152822228](assets/01_Intro/image-20200305152822228.png)

- $p=1$ 且 $0<\beta<1$ 则为线性收敛
- $p>1$ 或 $p=1,\beta=0$ 则超线性收敛

**迭代方法** 

![image-20200305153354055](assets/01_Intro/image-20200305153354055.png)

**搜索方向与步长因子** 
$$
\pmb{x}^{(k+1)}=\pmb{x}^{(k)}+\alpha_k\pmb{d}^{(k)}
$$
搜索方向一般选取某价值函数 merit function $\psi$ 在 $\pmb{x}^{(k)}$ 处的下降方向，即
$$
\nabla\psi(\pmb{x}^{(k)})^\top\pmb{d}^{(k)}<0
$$
步长因子的确定一般归结为解一维最优化问题
$$
\min_\limits{\alpha\ge 0}\psi(\pmb{x}^{(k)}+\alpha\pmb{d}^{(k)})
$$
**最优化迭代算法的基本结构** 

![image-20200305153325394](assets/01_Intro/image-20200305153325394.png)

