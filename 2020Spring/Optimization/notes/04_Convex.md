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

### 04.2.1 理论

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

拉格朗日对偶问题的最优解称为==对偶最优解== dual optimal 或==最优拉格朗日乘子== optimal Lagrange multiplier，记为 $(\lambda^*,\nu^*)$ 

拉格朗日对偶问题是凸优化问题（无论原问题是否为凸）

记拉格朗日对偶问题最优值为 $g^*$，有
$$
g^* \le v^*
$$
该性质称为==弱对偶性== weak duality

$v^*-g^*$ 称为原问题的==最优对偶间隙== optimal duality gap

若 $g^*=v^*$，则称有==强对偶性== strong duality

对于凸优化问题，还需要额外条件才能有强对偶性。一个简单的条件是 Slater 条件：
$$
\exist x\in \operatorname{relint}\mathcal{D},f_i(x)<0,i=1,\dots,m,Ax=b
$$
其中 $\operatorname{relint}\mathcal{D}=\{x\in \mathcal{D}|\exist r>0,B(x,r)\cap \operatorname{aff}\mathcal{D}\subseteq \mathcal{D}\}$，这样的 $x$ 称为==严格可行== strictly feasible

如果 $x$ 是可行的且 $(\lambda,\nu)$ 是对偶可行的，则
$$
f_0(x)-\nu^*\le f_0(x)-g(\lambda,\nu)
$$
故
$$
g(\lambda,\nu)=f_0(x)\Rightarrow v^*=f_0(x)=g(\lambda,\nu)=g^*
$$
称 $f_0(x)-g(\lambda,\nu)$ 为==对偶间隙== duality gap

当满足强对偶性时，有
$$
\begin{aligned}
f_{0}\left(x^{*}\right) &=g\left(\lambda^{*}, \nu^{*}\right) \\
&=\inf _{x}\left(f_{0}(x)+\sum_{i=1}^{m} \lambda_{i}^{*} f_{i}(x)+\sum_{j=1}^{p} \nu_{j}^{*} h_{j}(x)\right) \\
& \leqslant f_{0}\left(x^{*}\right)+\sum_{i=1}^{m} \lambda_{i}^{*} f_{i}\left(x^{*}\right)+\sum_{j=1}^{p} \nu_{j}^{*} h_{j}\left(x^{*}\right) \\
& \leqslant f_{0}\left(x^{*}\right)
\end{aligned}
$$
故
$$
\lambda_i^*f_i(x^*)=0\quad i=1,\dots,m
$$
该条件称为==互补松弛性== complementary slackness

> 等价于
> $$
> \lambda_i^*>0\Rightarrow f_i(x^*)=0\\
> f_i(x^*)<0\Rightarrow \lambda^*_i=0
> $$

假设 $f_0,f_1,\dots,f_m,h_1,\dots,h_p$ 是可微的，由于 $x^*$ 最小化 $L(x,\lambda^*,\nu^*)$，故有
$$
\nabla f_{0}\left(x^{*}\right)+\sum_{i=1}^{m} \lambda_{i}^{*} \nabla f_{i}\left(x^{*}\right)+\sum_{j=1}^{p} \nu_{j}^{*} \nabla h_{j}\left(x^{*}\right)=0
$$
综上，我们有强对偶性的一个必要条件
$$
\left\{\begin{array}{l}
f_{i}\left(x^{*}\right) \leqslant 0, \quad i=1, \ldots, m \\
h_{j}\left(x^{*}\right)=0, \quad j=1, \ldots, p \\
\lambda_{i}^{*} \geqslant 0, \quad i=1, \ldots, m \\
\lambda_{i}^{*} f_{i}\left(x^{*}\right)=0, \quad i=1, \ldots, m \\
\nabla f_{0}\left(x^{*}\right)+\sum_{i=1}^{m} \lambda_{i}^{*} \nabla f_{i}\left(x^{*}\right)+\sum_{j=1}^{p} \nu_{j}^{*} \nabla h_{j}\left(x^{*}\right)=0
\end{array}\right.
$$
称为 ==Karush-Kuhn-Tucker (KKT) 条件== 

若原问题是凸的，那么 KKT 条件是原问题和对偶问题最优的充分条件

### 04.2.2 算法

凸优化问题没有解析解

#### 04.2.2.1 无约束

$$
\min f(x)
$$
其中 $f(x)$ 可微且凸，通常使用下降方法

> 下降方法回顾
>
> 给定起始点 $x^{(0)}$，下降方法产生序列 $x^{(k)},k=1,\dots$，其中
>
> $$
> x^{(k+1)}=x^{(k)}+\alpha_k\delta_x^{(k)},\quad f(x^{(k+1)})<f(x^{(k)})
> $$
>
> 其中 $\alpha>0$ 称为步长，$\delta_x$ 称为搜索方向
>
> 通常省略上标，写为 $x:=x+\alpha\delta_x$ 
>
> 给定搜索方向 $\delta_x$，用先搜索确定步长 $\alpha$ 
>
> 不同的搜索方向
>
> - 负梯度：$\delta_x=-\nabla f(x)$ 
> - 标准最速下降方向：$\delta_{x_{\text{nsd}}}=\mathop{\arg\min}_\limits{v}\{{\nabla f(x)}^\top v|\|v\|=1\}$ 
> - 牛顿步：$\delta_{x_{\text{nt}}}=-{\nabla^2f(x)}^{-1}\nabla f(x)$ 

#### 04.2.2.2 等式约束

$$
\begin{array}{l}
\min & f(x)\\
\text{s.t.} & Ax=b
\end{array}
$$

其中 $f:\mathbb{R}^n\to \mathbb{R}$ 是凸函数且二次连续可微，$A\in \mathbb{R}^{p\times n}$，$\operatorname{rank} A=p<n$。假设最优解 $x^*$ 存在，最优值为 $v^*=f(x^*)$ 

由 KKT 条件可知，$x^*$ 为最优解 $\Leftrightarrow$ $\exist \nu^*\in \mathbb{R}^p$ 满足
$$
\begin{align}
Ax^*&=b\\
\nabla f(x^*)+A^\top \nu^*&=0
\end{align}
$$
其中 $Ax^*=b$ 称为==原可行性方程== primal feasibility equation，$\nabla f(x^*)+A^\top \nu^*=0$ 称为==对偶可行性方程== dual feasibility equation

等式约束问题的牛顿法几乎同于无约束问题的牛顿法，不同点如下

- 初始点必须为可行点
- 牛顿步 $\delta_{x_\text{nt}}$ 需要考虑等式约束

**牛顿步推导** 

在可行解 $x$ 附近用二阶泰勒近似替换目标函数
$$
\begin{array}{ll}
\min_\limits{s} & \hat{f}(x+s)=f(x)+{\nabla f(x)}^{\top} s+\frac{1}{2} s^{\top} \nabla^{2} f(x) s \\
\text { s.t. } & A(x+s)=b
\end{array}
$$
假设 $\delta_{x_\text{nt}}$ 是最优解，由 KKT 条件可知
$$
\left[\begin{array}{cc}
\nabla^{2} f(x) & A^{\top} \\
A & 0
\end{array}\right]
\left[\begin{array}{c}
\delta_{x_{\text{nt}}} \\
w
\end{array}\right]
=
\left[\begin{array}{c}
-\nabla f(x) \\
0
\end{array}\right]
$$

> KKT 条件为
>
> - 可微：${\nabla f(x)}^\top+\nabla^2 f(x)\delta_{x_{\text{nt}}}+wA=0$ 
> - 等式约束：$A\delta_{x_{\text{nt}}}=0$（$Ax=b$）

另外，我们也可以用 $x+\delta_{x_{\text{nt}}}$ 和 $w$ 替换原问题 KKT 条件中的 $x^*$ 和 $\nu^*$，并对目标函数微分进行二阶泰勒近似
$$
\begin{array}{c}
A\left(x+\delta_{x_{\text{nt}}}\right)=b \\
\nabla f\left(x+\delta_{x_{\text{nt}}}\right)+A^{\top} w \approx \nabla f(x)+\nabla^{2} f(x) \delta_{x_{\text{nt}}}+A^{\top} w=0
\end{array}
$$
再利用 $Ax=b$ 即可得到相同的方程

牛顿下降量 Newton decrement 定义为
$$
\kappa(x)=\sqrt{{\delta_{x_{\text{nt}}}}^\top\nabla^2 f(x)\delta_{x_{\text{nt}}}}
$$
由于
$$
\left.\frac{\mathrm{d}}{\mathrm{d} \alpha} f\left(x+\alpha \delta_{x_{\mathrm{nt}}}\right)\right|_{\alpha=0}=\nabla f(x)^{\top} \delta_{x_{\mathrm{nt}}}=-\kappa(x)^{2}
$$
故当 $\kappa(x)$ 很小时算法终止

**等式约束牛顿法——算法** 

给定初始点 $x\in \operatorname{dom} f$，容差 $\epsilon>0$，重复

- 计算牛顿步 $\delta_{x_{\text{nt}}}$ 和下降量 $\kappa(x)$ 
- 若 $\frac{1}{2}\kappa^2\le \epsilon$，则停止
- 用 backtracking 线搜索选择步长 $\alpha$ 
- 更新 $x:=x+\alpha\delta_{x_{\text{nt}}}$ 

**不可行起始牛顿法** 

> infeasible start Newton method

不假设 $x$ 为可行解，但假设 $x\in \operatorname{dom}f$，目标是找一个牛顿步 $\delta_x$ 使得 $x+\delta_x$ 满足最优性条件

用 $x+\delta_x$ 和 $\mu$ 替换 $x^*$ 和 $\nu^*$，并对梯度做一阶近似可得
$$
\begin{array}{c}
A\left(x+\delta_{x}\right)=b \\
\nabla f\left(x+\delta_{x}\right)+A^{\top} \mu \approx \nabla f(x)+\nabla^{2} f(x) \delta_{x}+A^{\top} \mu=0
\end{array}
$$
即
$$
\left[\begin{array}{cc}
\nabla^{2} f(x) & A^{\top} \\
A & 0
\end{array}\right]\left[\begin{array}{c}
\delta_{x} \\
\mu
\end{array}\right]=-\left[\begin{array}{c}
\nabla f(x) \\
A x-b
\end{array}\right]
$$
另外也可用==原-对偶牛顿步== primal-dual Newton step 解释

将最优性条件表示为 $r(x^*,\nu^*)=0$，其中 $r:\mathbb{R}^n\times\mathbb{R}^p\mapsto \mathbb{R}^n\times\mathbb{R}^p$ 定义为
$$
r(x,\nu)=(r_{\text{dual}}(x,\nu),r_{\text{pri}}(x,\nu))
$$
其中
$$
\begin{aligned}
r_{\text{dual}}(x,\nu)&=\nabla f(x)+A^\top \nu\\
r_{\text{pri}}(x,\nu)&=Ax-b
\end{aligned}
$$
并称 $r_{\text{dual}}$ 为==对偶残差== dual residual，称 $r_{\text{pri}}$ 为==原残差== primal residual

在 $y=(x,\nu)$ 附近 $r$ 的一阶泰勒近似为
$$
r(y+\delta_y)\approx \hat{r}(y+\delta_y)=r(y)+J[r(y)]\delta_y
$$
其中 $J[r(y)]\in \mathbb{R}^{(n+p)\times(n+p)}$ 是 $r$ 在 $y$ 处的导数（雅克比）

定义 $\delta_{y_{\text{pd}}}$ 为原-对偶牛顿步，满足 $\hat{r}(y+\delta_{y_{\text{pd}}})=0$，即 $J[r(y)]\delta_{y_{\text{pd}}}=-r(y)$，可表示为
$$
\left[\begin{array}{cc}
\nabla^{2} f(x) & A^{\top} \\
A & 0
\end{array}\right]\left[\begin{array}{c}
\delta_{x_{p d}} \\
\delta_{\nu_{p d}}
\end{array}\right]=-\left[\begin{array}{c}
r_{\text {dual }} \\
r_{p r i}
\end{array}\right]=-\left[\begin{array}{c}
\nabla f(x)+A^{\top} \nu \\
A x-b
\end{array}\right]
$$
用 $\mu$ 替换 $\nu + \delta_{\nu_\text{pd}}$，可得
$$
\left[\begin{array}{cc}
\nabla^{2} f(x) & A^{\top} \\
A & 0
\end{array}\right]\left[\begin{array}{c}
\delta_{x} \\
\mu
\end{array}\right]=-\left[\begin{array}{c}
\nabla f(x) \\
A x-b
\end{array}\right]
$$
不可行点处的牛顿方向不一定是 $f$ 的下降方向，但原-对偶解释代表牛顿方向的残差下降范数
$$
\left.\frac{\mathrm{d}}{\mathrm{d} \alpha}\left\|r\left(y+\alpha \delta_{y_{\mathrm{pd}}}\right)\right\|_{2}\right|_{\alpha=0}=-\|r(y)\|_{2}
$$
可用来衡量不可行起始牛顿法的进度

算法为

给定起始点 $x\in\operatorname{dom}f$，容差 $\epsilon >0$，$\tau\in(0,\frac{1}{2})$，$\gamma\in(0,1)$，重复

- 计算原和对偶牛顿步 $\delta_{x_{\text{nt}}}$，$\delta_{\nu_{\text{nt}}}$ 
- 基于 $\|r\|_2$ 进行 backtracking line search
  - $\alpha:=1$ 
  - while $\|r(x+\alpha\delta_{x_{\text{nt}}},\nu+\alpha\delta_{\nu_{\text{nt}}})\|_2>(1-\tau\alpha)\|r(x,\nu)\|_2$，$\alpha:=\gamma\alpha$ 
- 更新 $x:=x+\alpha \delta_{x_{\text{nt}}}$，$\nu:=\nu+\alpha\delta_{\nu_{\text{nt}}}$ 
- 若 $Ax=b$ 且 $\|r(x,\nu)\|_2\le \epsilon$，停止

#### 04.2.2.3 不等式约束

$$
\begin{array}{ll}
\min & f_{0}(x) \\
\mathrm{s.t.} & f_{i}(x) \leqslant 0, \quad i=1, \ldots, m \\
& A x=b
\end{array}
$$

其中 $f_0,f_1,\dots,f_m:\mathbb{R}^n\to\mathbb{R}$ 是凸的且二阶可导，$A\in\mathbb{R}^{p\times n}$，$\operatorname{rank} A = p < n$ 

假设最优解存在，记为 $x^*$，并最优值为 $v^*=f(x^*)$ 

假设问题严格可行，即 $\exist x\in \mathcal{D},Ax=b,f_i(x)<0(i=1,\dots,m)$ 

这意味者 Slater 约束条件满足，因此有强对偶性，故存在最优对偶乘子 $\lambda^*\in\mathbb{R}^m$，$\nu^*\in\mathbb{R}^p$，满足
$$
\begin{aligned}
A x^{*}=b, \quad f_{i}\left(x^{*}\right) & \leqslant 0, \quad i=1, \ldots, m \\
\lambda^{*} & \geqslant 0 \\
\nabla f_{0}\left(x^{*}\right)+\sum_{i=1}^{m} \lambda_{i}^{*} \nabla f_{i}\left(x^{*}\right)+A^{\top} \nu^{*} &=0 \\
\lambda_{i}^{*} f_{i}\left(x^{*}\right) &=0, \quad i=1, \ldots, m
\end{aligned}
$$
**屏障法** 

用示性函数将不等式约束放入目标函数中
$$
\begin{array}{ll}
\min & f_{0}(x)+\sum_{i=1}^{m} I_{-}\left(f_{i}(x)\right) \\
\text { s.t. } & A x=b
\end{array}
$$
基本思想是用屏障函数去近似示性函数 $I_-$ 
$$
\hat{I}_{-}(u)=-(1 / t) \log (-u), \quad \operatorname{dom} \hat{I}_{-}=-\mathbb{R}_{++}
$$
其中 $t$ 控制了近似的精度（越大越精确），显然 $\hat{I}_-$ 是凸的，非下降且可微

> 图示
>
> ![image-20200616113434567](assets/04_Convex/image-20200616113434567.png)

用 $\hat{I}_-$ 替换 $I_-$ 可得近似问题
$$
\begin{array}{ll}
\min & f_{0}(x)+\sum_{i=1}^{m}-(1 / t) \log \left(-f_{i}(x)\right) \\
\text { s.t. } & A x=b
\end{array}
$$
定义函数
$$
\phi(x)=-\sum_{i=1}^m\log(-f_i(x))
$$
称为==对数屏障== ligarithmic barrier，定义域为
$$
\operatorname{dom}\phi = \{x\in\mathbb{R}^n|f_i(x)<0,i=1,\dots,m\}
$$
梯度和 Hessian 为
$$
\begin{array}{c}
\nabla \phi(x)=\sum_{i=1}^{m} \frac{1}{-f_{i}(x)} \nabla f_{i}(x) \\
\nabla^{2} \phi(x)=\sum_{i=1}^{m} \frac{1}{f_{i}(x)^{2}} \nabla f_{i}(x) \nabla f_{i}(x)^{\top}+\sum_{i=1}^{m} \frac{1}{-f_{i}(x)} \nabla^{2} f_{i}(x)
\end{array}
$$
代入 $\phi$ 并乘 $t$ 可得
$$
\begin{array}{ll}
\min & tf_{0}(x)+\phi(x) \\
\text { s.t. } & A x=b
\end{array}
$$
假设该问题能用牛顿法解决（一个 $t$ 一个解），记最优解为 $x^*(t)$（严格可行），称为==中心点== central point，并称 $\{x^*(t)|t>0\}$ 为==中心路径== central path

$\exist \hat{v}(t)\in \mathbb{R}^p$ 满足微分条件
$$
\begin{aligned}
0 &=t \nabla f_{0}\left(x^{*}(t)\right)+\nabla \phi\left(x^{*}(t)\right)+A^{\top} \hat{\nu} \\
&=t \nabla f_{0}\left(x^{*}(t)\right)+\sum_{i=1}^{m} \frac{1}{-f_{i}\left(x^{*}(t)\right)} \nabla f_{i}\left(x^{*}(t)\right)+A^{\top} \hat{\nu}
\end{aligned}
$$
定义
$$
\lambda_{i}^{*}(t)=-\frac{1}{t f_{i}\left(x^{*}(t)\right)}, i=1, \ldots, m, \quad \nu^{*}(t)=\frac{\hat{\nu}}{t}
$$
因为 $f_i(x^*(t))<0(i=1,\dots,m)$（严格可行），故 $\lambda_i(t)>0$，则微分条件可写为
$$
\nabla f_{0}\left(x^{*}(t)\right)+\sum_{i=1}^{m} \lambda_{i}^{*}(t) \nabla f_{i}\left(x^{*}(t)\right)+A^{\top} \nu^{*}(t)=0
$$
故 $x^*(t)$ 最小化 $L(x,\lambda^*(t),\nu^*(t))$，因此 $(\lambda^*(t),\nu^*(t))$ 是对偶可行对

因此对偶函数 $g(\lambda^*(t),\nu^*(t))$ 是有限的且
$$
\begin{aligned}
g\left(\lambda^{*}(t), \nu^{*}(t)\right) &=f_{0}\left(x^{*}(t)\right)+\sum_{i=1}^{m} \lambda_{i}^{*}(t) f_{i}\left(x^{*}(t)\right)+\nu^{*}(t)^{\top}\left(A x^{*}(t)-b\right) \\
&=f_{0}\left(x^{*}(t)\right)-m / t
\end{aligned}
$$
因此
$$
f_{0}\left(x^{*}(t)\right)-v^{*} \leqslant m / t
$$
这保证了当 $t\to \infty$ 时，$x^*(t)$ **收敛于最优点** 

另外可用 KKT 条件解释，近似问题解为 $x$ 时当且仅当 $\exist \lambda,\nu$ 满足
$$
\begin{aligned}
A x=b, \quad f_{i}(x) & \leqslant 0, \quad i=1, \ldots, m \\
\lambda & \geqslant 0 \\
\nabla f_{0}(x)+\sum_{i=1}^{m} \lambda_{i} \nabla f_{i}(x)+A^{\top} \nu &=0 \\
-\lambda_{i} f_{i}(x) &=1 / t, \quad i=1, \ldots, m
\end{aligned}
$$
与原问题 KKT 条件仅最后一式不同，故对于较大的 $t$，$x^*(t),\lambda^*(t),\nu^*(t)$ 几乎满足原问题的 KKT 条件

算法

给定严格可行点 $x$，$t:=t^{(0)}>0$，$\gamma>1$，容差 $\epsilon>0$，重复

- 中心步：起始于 $x$，用牛顿法求近似问题最优解 $x^*(t)$ 
- $x:=x^*(t)$ 
- 当 $m/t<\epsilon$ 时停止
- $t:= \gamma t$ 

中心步中牛顿法的牛顿步 $\delta_{x_\text{nt}}$ 满足
$$
\left[\begin{array}{cc}
t \nabla^{2} f_{0}(x)+\nabla^{2} \phi(x) & A^{\top} \\
A & 0
\end{array}\right]\left[\begin{array}{c}
\delta_{x_{n t}} \\
\nu_{n t}
\end{array}\right]=-\left[\begin{array}{c}
t \nabla f_{0}(x)+\nabla \phi(x) \\
0
\end{array}\right]
$$
可解释为求解修改的 KKT 条件
$$
\begin{aligned}
\nabla f_{0}(x)+\sum_{i=1}^{m} \lambda_{i} \nabla f_{i}(x)+A^{\top} \nu &=0 \\
-\lambda_{i} f_{i}(x) &=1 / t, \quad i=1, \ldots, m \\
A x &=b
\end{aligned}
$$
二式代入一式，对于小 $\delta_x$，有
$$
\begin{aligned}
&\nabla f_{0}\left(x+\delta_{x}\right)+\sum_{i=1}^{m} \frac{1}{-t f_{i}\left(x+\delta_{x}\right)} \nabla f_{i}\left(x+\delta_{x}\right) \\
\approx& \nabla f_{0}(x)+\sum_{i=1}^{m} \frac{1}{-t f_{i}(x)} \nabla f_{i}(x)+\nabla^{2} f_{0}(x) \delta_{x}+\sum_{i=1}^{m} \frac{1}{-t f_{i}(x)} \nabla^{2} f_{i}(x) \delta_{x} \\
&+\sum_{i=1}^{m} \frac{1}{t f_{i}(x)^{2}} \nabla f_{i}(x) \nabla f_{i}(x)^{\top} \delta_{x}\\
=&\left(\nabla^2f_0(x)+\frac{1}{t}\nabla^2\phi(x)\right)\delta_x+\nabla f_0(x)+\frac{1}{t}\nabla \phi(x)
\end{aligned}
$$
记
$$
H=\nabla^2f_0(x)+\frac{1}{t}\nabla^2\phi(x),g=\nabla f_0(x)+\frac{1}{t}\nabla \phi(x)
$$
则牛顿步满足
$$
H\delta_x+A^T\nu=-g,A\delta_x=0
$$
对比可得
$$
\delta_x=\delta_{x_{\text{nt}}},\nu=\frac{\nu_{\text{nt}}}{t}
$$
屏障法需要一个严格可行解作为起始点，求此严格可行解的阶段称为==阶段Ⅰ== phaseⅠ

设计问题
$$
\begin{array}{ll}
\min_\limits{x,s} & s \\
\text { s.t. } & f_{i}(x) \leqslant s, \quad i=1, \ldots, m \\
& A x=b
\end{array}
$$
称为==阶段Ⅰ优化问题== phaseⅠoptimization problem

令 $\bar{v}^*$ 为最优值

- 若 $\bar{v}^*<0$，则相应 $x$ 为严格可行解（事实上我们可以在 $s<0$ 时停止算法）
- 若 $\bar{v}^*>0$，则不可行
- 若 $\bar{v}^*=0$，则非严格可行

修改的 KKT 条件可表示为 $r_t(x,\lambda,\nu)=0$，其中
$$
r_{t}(x, \lambda, \nu)=\left[\begin{array}{c}
\nabla f_{0}(x)+J[f(x)]^{\top} \lambda+A^{\top} \nu \\
-\operatorname{diag}(\lambda) f(x)-(1 / t) \boldsymbol{1} \\
A x-b
\end{array}\right]
$$
并且 $t>0$ 

这类 $f$ 和 $J[f]$ 分别为
$$
f(x)=\left[\begin{array}{c}
f_{1}(x) \\
\vdots \\
f_{m}(x)
\end{array}\right], \quad J[f(x)]=\left[\begin{array}{c}
\nabla f_{1}(x)^{\top} \\
\vdots \\
\nabla f_{m}(x)^{\top}
\end{array}\right]
$$
第一块 $r_{\text{dual}}=\nabla f_{0}(x)+J[f(x)]^{\top} \lambda+A^{\top} \nu$ 称为==对偶残差== dual residual

第三块 $r_{\text{pri}}=Ax-b$ 称为==原残差== primal residual

第二块 $r_{\text{cent}}=-\operatorname{diag}(\lambda) f(x)-(1 / t) 1$ 称为==中心残差== centrality residual

记当前点为 $y=(x,\lambda,\nu)$，牛顿步为 $\delta_y=(\delta_x,\delta_\lambda,\delta_\nu)$，牛顿步用于解方程 $r_t(x,\lambda,\nu)=0$，表示为
$$
r_t(y+\delta_y)\approx r_t(y)+J[r_t(y)]\delta_y=0
$$
写成矩阵形式为
$$
\left[\begin{array}{ccc}
\nabla^{2} f_{0}(x)+\sum_{i=1}^{m} \lambda_{i} \nabla^{2} f_{i}(x) & J[f(x)]^{\top} & A^{\top} \\
-\operatorname{diag}(\lambda) J[f(x)] & -\operatorname{diag}(f(x)) & 0 \\
A & 0 & 0
\end{array}\right]\left[\begin{array}{c}
\delta_{x} \\
\delta_{\lambda} \\
\delta_{\nu}
\end{array}\right]=-\left[\begin{array}{c}
r_{\text {dual }} \\
r_{\text {cent }} \\
r_{\text {pri }}
\end{array}\right]
$$
原-对偶搜索方向 primal-dual search direction $\delta_{y_{\text{pd}}}=(\delta_{x_{\text{pd}}},\delta_{\lambda_{\text{pd}}},\delta_{\nu_{\text{pd}}})$ 是上边的解

原-对偶内点法迭代的 $x^{(k)},\lambda^{(k)},\nu^{(k)}$ 不要求是可行的，我们没法计算对偶间隙，但我们可以定义==代理对偶间隙== surrogate duality gap
$$
\hat{\eta}(x,\lambda)=-f(x)^\top\lambda
$$
其中 $f(x)<0$，$\lambda\ge 0$ 

当 $x,\lambda,\nu$ 可行时，代理对偶间隙就是对偶间隙，另外
$$
t=\frac{m}{\hat{\eta}}
$$
原-对偶内点法——算法

给定 $x$ 满足 $f_1(x),\dots,f_m(x)<0$，$\lambda>0$，$\gamma>1$，$\epsilon_{\text{feas}}>0$，$\epsilon>0$，重复

- $t:=\gamma m/\hat{\eta}$ 
- 计算原-对偶搜索方向 $\delta_{y_{\text{pd}}}$ 
- 线搜索确定步长 $\alpha$ 并更新 $y:=y+\alpha\delta_{y_{\text{pd}}}$ 

直到 $\|r_{\text{pri}}\|\le \epsilon_{\text{feas}}$，$\|r_{\text{dual}}\|\le \epsilon_{\text{feas}}$，$\hat{\eta}\le \epsilon$ 

