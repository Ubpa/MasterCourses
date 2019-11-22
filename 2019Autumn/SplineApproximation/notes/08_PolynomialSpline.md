# 8. 多项式样条的基本空间

## 8.1 定义、维数和基函数

设 $[a,b]$ 是有限的闭区间，分割
$$
\Delta\triangleq\{x_i\}_{i=1}^k,\quad a=x_0<x_1<\dots<x_{k}<x_{k+1}=b
$$
把区间 $[a,b]$ 分成 $k+1$ 个小区间 $I_i\triangleq [x_i,x_{i+1})\ (i=0,1,\dots,k-1)$ 和 $I_k\triangleq[x_k,x_{k+1}]$。又设 $\mathfrak{M}\triangleq (m_1,\dots,m_k)$ 是一个矢量，其中 $m_i$ 为满足 $1\le m_i \le m$ 的正整数

![image-20191114162930390](assets/image-20191114162930390.jpg)

**定义 8.1** 称空间
$$
\begin{aligned}
\mathcal { S } \left( \mathcal { P } _ { m } , \mathfrak { M } , \Delta \right) \triangleq \{ & s : s ( x ) = s _ { i } ( x ) \in \mathcal { P } _ { m } , x \in I _ { i } ( i = 0,1 , \cdots , k ) , D ^ { j } s _ { i - 1 } \left( x _ { i } \right) \\
&= D ^ { j } s _ { i } \left( x _ { i } \right) \left( i = 1,2 , \cdots , k ; j = 0,1 , \cdots , m - 1 - m _ { i } \right)\}
\end{aligned}
$$
为 $m$ 阶的、**重度向量**为 $\mathfrak{M}$ 的、以 $x_1,\dots,x_k$ 为节点的多项式样条空间

> 空间 $\mathcal{S}$ 中的元素 $s(x)$ 是具有一定光滑性的分片 $m$ 阶多项式（$k+1$ 片，每片是 $m$ 阶多项式，次数为 $m-1$）。$s(x)$ 在每个节点处的光滑性是由重度向量 $\mathfrak{M}$ 来决定的，$s(x)$ 在 $x_i$ 处是 $C^{m-1-m_i}$ 连续的
>
> > 当 $m_i=m$ 时，$s(x)$ 在 $x_i$ 处是 $C^{-1}$ 连续的，说明在这点可能有一个跳跃
> >
> > $m_i$ 越大说明 $x_i$ 处的连续性要求越低，越不连续，自由度越大

若 $\mathfrak{M}=(m,\dots,m)$，则空间 $\mathcal{S}=\mathcal{P}\mathcal{P}_m(\Delta)$ 是 $m$ 阶分片多项式空间，这是光滑性最差的样条空间。若 $\mathfrak{M}=(1,\dots,1)$，则 $\mathcal{S}=\mathcal{S}_m(\Delta)$，即为 $m$ 阶的单节点的多项式样条空间，$S_m(\Delta)\subset C^{m-1}[a,b]$ 

**定理 8.1** 

(1) 对任意 $s(x)\in \mathcal{S}(\mathcal{P}_m,\mathfrak{M},\Delta)$，必存在 $p(x)\in \mathcal{P}_m$，和实数 $\{\alpha_{ij}\}_{i,j=1}^{k,m_i}$ 使得
$$
s ( x ) = p ( x ) + \sum _ { i = 1 } ^ { k } \sum _ { j = 1 } ^ { m _ { i } } \alpha _ { i j } \left( x - x _ { i } \right) _ { + } ^ { m - j }
$$
其中
$$
x _ { + } ^ { 0 } \triangleq \left\{ \begin{array} { l l } { 1 } & { x \geqslant 0 , \quad x _ { + } ^ { j } = x ^ { j } \cdot x _ { + } ^ { 0 } } \\ { 0 } & { x < 0 } \end{array} \right.
$$
为**截断幂函数** 

(2) 空间 $\mathcal{S}$ 的维数为
$$
\dim(\mathcal{S})=m+K
$$
其中 $K=\sum_{i=1}^k m_i$ 

> $m_i$ 越大自由度越大

**推论 8.1** 两种特殊类型的样条空间的维数公式如下：
$$
\operatorname { dim } \mathcal { P } \mathcal { P } _ { m } ( \Delta ) = ( k + 1 ) m , \quad \operatorname { dim } \mathcal { S } _ { m } ( \Delta ) = m + k
$$

---

由 **定理 8.1** 可知，$\left\{\rho_{ij}(x)=(x-x_i)_+^{m-j}\right\}_{i=0,j=1}^{k,m_i}$ 构成空间 $\mathcal{S}$ 的一个基，这里 $x_0=a$，$m_0=m$。但从数值计算的观点来看，这组基并不好，因为它**不具有局部性质**，当 $x$ 靠近右端 $b$ 时，为了计算样条 $s(x)$ 的值，必须计算所有的基函数在 $x$ 的值。

## 8.2 局部基的构造

**引理 8.1** 设给定 $\overbrace{\tau_1,\dots,\tau_1}^{l_1}<\dots<\overbrace{\tau_d,\dots,\tau_d}^{l_d},1\le l_i\le m\ (i=1,\dots,d)$ 

(1) 如果 $\sum_{i=1}^d l_i >m$，则存在不全为零的 $\{\alpha_{ij}\}_{i=1,j=1}^{d,l_i}$，使得
$$
B(x)=\sum_{i=1}^d\sum_{j=1}^{l_i}\alpha_{ij}\frac{(x-\tau_i)_+^{m-j}}{(m-j)!}
$$
对于 $x<\tau_1$ 和 $x>\tau_d$，有 $B(x)=0$ 

(2) 如果 $\sum_{i=1}^d l_i\le m$，那么没有这样的非平凡的 $B(x)$ 存在

> 用 $\{(x-\tau_i)_+^{m-j}\}_{i=1,j=1}^{d,l_i}$ 构造一个局部基 $B(x)$（$x<\tau_1$ 或 $x>\tau_d$ 时 $B(x)=0$），要求 $\sum_{i=1}^d l_i > m$ 
>
> ---
>
> **证明** 
>
> (1)
>
> 对于任意 $\alpha_{ij}$，当 $x<\tau_1$ 时，$B(x)=0$；当 $x>\tau_d$ 时，$B(x)=0$ 要求
> $$
> \begin{aligned}
> B ( x ) & = \sum _ { i = 1 } ^ { d } \sum _ { j = 1 } ^ { l _ { i } } \alpha _ { i j } \frac { \left( x - \tau _ { i } \right) ^ { m - j } } { ( m - j ) ! } \\
> & = \sum _ { i = 1 } ^ { d } \sum _ { j = 1 } ^ { l _ { i } } \alpha _ { i j } \sum _ { \nu = 0 } ^ { m - j } \frac { x ^ { \nu } } { \nu ! } \frac { \left( - \tau _ { i } \right) ^ { m - j - \nu } } { ( m - j - \nu ) ! }\\
> & = \sum _ { i = 1 } ^ { d } \sum _ { j = 1 } ^ { l _ { i } } \alpha _ { i j } \sum _ { \nu = 0 } ^ { m - 1 } \frac { x ^ { \nu } } { \nu ! } \gamma_{ijv}\\
> & = \sum _ { \nu = 0 } ^ { m - 1 } \frac { x ^ { \nu } } { \nu ! } \sum _ { i = 1 } ^ { d } \sum _ { j = 1 } ^ { l _ { i } } \alpha _ { i j }\gamma_{ijv}\\
> & = 0
> \end{aligned}
> $$
> 其中
> $$
> \gamma _ { i j \nu } \triangleq \left\{ \begin{array} { l l } { \frac { \left( - \tau _ { i } \right) ^ { m - j - \nu } } { ( m - j - \nu ) ! } } & { \nu = 0,1 , \cdots , m - j } \\ { 0 } & { \nu = m - j + 1 , \cdots , m - 1 } \end{array} \right.
> $$
> 由于 $\{x^{i}\}_{i=0}^{m-1}$ 线性无关，则
> $$
> \sum _ { i = 1 } ^ { d } \sum _ { j = 1 } ^ { l _ { i } } \alpha _ { i j }\gamma_{ijv}=0\quad(\nu=0,\dots,m-1)
> $$
> 上边是 $m$ 个方程，$\sum_{i=1}^dl_i$ 个未知数的齐次方程组，因而如果 $\sum_{i=1}^d l_i > m$，方程组一定有非零解

当 $\sum_{i=1}^d l_i=m+1$ 时，由 **引理 8.1** 知局部基存在，其形式为
$$
B(x)=C[t_1,\dots,t_{m+1}](x-\cdot)_+^{m-1}
$$
为构造空间 $\mathcal{S}(\mathcal{P},\mathfrak{M},\Delta)$ 的具有局部支集的基，应该考虑截断幂函数在节点的 $m$ 阶差商

> $m$ 阶差商定义
> $$
> f[x_0,\dots,x_k]=\sum_{i=0}^k\frac{f(x_i)}{\omega_{k+1}^\prime(x_i)}
> $$
> 其中 $\omega_{k+1}^\prime(x_i)=\prod_\limits{j=0\\j\neq i}^k(x_i-x_j)$ 

