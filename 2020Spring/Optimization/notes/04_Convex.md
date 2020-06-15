# 04. 凸优化

> convex optimization

在凸集上最小化凸函数

## 04.1 凸集和凸函数

### 04.1.1 仿射集

一个集合 $C\subseteq \mathbb{R}^n$ 是==仿射== affine 的，要求 $\forall x_1,x_2 \in C$ 且 $\theta \in \mathbb{R}$，都有
$$
\theta x_1+(1-\theta)x_2\in C
$$
可以范化成任意 $k\ge 1$， $x_1,\dots, x_k\in C$ 且 $\theta_1+\dots+\theta_k=1$，有 $\theta_1 x_1+\dots+\theta_k x_k\in C$ 

我们称 $\theta_1 x_1+\dots+\theta_k x_k\in C$（$\theta_1+\dots+\theta_k=1$）为点 $x_1,\dots,x_k$ 的 ==仿射组合== affine combination

若 $x_0\in C$，则
$$
V=C-x_0=\{x-x_0|x\in C\}
$$
是线性空间

集合 $C\subseteq \mathbb{R}^n$ 中点可构成的所有仿射组合的集合叫做 $C$ 的==仿射包== affibe hull，记为 $\operatorname{aff} C$ 
$$
\operatorname{aff} C=\left\{\theta_{1} x_{1}+\ldots+\theta_{k} x_{k} | x_{1}, \ldots, x_{k} \in C, \theta_{1}+\ldots+\theta_{k}=1\right\}
$$
仿射包是包含 $C$ 的最小凸包

### 04.1.2 凸集

![image-20200614205207812](assets/04_Convex/image-20200614205207812.png)

一个集合 $C$ 是==凸== convex的，要求 $\forall x_1,x_2\in C$ 且 $0\le \theta \le 1$，都有
$$
\theta x_1+(1-\theta)x_2 \in C
$$
可以泛化成任意 $k\ge 1$，$x_1,\dots,x_k\in C$ 且 $\theta_1+\dots+\theta_k=1$（$\theta_i\ge 0,i=1,\dots,k$），有 $\theta_1 x_1 +\dots+\theta_k x_k \in C$，其中 $\theta_1 x_1 +\dots+\theta_k x_k$（$\theta_1,\dots,\theta_k\ge 0$ 且 $\sum_{i=1}^k\theta_i=1$）称为 $x_1,\dots,x_k$ 的==凸组合== convex combination

集合 $C$ 中点可构成的所有凸组合的集合叫做 $C$ 的==凸包== convex hull，记为 $\operatorname{conv} C$ 
$$
\operatorname{conv} C=\left\{\theta_{1} x_{1}+\ldots+\theta_{k} x_{k} | x_{i} \in C, \theta_{i} \geqslant 0, i=1, \ldots, k, \theta_{1}+\ldots+\theta_{k}=1\right\}
$$

### 04.1.3 锥

![image-20200614205842109](assets/04_Convex/image-20200614205842109.png)

一个集合 $C$ 称为==锥== cone，要求 $\forall x \in C$ 且 $\theta\ge 0$，都有 $\theta x\in C$ 

一个集合 $C$ 称为==凸锥== convex cone，要求它是凸的且是一个锥，即 $\forall x_1,x_2\in C$ 且 $\theta_1,\theta_2 \ge 0$，都有 $\theta_1 x_1+\theta_2 x_2 \in C$ 

$\theta_1x_1+\dots+\theta_k x_k$（$\theta_1,\dots,\theta_k\ge 0$）称为 $x_1,\dots,x_k$ 的==锥组合== conic combination

集合 $C$ 中点可构成的所有锥组合的集合叫做 $C$ 的==锥包== conic hull
$$
\left\{\theta_{1} x_{1}+\ldots+\theta_{k} x_{k} | x_{i} \in C, \theta_{i} \geqslant 0, i=1, \ldots, k\right\}
$$

### 04.1.4 示例

**超平面** hyperplane
$$
\{x|a^\top x = b\}
$$
仿射

**半空间** halfspace
$$
\{x|a^\top x\le b\}
$$
**多面体** polyhedra
$$
\mathcal{P}=\left\{x | a_{j}^{\top} x \leq b_{j}, j=1, \ldots, m, c_{k}^{\top} x=d_{k}, k=1, \ldots, p\right\}
$$
**球** ball
$$
B(x_c,r)=\{x|\|x-x_c\|_2\le r\}
$$
其中 $r>0$，且 $\|u\|_2=\sqrt{u^\top u}$ 

**范数球** norm ball
$$
\{x|\|x-x_c\|\le r\}
$$
其中 $\|\cdot\|$ 是 $\mathbb{R}^n$ 上的范数

**范数锥** norm cone
$$
\{(x,t)|\|x\|\le t\}\subseteq \mathbb{R}^{n+1}
$$
![img](assets/04_Convex/v2-b37403be7c2793739fa488f6733cf6be_720w.jpg)

**半正定锥** positive semidefinite cone

==对称== symmetric矩阵
$$
S^n=\{X\in \mathbb{R}^{n\times n}|X=X^\top\}
$$
==对称半正定== semidefinite 矩阵
$$
S^n_+=\{X\in S^n|X\succeq 0\}
$$
==对称正定== definite 矩阵
$$
S^n_{++}=\{X\in S^n|X\succ 0\}
$$
$S^n$，$S^n_+$ 和 $S^n_{++}$ 都是凸的

### 4.1.5 真锥和泛化不等性

一个锥 $K\subseteq \mathbb{R}^n$ 称为真锥 proper cone 要求满足

- $K$ 是凸的

- $K$ 是闭的

- $K$ 是固体 solid（内部非空 nonempty interior）

- $K$ is pointed（不含线 line）
  $$
  x\in K,-x\in K \Rightarrow x=0
  $$

真锥 $K$ 可用于定义泛化的不等性
$$
x\preceq_K y \Leftrightarrow y-x\in K
$$
这是 $\mathbb{R}^n$ 上的==偏序== partial ordering 关系

类似地，相关的==严格偏序== strict partial ordering 为
$$
x\prec_K y\Leftrightarrow y-x\in \operatorname{int} K
$$
$x\in S$ 称为 $S$ 的==最小值== minimum element（相对于 $\preceq _K$）要求 $\forall y\in S$ 都有 $x\preceq_K y$，如 $S\subseteq x+K$ 

$x\in S$ 称为 $S$ 的==极小值== minimal element（相对于 $\preceq _K$）要求 $y\in S, y\preceq _K x \Rightarrow y = x$，如 $(x-K)\cap S = \{x\}$ 

> **示例** 
>
> ![image-20200614213811797](assets/04_Convex/image-20200614213811797.png)

最小值一定是极小值

### 4.1.6 凸函数

一个函数 $f:\mathbb{R}^n\to \mathbb{R}$ 是==凸== convex 函数，要求 $\operatorname{dom} f$ 是凸集且 $\forall x,y\in \operatorname{dom}f,\theta\in [0,1]$ 都有
$$
f(\theta x+(1-\theta) y) \leqslant \theta f(x)+(1-\theta) f(y)
$$
一个函数是==严格凸== strictly convex 函数，要求 $\forall x,y\in \operatorname{dom}f,x\neq y,\theta\in (0,1)$ 都有
$$
f(\theta x+(1-\theta) y) < \theta f(x)+(1-\theta) f(y)
$$
一个函数 $f$ 称为==凹== concave 函数，要求 $-f$ 是凸函数；称为严格凹 strictly convex 函数，要求 $-f$ 是严格凸函数

> **示例** 
>
> ![image-20200614214827679](assets/04_Convex/image-20200614214827679.png)

假设 $f$ 可微，则凸函数条件变为 $\forall x,y \in \operatorname{dom} f$ 都有
$$
f(y)\ge f(x)+{\nabla f(x)}^\top(y-x)
$$
假设 $f$ 二阶可微，则凸函数条件变为 $\forall x\in \operatorname{dom} f$ 都有
$$
\nabla^2 f(x)\succeq 0
$$

> **示例** 
>
> - $e^{ax}$ 是凸函数
> - $x^a$：当 $a\ge 1$ 或 $a\le 0$ 是凸函数，当 $0\le a\le 1$ 时是凹函数
> - $|x|^p$：当 $p\ge 1$ 时是凸函数
> - $\log x$ 是凸函数
> - $x\log x$ 是凸函数
> - 范数是凸函数
> - $f(x)=\max\{x_1,\dots,x_n\}$ 是凸函数
> - $f(x)=\log(e^{x_1}+\dots+e^{x_n})$ 是凸函数，满足 $\max\{x_1,\dots,x_n\}\le f(x)\le \max\{x_1,\dots,x_n\}+\log n$ 
> - $f(x)=(\prod_{i=1}^n x_i)^{1/n}$ 是凸函数
> - $f(X)=\log \det X$ 是凸函数
> - $f_1,\dots,f_m$ 是凸函数且 $w_1,\dots,w_m\ge 0$，则 $f=w_1f_1+\dots+w_mf_m$ 是凸函数
> - 若 $\forall y\in \mathcal{A}$，$f(x,y)$ 对于 $x$ 是凸的，且 $w(y)\ge 0$，则 $g(x)=\int_{\mathcal{A}} w(y)f(x,y)\mathrm{d}y$ 是凸函数
> - 若 $f:\mathbb{R}^n\to \mathbb{R}$，$A\in \mathbb{R}^{n\times m}$，其 $b\in \mathbb{R}^n$，则 $g(x)=f(Ax+b)$ 是凸函数
> - 若 $f_1,f_2$ 是凸函数，则 $f(x)=\max\{f_1(x),f_2(x)\}$ 是凸函数
> - 若 $\forall y\in \mathcal{A}$，$f(x,y)$ 对于 $x$ 是凸的，则 $g(x)=\sup_\limits{y\in\mathcal{A}} f(x,y)$ 是凸的
> - 伪凸 quasi-convex：水平集 $S_\alpha=\{x\in\operatorname{dom} f | f(x)\le \alpha\}$ 内 $f$ 是凸的，则称 $f$ 是伪凸函数
> - 对数凹 log-concave 函数：$f(x)>0$ 且 $\log f$ 是凹函数，则称 $f$ 是对数凹函数

