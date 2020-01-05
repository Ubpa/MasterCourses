# 1. 赋范线性空间中的逼近问题引论

## 1.1 逼近问题的提出

**定义 1.1** 
$$
\|x-m^*\|=\inf_{m\in M}\|x-m\|=d(x,M)\\
\mathcal{B}_M(x)\triangleq\{m\in M: \|x-m\|=d(x,M)\}
$$

---

- 存在性：$\# \mathcal{B}_M(x)\ge 1$ 
- 唯一性：$\# \mathcal{B}_M(x)\le 1$ 
- 存在性集：$\forall x\in X,\mathcal{B}_M(x)\neq \empty$ 
- 唯一性集：$\forall x \in X, \#\mathcal{B}_M(x)\le 1$ 
- T 集：$\forall x\in X,\#\mathcal{B}_M(x)=1$ 

---

- $I$：列紧的距离空间，一般可认为 $[a,b]$，常用的线性赋范空间
- $X$ 
  - $L_2(I)$：$\|f\|\triangleq\|f\|_2\triangleq\sqrt{\int_I|f(x)|^2\mathrm{d}x}$ ，相应问题是最小平方逼近
  - $C(I)$：$\|f\|\triangleq\|f\|_\infty\triangleq\sup_{x\in I}|f(x)|$，相应问题是一致逼近
  - $L_1(I)$：$\|f\|\triangleq \|f\|_1\triangleq \int_I|f(x)|\mathrm{d}x$，相应问题是最小平均逼近
- $M$ 
  - $\mathcal{P}_n=\left\{\sum_{i=0}^{n-1} a_i t^{i-1},a_i\in \mathbb{R}\right\}$ 
  - $\overset{\circ}{\mathcal{P}}_n\triangleq\left\{a_0+\sum_{i=1}^n(a_i\cos it+b_i\sin it),a_i,b_i\in\mathbb{R}\right\}$ 
  - $\mathcal{S}(\mathcal{P}_m,\mathfrak{M},\Delta)\triangleq \{S(t):S|_{I_i}=S_i(x)\in \mathcal{P}_m,S_i^{(j-1)}(t_i)=S^{(j-1)}_{i+1}(t_i)\ (i=1,\dots,k-1;j=1,\dots,m-m_i)\}$ 是 $m$ 阶的分割为 $\Delta$ 的重度向量为 $\mathfrak{M}=(m_0,\dots,m_k)$ 的多项式样条空间，其中 $\Delta\triangleq a=t_0<t_1<\dots,t_{k-1}<t_k=b$ 

## 1.2 最佳逼近元的存在唯一性

### 1.2.1 存在性

**定理 1.1**（存在性）设 $M\subset X$ 是 $X$ 中的列紧集，则 $M$ 是存在性集，即 $\mathcal{B}_M(x)\neq \empty$ 

**推论 1.1**（有限维子空间存在性）若 $M\subset X$ 是 $X$ 的子空间，且 $\dim(M)<+\infty$，则 $M$ 是存在性集

### 1.2.2 凸

**定义 1.2** $\forall s_1,s_2 \in S,\forall \lambda_1,\lambda_2\ge0,\lambda_1+\lambda_2=1$，有 $\lambda_1s_1+\lambda_2s_2\in S$，则称 $S$ 为凸集

**定理 1.2** $M$ 是凸集，则 $\mathcal{B}_M(x)$ 是凸集

**定义 1.3** $\forall u_1,u_2 \in \part B_1,\forall\lambda_1,\lambda_2>0,\lambda_1+\lambda_2=1$，有 $\|\lambda_1u_1+\lambda_2u_2\|<1$，则 $B_1$ 严格凸

**定理 1.3** 下列说法等价

(1) $X$ 严格凸

(2) $\forall x_1,x_2\in \part B_1, x_1\neq x_2$，则 $\|(x_1+x_2)/2\|<1$ 

(3) 若 $\forall x_1,x_2\in X, x_1\neq x_2, \|x_1+x_2\|=\|x_1\|+\|x_2\|$，则 $\exist c>0,x_1=cx_2$ 

**定义 1.4** 若 $\forall x,y\in\part B_1,\forall \epsilon>0,\exist\delta>0$，当 $\|(x+y)/2\|>1-\delta$ 时，有 $\|x-y\|<\epsilon$，则称 $\|\cdot\|$ 是**匀凸的** unifrom convex，$X$ 为匀凸空间

推论

- 若 $\forall \epsilon\in(0,2),\exist \delta>0$，当 $\|x-y\|\ge \epsilon$ 时，$\|(x+y)/2\|\le 1-\delta$，则 $X$ 匀凸
- 若 $\forall \{x_n\},\{y_n\}\subset \part B_1$，只需 $\lim_\limits{m,n\to\infty}\|(x_m+y_n)/2\|=1$，便有 $\lim_\limits{m,n\to\infty}\|x_m-y_n\|=0$，则 X 匀凸
- 匀凸 => 严格凸
- 内积空间匀凸
- 有限维严格凸赋范线性空间匀凸
- $L_p(1<p<+\infty)$ 是匀凸空间

**定义 2.2** 对于线性空间的任意集合 $V$，称集合
$$
\text{Co}(V)\triangleq\left\{v:v=\sum_{i=1}^m\alpha_iv_i,v_i\in V,\alpha_i\ge0,\sum_{i=1}^m\alpha_i = 1,m<+\infty\right\}
$$
为 V 的**凸包** convex hull。$\text{Co}(V)$ 是包含 $V$ 的最小凸集

**定理 2.4** 设 $A\subset \mathbb{R}^n$，则 $\text{Co}(A)$ 中的任一元素都可以表示为 $A$ 中不超过 $n+1$ 个元素的凸线性组合

> 比如平面内的一个集合 A，包含了一堆点，凸包中的任意一点，能从 A 中选出三个点构成三角形，使得该点在三角形内部（包含边）。

**定理 2.5**（线性不等式定理）设 $A\subset R^n$ 是紧子集，则线性不等式方程组
$$
\langle a,x\rangle >0 \quad (\forall a\in A)
$$
无解的充要条件是 $0\in Co(A)$ 

### 1.2.3 唯一性

**定理 1.4** 严格凸空间 $X$ 内的凸子集 $M$ 是唯一性集

**定理 1.5** $X$ 是匀凸的 Banach 空间，$M\subset X$ 是 $X$ 中的闭凸集，则 $M$ 是 $T$ 集

## 1.3 表征定理

**定理 1.7** $M$ 是 $X$ 的子空间，$\forall x\in X\backslash M,m^*\in M$，则 $m^*\in \mathcal{B}_M(x)$ 的充要条件为 $\exist \lambda \in X^*$，满足

- $\|\lambda\|=1$ 
- $\|x-m^*\|=\lambda(x-m^*)$ 
- $\lambda\in M^\perp$，其中 $M^\perp\triangleq\{\lambda\in X^*:\lambda m=0,\forall m \in M\}$ 

**定理 1.8** $M$ 是 $X$ 的非空闭凸集，$\forall x \in X \backslash M$，则 $m^*\in \mathcal{B}_M(x)$ 的充要条件为 $\exist \lambda \in X^*$，满足

- $\|\lambda\|=1$ 
- $\|x-m^*\|=\lambda(x-m^*)$ 
- $\lambda m^* = \sup_\limits{m\in M}\lambda m$ 

**定理 1.9**（对偶关系）$M$ 是 $X$ 的线性子空间，则

- $d(x,M)=\sup_\limits{\lambda\perp M,\|\lambda\|\le 1}|\lambda x|$ 
- $d(\lambda,M^\perp)=\sup_\limits{m\in M,\|m\|\le 1}|\lambda m|$ 

## 1.4 距离投影算子

**定义 1.5** $M$ 是 $T$ 集，若 $P_M:X\mapsto M$ 满足 $\forall x\in X, P_Mx\triangleq \mathcal{B}_M(x)$，则称 $P_M$ 为 $X$ 到 $M$ 的距离投影（映射）算子

> 当 $\#\mathcal{B}_M(x)=1$ 时，$\mathcal{B}_M(x)$ 也可表示其中的唯一元素

**定理 1.10** $M$ 是 $X$ 的线性子空间且 $M$ 是 $T$ 集，则 $P_M$ 有如下性质

- $\text{range}P_M = M,P_M|_M = I$ 
- $P_M$ 是有界算子
- $P_M$ 是闭算子
- 若 $M$ 列紧，则 $P_M$ 连续
- $P_M$ 齐次：$P_M(\alpha x)=\alpha P_M(x)$ 
- $\forall m \in M,P_M(x+m)=P_M(x)+P_M(m)$ 
- $P_M$ 一般不是线性算子

# 2. 一致逼近

$I$ 是一个紧的距离空间，$X=C(I)$ 表示定义在 $I$ 上的连续函数的全体，范数定义为
$$
\|f\|\triangleq\|f\|_\infty\triangleq\sup_\limits{t\in I}|f(t)|
$$

## 2.1 Weierstrass-Stone 定理

**Weierstrass 定理** $\forall f\in C[a,b],\forall \epsilon > 0, \exist p \in \mathcal{P}, \|f-p\| < \epsilon$ 

**定理 2.1** （Weierstrass-Stone 定理）$M(I)\subset C(I)$ 是 $C(I)$ 中子代数，若

- $1 \in M$ 
- $M$ 分离 $I$ 中的点，即 $\forall t,s\in I,t\neq s,\exist f\in M(I),f(t)\neq f(s)$ 

则 $\overline{M}(I)=C(I)$ 

**推论 2.1** $I^n \subset R^n$ 为有界闭集，$\mathcal{P}(I^n)$ 是 $n$ 个变元 $t_1,t_2,\dots,t_n$ 的多项式的全体，则 $\overline{P}(I^n)=C(I^n)$ 

**推论 2.2** $I=[a,b]$，$\varphi(t)$ 是 $[a,b]$ 上的严格单调连续函数，若 $M(I)$ 为包含 $1$，$\varphi(t)$ 的子代数，则 $\overline{M}(I)=C(I)$ 

## 2.2 正线性算子理论

**Bernstein**（Weierstrass 定理构造性证明）设
$$
B_n(f;x)\triangleq\sum_{i=0}^n f\left(\frac{i}{n}\right)\binom{n}{i}x^i(1-x)^{n-i}
$$
为 $[0,1]$ 上与函数 $f$ 相联系的 $n$ 次 Bernstein 多项式，可证 $\forall f\in C[0,1]$，有
$$
\lim_\limits{n\to\infty}\ B_nf = f
$$

在连续函数空间 $X=C(I)$ 中，函数 $f\ge 0$ 是指 $\forall t \in I,f(t)\ge 0$，称 $f$ 为 $X$ 的**正元素** 

**定义 2.1** 设 $L:X \to X$，若 $\forall f \ge 0,Lf\ge 0$，则称 $L$ 为**正算子**。若 $L$ 又是线性算子，则称 $L$ 为**正线性算子** 

**定理 2.2**（Bohman-Korovkin 定理）设函数 $\{f_i\}_{i=1}^m\subset C(I)$，$\exist a_i(s)\in C(I),i=1,2,\dots,m$ 使得
$$
P_s(t)=\sum_{i=1}^m a_i(s)f_i(t)\ge 0
$$
当且仅当 $t=s$ 时等号成立

设 $L_n:C(I) \to C(I)$ 是正线性算子序列，且满足
$$
\lim_\limits{n\to\infty}L_nf_i=f_i,i=1,2,\dots,m
$$
则 $\forall f \in C(I), \lim_\limits{n\to\infty}L_nf=f$ 

**推论 2.3** $L_n$ 是定义在 $C[a,b]$ 上的正线性算子序列，下列命题等价

- $\forall f\in C[a,b]$，有 $\lim_\limits{n\to\infty}L_nf=f$ 

- 当 $f(t)=1,t,t^2$ 时，有 $\lim_\limits{n\to\infty} L_nf=f$ 

- $\lim_\limits{n\to\infty}L_n 1= 1$，且对 $s\in [a,b],\lim_\limits{n\to\infty} L_n(P_s,s)=0$，其中 $P_s(t)=(s-t)^2$ 

**推论 2.4** Bernstein 算子
$$
B_n(f,t)\triangleq\sum_{i=1}^nf\left(\frac{i}{n}\right)B_i^n(t)
$$
其中 $B_i^n(t)=\binom{n}{i}t^i(1-t)^{n-i}$，则 $\forall f\in C[0,1]$，有
$$
\lim_\limits{n\to\infty} B_nf=f
$$

## 2.3 广义多项式的一致逼近

本节中 $M\triangleq\text{span}\{m_i(t)\}_{i=1}^n\subset C(I)$ 是 $C(I)$ 的线性子空间，$\dim (M) = n$，其中 $\{m_i(t)\}_{i=1}^n$ 线性无关，称为**广义多项式**或一般线性形式。$M$ 是存在性集。

$\forall t_i \in I$，用 $[t_i]:C(I)\to \mathbb{R}$ 表示在 $t_i$ 点取值的泛函，即 $\forall f \in C(I), [t_i]f=f(t_i)$，$[t_i]$ 称为**点泛函** 

矩阵和行列式的简化记号
$$
\begin{align}
A\begin{pmatrix}
t_1 & t_2 & \dots & t_n \\
m_1 & m_2 & \dots & m_n
\end{pmatrix}

&\triangleq

\left(m_j(t_i)\right)_{i,j=1}^n\\

D\begin{pmatrix}
t_1 & t_2 & \dots & t_n \\
m_1 & m_2 & \dots & m_n
\end{pmatrix}

&\triangleq

\det\left(m_j(t_i)\right)_{i,j=1}^n
\end{align}
$$

### 2.3.1 最佳逼近的表征定理

**引理 2.2** $\exist \tau=(t_1,t_2,\dots,t_n)\in I^n,M^*=\text{span}\{[t_i]\}_{i=1}^n$，则 $\forall \lambda \in M^*,\exist \alpha\in \mathbb{R}^n$，有
$$
\lambda=\sum_{i=1}^n\alpha_i[t_i],\quad \|\lambda\|_{C(I)}=\sum_{i=1}^n|\alpha_i|
$$

**定理 2.3**（$C(I)$ 中的表征定理）$\forall x \in X\backslash M,m^*\in M$，则 $m^*\in B_M(x)$ 当且仅当 $\exist \tau\in I^{n+1},\alpha\in \mathbb{R}^{n+1}$ 使得 $\lambda=\sum_{i=1}^{n+1}\alpha_i[t_i]$ 满足 $\|\lambda\|=1，\lambda\perp M,\lambda(x-m^*)=\|x-m^*\|$ 

**推论 2.5** $0\neq x(t)\in C(I)$，则下列命题等价，令 $e(t)=x(t)-m^*(t)$ 

(1) $m^* \in \mathcal{B}_M(x)$ 

(2) $0_n\triangleq(0,0,\dots,0)\in \text{Co}\left(e(t)(m_1(t),m_2(t),\dots,m_n(t)),t\in E\right)$，其中 $E$ 为 $e$ 的极点集，即 $\forall t \in E,|e(t)|=\|e\|$ 

(3) $\exist t_1,t_2,\dots,t_r\in E \ (1\le r\le n+1),\exist \alpha_1,\alpha_2,\dots,\alpha_r \in \mathbb{R}$，使得 $\text{sgn} \alpha_j=\text{sgn}e(t_j)(j=1,2,\dots,r)$，且 $\forall m \in M, \sum_{j=1}^r\alpha_j m(t_j)=0$（即泛函 $\sum_{j=1}^r\alpha_j[t_j] \perp M$）

**推论 2.6**（削皮定理）
$$
\inf_{m\in M}\|x-m\|=\max_{\tau \in I^{n+1}}\min_{m\in M}\|x-m\|_\tau
$$
其中 $\tau=(t_1,t_2,\dots,t_{n+1})\in I^{n+1}$，$\|x-m\|_\tau\triangleq\max_\limits{i}|(x-m)(t_i)|$ 

### 2.3.2 Haar 空间

**定义 2.3** 若 $\forall \tau \in I_0^n \triangleq \{\tau\in I^n:t_i\neq t_j,i\neq j\}$，有
$$
D\begin{pmatrix}
t_1 & t_2 & \dots & t_n \\
m_1 & m_2 & \dots & m_n
\end{pmatrix}
\neq 0
$$
则称 $\{m_i(t)\}_{i=1}^n$ 满足 **Haar 条件**，并称其为 **Haar 系统**，也称为 **Tchebycheff 系统**或 **T 系统**。若 $M$ 有一组基构成 T 系统，则称 M 为 **Haar 空间**或 **T 空间** 

**定义 2.4** 称 $\tau\in I_0^n$ 对 $M$ 是完全的 total for M 指，若 $m \in M$，且 $m(t_i)=0(i=1,2,\dots,n)$，则有 $m=0$ 

**定理 2.6** 下列命题等价

- $M$ 是 Harr 空间
- $\forall \tau \in I_0^n$，$\tau$ 对 $M$ 是完全的
- $\forall m \in M,Z_I(m)\le n-1,I=[a,b]$，其中 $Z_I(m)$ 表示 $m$ 在 $I$ 上的零点数
- $\forall \tau \in I_0^n, M^* = \text{span}\{[t_i]\}_{i=1}^n$ 

**定理 2.7** 设 $\{\varphi_i\}_{i=1}^n\subset C^{(n-1)}(I),I=[a,b]$，若 $\forall t \in I, r = 1,2,\dots,n$，都有
$$
w(\varphi_1,\varphi_2,\dots,\varphi_r)=\det\left(\varphi_j^{(i-1)}\right)_{i,j=1}^r\neq 0
$$
则 $\text{span}\{\varphi_i\}_{i=1}^r$ 是 Haar 空间

### 2.3.3 最佳逼近的交错定理

设 $I=[a,b]$，令 $I_{0,0}^n\triangleq\{\tau \in I^n:t_1<t_2<\cdots<t_n\}$ 

**定理 2.8** 

- $\forall \tau \in I_0^{n+1}$，存在唯一的 $\alpha\in\mathbb{R}^{n+1},\alpha_{n+1}=1$，满足 $\lambda\triangleq\sum_{i=1}^{n+1}\alpha_i[t_i]\perp M$ 

- 若
  $$
  0\neq \sum_{i=1}^{n+1}\alpha_i[t_i]\perp M\quad(t_1\le t_2\le \cdots\le t_{n+1})
  $$
  则必有 $t_1<t_2<\cdots<t_{n+1}$，而且 $\alpha_i\alpha_{i+1}<0(i=1,2,\cdots,n)$

**定理 2.9**（交错定理）$m^*\in \mathcal{B}_M(x)$ 的充要条件是 $\exist \tau \in I_{0,0}^{n+1},\exist \sigma\in\{-1,1\}$，使得 $\sigma(-1)^ie(t_i)=\|e\|(i=1,2,\cdots,n+1)$，其中 $e=x-m^*$ 

**推论 2.7**（Tchebycheff 定理）设 $M=\mathcal{P}_n=\text{span}\{t^{i-1}\}_{i=1}^n$，则 $m^* \in \mathcal{B}_M(x)$ 的充要条件是 $\exist \tau \in I_{0,0}^{n+1},\exist \sigma\in\{-1,1\}$，使得
$$
\sigma(-1)^i(x-m^*)(t_i)=\|x-m^*\|(i=1,2,\cdots,n+1)
$$

**定理 2.10** 若 $\forall x \in X = C(I),\forall m \in M,\exist \tau \in I_{0,0}^{n+1}$，使得 $e(t_i)e(t_{i+1}) < 0$，其中 $e(t_i)\triangleq(x-m)(t_i)$，则
$$
d(x,M)\ge \min_{1\le i \le n+1}|e(t_i)|
$$

### 2.3.4 唯一性问题

**定理 2.11** $M$ 是 T 集 $\Leftrightarrow$ $M$ 是 Haar 空间

**定义 2.5** 设 $X$ 是赋范线性空间，$M\subset X$ 为子空间，称 $m\in \mathcal{B}_M(x)$ 为强唯一的，是指 $\exist r_x>0$，对 $\forall m'\in M$，有 $\|x-m'\|\ge\|x-m\|+r_x\|m'-m\|$ 

强唯一性包含唯一性

**定理 2.12**（Haar 空间的强唯一性）$M$ 是 $C(I)$ 的 $n$ 维 Haar 子空间，则 $\forall x \in C(I),\forall m \in \mathcal{B}_M(x)$，$m$ 是强唯一的。

**推论 2.8** $M$ 是 $n$ 维 Haar 子空间，则 $\exist\alpha >0$，使得
$$
\|P_Mx-P_My\| \le \alpha\|x-y\|
$$

### *2.3.5 最佳逼近函数的计算

# 3. 线性插值

## 3.1 线性插值问题

### 3.1.1 问题的提出

$X$ 是线性空间，$M\triangleq \text{span}\{m_i(t)\}_{i=1}^n\subset X$，$\dim (M) = n$，$\{\lambda_i\}_{i=1}^n\subset X^*$，所谓**线性插值问题**，是指 $\forall x \in X$，求 $m=Px\in M$，使得 $Px$ 在 $\{\lambda_i\}_{i=1}^n$ 上插值于 $x$，即
$$
\lambda_i(Px)=\lambda_ix\quad(i=1,2,\dots,n)
$$
或者换个记法，令 $\Lambda\triangleq \text{span}\{\lambda_i\}_{i=1}^n$，希望将 $x$ 分解为 $x=m+(x-m)$，其中 $m\in M$，$x-m\in \Lambda_\perp\triangleq\{y\in X:\lambda y = 0,\forall \lambda \in \Lambda\}$ 

**定义 3.1** 若 $\forall x \in X$，存在唯一的 $m\in M$，满足 $\Lambda x = \Lambda m$（即 $\forall \lambda \in \Lambda,\lambda x = \lambda m$），或者 $X=M\oplus \Lambda_\perp$，则称线性插值问题是**正确**的

下面设 $\{m_i\}_{i=1}^n$，$\{\lambda_i\}_{i=1}^n$ 是线性无关的

**定理 3.1** 线性插值问题 $\lambda_i Px=\lambda_i x(i=1,2,\dots,n)$ 正确 $\Leftrightarrow$ $G\triangleq (\lambda_i m_j)_{i,j=1}^n$ 可逆

### 3.1.2 线性投影的计算

$M$ 和 $\Lambda$ 中随意取一组基 $\{m_i\}_{i=1}^n$，$\{\lambda_i\}_{i=1}^n$，设 $Px=\sum_{j=1}^n\alpha_j m_j$，则插值条件为
$$
\sum_{j=1}^n\alpha_j\lambda_i m_j=\lambda_ix\quad(i=1,2,\dots,n)
$$
解方程求出 $\{\alpha_j\}_{j=1}^n$ 即可确定 $Px$ 的表达式

若恰好 $\lambda_i m_j=0(i\neq j)$，则 $\alpha_i=\lambda_ix/\lambda_i m_i$，但一般没这么恰好。但我们可以用**双正交化**过程，同时改变 $\lambda_i$ 和 $m_j$，从而得到 $\hat{\lambda}_i$ 和 $\hat{m}_j$，使之满足 $\hat\lambda_i \hat m_j=0(i\neq j)$。

设 $M_k\triangleq\text{span}\{m_i(t)\}^k_{i=1}$，$\Lambda_k\triangleq\text{span}\{\lambda_i(t)\}^k_{i=1}$，$P_k\triangleq P_{M_k,\Lambda_k}$。

令
$$
\begin{aligned}
&\hat m_1=m_1,\hat \lambda_1 = \lambda_1,\\
&\hat m_i=m_i-P_{i-1}m_i,\hat\lambda_i=\lambda_i-\lambda_i P_{i-1}
\end{aligned}
$$
可证
$$
\begin{aligned}
& P_{i-1}m_i\in M_{i-1},\lambda_i P_{i-1} \in \Lambda_{i+1}\\
& \hat m_i\perp \Lambda_{i-1}, \hat\lambda_i\perp M_{i-1}
\end{aligned}
$$
**定理 3.2** 设 $\hat m_i$ 和 $\hat\lambda_i$ 的定义如前，则

- $\text{span}\{\hat m_i(t)\}^k_{i=1}=\text{span}\{m_i(t)\}^k_{i=1}=M_k$，$\text{span}\{\hat \lambda_i(t)\}^k_{i=1}=\text{span}\{\lambda_i(t)\}^k_{i=1}=\Lambda_k$ $(i=1,2,\dots,n)$ 
- $\hat\lambda_i \hat m_j = 0(i\neq j),\hat\lambda_i \hat m_i\neq 0$ 
- $P_k x=\sum_{j=1}^k\frac{\hat \lambda_j x}{\hat \lambda_j \hat m_j} \hat m_j$ 

**Newton 插值** 

$M_k=\text{span}\{m_i(t)=t^{i-1}\}_{i=1}^k$，$\Lambda_k=\text{span}\{\lambda_i=[t_i]\}_{i=1}^n$，$\tau_k=(t_i)_{i=1}^k\in I^k_{0,0}$，求 $P_kx$ 

由 定理 3.2 知，$P_kx=\sum_{i=1}^{k}\frac{\widehat{\lambda}_ix}{\widehat{\lambda}_i\widehat{m}_i}\widehat{m}_i$ 

可求得 $\widehat{m}_i(t)=\prod_{j=1}^{i-1}(t-t_j)$，$\frac{\widehat{\lambda}_i}{\widehat{\lambda}_i\widehat{m}_i}=[t_1,\dots,t_{i}]$，则
$$
P_kx=\sum_{i=1}^k\left(\prod_{j=1}^{i-1}(t-t_j)\right)[t_1,\dots,t_i]x(t)
$$

## 3.2 线性插值的误差

### 3.2.1 Lebesgue 不等式

**定理 3.3**（Lebesgue 不等式）设 $X$ 为赋范线性空间，$P$ 是由 $M$ 和 $\Lambda$ 决定的线性投影算子，则 $\forall \mu \in X^*,x\in X$，有
$$
|\mu(I-P)x|\le d(\mu,\Lambda)\|I-P\|d(x,M)
$$
**推论 3.1** 
$$
\|x-Px\|\le \|I-P\| d(x,M)
$$

### 3.2.2 极小线性投影

令 $\text{proj}(M) \triangleq \{P: P是从 X 到 M 的线性投影, \text{range} P = M\}$。

**定义 3.2** 给定一个线性投影 $P$，若 $\|I-P\|=\inf\{\|I-Q\|:Q\in\text{proj}(M)\}$，则称 $P$ 是**最优的** optimal；若 $\|P\|=\inf\{\|Q\|:Q\in \text{proj}(M)\}$，则称 $P$ 是**极小的** 

**引理 3.1** 设 $M$ 是 $X$ 中的 $n$ 维子空间，$\{\lambda_i\}_{i=1}^m\subset X^*$，则 $\{\lambda_i\}_{i=1}^m$ 在 $M$ 上线性无关的充要条件是 $\exist \{m_j\}_{j=1}^m\subset M$ 使得 $(\lambda_i m_j)_{i,j=1}^n=I_n$ 

**推论 3.2** 设 $M=\text{span}\{m_i\}_{i=1}^n$，则 $\exist\{\lambda_i\}_{i=1}^n\subset \Lambda$，使得 $\lambda_i m_j=\delta_{ij}$ 

**定理 3.4** 设 $X$ 是可分的（即具有可数的稠密子集）赋范线性空间，$M\subset X$，$\dim(M)=n$，则存在从 $X$ 到 $M$ 的极小和最优的线性投影

### 3.2.3 线性投影算子的范数

**定理 3.5** 设 $P$ 是从 $M$ 和 $\Lambda$ 所决定的线性投影算子，则
$$
\|P\|=\sup_{m\in M}\inf_{\lambda \in \Lambda}\frac{\|\lambda\|\|m\|}{|\lambda m|}
$$

---

设 $\tau=(t_i)_{i=1}^n\in I^n_{0,0},\Lambda\triangleq \text{span}\{\lambda_i=[t_i]\}_{i=1}^n,M\triangleq \text{span}\{m_i\}_{i=1}^n$，其中
$$
m_i(t)=l_i(t)=\prod_{j\neq i}^n\frac{t-t_j}{t_i-t_j}
$$
可得
$$
P_{M,\Lambda}=P_{n,\tau}=\|L_\tau (t)\|\ge 1
$$


其中 **Lebesgue 函数** $L_\tau (t)$ 为
$$
L_\tau (t)=\sum_{i=1}^n|l_i(t)|
$$

### 3.2.4 多项式插值节点的最优选择

设 $I=[-1,1],n=2k+1,t_i=\frac{i}{k}\ (i=-k,\dots,k)$，可得
$$
\lim_{n\to\infty} \|L_\tau (t)\|^{\frac{1}{n}}=2
$$
则 $\|P\|\sim 2^n$ 

设
$$
\text{sgn}\ l_j(t)=\alpha_{ij}\quad(t\in (t_i,t_{i+1}))
$$
则当 $t\in (t_i,t_{i+1})$ 时，
$$
L_\tau (t)=\sum_{j=1}^n\text{sgn}l_j(t)l_j(t)=\sum_{j=1}^n\alpha_{ij}l_j(t)\triangleq F_i(t)
$$
令
$$
\lambda_i=\|F_i\|_{[t_i,t_{i+1}]}=F_i(t_i^\prime)\quad(i=1,\dots,n-1)
$$
**引理 3.2** $F_i(t)$ 在 $(t_i,t_{i+1})$ 中仅有唯一的局部极大值

**引理 3.3** $\frac{\part \lambda_i}{\part t_j}=-F^\prime_i(t_j)l_j(t^\prime_i)$ 

**定理 3.6** 

(1) 存在唯一的 $\tau^*$ 使
$$
\lambda_1(\tau^*)=\dots=\lambda_{n-1}(\tau^*)=\lambda^*
$$
(2) 当 $\tau\neq \tau^*$ 时，总有
$$
\min_i\lambda_i(\tau)<\lambda^*<\max_i\lambda_i(\tau)
$$
其中 $\tau^*$ 是非线性方程组
$$
\left\{\begin{array}{ll}
F_i(t_i)=F_{i-1}(t_{i-1})&i=2,\dots,n-1\\
F_i^\prime(t_i)=0&i=1,\dots,n-1
\end{array}\right.
$$
的解

---

$\tau^e$ 是 $[a,b]$ 上扩充的 Tchebycheff 点，有
$$
\|L_{n,\tau^e}\|\sim\frac{2}{\pi}\ln n+0.6
$$
其中
$$
t^e_i=\frac{1}{2}\left((a+b)+(a-b)\frac{\cos\left(\frac{2i-1}{2n}\pi\right)}{\cos\left(\frac{\pi}{2n}\right)}\right)\quad(i=1,\dots,n)
$$
虽然 $\lim_\limits{n \to \infty}\|P_{n,\tau^e}\|=\infty$，但因为阶为 $\ln n$，所以趋于无穷的速度不快。因而从逼近阶的角度，扩充的 Tchebycheff 插值节点 $\tau^e$ 可作为近似的最优插值节点

## 3.3 从 $\overset{\circ}{C}$ 到 $\overset{\circ}{\mathcal{P}}_n$ 的极小投影

令
$$
\overset{\circ}{\mathcal{P}}_n \triangleq\text{span}\{1,\sin rt,\cos rt\}_{r=1}^n
$$
为 $2n + 1$ 维的三角多项式空间，为方便起见，记
$$
\overset{\circ}{\mathcal{P}}_n\triangleq\text{span}\{e_r\}_{r=-n}^n,e_r\triangleq e^{\sqrt{-1}rt}
$$
系数可为复数，$\overset{\circ}{C}$ 表示连续的周期为 $2\pi$ 的函数空间，显然 $\dim \overset{\circ}{\mathcal{P}}_n=2n+1$，$\overset{\circ}{\mathcal{P}}_n\subset \overset{\circ}{C}$，定义线性投影算子 $S_n:\overset{\circ}{C}\mapsto\overset{\circ}{\mathcal{P}}_n$，如下
$$
S_nf=\sum _ { r = - n } ^ { n } \left( \frac { 1 } { 2 \pi } \int _ { - \pi } ^ { \pi } f \cdot e _ { - r } \mathrm { d } t \right) e _ { r }
$$

为函数 $f$ 的 Fourier 级数前 $2n+1$ 项的部分和，可知
$$
\begin{aligned} S _ { n } ( f ) & = \frac { 1 } { 2 \pi } \int _ { - \pi } ^ { \pi } f \mathrm { d } t + \frac { 1 } { 2 \pi } \sum _ { r = 1 } ^ { n } \left( \int _ { - \pi } ^ { \pi } f \mathrm { e } ^ { - \sqrt { - 1 } r s } \mathrm { d } s \cdot \mathrm { e } ^ { \sqrt { - 1 } r t } + \int _ { - \pi } ^ { \pi } f \mathrm { e } ^ { \sqrt { - 1 } r s } \mathrm { d } s \cdot \mathrm { e } ^ { - \sqrt { - 1 } r t } \right) \\ & = \frac { 1 } { 2 \pi } \int _ { - \pi } ^ { \pi } f \mathrm { d } t + \frac { 1 } { 2 \pi } \sum _ { r = 1 } ^ { n } \left( \int _ { - \pi } ^ { \pi } f \cdot \left( \mathrm { e } ^ { - \sqrt { - 1 } r ( s - t ) } + \mathrm { e } ^ { \sqrt { - 1 } r ( s - t ) } \right) \mathrm { d } s \right) \\ & = \frac { 1 } { 2 \pi } \int _ { - \pi } ^ { \pi } f \mathrm { d } t + \frac { 1 } { \pi } \sum _ { r = 1 } ^ { n } \int _ { - \pi } ^ { \pi } f \cdot \cos ( s - t ) \mathrm { d } s \\ & = \frac { 1 } { 2 \pi } \int _ { - \pi } ^ { \pi } f \mathrm { d } t + \frac { 1 } { \pi } \sum _ { r = 1 } ^ { n } \left( \int _ { - \pi } ^ { \pi } f \cos r t \mathrm { d } t \cdot \cos r t + \int _ { - \pi } ^ { \pi } f \sin r t \mathrm { d } t \cdot \sin r t \right) \end{aligned}
$$
**定理 3.7** $S_n$ 是从 $\overset{\circ}{C}$ 到 $\overset{\circ}{\mathcal{P}}_n$ 的极小投影，且
$$
\|S_n\|=\frac{4}{\pi^2}\ln n+O(1)
$$

## 3.4 从 $C[a,b]$ 到 $\mathcal{P}_n$ 的线性投影算子的下界

$$
\|P\|\ge\frac{2}{\pi^2}\ln n+O(1)
$$

用 $\overset{\circ}{C}_E\triangleq \{f\in \overset{\circ}{C}:f(-t)=t\}$ 表示周期为 $2\pi$ 的偶的连续函数空间

## 3.5 线性投影算子的收敛性质

**定理 3.10** 设 X 是 Banach 空间，$\{P_n\}$ 是从 $X\to M_n$ 的线性投影算子序列，$\text{range} P_n=M_n$，则
$$
\lim_\limits{n \to \infty} \|P_n-I\|=0
$$
（即对 $\forall x\in X$，$\|P_n-O\|\to 0$）当且仅当 $\|P_n\|$ 一致有界，且 $\lim M_n=X$，其中 $\lim M_n\triangleq \{x\in X,d(x,M_n)\to 0\}$

# 4. 多项式的性质和平滑模

## 4.1 多项式的性质

### 4.1.1 Bernstein 不等式

**定理 4.1**（Bernstein 不等式） $\forall f \in \overset{\circ}{\mathcal{P}}_n=\text{span}\{1,\sin rt, cos rt\}_{r=1}^n$，都有 $\|f^\prime\|_\infty\le n \|f\|_\infty$ 

**推论 4.1** 对于 $p\in\mathcal{P}_{n+1}$，$\|p\|_{[-1,1]} \le M$，我们有
$$
|p^\prime(t)|\le\frac{nM}{\sqrt{1-t^2}}
$$
其中 $-1<t<1$ 

当 $p(t)=T_n(t)=\cos(n\arccos t)$ 时能取到等号，此时 $M=1$，有
$$
|T^\prime_n(t)|=\frac{n|\sin(n\arccos t)|}{\sqrt{1-t^2}}\le\frac{n}{\sqrt{1-t^2}}
$$
且可取到等号

**推论 4.2** 对于复系数的三角多项式
$$
T_n(t)=\sum_{k=0}^nc_k e^{\sqrt{-1}kt}
$$
我们有
$$
\|T^\prime_n\|\le n\|T_n\|
$$
**推论 4.3** 对于圆 $|z|\le 1$ 内复系数多项式 $p_n(z)=\sum_{k=0}^na_kz^k$，令
$$
\|p_n\|\triangleq\max_\limits{|z|\le 1}|p_n(z)|
$$
则
$$
\|p^\prime_n\|\le n\|p_n\|
$$

### 4.1.2 Markov 不等式

**定理 4.2** 设 $p\in \mathcal{P}_n$ 是 $[-1,1]$ 上 $n-1$ 次多项式，若 $\|\sqrt{1-t^2}p(t)\|\le M$，则 $\|p\|\le nM$ 

**定理 4.3**（Markov 不等式）设 $p_n\in \mathcal{P}_{n+1}$，且在 $[-1,1]$ 中 $\|p_n\|\le M$，则 $\|p^\prime_n(t)\|\le n^2M$ 

当 $p_n(t)=T_n(t)=\cos(n\arccos t)$ 时，定理 4.3 不等式等号成立。$M=1$，且
$$
T_n^\prime(1)=n\lim_\limits{\theta\to 0}\frac{\sin n\theta}{\sin \theta}=n^2
$$

## 4.2 连续模

**定义 4.1** 设 $f\in C(I)$，$\rho(t_1,t_2)$ 为 $t_1$ 和 $t_2$ 之间的距离，其中 $t_1,t_2\in I$，函数
$$
\omega_f(h)\triangleq\sup_\limits{\rho(t_1,t_2)\le h}|f(t_1)-f(t_2)|
$$
是从 $[0,+\infty)$ 到 $[0,+\infty)$ 的映射，称为函数 $f$ 的连续模，不致歧义时记为 $\omega(h)$ 

**性质** 

- $\lim_\limits{h\to 0^+}\omega(h)=\omega(0)=0$ 
- $\omega(h)$ 单调上升
- $\omega(h_1+h_2)\le\omega(h_1)+\omega(h_2)$，即次可加性
- $\omega_{f_1+f_2}(h)=\omega_{f_1}(h)+\omega_{f_2}(h)$ 
- $\forall n \in \mathbb{Z}^+,\omega(nh)\le n \omega(h)$ 
- $\forall \lambda >0,\omega(\lambda h)\le(\lambda+1)\omega(h)$ 
- $\omega(h)$ 是连续函数
- $f\in \text{Lip}_M \alpha \Leftrightarrow \omega_f(h)\le Mh^\alpha$ （$f\in \text{Lip}_M\alpha$ 就是 $\forall t_1,t_2,|f(t_1)-f(t_2)|\le M|t_1-t_2|^\alpha$）
- 若 $f\neq \text{C}$，则 $\lim_\limits{h\to 0}\frac{\omega_f(h)}{h}>0$ 

## 4.3 平滑模

**定义 4.2** 函数 $f$ 在区间 $I$ 上的 $r$ 阶平滑模定义为
$$
\omega_{I,r,f}(h)\triangleq\sup_\limits{0\le s\le h}\|\Delta_s^rf(t)\|_{\infty(I)}
$$
不致歧义时，记为 $\omega_r(h)$。$\omega_r(0)=0$ 

**性质** 

- $\omega_r(h)$ 单调增
- $\omega_{r,f_1+f_2}(h)\le\omega_{r,f_1}(h)+\omega_{r,f_2}(h)$ 
- $\omega_{r,f}(h) \le 2^j\omega_{r-j,f}(h)$，特别地，$\omega_{r,f}(h)\le 2^r \|f\|_\infty$ 
- $\forall k \in \mathbb{Z}^+,\omega_r(kh)\le k^r\omega_{r}(h)$；$\forall \lambda>0,\omega_r(\lambda h)\le (\lambda+1)^r\omega_r(h)$ 
- $\forall f \in C^{(j)}[a,b](0\le j\le r-1),\omega_{r,f}(h)\le h^j\omega_{r-j,f^{(j)}}(h)$；$\forall f\in C^{(r)}[a,b],\omega_{r,f}(h)\le h^r\|f^{(r)}\|_\infty$ 
- 若 $\omega_{r,f}(h) > 0(h>0)$，则 $\lim_\limits{h\to 0}\frac{\omega_{r,f}(h)}{h^r}>0$ 
- 若 $f \in C^{(r)}[a,b]$，则 $\lim_\limits{h\to 0}\frac{\omega_{r,f}(h)}{h^r}=0\Leftrightarrow f\in \mathcal{P}_r$ 

# 5. 最佳逼近的定量理论

## 5.1 周期函数类上最佳逼近的正逆定理

**定理 5.1** 对任意 $f\in \overset{\circ}{C}$ 以及任意 $\epsilon > 0$，都存在三角多项式 $T$，使得 $\|f-T\| < \epsilon$ 

记 $E_n(f)=d(f,\overset{\circ}{\mathcal{P}}_n)$ 

### 5.1.1 Jackson 型定理

$E_n(f)$ 是难以计算的，一般估计它的上界，取一个线性算子 $L_n$，用 $L_n(f)$ 来逼近 $f$ 
$$
L_n(f)\triangleq (L_n\star f)(t)
$$
引入 Jackson 核
$$
J_n(t)=F_n^2(t)=\left(\frac{\sin \frac{n}{2}t}{\sin \frac{t}{2}}\right)^4
$$
令 $\lambda_n\triangleq \int_{-\pi}^\pi J_n(t) \mathrm{d}t$，$L_n(t)=\frac{J_n(t)}{\lambda_n}$ 

**引理 5.1** $L_n(t)$ 满足如下性质

1. $L_n(t)=L_n(-t)$ 
2. $\int_{-\pi}^\pi L_n(t)=1$，由 1 得 $2\int_0^\pi L_n(t)=1$ 
3. $L_n(t) \in \overset{\circ}{\mathcal{P}}_{2n-2}$ 
4. $\int_0^\pi (ns+1)^2L_n(s)\mathrm{d}s = O(1)$ 

**定理 5.2**（Jackson-Zygmund） $\exist M$，$\forall f \in \overset{\circ}{C}$，有
$$
d(f,\overset{\circ}{\mathcal{P}}_n)\le M\omega_2\left(f,\frac{1}{n}\right)
$$
广义 Jackson 核
$$
J_{n,r}(t)\triangleq F_n^r(t)
$$
设 $\lambda_{n,r}=\int_{-\pi}^\pi J_{n,r}(t)\mathrm{d}t$，$L_{n,r}(t)=J_{n,r}(t)/\lambda_{n,r}$ 

**引理 5.2** $L_{n,r}$ 有如下性质

1. $L_{n,r}(t)=L_{n,r}(-t)$ 
2. $\int_{-\pi}^\pi L_{n,r}(t)\mathrm{d}t=1$ 
3. $L_{n,r}(t)\in \overset{\circ}{\mathcal{P}}_{r(n-1)}$ 
4. $\int_0^\pi t^k L_{n,r}(t)\mathrm{d}t=O(n^{-k})(1\le k \le 2r-2)$ 

**引理 5.3** 
$$
\int_{-\pi}^\pi L_{\lceil n/r \rceil,r}(s)f(t+ks)\mathrm{d}s \in \overset{\circ}{\mathcal{P}}_n\quad(k=1,\dots,r)
$$
**定理 5.3**（Jackson-Stechkin 定理）$\forall r \in \mathbb{Z}^+$，$\forall f \in \overset{\circ}{C}$，$\exist C_r$，使得
$$
d(f,\overset{\circ}{\mathcal{P}}_n)\le C_r\omega_r\left(f,\frac{1}{n}\right)
$$

### 5.1.2 Bernstein 逆定理

**定理 5.4** 设 $\varphi(u)$ 为单调下降的非负函数，序列 $0<u_k\le u_{k+1}\le\dots\le u_l$ 满足 $2\le u_i/u_{i-1}\le 4\quad(i=k+1,k+2,\dots,l)$，则 $\forall p \in \mathbb{R}$，$\exist M_p$，满足
$$
\sum _ { i = k } ^ { l } u _ { i } ^ { p } \varphi \left( u _ { i } \right) \leqslant M _ { p } \sum _ { \left[ \frac { 1 } { 2 } u _ { k } \right] \leqslant n < u _ { l } } ( n + 1 ) ^ { p - 1 } \varphi ( n )
$$

**推论 5.1** 
$$
\sum _ { i = k } ^ { l } \left( 2 ^ { i } \right) ^ { p } \varphi \left( 2 ^ { i } \right) \leqslant M _ { p } \sum _ { \lfloor 2 ^ { k - 1 } \rfloor \leqslant n < 2 ^ { l }} ( n + 1 ) ^ { p - 1 } \varphi ( n )
$$

**定理 5.5**（Bernstein 逆定理）$\exist M_p$，$\forall f \in \overset{\circ}{C},h>0$，有
$$
\omega _ { p } ( f , h ) \leqslant M_p h ^ { p } \sum _ { 0 \leqslant n \leqslant h^{-1} } ( n + 1 ) ^ { p - 1 } d ( f , \overset{\circ} { \mathcal { P } } _ { n } )
$$
**推论 5.2**（Bernstein）设 $0<\alpha <1$，则 $d(f,\overset{\circ}{\mathcal{P}}_n)=O(n^{-\alpha}) \Leftrightarrow \omega(f,h)=O(h^\alpha)$ 

**推论 5.3** $d(f,\overset{\circ}{\mathcal{P}}_n)=O(n^{-1}) \Leftrightarrow \omega_2(f,h)=O(h)$ 

**定理 5.6** 设整数 $p\ge 1$，
$$
\sum_{n=1}^\infty n^{p-1}E_n(f)<\infty
$$
则 $f\in \overset{\circ}{C}^{(p)}$，且
$$
d \left( f ^ { ( p ) } , \overset{\circ} { \mathcal { P } } _ { n } \right) \leqslant M _ { p } \sum _ { k = \left[ \frac { m } { 2 } \right] } ^ { \infty } k ^ { p - 1 } E _ { k } ( f )
$$

**推论 5.4** 设 $0<\alpha<1$，则
$$
f\in \overset{\circ}{\text{Lip}}_\alpha^{(p)}\triangleq\{f\in \overset{\circ}{C}^{(p)} : f^{(p)}\in \text{Lip} \alpha\} \Leftrightarrow d(f,\overset{\circ}{\mathcal{P}}_n)=O\left(\frac{1}{n^{p+\alpha}}\right)
$$

## 5.2 代数多项式的逼近阶

### 5.2.1 Jackson 定理

约定 $[a,b]=[-1,1],f\in C[-1,1]$ 

**定理 5.7** 存在常数 $M$ 使得对任意 $f\in C[-1,1]$，都有
$$
d(f,\mathcal{P}_n)\le M\omega_f\left(\frac{1}{n}\right)
$$

>其实可证明
>$$
>d(f,\mathcal{P}_n)\le M\omega_{p,f}\left(\frac{1}{n}\right)
>$$

### 5.2.2 Nikolsky-Timan 定理

端点比中间逼近更好
$$
\Delta_n(t)\triangleq \max\left(\frac{\sqrt{1-t^2}}{n},\frac{1}{n^2}\right)
$$
**定理 5.8** [TODO]

**定理 5.9**（Nikolsky-Timan 定理）存在常数 $M$，对任意 $f\in C[-1,1]$，都有多项式 $p_n(t)\in \mathcal{P}_{n+1}$，使得
$$
|f(t)-p_n(t)|\le M\omega(f,\Delta_n(t))\quad(t\in [-1,1];n=0,1,\dots)
$$

## 5.3 代数多项式的点态逆定理

**定理 5.10** 设 $p_n(t)\in \mathcal{P}_{n+1}$ 且满足
$$
|p_n(t)|\le \Delta_n^r(t)\omega(\Delta_n(t))\quad (|t|\le 1;r=0,1,\dots)
$$
则存在常数 $M_r$ 满足
$$
|p_n^\prime(t)|\le M_r\Delta_n^{r-1}(t)\omega(\Delta_n(t))
$$
**定理 5.11** 设 $f\in C[-1,1]$，$p_n(t)\in \mathcal{P}_{n+1}(n=0,1,\dots)$，若
$$
|f(t)-p_n(t)|\le \omega(\Delta_n(t))\quad (|t|\le 1)
$$
则存在 $M$ 使得
$$
\omega_f(h)\le Mh\sum_{1\le n\le \frac{1}{h}}\omega_f\left(\frac{1}{n}\right)
$$
**定理 5.12** 若 $\omega$ 是使
$$
\sum_{n=1}^\infty\frac{1}{n}\omega\left(\frac{1}{n}\right)<\infty
$$
的连续模，且若对于 $f\in C[-1,1]$ 和 $n$ 次多项式 $p_n(x)(n=0,1,\dots)$，有
$$
|f(x)-p_n(x)|\le M\Delta_n^m(x)\omega(\Delta_n(x))\quad (|x|\le 1)
$$
则 $f$ 有连续导数 $f^{(1)},\dots,f^{(m)}$，且
$$
|f^{(m)}(x)-p_n^{(m)}(x)|\le M_m\sum_{k\ge \lfloor\Delta_n^{-1}(x)\rfloor}\frac{1}{k}\omega_f\left(\frac{1}{k}\right)
$$
**定理 5.13** 设 $0<\alpha<1,m=0,1,\dots$，且 $f\in C[-1,1]$，则存在多项式序列 $\{p_n(x)\}$ 满足
$$
|f(x)-p_n(x)|=O(\Delta_n^{m+\alpha})
$$
的充要条件为 $f^{(1)},\dots,f^{(m)}$ 存在，且 $f^{(m)}\in \text{Lip}(\alpha)$ 

# 6. 最小平方逼近

本章考虑内积空间中的逼近问题，范数为
$$
\|f\|_2=\sqrt{\int_T |f(t)|^2\rho(t)\mathrm{d}t}
$$
一般可把 $\cdot_2$ 忽略，写成 $\|f\|$ 

其中 $\rho(t)>0$ 是**权函数**（如果没提权函数是什么，就默认 $\rho(t)=1$）

向量 $x$ 与空间 $M$ 垂直 $x\perp M$ 指 $\forall m \in M$，$\langle x,m\rangle = 0$ 

对向量 $x$ 进行标准化 $\hat{x} \triangleq x/\|x\|=x/\sqrt{\langle x,x\rangle}$ 

向量 $x$ 在向量 $y$ 上的投影 $\text{proj}(x,y)$ 为

$$
\begin{aligned}
\text{proj}(x,y)
&= \langle x, \hat{y}\rangle\hat{y} \\
&= \left\langle x, \frac{y}{\|y\|}\right\rangle\frac{y}{\|y\|} \\
&= \frac{\langle x,y\rangle}{\langle y,y\rangle} y \\
\end{aligned}
$$

## 6.1 最佳逼近

**定理 6.1** 设 $X$ 是 Hilbert 空间，$M\subset X$ 是闭线性子空间（闭凸集），则 $\forall x \in X$，$\#B_M(x)=1$ 

**定理 6.2** 设 $X$ 是 Hilbert 空间，$M$ 是 $X$ 的子空间，$x\in X$，$m^*\in M$，则 $m^*\in \mathcal{B}_M(x) \Leftrightarrow (x-m^*)\perp M$ 

**推论 6.1** $M$ 是闭的线性子空间 $\Rightarrow$ 距离投影算子 $P_M$ 是线性算子，且 $\|P_M\|=1$ 

**计算** $P_Mx$ 

设 $M\triangleq \text{span}\{m_i\}_{i=1}^n$，$m^*=P_Mx$，则 $\exist \pmb{\alpha}=\left[\begin{matrix}\alpha_1\\\vdots\\\alpha_n\end{matrix}\right] \in \mathbb{R}^n$，使得
$$
m^*=\sum_{j=1}^n\alpha_jm_j
$$
且 $x-P_Mx\perp M$，即
$$
\left\langle m_i,x-m^* \right\rangle=0 \quad(i=1,2,\dots,n)
$$
即
$$
\sum_{j=1}^n\left\langle m_i,m_j \right\rangle \alpha_j = \left\langle   m_i,x \right\rangle\quad(i=1,2,\dots,n)
$$
令 $G\triangleq \{\left\langle m_i,m_j \right\rangle\}_{i,j=1}^n$ 为 Gram 矩阵，$\pmb{b}=\{\left\langle m_i,x \right\rangle\}_{i=1}^n$，则上述方程组可写为 $G\pmb{\alpha}=\pmb{b}$。其中 $G$ 是对称正定阵，可分解为 $G=LDL^\top$，其中 $L$ 为下三角阵，$D$ 为对角阵。则 $G\pmb{\alpha}=\pmb{b}$ 等价于
$$
\left\{\begin{array}{l}
L\beta=\pmb{b},\\
L^\top\alpha = D^{-1}\beta
\end{array}\right.
$$
由于 $L$ 为三角阵，很容易解出 $\beta$ 和 $\alpha$ 

## 6.2 正交函数系

设 $\{\varphi_i\}_{i=1}^\infty$ 是规范的正交函数系，即
$$
\left\langle \varphi_i,\varphi_k \right\rangle = \int_a^b \rho(t)\varphi_i(t)\varphi_k(t)\mathrm{d}t = \delta_{ik}
$$
$\forall f \in L_{2,\rho}[a,b]$，令
$$
c_k=\left\langle f,\varphi_k \right\rangle=\int_a^b\rho(t)f(t)\varphi_k(t)\mathrm{d}t
$$
则称
$$
\sum_{k=1}^\infty c_k\varphi_k(t)
$$
为 $f$ 的**形式上**的 Fourier 级数，而
$$
S_n(f)\triangleq\sum_{k=1}^n c_k \varphi_k
$$
称为 $f$ 的 Fourier 级数前 n 项的和

**引理 6.1** 

(1)
$$
\left\|f-S_n(f)\right\|_2=\min_\limits{\pmb{\alpha}\in \mathbb{R}^n} \left\|f-\sum_{k=1}^n a_k\varphi_k\right\|_2
$$

(2) 若数列 $\{c_k\}_{k=1}^\infty$ 满足
$$
\sum_{k=1}^\infty c_k^2 < + \infty
$$

则在 $L_{2,\rho}$ 中存在唯一的函数 $f(t)$ 使 $c_k=\left\langle f,\varphi_k \right\rangle$，且
$$
\lim_\limits{n\to \infty}\left\|f-\sum_{k=1}^nc_k\varphi_k\right\|_2\to 0
$$

内积空间中任意一组线性无关的函数系都可以通过 **Schmidt 正交化** 得到等价的规范正交系

**引理 6.2** 设 $\omega_1(t),\dots,\omega_n(t),\dots$ 是 $L_{2,\rho}[a,b]$ 中一组线性无关函数系（数目有限或可数），再设 $\psi_1(t)=\omega_1$，
$$
\psi _ { n } ( t ) = \left| \begin{array} { c c c c } { \left\langle \omega _ { 1 } , \omega _ { 1 } \right\rangle } & { \cdots } & { \left\langle \omega _ { 1 } , \omega _ { n - 1 } \right\rangle } & { \omega _ { 1 } } \\ { \left\langle \omega _ { 2 } , \omega _ { 1 } \right\rangle } & { \cdots } & { \left\langle \omega _ { 2 } , \omega _ { n - 1 } \right\rangle } & { \omega _ { 2 } } \\ { \vdots } & { } & { \vdots } & { \vdots } \\ { \left\langle \omega _ { n } , \omega _ { 1 } \right\rangle } & { \cdots } & { \left\langle \omega _ { n } , \omega _ { n - 1 } \right\rangle } & { \omega _ { n } } \end{array} \right|
$$
以及 $\Delta_0\triangleq 1$，$\Delta_m\triangleq G(\omega_1,\dots,\omega_n)\triangleq \det\left(\left\{\left\langle \omega_i,\omega_j \right\rangle\right\}_{i,j=1}^n\right)$，其中 $G$ 称为 $\omega_1,\dots,\omega_n$ 的 Gram 行列式，则
$$
\varphi_k(t)=\frac{\psi_k(t)}{\sqrt{\Delta_k\Delta_{k-1}}}\quad(k\ge 1)
$$
是一组规范正交系，且
$$
\text{span}\{\varphi_i\}_{i=1}^k=\text{span}\{\omega_i\}_{i=1}^k\triangleq M_k\quad (k=1,2,\dots)
$$

**定理 6.3**（Gram 定理）设 $M_n\triangleq \text{span}\{f_i\}_{i=1}^n$ 是内积空间 $H$ 中的 $n$ 维子空间，则 $\forall g\in H$，都有
$$
d^2(g,M_n)\triangleq d^2=\frac{G(f_1,\dots,f_n,g)}{G(f_1,\dots,f_n)}
$$

**推论 6.2** 若 $\{f_i\}_{i=1}^n$ 线性无关，则 $G(f_1,\dots,f_n)>0$ 

**推论 6.3** $\forall m < n$，有
$$
G(f_1,\dots,f_n)\le G(f_1,\dots,f_m)G(f_{m+1},\dots,f_n)
$$
且等号成立的充要条件为
$$
\left\langle f_k,f_i \right\rangle=0\quad 
(k=1,\dots,m;i=m+1,\dots,n)
$$

由以上推论进一步可知道，对于线性无关组 $\{f_i\}_{i=1}^n$，有
$$
G(f_1,\dots,f_n)\le\left\langle f_1,f_1 \right\rangle \dots \left\langle f_n,f_n \right\rangle
$$
且等号成立的条件为 $\left\langle f_i,f_k \right\rangle = 0$（$i\neq k$ 且 $i,k=1,\dots,n$）

## 6.3 正交多项式的性质

多项式组 $\{t_i\}_{i=0}^\infty$ 经 Schmidt 正交化可得到规范正交多项式系 $\{\varphi_i(t)\}_{i=0}^\infty$，其中 $\varphi_0=\psi_0=1$，
$$
\varphi_k(t)=\frac{\psi_k(t)}{\sqrt{\Delta_k\Delta_{k-1}}}
$$
是 $k$ 次多项式

**定理 6.4** $\sqrt{\Delta_k/\Delta_{k-1}}\varphi_k(t)$ 是首项系数为 $1$ 的 $k$ 次多项式，它使积分
$$
\left\langle p,p \right\rangle = \int_a^b \rho(t)p^2(t)\mathrm{d}t
$$

在所有首项系数为 $1$ 的 $k$ 次多项式中达到极小

**定理 6.5** 设 $\{p_n(t)\}_{n=0}^\infty$ 是区间 $[a,b]$ 上关于权 $\rho(t)$ 的正交多项式系，$\deg(p_n(t))=n$，又设 $f\in C[a,b]$，且 $\left\langle f,p_i \right\rangle = 0\quad(i=0,\dots,n-1)$，则 $f$ 在 $(a,b)$ 中至少变号 $n$ 次或者恒等于 $0$ 

 

**推论 6.4** 设 $\{\varphi_n(t)\}_{n=0}^\infty$ 是 $[a,b]$ 上关于权 $\rho(t)$ 正交的多项式函数系，则 $\varphi_n(t)$ 的零点全部是单重的，且都在 $(a,b)$ 中

**推论 6.5** 设 $\{\varphi_n(t)\}_{n=0}^\infty$ 是 $[a,b]$ 上关于权 $\rho(t)$ 正交的多项式函数系，记 $M_n\triangleq\text{span}\{\varphi_i\}_{i=0}^n$，$\varphi(t)=\sum_{i=0}^n c_i\varphi_i(t)$ 从 $M_n$ 对连续函数 $f$ 的最小平方逼近，则 $\varphi$ 在 $[a,b]$ 中至少 $n+1$ 个点上插值与 $f$ 

**定理 6.6** (1) 和 (2) 等价

(1) $\{p_n(t)\}_{n=0}^\infty$ 是首相系数为 1 的正交多项式系，如
$$
\left\{ p _ { n } ( t ) = \sqrt { \frac { \Delta _ { n } } { \Delta _ { n - 1 } } \varphi _ { n } ( t ) } \right\} _ { n = 0 } ^ { \infty }
$$
(2) 递推关系
$$
\begin{array} { l } { p _ { n } ( t ) = \left( t - a _ { n } \right) p _ { n - 1 } ( t ) - b _ { n } p _ { n - 2 } ( t ) } \\ { p _ { 0 } = 1 , \quad p _ { 1 } = t - a _ { 1 } } \end{array}
$$
其中
$$
a _ { n } = \frac { \left\langle t p _ { n - 1 } , p _ { n - 1 } \right\rangle } { \left\langle p _ { n - 1 } , p _ { n - 1 } \right\rangle } , \quad b _ { n } = \frac { \left\langle t p _ { n - 1 } , p _ { n - 2 } \right\rangle } { \left\langle p _ { n - 2 } , p _ { n - 2 } \right\rangle }
$$
在实际中当我们需要计算正交多项式系时，采用的就是 **定理 6.6** 中的三项递推关系式，而不是用定义式
$$
p_n(t)=\sqrt{\frac{\Delta_n}{\Delta_{n-1}}}\varphi_n(t)
$$
**定理 6.7** 设 $\{p_n(t)\}_{n=0}^\infty$ 是首项系数为 1 的区间 $[a,b]$ 上的正交多项式系，则 $p_n(t)$ 和 $p_{n-1}(t)$ 的零点必互相交错

人们常常希望用函数 $f$ 在 $n$ 个点的值的线性组合来逼近积分，即
$$
\int_a^b f(t) \mathrm{d}t \approx \sum_{k=1}^n A_k f(t_k)
$$
其中 $\{t_i\}_{i=1}^n$ 是 $[a,b]$ 中的点。Lagrange 插值多项式
$$
L(t) = \sum_{k=1}^n f(t_k)l_k(t)
$$
则
$$
\int _ { a } ^ { b } f ( t ) \rho ( t ) \mathrm { d } t \approx \sum _ { k = 1 } ^ { n } f \left( t _ { k } \right) \int _ { a } ^ { b } l _ { k } ( t ) \rho ( t ) \mathrm { d } t \triangleq \sum _ { k = 1 } ^ { n } A _ { k } \cdot f \left( t _ { k } \right)
$$
其中 $\{A_k\}$ 仅与 $\{t_k\}$ 和 $\rho(t)$ 有关，与 $f(t)$ 无关。当 $f$ 为小于 $n$ 次的多项式时，近似公式为等式。

Guass 发现当 $\{t_i\}_{i=1}^n$ 设置巧妙时，上述近似积分对所有次数小于 $2n$ 的多项式都准确

**定理 6.8** 设积分公式
$$
\int _ { a } ^ { b } f ( t ) \rho ( t ) \mathrm { d } t \approx  \sum _ { k = 1 } ^ { n } A _ { k } f \left( t _ { k } \right)
$$
对所有次数小于 $n$ 次的多项式准确，则该积分公式对所有次数小于 $2n$ 次的多项式 $f$ 准确的充要条件是 $\{t_i\}_{i=1}^n$ 是 $p _ { n } ( t ) = \sqrt{\frac{\Delta_n}{\Delta_{n-1}}} \varphi _ { n } ( t )$ 的零点

**定理 6.9**（Stieltjes 定理）设 $f\in C[a,b]$，则对 Gauss 型积分公式
$$
\int _ { a } ^ { b } f ( t ) \rho ( t ) \mathrm { d } t \approx  \sum _ { k = 1 } ^ { n } A _ { nk } f \left( t _ { nk } \right)
$$
有
$$
\lim _ { n \rightarrow \infty } \sum _ { k = 1 } ^ { n } A _ { n k } f \left( t _ { n k } \right) = \int _ { a } ^ { b } f ( t ) \rho ( t ) \mathrm { d } t
$$

## 6.4 正交展开的收敛性

设 $\{\varphi_n\}_{n=0}^\infty$ 是 $[a,b]$ 上标准正交多项式，$\deg \varphi_n = n$，定义
$$
S_nf\triangleq\sum_{k=0}^n\left\langle f,\varphi_k \right\rangle\varphi_k
$$
已知 $\forall f \in L_{2,\rho}[a,b]$ 有
$$
\lim_\limits{n\to\infty}\|S_nf-f\|_2=0
$$
但 $\exist f$ 使得
$$
\lim_\limits{n\to\infty}\|S_nf-f\|_\infty\neq 0
$$
本节考虑一致逼近时 $f$ 需要满足的条件
$$
\lim_\limits{n\to\infty}\|S_nf-f\|_\infty = 0
$$
将 $S_nf$ 表示为积分算子的形式
$$
\begin{aligned} S _ { n } f ( t ) & = \sum _ { i = 0 } ^ { n } \left\langle f , \varphi _ { i } \right\rangle \varphi _ { i } = \int _ { a } ^ { b } f ( s ) \sum _ { i = 0 } ^ { n } \varphi _ { i } ( s ) \varphi _ { i } ( t ) \rho ( s ) \mathrm { d } s \\ & = \int _ { a } ^ { b } f ( s ) K _ { n } ( s , t ) \rho ( s ) \mathrm { d } s \end{aligned}
$$
其中
$$
K _ { n } ( s , t ) = \sum _ { i = 0 } ^ { n } \varphi _ { i } ( s ) \varphi _ { i } ( t )
$$
称为规范正交系的核

设 $\varphi_n(t)$ 中 $t^n$ 的系数为 $\lambda_n^{-1}$，则 $p_n(t)=\lambda_n\varphi_n(t)$ 是首项系数为 1 的正交多项式系

**定理 6.10**（Christoffe-Darboux 定理）
$$
\sum _ { i = 0 } ^ { n } \varphi _ { i } ( s ) \varphi _ { i } ( t ) = \lambda _ { n + 1 } \lambda _ { n } ^ { - 1 } \frac { \varphi _ { n + 1 } ( t ) \varphi _ { n } ( s ) - \varphi _ { n } ( t ) \varphi _ { n + 1 } ( s ) } { t - s }
$$

**定理 6.11** 设 $t_0\in[a,b]$，若 $\varphi_n(t_0)$ 对 $n$ 一致有界，又设 $f\in C[a,b]$ 且在 $t_0$ 处满足 Lipschitz 条件，即 $|f(t)-f(t_0)|<\alpha|t-t_0|$，则
$$
f(t_0)=\sum_{n=0}^\infty\left\langle f,\varphi_n \right\rangle\varphi_n(t_0)
$$
**推论 6.6** 设 $f\in C[-1,1]$，且 $f$ 满足 Lipschitz 条件，即 $|f(t_1)-f(t_2)|\le\alpha|t_1-t_2|$，则
$$
f=\sum_{i=0}^\infty\left\langle f,T_i \right\rangle T_i(t)
$$
即 $\lim_\limits{n\to\infty}\|f-S_nf\|_\infty = 0$ 

