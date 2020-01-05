# 1. 赋范线性空间中的逼近问题引论

## 1.1 逼近问题的提出

## 1.2 最佳逼近元的存在唯一性

### 1.2.1 存在性

有限维子空间 / 列紧 $\Rightarrow$ 存在

### 1.2.2 凸

$M$ 凸 $\Rightarrow$ $\mathcal{B}_M(x)$ 凸

严格凸 $\Leftrightarrow$ $\forall x_1\neq x_2\in \part B_1,\left\|\frac{1}{2}(x_1+x_2)\right\|<1$ $\Leftrightarrow$ $\forall x_1\neq x_2\in X, \|x_1+x_2\|=\|x_1\|+\|x_2\|\Rightarrow \exist c>0,x_1=c x_2$ 

匀凸：$\forall x_1\neq x_2\in\part B_1,\forall \epsilon>0,\exist\delta>0,\left\|\frac{1}{2}(x_1+x_2)\right\|>1-\delta\Rightarrow \|x_1-x_2\|<\epsilon$ 

匀凸 $\Rightarrow$ 严格凸

内积空间 / 有限维严格凸 $\Rightarrow$ 匀凸

$A\subset \mathbb{R}^n \Rightarrow \forall a\in Co(A),\exist \{a_i\}_{i=1}^r\subset A,a=\sum_{i=1}^rc_ia_i\ (r\le n+1,c_i\ge 0,\sum_{i=1}^rc_i=1)$ 

$\exist x\in X,\forall a\in A,\langle a,x\rangle >0 \Leftrightarrow 0 \notin Co(A)$ 

### 1.2.3 唯一性

严凸 $X$，凸 $M$ $\Rightarrow$ 唯一

匀凸 Banach $X$，闭凸 $M$ $\Rightarrow$ T

## 1.3 表征定理

- 表征
  - $M$ 子空间：$\forall x\in X\backslash M,m^*\in \mathcal{B}_M(x)\Leftrightarrow \exist \lambda\in X^*,\|\lambda\|=1,\|e\|=\lambda e,\lambda\perp M$ （$\lambda\in (M\oplus \text{span}\{x\})^*$）
  - $M$ 闭凸集：$\forall x\in X\backslash M,m^*\in \mathcal{B}_M(x)\Leftrightarrow \exist \lambda\in X^*,\|\lambda\|=1,\|e\|=\lambda e,\lambda m^*=\sup_{m\in M} \lambda m$ 
- 对偶（$M$ 子空间）
  - $d(x,M)=\sup_\limits{\lambda\perp M,\|\lambda\|\le 1}|\lambda x|$ 
  - $d(\lambda,M^\perp)=\sup_\limits{m\in M,\|m\|\le 1}|\lambda m|$ 

## 1.4 距离投影算子

$P_M x = \mathcal{B}_M(x)$ 

$M$ 子空间 T 集，则

- $\text{range}P_M = M,P_M|_M = I$ 
- $P_M$ 是有界闭算子
- $M$ 列紧 $\Rightarrow$ $P_M$ 连续
- 伪线性
  - 齐次：$P_M(\alpha x)=\alpha P_M(x)$ 
  - 加法：$\forall m \in M,P_M(x+m)=P_M(x)+P_M(m)$ 

# 2. 一致逼近

$I$ 是一个紧的距离空间，$X=C(I)$ 表示定义在 $I$ 上的连续函数的全体，范数定义为
$$
\|f\|\triangleq\|f\|_\infty\triangleq\sup_\limits{t\in I}|f(t)|
$$

## 2.1 Weierstrass-Stone 定理

**定理 2.1** （Weierstrass-Stone 定理）$M(I)\subset C(I)$ 是 $C(I)$ 中子代数，$1 \in M, \forall t,s\in I,t\neq s,\exist f\in M(I),f(t)\neq f(s) \Rightarrow \overline{M}(I)=C(I)$ 

## 2.2 正线性算子理论

**推论 2.3** $\forall f\in C[a,b]$，有 $\lim_\limits{n\to\infty}L_nf=f$ $\Leftrightarrow$ 当 $f(t)=1,t,t^2$ 时，有 $\lim_\limits{n\to\infty} L_nf=f$ 

**推论 2.4** $\forall f\in C[0,1],\lim_\limits{n\to\infty} B_nf=f$，其中
$$
B_n(f,t)\triangleq\sum_{i=1}^nf\left(\frac{i}{n}\right)B_i^n(t)\\
B_i^n(t)=\binom{n}{i}t^i(1-t)^{n-i}
$$

## 2.3 广义多项式的一致逼近

$M\triangleq\text{span}\{m_i(t)\}_{i=1}^n\subset C(I)$，$\dim (M) = n$ 

### 2.3.1 最佳逼近的表征定理

**引理 2.2** $\exist \tau=(t_1,t_2,\dots,t_n)\in I^n,M^*=\text{span}\{[t_i]\}_{i=1}^n$，则 $\forall \lambda \in M^*,\exist \alpha\in \mathbb{R}^n$，有
$$
\lambda=\sum_{i=1}^n\alpha_i[t_i],\quad \|\lambda\|=\sum_{i=1}^n|\alpha_i|
$$

**定理 2.3**（$C(I)$ 中的表征定理）$\forall x \in X\backslash M,m^*\in M$，则 $m^*\in B_M(x)$ 当且仅当 $\exist \tau\in I^{n+1},\alpha\in \mathbb{R}^{n+1}$ 使得 $\lambda=\sum_{i=1}^{n+1}\alpha_i[t_i]$ 满足 $\|\lambda\|=1，\lambda\perp M,\lambda(x-m^*)=\|x-m^*\|$ 

**推论 2.5** $0\neq x(t)\in C(I)$，则下列命题等价，令 $e(t)=x(t)-m^*(t)$ 

(1) $m^* \in \mathcal{B}_M(x)$ 

(2) $\exist t_1,t_2,\dots,t_r\in E \ (1\le r\le n+1),\exist \alpha_1,\alpha_2,\dots,\alpha_r \in \mathbb{R}$，使得 $\text{sgn} \alpha_j=\text{sgn}e(t_j)(j=1,2,\dots,r)$，且 $\forall m \in M, \sum_{j=1}^r\alpha_j m(t_j)=0$（即泛函 $\sum_{j=1}^r\alpha_j[t_j] \perp M$）

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

# 3. 线性插值

## 3.1 线性插值问题

### 3.1.1 问题的提出

$M\triangleq \text{span}\{m_i(t)\}_{i=1}^n\subset X$，$\dim (M) = n$，$\{\lambda_i\}_{i=1}^n\subset X^*$，所谓**线性插值问题**，是指 $\forall x \in X$，求 $m=Px\in M$，满足
$$
\lambda_i(Px)=\lambda_ix\quad(i=1,2,\dots,n)
$$
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

**定理 3.3**（Lebesgue 不等式）
$$
|\mu(I-P_{M,\Lambda})x|\le d(\mu,\Lambda)\|I-P_{M,\Lambda}\|d(x,M)\quad(\forall \mu \in X^*,x\in X)
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
\overset{\circ}{\mathcal{P}}_n \triangleq\text{span}\{1,\sin rt,\cos rt\}_{r=1}^n=\text{span}\left\{e_r=e^{\sqrt{-1}rt}\right\}_{r=-n}^n
$$
$\overset{\circ}{C}$ 表示连续的周期为 $2\pi$ 的函数空间，显然 $\dim \overset{\circ}{\mathcal{P}}_n=2n+1$，$\overset{\circ}{\mathcal{P}}_n\subset \overset{\circ}{C}$，定义线性投影算子 $S_n:\overset{\circ}{C}\mapsto\overset{\circ}{\mathcal{P}}_n$ 如下
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

- $\forall \overset{\circ}{P}\in \text{proj}(\overset{\circ}{\mathcal{P}}_{n,E}),\|\overset{\circ}{\mathcal{P}}\|\ge\frac{2}{\pi^2}\ln n+O(1)$ 
- $\forall P\in \text{proj}(\mathcal{P}_{n+1}),\|P\|\ge\frac{2}{\pi^2}\ln n+O(1)$ 

## 3.5 线性投影算子的收敛性质

$\lim_\limits{n \to \infty} \|P_n-I\|=0\Leftrightarrow \|P_n\| 一致有界,\lim \text{range}P_n\triangleq \{x\in X:d(x,\text{range}P_n)\to 0\}=X$ 

# 4. 多项式的性质和平滑模

多项式的取值范围为 $[-1,1]$ 

## 4.1 多项式的性质

### 4.1.1 Bernstein 不等式

- $\forall f \in \overset{\circ}{\mathcal{P}}_n,\|f^\prime\|\le n \|f\|$ 
- $\forall p_n\in \mathcal{P}_{n+1},|p_n^\prime(t)|\le\frac{n\|p_n\|}{\sqrt{1-t^2}}$ 
- $T_n(t)=\sum_{k=0}^nc_ke^{\mathrm{i}kt},\|T_n^\prime\|\le n\|T_n\|$ 
- $p_n(z)=\sum_{k=0}^nc_kz^k,\|p_n^\prime\|\le n\|p_n\|$ 

### 4.1.2 Markov 不等式

- $\forall p\in \mathcal{P}_n,\|p\|\le \|\sqrt{1-t^2}p(t)\|$ 
- $\forall p_n\in \mathcal{P}_{n+1},\|p_n^\prime\|\le n^2\|p_n\|$ 

## 4.2 连续模

- $\omega_f(h)=\sup_\limits{\rho(t_1,t_2)\le h}|f(t_1)-f(t_2)|$ 
- $\omega_{f_1+f_2}(h)\le \omega_{f_1}(h)+\omega_{f_2}(h),\omega(h_1+h_2)\le \omega(h_1)+\omega(h_2)$ 
- $\omega(nh)\le n\omega(h),\omega(\lambda h)\le (\lambda + 1)\omega(h)$ 
- $f\in \text{Lip}_M \alpha \Leftrightarrow \omega_f(h)\le Mh^\alpha$ 

## 4.3 平滑模

- $\omega_{r,f,I}(h)=\sup_\limits{0\le s\le h}\|\Delta_s^rf(t)\|$ 
- $\omega_{r,f_1+f_2}(h)\le \omega_{r,f_1}(h)+\omega_{r,f_2}(h),\omega_{r}(h_1+h_2)\le \omega_{r}(h_1)+\omega_{r}(h_2)$ 
- $\omega_{r,f}(h) \le 2^j\omega_{r-j,f}(h)$ 
- $\omega_r(nh)\le n^r\omega_{r}(h),\omega_r(\lambda h)\le (\lambda+1)^r\omega_r(h)$ 
- $\forall f \in C^{(j)}[a,b](0\le j\le r),\omega_{r,f}(h)\le h^j\omega_{r-j,f^{(j)}}(h)$ 
- $\lim_\limits{h\to 0}\frac{\omega_{r,f}(h)}{h^r}=0\Leftrightarrow f\in \mathcal{P}_r$ 

# 5. 最佳逼近的定量理论

## 5.1 周期函数类上最佳逼近的正逆定理

$\forall f\in \overset{\circ}{C},\forall \epsilon >0,\exist T\in \overset{\circ}{\mathcal{P}},\|f-T\|<\epsilon$ 

### 5.1.1 Jackson 型定理

$d(f,\overset{\circ}{\mathcal{P}}_n)\le C_r\omega_{r,f}\left(\frac{1}{n}\right)$ 

### 5.1.2 Bernstein 逆定理

- $\omega _ { p,f } ( h ) \leqslant M_p h ^ { p } \sum _ { 0 \leqslant n \leqslant h^{-1} } ( n + 1 ) ^ { p - 1 } d ( f , \overset{\circ} { \mathcal { P } } _ { n } )$ 
- $d(f,\overset{\circ}{\mathcal{P}}_n)=O(n^{-\alpha}) \Leftrightarrow \omega_f(h)=O(h^\alpha)\ (0<\alpha<1)$ 
- $d(f,\overset{\circ}{\mathcal{P}}_n)=O(n^{-1}) \Leftrightarrow \omega_{2,f}(h)=O(h)$ 
- $f\in \overset{\circ}{\text{Lip}}_\alpha^{(p)}\triangleq\{f\in \overset{\circ}{C}^{(p)} : f^{(p)}\in \text{Lip} \alpha\} \Leftrightarrow d(f,\overset{\circ}{\mathcal{P}}_n)=O\left(\frac{1}{n^{p+\alpha}}\right)\ (0<\alpha<1)$ 

## 5.2 代数多项式的逼近阶

### 5.2.1 Jackson 定理

$d(f,\mathcal{P}_n)\le M\omega_{p,f}\left(\frac{1}{n}\right)$ 

### 5.2.2 Nikolsky-Timan 定理

- $\Delta_n(t)\triangleq \max\left(\frac{\sqrt{1-t^2}}{n},\frac{1}{n^2}\right)$ 
- $|f(t)-p_n(t)|\le M\omega_f(\Delta_n(t))$ 

## 5.3 代数多项式的点态逆定理

- $|p_n(t)|\le \Delta_n^r(t)\omega_{p_n}(\Delta_n(t)) \Rightarrow |p_n^\prime(t)|\le M_r\Delta_n^{r-1}(t)\omega_{p_n}(\Delta_n(t))$ 
- $|f(t)-p_n(t)|\le \omega_f(\Delta_n(t))\Rightarrow \omega_f(h)\le Mh\sum_{1\le n\le \frac{1}{h}}\omega_f\left(\frac{1}{n}\right)$ 
- $\sum_{n=1}^\infty\frac{1}{n}\omega_f\left(\frac{1}{n}\right)<\infty,|f(t)-p_n(t)|\le M\Delta_n^m(t)\omega_f(\Delta_n(t))\\\Rightarrow f^{(1)},\dots,f^{(m)} 存在,|f^{(m)}(x)-p_n^{(m)}(x)|\le M_m\sum_{k\ge \lfloor\Delta_n^{-1}(x)\rfloor}\frac{1}{k}\omega_f\left(\frac{1}{k}\right)$ 
- $0<\alpha<1,|f(t)-p_n(t)|=O(\Delta_n^{m+\alpha}(t)) \Leftrightarrow f^{(1)},\dots,f^{(m)} 存在,f^{(m)}\in \text{Lip}(\alpha)$ 

# 6. 最小平方逼近

## 6.1 最佳逼近

- $X$ Hibert 空间，$M$ 闭线性子空间 $\Rightarrow$ T
- $X$ Hibert 空间，$M$ 线性子空间，$m^*\in \mathcal{B}_M(x) \Leftrightarrow (x-m^*)\perp M$ 
- $M$ 闭线性子空间 $\Rightarrow$ 距离投影算子 $P_M$ 是线性算子，且 $\|P_M\|=1$ 

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
令 $G\triangleq (\left\langle m_i,m_j \right\rangle)_{i,j=1}^n$ 为 Gram 矩阵，$\pmb{b}=\{\left\langle m_i,x \right\rangle\}_{i=1}^n$，则上述方程组可写为 $G\pmb{\alpha}=\pmb{b}$。其中 $G$ 是对称正定阵，可分解为 $G=LDL^\top$，其中 $L$ 为下三角阵，$D$ 为对角阵。则 $G\pmb{\alpha}=\pmb{b}$ 等价于
$$
\left\{\begin{array}{l}
L\beta=\pmb{b},\\
L^\top\alpha = D^{-1}\beta
\end{array}\right.
$$
由于 $L$ 为三角阵，很容易解出 $\beta$ 和 $\alpha$ 

## 6.2 正交函数系

设 $\{\varphi_i\}_{i=1}^\infty$ 是规范的正交函数系，即 $\left\langle \varphi_i,\varphi_k \right\rangle = \delta_{ik}$ 

$\forall f \in L_{2,\rho}[a,b]$，令 $c_k=\left\langle f,\varphi_k \right\rangle$，则称 $\sum_{k=1}^\infty c_k\varphi_k(t)$ 为 $f$ 的**形式上**的 Fourier 级数，而
$$
S_n(f)\triangleq\sum_{k=1}^n c_k \varphi_k
$$
称为 $f$ 的 Fourier 级数前 $n$ 项的和

**引理 6.1** 

- $S_n f=\mathcal{B}_{\Phi_n}(f)$ 
- $\sum_{k=1}^\infty c_k^2 < + \infty \Rightarrow 存在唯一 f\in L_{2,\rho},c_k=\left\langle f,\varphi_k \right\rangle,\lim_\limits{n\to \infty}\left\|f-\sum_{k=1}^nc_k\varphi_k\right\|_2\to 0$ 

**引理 6.2**（Schmidt 正交化）设 $\omega_1(t),\dots,\omega_n(t),\dots$ 是 $L_{2,\rho}[a,b]$ 中一组线性无关函数系（数目有限或可数），再设 $\psi_1(t)=\omega_1$，
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

- $M_n\triangleq \text{span}\{f_i\}_{i=1}^n,d^2(g,M_n)=\frac{G(f_1,\dots,f_n,g)}{G(f_1,\dots,f_n)}$ 
- $\{f_i\}_{i=1}^n$ 线性无关 $\Rightarrow G(f_1,\dots,f_n)>0$ 
- $G(f_1,\dots,f_n)\le G(f_1,\dots,f_m)G(f_{m+1},\dots,f_n) \quad (m<n)\\
  =\Leftrightarrow\left\langle f_k,f_i \right\rangle=0\quad 
  (k=1,\dots,m;i=m+1,\dots,n)$ 
- $\{f_i\}_{i=1}^n$ 线性无关 $\Rightarrow G(f_1,\dots,f_n)\le\left\langle f_1,f_1 \right\rangle \dots \left\langle f_n,f_n \right\rangle,=\Leftrightarrow  \{f_i\}_{i=1}^n 是正交系$ 

## 6.3 正交多项式的性质

多项式组 $\{t^i\}_{i=0}^\infty$ 经 Schmidt 正交化可得到规范正交多项式系 $\{\varphi_i(t)\}_{i=0}^\infty$，其中 $\varphi_0=\psi_0=1$，
$$
\varphi_k(t)=\frac{\psi_k(t)}{\sqrt{\Delta_k\Delta_{k-1}}}
$$
是 $k$ 次多项式

**定理 6.4** $\sqrt{\Delta_k/\Delta_{k-1}}\varphi_k(t)$ 是首项系数为 $1$ 的 $k$ 次多项式，它使积分
$$
\left\langle p,p \right\rangle = \int_a^b \rho(t)p^2(t)\mathrm{d}t
$$

在所有首项系数为 $1$ 的 $k$ 次多项式中达到极小

设 $\{\varphi_n(t)\}_{n=0}^\infty$ 是 $[a,b]$ 上关于权 $\rho(t)$ 正交的多项式函数系

- 设 $\deg(\varphi_n(t))=n$，又设 $f\in C[a,b]$，且 $\left\langle f,\varphi_i \right\rangle = 0\quad(i=0,\dots,n-1)$，则 $f$ 在 $(a,b)$ 中至少变号 $n$ 次或者恒等于 $0$ 
- $\varphi_n(t)$ 的零点全部是单重的，且都在 $(a,b)$ 中
- 记 $M_n\triangleq\text{span}\{\varphi_i\}_{i=0}^n$，$\varphi(t)=\sum_{i=0}^n c_i\varphi_i(t)$ 从 $M_n$ 对连续函数 $f$ 的最小平方逼近，则 $\varphi$ 在 $[a,b]$ 中至少 $n+1$ 个点上插值与 $f$ 

**定理 6.6** (1) 和 (2) 等价

(1) $\{p_n(t)\}_{n=0}^\infty$ 是首相系数为 1 的正交多项式系 $\left\{ p _ { n } ( t ) = \sqrt { \frac { \Delta _ { n } } { \Delta _ { n - 1 } } \varphi _ { n } ( t ) } \right\} _ { n = 0 } ^ { \infty }$ 

(2) 递推关系
$$
\begin{array} { l } { p _ { n } ( t ) = \left( t - a _ { n } \right) p _ { n - 1 } ( t ) - b _ { n } p _ { n - 2 } ( t ) } \\ { p _ { 0 } = 1 , \quad p _ { 1 } = t - a _ { 1 } } \end{array}
$$
其中
$$
a _ { n } = \frac { \left\langle t p _ { n - 1 } , p _ { n - 1 } \right\rangle } { \left\langle p _ { n - 1 } , p _ { n - 1 } \right\rangle } , \quad b _ { n } = \frac { \left\langle t p _ { n - 1 } , p _ { n - 2 } \right\rangle } { \left\langle p _ { n - 2 } , p _ { n - 2 } \right\rangle }
$$
**定理 6.7** 设 $\{p_n(t)\}_{n=0}^\infty$ 是首项系数为 1 的区间 $[a,b]$ 上的正交多项式系，则 $p_n(t)$ 和 $p_{n-1}(t)$ 的零点必互相交错

**定理 6.8** 设积分公式
$$
\int _ { a } ^ { b } f ( t ) \rho ( t ) \mathrm { d } t \approx  \sum _ { k = 1 } ^ { n } A _ { k } f \left( t _ { k } \right)
$$
对所有次数小于 $n$ 次的多项式准确，则该积分公式对所有次数小于 $2n$ 次的多项式 $f$ 准确的充要条件是 $\{t_i\}_{i=1}^n$ 是 $p _ { n } ( t ) = \sqrt{\frac{\Delta_n}{\Delta_{n-1}}} \varphi _ { n } ( t )$ 的零点

**定理 6.9**（Stieltjes 定理）Gauss 型积分收敛

## 6.4 正交展开的收敛性

设 $\{\varphi_n\}_{n=0}^\infty$ 是 $[a,b]$ 上标准正交多项式，$\deg \varphi_n = n$，定义
$$
S_nf\triangleq\sum_{k=0}^n\left\langle f,\varphi_k \right\rangle\varphi_k
$$
已知 $\forall f \in L_{2,\rho}[a,b]$ 有
$$
\lim_\limits{n\to\infty}\|S_nf-f\|_2=0
$$
将 $S_nf$ 表示为积分算子的形式
$$
\begin{aligned} S _ { n } f ( t ) & = \sum _ { i = 0 } ^ { n } \left\langle f , \varphi _ { i } \right\rangle \varphi _ { i } = \int _ { a } ^ { b } f ( s ) \sum _ { i = 0 } ^ { n } \varphi _ { i } ( s ) \varphi _ { i } ( t ) \rho ( s ) \mathrm { d } s \\ & = \int _ { a } ^ { b } f ( s ) K _ { n } ( s , t ) \rho ( s ) \mathrm { d } s \end{aligned}
$$
其中
$$
K _ { n } ( s , t ) = \sum _ { i = 0 } ^ { n } \varphi _ { i } ( s ) \varphi _ { i } ( t )
$$
称为**规范正交系的核** 

设 $\varphi_n(t)$ 中 $t^n$ 的系数为 $\lambda_n^{-1}$，则 $p_n(t)=\lambda_n\varphi_n(t)$ 是首项系数为 1 的正交多项式系

**定理 6.10**（Christoffe-Darboux 定理）
$$
K _ { n } ( s , t ) = \lambda _ { n + 1 } \lambda _ { n } ^ { - 1 } \frac { \varphi _ { n + 1 } ( t ) \varphi _ { n } ( s ) - \varphi _ { n } ( t ) \varphi _ { n + 1 } ( s ) } { t - s }
$$

**定理 6.11** 设 $t_0\in[a,b]$，若 $\varphi_n(t_0)$ 对 $n$ 一致有界，又设 $f\in C[a,b]$ 且在 $t_0$ 处满足 Lipschitz 条件，即 $|f(t)-f(t_0)|<\alpha|t-t_0|$，则
$$
f(t_0)=\sum_{n=0}^\infty\left\langle f,\varphi_n \right\rangle\varphi_n(t_0)
$$
**推论 6.6** 设 $f\in C[-1,1]$，且 $f$ 满足 Lipschitz 条件，则
$$
f=\sum_{i=0}^\infty\left\langle f,T_i \right\rangle T_i(t)
$$
即 $\lim_\limits{n\to\infty}\|f-S_nf\|_\infty = 0$ 

