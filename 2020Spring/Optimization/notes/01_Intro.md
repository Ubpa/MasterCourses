# 1. 导论

[TOC]

## 1.1 最优化基本概念

实际问题解不唯一，往往通过制定目标准则选出最好的解

核心：模型 + 算法

### 1.1.1 数学描述

==最优化== optimization 一般是指在某种条件下作出最好的决策。

这种问题经常用下面的数学模型描述：

在给定的==约束条件== constraint 下，找出一个==决策变量== decision variable 的值，使得被称为==目标函数== objective function 的表达愿望尺度的函数值达到最小或最大。

### 1.1.2 最优化模型

一般来说决策变量有多个，因此用 $n$ 维向量 $\mathbf{x}=(x_1,\dots,x_n)^\top$ 来表示，于是问题写成如下形式
$$
\begin{aligned}
&\min f(\mathbf{x})\\
&s.t. \mathbf{x}\in \mathcal{S}\subset \mathbb{R}^n
\end{aligned}
$$
其中目标函数 $f$ 是定义在包含 $\mathcal{S}$ 的适当集合上的实值函数，$\mathcal{S}$ 是该问题变量 $\mathbf{x}$ 的可取值集合，称为问题的==可行域== feasible region

### 1.1.3 最优化模型的分类

若 $\mathcal{S}=\mathbb{R}^n$，则称为==无约束最优化问题==：
$$
\min_\limits{\mathbf{x}\in\mathbb{R}^n}f(\mathbf{x})
$$

带约束最优化问题通常可写为：
$$
\begin{aligned}
&\min & &f(\mathbf{x})&\\
&\text{s}.\text{t}. & &c_i(\mathbf{x})=0,& &i\in \mathcal{E}&\\
&& &c_j(\mathbf{x})\ge 0,& &j\in \mathcal{I}&
\end{aligned}
$$
这里 $c_i(\mathbf{x})$ 是约束函数，$\mathcal{E}$ 和 $\mathcal{I}$ 分别是等式约束的指标集合不等式约束的指标集

当 $f$ 和 $c_i$ 均为线性函数时，问题成为==线性规划== Linear Programming，否则称为==非线性规划== Nonlinear Programming

### 1.1.4 最优化问题的解

满足 $\mathbf{x} \in \mathcal{S}$ 的 $\mathbf{x}$ 称为问题的==可行解== feasible solution

若 $\mathbf{x}^*\in \mathcal{S}$ 满足
$$
f(\mathbf{x}^*)\le f(\mathbf{x})\quad \forall \mathbf{x}\in\mathcal{S}
$$
则称 $\mathbf{x}^*$ 为==全局最优解== global optimal solution

若 $\mathbf{x}\in \mathcal{S}$ 在适当邻域 $U(\mathbf{x})$ 满足
$$
f(\mathbf{x}^*)\le f(\mathbf{x})\quad \forall \mathbf{x}\in U(\mathbf{x}^*)
$$
则称 $\mathbf{x}^*$ 为==局部最优解== local optimal solution

###  1.1.5 最优性条件

最优性条件：问题的最优解所满足的**必要**或者**充分**条件

**无约束问题的极值条件** 

- 一阶必要条件：$\mathbf{\bar{x}}$ 极小点 $\Rightarrow$ $\nabla f(\mathbf{\bar{x}})=0$ 
- 二阶必要条件： $\mathbf{\bar{x}}$ 极小点 $\Rightarrow$ $\nabla f(\mathbf{\bar{x}})=0$，$\nabla^2 f(\mathbf{\bar{x}})\ge 0$ 
- 二阶充分条件：$\nabla f(\mathbf{\bar{x}})=0$，$\nabla^2 f(\mathbf{\bar{x}})> 0$ $\Rightarrow$ $\mathbf{\bar{x}}$ 极小点 
- 充要条件：设 $f(\mathbf{x})$ 为可微凸函数，则 $\mathbf{\bar{x}}$ 极小点 $\Leftrightarrow$ $\nabla f(\mathbf{\bar{x}})=0$ 

> $\nabla f(\mathbf{\bar{x}})$ 是**梯度** 
> $$
> \nabla=\left[\begin{array}{c}
> \frac{\part}{\part x_1}\\
> \vdots\\
> \frac{\part}{\part x_n}
> \end{array}\right],\nabla f(\bar{\mathbf{x}})=\left[\begin{array}{c}
> \frac{\part f(\bar{\mathbf{x}})}{\part x_1}\\
> \vdots\\
> \frac{\part f(\bar{\mathbf{x}})}{\part x_n}
> \end{array}\right]
> $$
> $\nabla^2 f(\mathbf{\bar{x}})$ 是 **Hesse 矩阵** 
> $$
> \begin{aligned}
> \nabla^2 &=\nabla \nabla^\top &=
> \left[\begin{array}{c}
> \frac{\part^2}{\part x_1\part x_1} && \dots && \frac{\part^2}{\part x_1\part x_n}\\
> \vdots && \dots && \vdots\\
> \frac{\part^2}{\part x_n\part x_1} && \dots && \frac{\part^2}{\part x_n\part x_n}\\
> \end{array}\right]\\
> \nabla^2 f(\mathbf{\bar{x}})&=\nabla \nabla^\top f(\mathbf{\bar{x}})&=
> \left[\begin{array}{c}
> \frac{\part^2 f(\mathbf{\bar{x}})}{\part x_1\part x_1} && \dots && \frac{\part^2 f(\mathbf{\bar{x}})}{\part x_1\part x_n}\\
> \vdots && \dots && \vdots\\
> \frac{\part^2 f(\mathbf{\bar{x}})}{\part x_n\part x_1} && \dots && \frac{\part^2 f(\mathbf{\bar{x}})}{\part x_n\part x_n}\\
> \end{array}\right]
> \end{aligned}
> $$
>
> ---
>
> 从二维来理解，$\nabla f(\mathbf{\bar{x}})=0$ 意味着周围是平的，$\nabla^2 f(\mathbf{\bar{x}})\ge 0$ 意味着开口朝上
>
> ---
>
> $f(\mathbf{x})$ 在 $\mathbf{x}_k$ 附近的二阶泰勒展开
> $$
> f(\mathbf{x})\approx f(\mathbf{x}_k)+\nabla^\top f(\mathbf{x})(\mathbf{x}-\mathbf{x}_k)+\frac{1}{2}(\mathbf{x}-\mathbf{x}_k)^\top \nabla^2 f(\mathbf{x})(\mathbf{x}-\mathbf{x}_k)
> $$

**约束问题的最优性条件** 

> 后边有解释

Kuhn-Tucker 必要条件

$\exist \lambda_i\ge 0(i\in \mathcal{I}_e),\mu_i(i\in\mathcal{E})$ 使得
$$
\nabla f(\mathbf{\bar{x}})-\sum_{i\in\mathcal{I}_e}\lambda_i \nabla c_i(\mathbf{\bar{x}})-\sum_{i\in \mathcal{E}}\mu_i \nabla c_i(\mathbf{\bar{x}})=0
$$
其中 $\mathcal{I}_e=\{i\in \mathcal{I} | c_i(\mathbf{\bar{x}})=0\}$ 

> 其他条件
>
> - $f$ 和 $c_i(i\in\mathcal{I}_e)$ 在 $\mathbf{\bar{x}}$ 可微
> - $c_i(i\in\mathcal{I}\backslash \mathcal{I}_e)$ 在点 $\bar{\mathbf{x}}$ 连续
> - $c_i(i\in\mathcal{E})$ 在 $\mathbf{\bar{x}}$ 连续可微
> - $\{\nabla c_i(\mathbf{\bar{x}})\ |\ i\in\mathcal{E}\cup\mathcal{I}_e\}$ 线性无关

定义 Lagrange 函数 $L(\mathbf{x},\mathbf{\lambda},\mathbf{\mu})=f(\mathbf{x})-\sum_{i\in\mathcal{I}}\lambda_i c_i(\mathbf{\bar{x}})-\sum_{i\in \mathcal{E}}\mu_i c_i(\mathbf{\bar{x}})$，若 $\mathbf{\bar{x}}$ 是局部最优解，则 $\exist \mathbf{\bar{\lambda}}\ge 0,\mathbf{\bar{\mu}}$ 使得
$$
\nabla_{\mathbf{x}} L(\mathbf{x},\mathbf{\lambda},\mathbf{\mu})=0
$$
上述条件可表达为
$$
(K-T)\left\{
\begin{aligned}
&\nabla_{\mathbf{x}} L(\mathbf{x},\mathbf{\lambda},\mathbf{\mu})=0\\
&c_i(\mathbf{x})=0 & i\in\mathcal{E}\\
&c_i(\mathbf{x})\ge 0 & i\in\mathcal{I}\\
&\lambda_ic_i(\mathbf{x})=0 & i\in \mathcal{I}\\
&\lambda_i\ge 0 & i\in \mathcal{I}
\end{aligned}
\right.
$$
其中 $\lambda_ic_i(\mathbf{x})=0(i\in \mathcal{I})$ 为互补松弛条件

## 1.2 非线性规划基础理论

同于 [1.1.2 最优化模型](#1.1.2 最优化模型)，可分为

- 连续变量
- 离散变量（组合优化问题）

非线性规划属于**连续型**最优化问题

改下符号
$$
\begin{aligned}
&\min & &f(\mathbf{x})&\\
&\text{s}.\text{t}. & &g_i(\mathbf{x})\ge0,& &i=1,\dots,m&\\
&& &h_j(\mathbf{x})= 0,& &j=1,\dots,l&
\end{aligned}
$$
> $f,g,h$ 至少有一个是非线性的

研究分两方面

- 研究最优解的性质
- 设计有效算法来求解

### 1.2.1 约束问题的最优性条件

> 最优性条件：问题的最优解所满足的**必要或充分**条件

**可行方向** 

设 $\mathbf{\bar{x}}\in \mathcal{S}$，$\mathbf{d}\in\mathbb{R}^n$ 是非零向量。若 $\exist \delta >0$ 使得
$$
\mathbf{\bar{x}}+\lambda\mathbf{d}\in\mathcal{S},\forall \lambda\in(0,\delta)
$$
则称 $\mathbf{x}$ 是$\mathcal{S}$ 在 $\mathbf{\bar{x}}$ 处的**可行方向**，记所有可行方向集合为 $F(\mathbf{\bar{x}},\mathcal{S})$ 

**下降方向** 

设 $f(\mathbf{x})$ 是 $\mathbb{R}^n$ 上的实函数，$\mathbf{\mathbf{x}}\in\mathbb{R}^n$，$\mathbb{d}$ 是非零向量。若 $\exist\delta>0$ 使得
$$
f(\mathbf{\bar{x}}+\lambda\mathbf{d})<f(\mathbf{\bar{x}}),\forall \lambda\in (0,\delta)
$$
则称 $\mathbf{d}$ 是 $f(\mathbf{x})$ 在 $\mathbf{\bar{x}}$ 处的下降方向

**下降方向集的子集** 

若 $f(\mathbf{x})$ 可微，且 $\nabla f(\mathbf{\bar{x}})^\top \mathbf{d}<0$，则 $\mathbf{d}$ 是下降方向。记这样的方向集合为 
$$
D(\mathbf{\bar{x}},f)=\{\mathbf{d}\ |\ \nabla f(\mathbf{\bar{x}})^\top\mathbf{d}<0\}
$$

> **证明** 
> $$
> f(\mathbf{x})\approx f(\bar{\mathbf{x}})+{\nabla f(\mathbf{x})}^\top(\mathbf{x}-\bar{\mathbf{x}})\\
> f(\mathbf{x}+\lambda\mathbf{d})-f(\bar{\mathbf{x}})=\lambda{\nabla f(\mathbf{x})}^\top\mathbf{d}<0
> $$

---

必要条件
$$
F(\mathbf{\bar{x}},\mathcal{S})\cap D(\mathbf{\bar{x}},f)=\empty
$$

---

记 $\mathcal{I}_e(\mathbf{\bar{x}})=\{i\in\{1,\dots,m\}|g_i(\mathbf{\bar{x}})=0\}$（起作用的不等式约束），
$$
\begin{aligned}
&D_f=D(\mathbf{\bar{x}},f)=\{\mathbf{d}\ |\ \nabla f(\mathbf{\bar{x}})^\top\mathbf{d}<0\}\\
&F_g=F(\mathbf{\bar{x}},g)=\{\mathbf{d}\ |\ \nabla g_i(\mathbf{\bar{x}})^\top\mathbf{d}>0,i\in \mathcal{I}_e(\mathbf{\bar{x}})\}\\
&F_h=F(\mathbf{\bar{x}},h)=\{\mathbf{d}\ |\ \nabla h_j(\mathbf{\bar{x}})^\top\mathbf{d}=0,j=1,\dots,l\}\\
\end{aligned}
$$
则必要条件为
$$
D_f\cap F_g \cap F_h=\empty
$$

> 其他条件
>
> - $f$ 和 $g_i(i\in I_e)$ 在 $\mathbf{\bar{x}}$ 可微
> - $g_i(i\notin \mathcal{I}(\mathbf{\bar{x}})$ 在 $\mathbf{\bar{x}}$ 连续
> - $h_j$ 在 $\mathbf{\bar{x}}$ 连续可微
> - $\{\nabla h_j(\mathbf{\bar{x}})\}^l_{j=1}$ 线性无关
>
> ---
>
> $F_g \cap F_h$  是可行方向集（$g$ 不变负，$h$ 保持等式），则 $D_f\cap F_g \cap F_h$ 是可行下降集

**Fritz-John 条件** 

设 $\bar{\mathbf{x}}$ 为可行点，若 $\bar{\mathbf{x}}$ 是局部最优解，则存在不全为 0 的数 $\lambda_0,\lambda_i(i\in I_e(\mathbf{\bar{x}}))$ 和 $\mu_j(j=1,\dots,l)$ 使得
$$
\lambda_0\nabla f(\mathbf{\bar{x}})-\sum_{i\in\mathcal{I}_e(\mathbf{\bar{x}})}\lambda_i\nabla g_i(\mathbf{\bar{x}})-\sum_{j=1}^l\mu_j\nabla h_j(\mathbf{\bar{x}})=0
$$
其中 $\lambda_0\ge 0,\lambda_i\ge 0,i\in \mathcal{I}(\mathbf{x})$ 

> 其他条件
>
> - $f$ 和 $g_i(i\in I_e)$ 在 $\mathbf{\bar{x}}$ 可微
> - $g_i(i\notin \mathcal{I}(\mathbf{\bar{x}})$ 在 $\mathbf{\bar{x}}$ 连续
> - $h_j$ 在 $\mathbf{\bar{x}}$ 连续可微
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
> > [凸集分离定理](https://baike.baidu.com/item/%E5%87%B8%E9%9B%86%E5%88%86%E7%A6%BB%E5%AE%9A%E7%90%86/12753190?fr=aladdin)：两不相交的凸集可用一超平面分离
> >
> > 设 $\mathcal{S}_1,\mathcal{S}_2\subseteq \mathbb{R}^n$ 为两个非空凸集，则存在非零向量 $\mathbb{p}\in\mathbb{R}^n$ 及 $\alpha\in\mathbb{R}$，记超平面 $H=\{\mathbf{x}\in\mathbb{R}^n|\mathbf{p}^\top\mathbf{x}=\alpha\}$，$H$ 分离两凸集
> >
> > $\mathbf{p}$ 是超平面的法向
>
> ![image-20200509233448483](assets/01_Intro/image-20200509233448483.png)
>
> > $0\ge\mathbf{p}_1^\top\mathbf{y}_1$，若 $\mathbf{p}_1$ 含有负项，则让 $\mathbf{y}_1$ 该项负无穷， 右边为正，矛盾
>
> ![image-20200509233621581](assets/01_Intro/image-20200509233621581.png)
>
> > 将 $\mathbf{d}$ 代入不等式可得 $-\|A\mathbf{p}_1+B\mathbf{p}_2\|^2=\mathbf{0}$ 

**Kuhn-Tucker 条件** 

已在 [1.1.5 最优性条件](#1.1.5 最优性条件) 表述过一次，下边更换下符号再表述一遍

存在 $\lambda_i\ge 0(i\in\mathcal{I}_e(\mathbf{\bar{x}}))$ 和 $\mu_j$ 使得
$$
\nabla f(\mathbf{\bar{x}})-\sum_{i\in\mathcal{I}_e(\mathbf{\bar{x}})}\lambda_i\nabla g_i(\mathbf{\bar{x}})-\sum_{j=1}^l\mu_j\nabla h_j(\mathbf{\bar{x}})=0
$$

> 其他条件
>
> - $f$ 和 $g_i(i\in\mathcal{I}_e(\mathbf{\bar{x}}))$ 在 $\mathbf{\bar{x}}$ 可微
> - $g_i(i\in\mathcal{I}\backslash \mathcal{I}_e(\mathbf{\bar{x}}))$ 在点 $\bar{\mathbf{x}}$ 连续
> - $h_j$ 在 $\mathbf{\bar{x}}$ 连续可微
> - $\{\nabla g_i(\mathbf{\bar{x}})\ |\ i\in\mathcal{I}_e\}\cup \{h_j(\mathbf{\bar{x}})\}^l_{j=1}$ 线性无关
>
> ---
>
> 由 **Fritz-John 条件** 可知，当 $\lambda_0=0$ 时，等式成立则意味着 $\{\nabla g_i(\mathbf{\bar{x}})\ |\ i\in\mathcal{I}_e\}\cup \{h_j(\mathbf{\bar{x}})\}^l_{j=1}$ 线性相关，矛盾，故 $\lambda_0\neq 0$，等式除以 $\lambda_0$ 即为 KT 条件
>
> ---
>
> [理解](https://www.zhihu.com/question/23311674) 

定义 Lagrange 函数 $L(\mathbf{x},\mathbf{\lambda},\mathbf{\mu})=f(\mathbf{x})-\sum_{i=1}^m\lambda_ig_i(\mathbf{x})-\sum_{j=1}^l \mu_jh_j(\mathbf{x})$ 

若 $\mathbf{\bar{x}}$ 是局部最优解，则 $\exist \mathbf{\bar{\lambda}}\ge 0,\mathbf{\bar{\mu}}$ 使得
$$
\nabla_{\mathbf{x}}L(\mathbf{\bar{x}},\mathbf{\bar{\lambda}},\mathbf{\bar{\mu}})=0
$$
可表达为
$$
(K-T)\left\{
\begin{aligned}
&\nabla_{\mathbf{x}} L(\mathbf{x},\mathbf{\lambda},\mathbf{\mu})=0\\
&g_i(\mathbf{x})\ge0 & i=1,\dots,m\\
&\lambda_ig_i(\mathbf{x})= 0 & i=1,\dots,m\\
&\lambda_i\ge 0 & i=1,\dots,m\\
&h_j(\mathbf{x})=0 & j=1,\dots,l\\
\end{aligned}
\right.
$$

> $g$ 中非等式部分可取相应 $\lambda$ 为 0，从而化为 KT 条件

### 1.2.2 下降算法

**算法映射** 

算法 $\mathcal{A}$ 是定义在空间 $X$ 上的点到**集**的映射，即对每个点 $\mathbf{x}^{(k)}\in X$，经算法 $\mathcal{A}$ 作用后产生一个点集 $\mathcal{A}(\mathbf{x}^{(k)})\subset X$，任意选择一个点 $\mathbf{x}^{(k+1)}\in \mathcal{A}(\mathbf{x}^{(k)})$ 作为 $\mathbf{x}^{(k)}$  的后续点

***闭映射** 

设 $X$ 和 $Y$ 分别是空间 $\mathbb{E}^p$ 和 $\mathbb{E}^q$ 中的非空闭集，$\mathcal{A}:X\to Y$ 为点到集的映射。如果 $\mathbf{x}^{(k)}\to \mathbf{x},y^{(k)}\in \mathcal{A}(\mathbf{x}^{(k)}),y^{(k)}\to y$ 蕴含着 $\mathbf{y}\in \mathcal{A}(\mathbf{x})$，则称映射 $\mathcal{A}$ 在 $\mathbf{x}\in X$ 处是闭的

**解集合** 

> 全局最优解难求，所以退而求其次只求满足**必要条件**的点

无约束优化问题可定义解集合为
$$
\Omega =\{\mathbf{\bar{x}}\ |\ \|\nabla f(\mathbf{\bar{x}})\|=0\}
$$
约束优化问题可定义解集合为
$$
\Omega=\{\mathbf{\bar{x}}\ |\ \mathbf{\bar{x}}\ \text{是 K - T 点}\}
$$
**下降函数** 

设 $\Omega\subset X$ 为解集合，$\mathcal{A}$ 为 $X$ 上的一个算法映射，$\psi(\mathbf{x})$ 是定义在 $X$ 上的连续实函数，若

- 当 $\mathbf{x}\notin \Omega$ 且 $\mathbf{y}\in \mathcal{A}(\mathbf{x})$ 时，$\psi(\mathbf{y})<\psi(\mathbf{x})$ 
- 当 $\mathbf{x}\in \Omega$ 且 $\mathbf{y}\in \mathcal{A}(\mathbf{x})$ 时，$\psi(\mathbf{y})\le\psi(\mathbf{x})$ 

则称 $\psi$ 是关于解集合 $\Omega$ 和算法 $\mathcal{A}$ 的下降函数

> 解集之外，$\psi$ 可引导向算法**走入解集** 
>
> 解集之内，$\psi$ 保证算法**不离开解集** 

**算法收敛性** 

> 存在下降函数的算法是有效的

设 $\Omega$ 为解集合，$\mathcal{A}$ 为 $X$ 上的算法映射。若以任意初始点 $\mathbf{x}^{(0)}\in Y\subset X$ 出发，算法产生的序列的任一收敛子列的极限属于解集合，则称算法映射 $\mathcal{A}$ 在 $Y$ 上收敛于解集合 $\Omega$ 

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
\mathbf{x}^{(k+1)}=\mathbf{x}^{(k)}+\alpha_k\mathbf{d}^{(k)}
$$
搜索方向一般选取某==价值函数== merit function $\psi$ 在 $\mathbf{x}^{(k)}$ 处的下降方向，即
$$
\nabla^\top\psi(\mathbf{x}^{(k)})\mathbf{d}^{(k)}<0
$$
步长因子的确定一般归结为解一维最优化问题
$$
\min_\limits{\alpha\ge 0}\psi(\mathbf{x}^{(k)}+\alpha\mathbf{d}^{(k)})
$$
**最优化迭代算法的基本结构** 

![image-20200305153325394](assets/01_Intro/image-20200305153325394.png)

 