# 1. 赋范线性空间中的逼近问题引论

## 1.1 逼近问题的提出

设 X 是**赋范线性空间**，M 是 X 的**非空子集**，X 中的范数记为 $\|\cdot\|$。希望从 M 中选取元素逼近 X 中的元素，M 称为 X 的一个**逼近集**。

---

**定义 1.1** （最佳逼近）对任意 $x\in X$，如果有元素 $m^*\in M$ 使得
$$
\|x-m^*\|=\inf_{m\in M}\|x-m\|=d(x,M)
$$
则把 $m^*$ 称为由子集 M 逼近 x 的**最佳逼近元**，简记为 $m^*\in B_M(x)$。这里
$$
B_M(x)\triangleq\{m\in M: \|x-m\|=d(x,M)\}
$$
表示由 M 逼近 x 的最佳逼近元的**集合**，用 $\#B_M(x)$ 记集合中元素的个数。

> $\inf$ 是下确界，意味着存在 $m_n\in M$ 使得
> $$
> \lim_{n\to\infty}\|x-m_n\|=d(x,M)
> $$

---

赋范线性空间中逼近问题讨论的主要内容

- 存在性：$\# B_M(x)\ge 1$
- 唯一性：$\# B_M(x)\le 1$ 
- 表征定理：最佳逼近元的特征
- 构造：给定 x 和 M，计算最佳逼近元

> 唯一性并不是 $\# B_M(x)=1$ 
>
> 存在性 + 唯一性 => $\#B_M(x)=1$ 

**相关概念** 

- 存在性集：$\forall x\in X,B_M(x)\neq \empty$ 
- 唯一性集：$\forall x \in M, \#B_M(x)\le 1$ 
- T 集：$\forall x\in X,\#B_M(x)=1$ 

> T 集也叫 Tchebycheff/Chebychev/Chebysheff/Chebyshov 集

---

**问题典例** 

$I$ 是列紧的距离空间

> 设 $(X,\rho)$ 是度量空间，$A\subset X$，若 A 中的任何点列必有在 X 中收敛的子点列，则称 A 是（X 中的）致密集。若 X 自身是致密集，则称 X 是致密空间。
>
> 称度量空间中的致密闭集为紧集 compact set。A 是紧集的充要条件是：A 中任意点列有收敛的子点列收敛于 A 中的一点。致密的度量空间又称为紧（度量）空间。
>
> 任意序列：$\{x_n\}, x_n\in X$ 
>
> 子列：$\{x_{n_i}\},n_i<n_{i+1}$ 
>
> 收敛子列：$\lim_{i\to \infty} x_{n_i}=x^*\in X$ 

常用的线性赋范空间

> 下边的都是线性函数空间，区别在于范数不一样，这也是赋范线性空间的关键

- $L_2(I)$ [TODO]
- $C(T)$ [TODO]
- $L_1(T)$ [TODO]

M 常取为 X 的真子空间

- $\mathcal{P}_n$ [TODO]
- [TODO]
- $\mathcal{S}(\mathcal{P}_m,[TODO],\Delta)$ [TODO]
- $R_{m,n}[TODO]$ [TODO]

## 1.2 最佳逼近元的存在唯一性

### 1.2.1 存在性

**定理 1.1**（存在性）设 $M\subset X$ 是 X 中的列紧集，则 M 是存在性集。

> 证明 [TODO]

**推论 1.1**（有限维子空间存在性）设 M 是 X 的有限维真子空间，则 M 是存在性集。

> 有限维子空间的有界集是列紧的
>
> 子空间与中心为 x 的足够大的球相交得有界集

### 1.2.2 凸集 / 严格凸  / 匀凸

**定义 1.2** $\forall s_1,s_2 \in S,\forall \lambda_1,\lambda_2\ge0,\lambda_1+\lambda_2=1$，有 $\lambda_1s_1+\lambda_2s_2\in S$，则称 S 为凸集。

常见凸集

- 若 $S=\empty$ 或 $\#S=1$，则 S 是凸集
- 若 $S$ 线性空间，则 S 为凸集
- 赋范线性空间中单位球 $B_1\triangleq\{x\in X:\|x\|\le 1\}$ 是凸集

性质

- $\forall \alpha_i\ge 0,\sum_i\alpha_i=1$，有 $\sum_i\alpha_i s_i\in S$ 
- $S_\xi$ 为凸集，则 $\cap_\xi S_\xi$ 是凸集
- 元素个数只能是 0，1 或无穷

**定理 1.2** M 是凸集，则 $B_M(x)$ 是凸集

> 证明 [TODO]
>
> 几何直观
> $$
> B(x,r)\triangleq\{y\in X:\|y-x\|\le r\}
> $$
> 那么
> $$
> B_M(x)=M\cap B(x,d(x,M))
> $$
> 从而 $B_M(x)$ 是两凸集的交，也是凸集。
>
> 图 [TODO]

---

**定义 1.3** $\forall u_1,u_2 \in \part B_1,\forall\lambda_1,\lambda_2>0,\lambda_1+\lambda_2=1$，有 $\|\lambda_1u_1+\lambda_2u_2\|<1$，则 $B_1$ 严格凸。

> 几何意义是 $\part B_1$ 不含线段
>
> $\part B_1=\{x:\|x\|=1\}$ 
>
> $\|\cdot\|_1$ 和 $\|\cdot\|_\infty$ 不是严格凸的
>
> 图 [TODO]

单位球严格凸、X 严格凸、范数严格凸是同一含义的不同说法。

**定理 1.3** 下列说法等价

- X 严格凸
- $\forall x_1,x_2\in \part B_1, x_1\neq x_2$，则 $\|(x_1+x_2)/2\|<1$ 
- 若 $\forall x_1,x_2\in X, x_1\neq x_2, \|x_1+x_2\|=\|x_1\|+\|x_2\|$，则 $\exist c>0,x_1=cx_2$ 

> 证明 [TODO]

---

**定义 1.4** 若 $\forall x,y\in\part B_1,\forall \epsilon>0,\exist\delta>0$，当 $\|(x+y)/2\|>1-\delta$ 时，有 $\|x-y\|<\epsilon$，则称 $\|\cdot\|$ 是匀凸的 unifrom convex，X 为匀凸空间。

> 几何意义：若端点位于单位球面上的咸顿的中点接近于球面时，则其端点必同时相互接近

推论

- 若 $\forall \epsilon\in(0,2),\exist \delta>0$，当 $\|x-y\|\ge \epsilon$ 时，$\|(x+y)/2\|\le 1-\delta$，则 X 匀凸
- 若 $\forall \{x_n\},\{y_n\}\subset \part B_1$，只需 $\lim_\limits{m,n\to\infty}\|(x_m+y_n)/2\|=1$，便有 $\lim_\limits{m,n\to\infty}\|x_m-y_n\|=0$，则 X 匀凸
- 匀凸 => 严格凸
- 内积空间匀凸
- 有限维严格凸赋范线性空间匀凸
- $L_p(1<p<+\infty)$ 是匀凸空间

### 1.2.3 唯一性

**定理 1.4** 严格凸空间 X 内的凸子集 M 是唯一性集

> 证明 [TODO]

**定理 1.5** X 是匀凸的 Banach 空间，$M\subset X$ 是 X 中的闭凸集，则 M 是 T 集

> 证明 [TODO]

