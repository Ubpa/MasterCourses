# 2. 一致逼近

> 第一章讲了逼近问题，第二章将逼近问题初步具体为函数的逼近问题（因为范数是一致范数，所以也叫一致逼近问题）

$I$ 是一个紧的距离空间，$X=C(I)$ 表示定义在 $I$ 上的连续函数的全体，范数定义为
$$
\|f\|\triangleq\|f\|_\infty\triangleq\sup_\limits{t\in I}|f(t)|
$$

> $\|\cdot\|_\infty$ 是一致范数，$\|f-g\|=\sup_\limits{t\in I}|f(t)-g(t)|$，差值的上确界

## 2.1 Weierstrass-Stone 定理

> 问题：子代数 $\overline{M}(I)=C(I)$？
>
> 多项式全体 $\mathcal{P}$ 在 $C[a,b]$ 中是稠密的
>
> 如何判断一个子代数是稠密的？

**Weierstrass 定理** $\forall f\in C[a,b],\forall \epsilon > 0, \exist p \in \mathcal{P}, \|f-p\| < \epsilon$  

> $f(t)\in C[a,b]$ 当且仅当 $f(t)$ 可表示为在 $[a,b]$ 上一致收敛的函数项级数，其各项都是多项式
>
> 连续函数可以用多项式函数级数表示

**代数** 就是一个线性空间，其上定义了乘法 $(f\cdot g)(t)\triangleq f(t)\cdot g(t)$，且 $\forall f,g,h\in C(I),\forall \alpha \in \mathbb{R}$，满足

- 左分配律：$f\cdot(g+h)=f\cdot g+f\cdot h$ 
- 右分配律：$(f+g)\cdot h=f\cdot h + g\cdot h$ 
- 结合律：$f\cdot (g \cdot h) = (f\cdot g)\cdot h$ 
- 数乘：$\alpha(f\cdot g)=(\alpha f)\cdot g = f \cdot (\alpha g)$ 

多项式全体 $\mathcal{P}$ 构成一个**子代数**。Weierstrass 定理说的就是，$\mathcal{P}$ 按一致范数在 $C[a,b]$ 中是稠密的，即
$$
\overline{\mathcal{P}}=C[a,b]
$$

> P 本身不是完备的，可以逼近任意闭区间上连续函数，$\exist f\in C[a,b],f\notin \mathcal{P},f\in \overline{\mathcal{P}} \backslash P$ 

---

> M. H. Stone: $C[a,b]$ 中子代数具备什么性质能保证其在 $C[a,b]$ 中稠密呢？

**定理 2.1** （Weierstrass-Stone 定理）$M(I)\subset C(I)$ 是 $C(I)$ 中子代数，若

- $1 \in M$ 
- M 分离 $I$ 中的点，即 $\forall t,s\in I,t\neq s,\exist f\in M(I),f(t)\neq f(s)$ 

则 $\overline{M}(I)=C(I)$ 

> $f = 1 \Leftrightarrow f(x)=1$ 
>
> Wererstrass 定理是 Weierstrass-Stone 的特例

**推论 2.1** $I^n \subset R^n$ 为有界闭集，$\mathcal{P}(I^n)$ 是 n 个变元 $t_1,t_2,\dots,t_n$ 的多项式的全体，则 $\overline{P}(I^n)=C(I^n)$ 

**推论 2.2** $I=[a,b]$，$\varphi(t)$ 是 $[a,b]$ 上的严格单调连续函数，若 $M(I)$ 为包含 $1$，$\varphi(t)$ 的子代数，则 $\overline{M}(I)=C(I)$ 

## 2.2 正线性算子理论

> 如何找在稠密的子代数中找一个函数来逼近所需函数？
>
> 即寻找一个算子 $L:C(I) \mapsto M(I)$，用 $Lf$ 来逼近 $f$ 
>
> 对于 $f \notin M(I)$，则需要通过算子序列 $L_n$ 来逼近 $f$，即 $\lim_\limits{n\to\infty} L_nf=f$ 
>
> 怎样的算子序列呢？正线性算子理论给出了答案
>
> Bernstein 算子是特例，一般的算子只要满足 Bohman-Lorovkin 定理即可，具体地可从其推论（$f(t)=1,t,t^2$）入手

**Bernstein**（Weierstrass 定理构造性证明）设
$$
B_n(f;x)\triangleq\sum_{i=0}^n f\left(\frac{i}{n}\right)C_n^i x^i(1-x)^{n-i}
$$
为 $[0,1]$ 上与函数 $f$ 相联系的 n 次 Bernstein 多项式，可证 $\forall f\in C[0,1]$，有
$$
\lim_\limits{n\to\infty}\ B_nf = f
$$

> $\lim_\limits{n\to\infty}L_nf=f$ 即为 $\lim_\limits{n\to\infty}\|L_nf-f\|=0$

---

在空间 $X=C(I)$ 中，元素 $f\ge 0$ 是指 $\forall t \in I,f(t)\ge 0$，称 $f$ 为 X 的正元素

**定义 2.1** 设 $L:X\mapsto X$，若 $\forall f \ge 0,Lf\ge 0$，则称 L 为正算子，若 $L$ 又是线性算子，则称 $L$ 为正线性算子

**定理 2.2**（Bohman-Korovkin 定理）设函数 $\{f_i\}_{i=1}^m\subset C(I)$，$\exist a_i(s)\in C(I),i=1,2,\dots,m$ 使得
$$
P_s(t)=\sum_{i=1}^m a_i(s)f_i(t)\ge 0
$$
当且仅当 $t=s$ 时等号成立

设 $L_n$ 是从 $C(I)$ 到 $C(I)$ 的正线性算子序列，且满足
$$
\lim_\limits{n\to\infty}L_nf_i=f_i,i=1,2,\dots,m
$$
则 $\forall f \in C(I), \lim_\limits{n\to\infty}L_nf=f$ 

**推论 2.3** $L_n$ 是定义在 $C[a,b]$ 上的正线性算子序列，下列命题等价

- $\forall f\in C[a,b]$，有
  $$
  \lim_\limits{n\to\infty}L_nf=f
  $$

- 当 $f(t)=1,t,t^2$ 时，有
  $$
  \lim_\limits{n\to\infty} L_nf=f
  $$

- $$
  \lim_\limits{n\to\infty}L_n 1= 1
  $$

  且对 $s\in [a,b]$
  $$
  \lim_\limits{n\to\infty} L_n(P_s,s)=0
  $$
  其中 $P_s(t)=(s-t)^2$ 

**推论 2.4** Bernstein 算子
$$
B_n(f,t)\triangleq\sum_{i=1}^nf\left(\frac{i}{n}\right)B_i^n(t)
$$
其中 $B_i^n(t)=C_n^it^i(1-t)^{n-i}$，则 $\forall f\in C[0,1]$，有
$$
\lim_\limits{n\to\infty} B_nf=f
$$
