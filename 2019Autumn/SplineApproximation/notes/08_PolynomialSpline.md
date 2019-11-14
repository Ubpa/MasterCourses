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

**推论 8.1** 两种特殊类型的样条空间的维数公式如下：
$$
\operatorname { dim } \mathcal { P } \mathcal { P } _ { m } ( \Delta ) = ( k + 1 ) m , \quad \operatorname { dim } \mathcal { S } _ { m } ( \Delta ) = m + k
$$

---

由 **定理 8.1** 可知，$\left\{\rho_{ij}(x)=(x-x_i)_+^{m-j}\right\}_{i=0,j=1}^{k,m_i}$ 构成空间 $\mathcal{S}$ 的一个基，这里 $x_0=a$，$m_0=m$。但从数值计算的观点来看，这组基并不好，因为它**不具有局部性质**，当 $x$ 靠近右端 $b$ 时，为了计算样条 $s(x)$ 的值，必须计算所有的基函数在 $x$ 的值。

