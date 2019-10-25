# 群

## 群

集合 $G\neq \empty$ 和二元运算 $\cdot:G\times G\mapsto G$ 构成代数结构 $(G,\cdot)$，满足

- 封闭性：$\forall a,b \in G, a\cdot b\in G$ 
- 结合律：$\forall a,b,c \in G,(a\cdot b)\cdot c=a\cdot(b\cdot c)$ 
- 单位元：$\exist e \in G,\forall a \in G,e\cdot a=a\cdot e=a$ 
- 逆元：$\forall a \in G,\exist b \in G, a\cdot b=b\cdot a=e$，称 b 为 a 的逆元，记为 $a^{-1}$ 

则 $(G,\cdot)$ 称为**群** group，只满足封闭性和结合律的称为**半群**，满足封闭性、结合律和单位元的称为**幺半群**。

## 阿贝尔群

群 $(G,\cdot)$ 满足交换律：$\forall a,b \in G,a\cdot b=b\cdot a$，则称该群为阿贝尔群（加法群、交换群）

# 环

集合 $R\neq \empty$，定义了两种运算 $+$ 和 $\times$，满足

- $(R,+)$ 是阿贝尔群

- $(R,\times)$ 是半群

- 分配律：$\forall a,b,c \in R$，有
  $$
  a\times(b+c)=a\times b+a\times c\\
  (a+b)\times c=a\times c+ b\times c
  $$

称 $(R,+,\times)$ 是环 ring，加法的单位元记为 0。

# 域

 集合 $R\neq \empty$，定义了两种运算 $+$ 和 $\times$，满足

- $(R,+,\times)$ 是环
- $(R-0,\times)$ 是阿贝尔群，单位元记为 1

则 $(R,+,\times)$ 是域

# 线性空间

非空集合 V 和 F，运算 $\cdot:F \times V \mapsto V$（称为数乘），$\forall k,l\in F,\alpha, \beta \in V$，满足

- $(V, +)$ 是阿贝尔群
- $(F,+,\cdot)$ 是域
- 单位元：$1\alpha=\alpha$ 
- 结合律：$(kl)\alpha=k(l\alpha)$ 
- 分配律1：$(k+l)\alpha=k\alpha+l\alpha$ 
- 分配律2：$k(\alpha+\beta)=k\alpha + k\beta$ 

> 封闭性：$k\alpha\in V$ 
>
> 上述总共涉及 4 中运算：V 上的加法、F 上的加法和乘法，V 与 F 间的数乘，记号复用了，根据上下文判断即可。

则称 V 为 F 上的一个线性空间（向量空间），V 中元素称为向量，V 的零元称为零向量，F 为线性空间的基域。

# 度量

集合 $X\neq \empty$，映射 $d:X\times X\mapsto R$。$\forall x,y,z \in X$，满足

- 正定性：$d(x,y)\ge 0,d(x,y)=0\Leftrightarrow x=y$ 
- 对称性：$d(x,y)=d(y,x)$ 
- 三角不等式：$d(x,z)\le d(x,y)+d(y,z)$ 

则 d 是 X 得到一个度量（距离），$(X,d)$ 是度量空间。

> 度量空间只要求 X 是一个集合，不要求其为线性空间

# 致密

> [百度文库 | 紧集与有限维赋范线性空间](https://wenku.baidu.com/view/fb5b41dbce2f0066f5332259.html)

设 $(X,\rho)$ 是度量空间，$A\subset X$，若 A 中的任何点列必有在 X 中收敛的子点列，则称 A 是（X 中的）致密集。若 X 自身是致密集，则称 X 是致密空间。

> $\forall \{x_n\},\exist\{x_{n_k}\}$，使得
> $$
> \lim_{k\to \infty}x_{n_k}=x\in X
> $$

# 紧集

度量空间中的致密闭集为紧集 compact set

# 对偶空间

## 定义

设 V 为定义在数域 F 上的向量空间，定义 V 上的线性函数是从 V 到 F 的映射 $f:V\mapsto F$，且 $\forall x,y \in V, \forall k \in F$，有

- $f(x+y) = f(x)+f(y)$ 
- $f(kx)=kf(x)$ 

现考虑 V 上所有线性函数的集合 $V^*$，$\forall f,g \in V^*,\forall x\in V,\forall k \in F$，可以在 $V^*$ 定义如下标量乘法和加法

- $f(kx)=kf(x)$ 
- $(f+g)(x)=f(x)+g(x)$ 

易得 $V^*$ 是域 F 上的向量空间，称为 V 的对偶空间，其中元素称为协向量 covector。

## 对偶范数

$\forall f\in V^*,\|f\|=\sup\{|f(x)|:\|x\|\le 1\}=\sup \left\{\frac{|f(x)|}{\|x\|}:x\neq 0\right\}$ 

# 稠密

如果一个集合与**一个元素属于的任意一个开集**的交集都非空，那么我们称这个集合对于该元素稠密。

如果一个集合是一个空间的子集且对于该空间的任意元素都稠密，那么我们称这个集合在这个空间中稠密。

>  比如有理数集在实数空间中稠密

# 极限点

极限点是点列的收敛子列的极限，a 是 A 中的点列 $\{a_n\}$ 的极限点的充分必要条件是a的任何邻域内有 $\{a_n\}$ 的无穷多项

# 完备集

集合 S 的完备集是 S 的所有极限点的集合

# 切比雪夫多项式

$$
\begin{aligned}
T_0(x)&=1\\
T_1(x)&=\cos\theta=x\\
T_2(x)&=\cos2\theta\\
\dots&\\
T_n(x)&=\cos n\theta
\end{aligned}
$$

## 递推公式

由 $\cos (n+1)\theta=2\cos\theta\cos(n\theta)-\cos(n-1)\theta$ 得
$$
T_{n+1}(x)=2xT_n(x)-T_{n-1}(x)\quad(n\ge1)
$$
则 $T_0(x)=1$，$T_1(x)=x$，$T_2(x)=2x^2-1$，$T_3(x)=4x^3-3x$，$T_4(x)=8x^4-8x^2+1$ 

![image-20191024114926766](assets/image-20191024114926766.jpg)

## 展开式

$$
T_n(x)=2^{n-1}\prod_{i=1}^n(x-\xi_i)
$$

## 正交性

已知
$$
\int_0^\pi\cos(m\theta)\cos(n\theta)\mathbb{d}\theta=0\quad(m\neq n)
$$
则
$$
\begin{aligned}
(T_m,T_n)=&\int_{-1}^1\frac{1}{\sqrt{1-x^2}}T_m(x)T_n(x)\mathbb{d}x\\
\xlongequal{x=\cos\theta}&\int_0^\pi\cos m\theta\cos n\theta \mathbb{d}\theta\\
=& 0
\end{aligned}
$$

则切比雪夫多项式在 $[-1,1]$ 上带权 $\rho(x)=\frac{1}{\sqrt{1-x^2}}$ 正交

## 最值

$$
\|T_n\|_{[-1,1]}=1
$$

最值点为
$$
x_i=\cos\frac{i \pi}{n} (i=0,1,\dots,n)
$$

## 零点

$$
T_n(x)=\cos(n\theta)=\cos (n\arccos x)
$$

取
$$
n\arccos \xi_i=\frac{(2i+1)\pi}{2}\quad(i=0,1,\dots,n-1)
$$
即
$$
\begin{aligned}
\xi_i&=\cos\frac{(2i-1)\pi}{2n}\quad(i=1,\dots,n)\\
&=\cos\frac{\pi}{2n},\cos\frac{3\pi}{2n},\dots,\cos\frac{(2n-1)\pi}{2n}
\end{aligned}
$$

> $x_0>x_1>\dots>x_{n-1}$ 
>
> 在 $[-1,1]$ 上共 n 个零点

## 导数

$$
\begin{aligned}
T_n^\prime(x)&=\frac{n\sin (n\arccos x)}{\sqrt{1-x^2}}
=\frac{n\sin (n\theta)}{\sin\theta}\\
&=2^{n-1}\sum_{i=1}^n\prod_{j=1,j\neq i}^n (t-\xi_j)
=\sum_{i=1}^n\frac{T_n(x)}{(x-\xi_i)}\\
T_n^\prime(\xi_i)&=\frac{(-1)^{i-1}n}{\sqrt{1-\xi_i^2}}
=\prod_{j=1,j\neq i}^n (\xi_i-\xi_j)\\
\end{aligned}
$$

此外
$$
|T^\prime_n(x)|= n \left|\frac{\sin (n\theta)}{\sin\theta}\right|\le n^2
$$
且
$$
T_n^\prime(1)=n\left|\lim_\limits{\theta\to0}\frac{\sin (n\theta)}{\sin\theta}\right|=n^2
$$

## 极性

$T_n(x)$ 的最高次项 $x^n$ 的系数为 $2^{n-1}$，$[-1,1]$ 上与 0 的偏差最小且首项系数为 1 的 n 次多项式是
$$
P_n(x)=\frac{T_n(x)}{2^{n-1}}
$$

> 函数 $f(t)$ 在 $[-1,1]$ 上与 0 的偏差指的是
> $$
> \max_\limits{-1\le t\le1}|f(t)|=\|f\|_{[-1,1]}
> $$
>
> ---
>
> 证明
>
> 记 $[-1,1]$ 上与 0 的偏差最小且首项系数为 1 的 n 次多项式集合为 $\mathcal{P}_n^0$，$C_n=\frac{1}{2^{n-1}}$， $T_n^0=C_n T_n(x)$ 
>
> 由于 $T_n(x)$ 首项系数为 $C_n$，则 $T_n^0 \in \mathcal{P}^0$ 
>
> $\|T_n^0\|_{[1,1]}=C_n$，且 $T_n^0(x)$ 交替最大值 $C_n$ 和最小值 $-C_n$ 共 $n+1$ 次
>
> 若 $\exist p\in \mathcal{P}_n^0$ 满足 $\|p\|_{[-1,1]}<\|T_n^0\|_{[-1,1]}=C_n$，则 $T_n^0-p$ 在 $[-1,1]$ 上正负号交替 $n+1$ 次，则有 n 个零点，但 $T_n^0-p\in \mathcal{P}_{n-1}$ 不能有 n 个零点，矛盾。

# 全纯函数[^holomorphic] 

设 $U\subset \overset{\circ}{C}$ 是开子集且 $f:U\to \overset{\circ}{C}$ 是一个单复变函数，称 $f$ 在 $z_0\in U$ （复）可微（[complex] differentiable）或全纯，如果极限 $f^\prime(z_0)=\lim_\limits{z \to z_0}\frac{f(z)-f(z_0)}{z-z_0}$ 存在。

若 $f$ 在 $U$ 中处处可微，则称 $f$ 在 $U$ 上全纯（holomorphic over $U$）

# 最大模原理[^maxmod] 

$|f|$ 在复分析中，最大模原理说明如果单变量复变函数 $f$ 是一个[全纯函数](#全纯函数[^holomorphic])，那么它的模的局部最大值不可能在其定义域的内部取到。

# 参考

[^holomorphic]: 百度百科. [全纯函数](https://baike.baidu.com/item/%E5%85%A8%E7%BA%AF%E5%87%BD%E6%95%B0).
[^maxmod]: 百度百科. [最大模原理](https://baike.baidu.com/item/%E6%9C%80%E5%A4%A7%E6%A8%A1%E5%8E%9F%E7%90%86).

