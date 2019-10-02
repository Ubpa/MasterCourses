# 2. 一致逼近

$I$ 是一个紧的距离空间，$X=C(I)$ 表示定义在 $I$ 上的连续函数的全体，范数定义为
$$
\|f\|\triangleq\|f\|_\infty\triangleq\sup_\limits{t\in I}|f(t)|
$$

> $\|\cdot\|_\infty$ 是一致范数，$\|f-g\|=\sup_\limits{t\in I}|f(t)-g(t)|$，差值的上确界

## 2.1 Weierstrass-Stone 定理

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

**推论 2.1** $I^n \subset R^n$ 为有界闭集，$\mathcal{P}(I^n)$ 是 n 个变元 $t_1,t_2,\dots,t_n$ 的多项式的全体，则 $\overline{P}(I^n)=C(I^n)$ 

**推论 2.2** $I=[a,b]$，$\varphi(t)$ 是 $[a,b]$ 上的严格单调连续函数，若 $M(I)$ 为包含 $1$，$\varphi(t)$ 的子代数，则 $\overline{M}(I)=C(I)$ 

