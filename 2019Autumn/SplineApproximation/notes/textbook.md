# 1. 赋范线性空间中的逼近问题引论

> 线性空间 [TODO]
>
> 赋范 [TODO]

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

> [TODO]
>
> 任意序列都有收敛子列的空间称为列紧空间
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

