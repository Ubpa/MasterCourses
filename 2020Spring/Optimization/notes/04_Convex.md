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

## 04.2 凸优化算法

**基本术语** 
$$
\begin{array}{ll}
\min & f_{0}(x) \\
\text { s.t. } & f_{i}(x) \leqslant 0, \quad i=1, \ldots, m \\
& h_{j}(x)=0, \quad j=1, \ldots, p
\end{array}
$$
其中

- $x\in \mathbb{R}^n$ 为优化变量
- $f_0:\mathbb{R}^n\to \mathbb{R}$ 为目标函数
- $f_i(x)\le 0$ 是不等式约束
- $f_i:\mathbb{R}^n\to \mathbb{R}$ 是不等式约束函数
- $h_j(x)= 0$ 是不等式约束
- $h_j:\mathbb{R}^n\to \mathbb{R}$ 是不等式约束函数

定义域为 $\mathcal{D}=\bigcap_{i=0}^m\operatorname{dom}f_i\cap\bigcap_{j=1}^p\operatorname{dom}h_j$ 

可行解集为 $X=\{x|f_i(x)\le 0,i=1,\dots,m,h_j(x)=0,j=1,\dots,p\}$ 

最优值 $v^*=\inf\{f_0(x)|f_i(x)\le 0,i=1,\dots,m,h_j(x)=0,j=1,\dots,p\}$ 

若问题无解，则 $v^*=\infty$ 

一个解 $x$ 是局部最优的，要求 $\exist \delta >0$ 满足
$$
f_0(x)=\inf\{f_0(z)|f_i(z)\le 0,i=1,\dots,m,h_j(z)=0,j=1,\dots,p,\|z-x\|_2\le \delta \}
$$
**凸优化问题** 
$$
\begin{array}{ll}
\min & f_{0}(x) \\
\text { s.t. } & f_{i}(x) \leqslant 0, \quad i=1, \ldots, m \\
& a_j^\top x=b_j, \quad j=1, \ldots, p
\end{array}
$$


其中 $f_0,f_1,\dots,f_m$ 是凸函数

任意局部最优解是全局最优解

假设 $f_0$ 是可微的，则 $x$ 是最优解 $\Leftrightarrow$ $x\in X$ 且 ${\nabla f_0(x)}^\top(y-x)\ge 0, \forall y \in X$ 

对于无约束问题，则条件简化为 $\nabla f_0(x)=0$ 

**仅等式约束** 
$$
\begin{array}{ll}
\min & f_{0}(x) \\
\text { s.t. } & Ax=b
\end{array}
$$
最优条件为
$$
{\nabla f_0(x)}^\top u \ge 0 \quad \forall u \in \mathcal{N}(A)
$$
即 $\nabla f_0(x)\perp \mathcal{N}(A)$，其中 $\mathcal{N}(A) = \{u|Au = 0\}$ 为 $A$ 的零空间

**线性规划问题** 

> linear program (LP)

$$
\begin{array}{ll}
\min & q^\top x + r \\
\text { s.t. } & Gx\le h\\
&Ax=b
\end{array}
$$

一般 $r$ 可忽略

**二次规划问题** 

> quadratic program (QP)

$$
\begin{array}{ll}
\min & \frac{1}{2}x^\top P x+ q^\top x + r \\
\text { s.t. } & Gx\le h\\
&Ax=b
\end{array}
$$

其中 $P\in S^n_+$，$G\in \mathbb{R}^{m\times n}$ 且 $A\in \mathbb{R}^{p\times n}$ 

线性规划是特殊的二次规划（取 $P=0$）

**二次约束二次规划问题** 

> quadratically constrained quadratic program (QCQP)

$$
\begin{array}{l}
\min &\frac{1}{2} x^{\top} P_{0} x+q_{0}^{\top} x+r_{0} \\
\text { s.t. } &\frac{1}{2} x^{\top} P_{i} x+q_{i}^{\top} x+r_{i} \leqslant 0, \quad i=1, \ldots, m \\
 &A x=b
\end{array}
$$

其中 $P_i\in S^n_+,i=0,\dots,m$ 

QP 是特殊的 QCQP（取 $P_i=0,i=1,\dots,m$）

**二阶锥规划问题** 

> second-order cone program (SOCP)

$$
\begin{array}{l}
\min & f^{\top} x\\
\text { s.t. } & \left\|L_{i} x+g_{i}\right\|_{2} \leqslant c_{i}^{\top} x+d_{i}, \quad i=1, \ldots, m\\
&A x=b
\end{array}
$$

QCQP 是特殊的 SOCP

> 引入新变量 $y$，满足 $\frac{1}{2} x^{\top} P_{0} x+q_{0}^{\top} x+r_{0}\le y$，则 QCQP 变为
> $$
> \begin{array}{l}
> \min_{x,y} & y \\
> \text { s.t. } &\frac{1}{2} x^{\top} P_{i} x+q_{i}^{\top} x+r_{i} \leqslant 0, \quad i=1, \ldots, m \\
> & \frac{1}{2} x^{\top} P_{0} x+q_{0}^{\top} x - y + r_{0}\le 0\\
>  &A x=b
> \end{array}
> $$
> 目标函数是线性的
>
> 对于一个二次约束
> $$
> \frac{1}{2}x^\top P x+q^\top x+r\le 0
> $$
> 其中 $P\in S^n_+$，令 $L\in S^n_+$ 为 $P$ 的平方根（$LL=P$），令
> $$
> \tilde{L}=\left[\begin{array}{c}
> L \\
> q^{\top}
> \end{array}\right], \quad \tilde{g}=\left[\begin{array}{c}
> 0 \\
> \vdots \\
> 0 \\
> r+\frac{1}{2}
> \end{array}\right] \in \mathbb{R}^{n+1}
> $$
> 则
> $$
> \|\tilde{L} x+\tilde{g}\|_{2} \leqslant-\left(q^{\top} x+r-\frac{1}{2}\right)
> $$

**拉格朗日** 

考虑标准形式的优化问题
$$
\begin{array}{ll}
\min & f_{0}(x) \\
\text { s.t. } & f_{i}(x) \leqslant 0, \quad i=1, \ldots, m \\
& h_{j}(x)=0, \quad j=1, \ldots, p
\end{array}
$$
拉格朗日对偶的基本思想是将约束通过加权求和的形式放进目标函数中

定义拉格朗日函数 $L:\mathbb{R}^n\times \mathbb{R}^m\times \mathbb{R}^p\to \mathbb{R}$ 为
$$
L(x, \lambda, \nu)=f_{0}(x)+\sum_{i=1}^{m} \lambda_{i} f_{i}(x)+\sum_{j=1}^{p} \nu_{j} h_{j}(x)
$$
其中 $\operatorname{dom}L=\mathcal{D}\times\mathbb{R}^m\times\mathbb{R}^p$，$\lambda_i$ 是 $f_i(x)$ 的==拉格朗日乘子== Lagrange multiplier，$\nu_j$ 是 $h_j(x)$ 的拉格朗日乘子

$\lambda$ 和 $\nu$ 称为原问题的==拉格朗日乘子向量== Lagrange multiplier vector 或者==对偶变量== dual variable

定义==拉格朗日对偶函数== Lagrange dual function（或简称为==对偶函数== dual function） $g:\mathbb{R}^m\times\mathbb{R}^p\to \mathbb{R}$ 为
$$
g(\lambda, \nu)=\inf _{x \in \mathcal{D}} L(x, \lambda, \nu)=\inf _{x \in \mathcal{D}}\left(f_{0}(x)+\sum_{i=1}^{m} \lambda_{i} f_{i}(x)+\sum_{j=1}^{p} \nu_{j} h_{j}(x)\right)
$$
是凹函数

显然，当 $\lambda \ge 0$ 时，有 $g(\lambda,\nu) \le v^*$，即对偶函数给出了 $v^*$ 的下界

我们称 $(\lambda, \nu)$（$\lambda \ge 0$，$(\lambda,\nu)\in\operatorname{dom}g$）为==对偶可行== dual feasible

引入示性函数
$$
I_{-}(u)=\left\{\begin{array}{ll}
0 & u \leqslant 0 \\
\infty & u>0
\end{array}, \quad I_{0}(u)=\left\{\begin{array}{ll}
0 & u=0 \\
\infty & u \neq 0
\end{array}\right.\right.
$$
则原问题可等价为
$$
\min \quad f_{0}(x)+\sum_{i=1}^{m} I_{-}\left(f_{i}(x)\right)+\sum_{j=1}^{p} I_{0}\left(h_{j}(x)\right)
$$
用 $\lambda_i u$ 替换 $I_-(u)$，$\nu_j u$ 替换 $I_0(u)$，则目标函数变为拉格朗日函数，问题变为
$$
\min L(x, \lambda, \nu)=f_{0}(x)+\sum_{i=1}^{m} \lambda_{i} f_{i}(x)+\sum_{j=1}^{p} \nu_{j} h_{j}(x)
$$
上式中，我们用线性 / "soft" displeasure 函数替代了 $I_-$ 和 $I_0$，为==下估计== underestimator，故显然可知对偶函数给出了 $v^*$ 的下界

为了得到“最好”的下界，引出问题
$$
\begin{array}{c}
\max & g(\lambda, \nu)\\
\text{s.t.} & \lambda \ge 0
\end{array}
$$
该问题称为==原问题== primal problem 的==拉格朗日对偶问题== Lagrange dual problem

