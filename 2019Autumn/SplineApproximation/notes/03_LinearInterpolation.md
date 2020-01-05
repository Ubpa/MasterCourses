# 03. 线性插值

$P_M$ 不是线性算子，虽然 $P_Mx=B_M(x)$，但难以严格求出，即使计算近似解也要大量计算。人们往往用 $x$ 到 $M$ 的线性投影 $Px$ 来逼近 $x$。虽然理论上 $Px$ 不如 $P_Mx$ 好，但 $P$ 是线性算子，且 $Px$ 易于计算。

## 3.1 线性插值问题

### 3.1.1 问题的提出

$X$ 是线性空间，$M\triangleq \text{span}\{m_i(t)\}_{i=1}^n\subset X$，$\dim (M) = n$，$\{\lambda_i\}_{i=1}^n\subset X^*$，所谓**线性插值问题**，是指 $\forall x \in X$，求 $m=Px\in M$，使得 $Px$ 在 $\{\lambda_i\}_{i=1}^n$ 上插值于 $x$，即
$$
\lambda_i(Px)=\lambda_ix\quad(i=1,2,\dots,n)
$$
或者换个记法，令 $\Lambda\triangleq \text{span}\{\lambda_i\}_{i=1}^n$，希望将 $x$ 分解为 $x=m+(x-m)$，其中 $m\in M$，$x-m\in \Lambda_\perp\triangleq\{y\in X:\lambda y = 0,\forall \lambda \in \Lambda\}$ 

> $P$ 就是一个将任意连续函数 $x$ 转变成合适的插值函数 $m$ 的算子
>
> $\lambda_i$ 可以视为点泛函来方便理解，称为**插值点** 
>
> $\lambda_i(Px)=\lambda_ix\quad(i=1,2,\dots,n)$ 称为**插值条件** 
>
> 那么 $\Lambda$ 就是点泛函的线性组合，称为**插值空间**，则 $\Lambda_\perp$ 就是在样本点处值为 0 的函数，正确插值后的误差函数 $e$ 都应在 $\Lambda_\perp$ 中，故一般就记 $\Lambda_\perp$ 中的元素为 $e$ 吧
>
> 插值函数 $m\triangleq Px$ 与 $x$ 的误差函数 $e\triangleq x-m$ 在样本点处应为 0，故 $e \in \Lambda_\perp$，而 $x=m+e$ 就是插值正确的分解，即 $m$ 满足插值条件。
>
> 故 $\lambda_i(Px)=\lambda_ix(i=1,2,\dots,n) \Leftrightarrow e=x-Px\in \Lambda_\perp$。

关心有**唯一解**的线性插值问题，故引出如下定义

**定义 3.1** 若 $\forall x \in X$，存在唯一的 $m\in M$，满足 $\Lambda x = \Lambda m$（即 $\forall \lambda \in \Lambda,\lambda x = \lambda m$），或者 $X=M\oplus \Lambda_\perp$，则称线性插值问题是**正确**的。

> $\Lambda x = \Lambda m \Leftrightarrow \Lambda e=0\Leftrightarrow e\in\Lambda_\perp$，即 m 满足插值条件，整句话就是说**满足插值条件的函数只有一个**。
>
> $X=M\oplus \Lambda_\perp$，则 $\forall x \in X$，存在唯一的 $m\in M$，$e \in \Lambda_\perp$，满足 $x=m+e$。 
>
> 常见的比如**多项式插值**问题，$X=C[a,b],M=\mathcal{P}_n,\lambda_i=[t_i](i=1,2,\dots,n)$。插值条件是 $\lambda_i x=\lambda_i Px$，即 $x(t_i)=(Px)(t_i)=m(t_i)$。
>
> 可以观察到插值条件的个数 / 样本点个数就是 $M$ 的维数

下面设 $\{m_i\}_{i=1}^n$，$\{\lambda_i\}_{i=1}^n$ 是线性无关的

> $\{m_i\}_{i=1}^n$ 是函数组，线性无关好理解
>
> $\{\lambda_i\}_{i=1}^n$ 是泛函，线性无关 $\Leftrightarrow$ $\sum_{i=1}^n \alpha_i\lambda_i=0$ 只有零解。对于点泛函来说，只需**不同点**即可。

**定理 3.1** 线性插值问题 $\lambda_i Px=\lambda_i x(i=1,2,\dots,n)$ 正确 $\Leftrightarrow$ $G\triangleq (\lambda_i m_j)_{i,j=1}^n$ 可逆

> 存在唯一的 $m=Px=\sum_{j=1}^n\alpha_j m_j\in M$ 满足插值条件
> $$
> \lambda_i x=\lambda_im=\sum_{j=1}^n\alpha_j(\lambda_i m_j)\quad(i=1,2,\dots,n)
> $$
> 的充要条件为 $G\triangleq (\lambda_i m_j)_{i,j=1}^n$ 可逆
>
> 其实这说明插值点在 M 上是线性无关的，参考 [3.2.2 极小线性投影](#3.2.2 极小线性投影) 上的引理 3.1

若 $M$ 和 $\Lambda$ 给出正确的线性插值问题，则确定了从 $X$ 到 $M$ 的线性投影算子 $P\triangleq P_{M,\Lambda}$，且满足
$$
Px\in M,e= x-Px \in \Lambda_\perp
$$

### 3.1.2 线性投影的计算

$M$ 和 $\Lambda$ 中随意取一组基 $\{m_i\}_{i=1}^n$，$\{\lambda_i\}_{i=1}^n$，设 $Px=\sum_{j=1}^n\alpha_j m_j$，则插值条件为
$$
\sum_{j=1}^n\alpha_j\lambda_i m_j=\lambda_ix\quad(i=1,2,\dots,n)
$$
解方程求出 $\{\alpha_j\}_{j=1}^n$ 即可确定 $Px$ 的表达式。

> 方程简记为 $G\boldsymbol{\alpha}=\boldsymbol{b}$，其中 $G\triangleq (\lambda_i m_j)_{i,j=1}^n$，$\boldsymbol{\alpha}=\left[\begin{matrix}\alpha_1 \\ \vdots \\ \alpha_n \end{matrix}\right]$，$\boldsymbol{b}=\left[\begin{matrix}\lambda_1x\\\vdots\\\lambda_n x\end{matrix}\right]$，则 $\boldsymbol{\alpha}=G^{-1}\boldsymbol{b}$ 

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
> $\hat m_i=m_i-P_{i-1}m_i$ 就是基函数与其在低维空间上的满足线性插值条件的拟合函数的误差，因此这个误差函数满足 $\hat{m}_i\perp \Lambda_{i-1}$ 
>
> 插值空间上也有类似结论
>
> $P_{i-1}m_i$ 可用 定理 3.2 求解，$\lambda_iP_{i-1}$ 难以求解
>
> ---
>
> 证明：$\lambda_i P_{i-1} \in \Lambda_{i+1}$，即证 $\exist \boldsymbol{\alpha} \in \mathbb{R}^{i-1},\forall x \in X, \lambda_iP_{i-1}x=\sum_{j=1}^{i-1}\alpha_j \lambda_j x$ 
>
> 先看特例 $\{m_l\}_{l=1}^{i-1}$ 
>
> $\lambda_i m_l = \lambda_i P_{i-1}m_l=\sum_{j=1}^{i-1}\alpha_j\lambda_j m_l(l=1,\dots,i-1)$，因 $\{\lambda_jm_l\}_{j,l=1}^{i-1}$ 可逆（$\{\lambda_jm_l\}_{j,l=1}^{n}$ 可逆），故可由此方程组确定 $\boldsymbol{\alpha}$。
>
> 则 $\forall x \in X$，有
> $$
> \begin{aligned}
> \lambda_i P_{i-1}x&=\lambda_i \sum_{l=1}^{i-1}\beta_l m_l\\
> &=\sum_{l=1}^{i-1}\beta_l\lambda_im_l\\
> &=\sum_{l=1}^{i-1}\beta_l\sum_{j=1}^{i-1}\alpha_j\lambda_j m_l\\
> &=\sum_{j=1}^{i-1}\alpha_j\lambda_j\sum_{l=1}^{i-1}\beta_l m_l\\
> &=\sum_{j=1}^{i-1}\alpha_j\lambda_j(P_{i-1}x)\\
> &=\sum_{j=1}^{i-1}\alpha_j\lambda_jx\\
> \end{aligned}
> $$
> 最后一个等号用了插值条件 $\lambda_j x=\lambda_j(P_{i-1}x),j=1,\dots,i-1$。
>
> 其他证明见于 [homeworks/2.md](../homeworks/2.md) 

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
> **证明** 
>
> 满足插值条件的 P 有 $\Lambda P X=\Lambda X\Leftrightarrow\Lambda P = \Lambda I\Leftrightarrow \Lambda(I-P)=0 \Leftrightarrow \forall \lambda \in \Lambda,\lambda(I-P)=0$ 
>
> 此外 $PM=M\Leftrightarrow P|_M = I\Leftrightarrow (I - P|_M)=0\Leftrightarrow \forall m \in M, (I-P)m=0$。
>
> 则
> $$
> \begin{aligned} \mu ( I - P ) x & = ( \mu - \lambda ) ( I - P ) x \\ & = ( \mu - \lambda ) ( I - P ) ( x - m ) \\ & \leqslant \| \mu - \lambda \| \cdot \| I - P \| \cdot \| x - m \| \end{aligned}
> $$
> 由此得
> $$
> \begin{aligned} | \mu ( I - P ) x | & \leqslant \inf _ { \lambda \in A } \| \mu - \lambda \| \cdot \| I - P \| \cdot \inf _ { m \in M } \| x - m \| \\ & = d ( \mu , \Lambda ) \| I - P \| d ( x , M ) \end{aligned}
> $$

**推论 3.1** 
$$
\|x-Px\|\le \|I-P\| d(x,M)
$$

> **证明** 
>
> $\forall m \in M$，有
> $$
> \|(I-P)x\|=\|(I-P)(x-m)\|\le \|I-P\|\|x-m\|
> $$
> 则
> $$
> \|x-Px\|\le \|I-P\| d(x,M)
> $$

### 3.2.2 极小线性投影

令 $\text{proj}(M) \triangleq \{P: P是从 X 到 M 的线性投影, \text{range} P = M\}$。

**定义 3.2** 给定一个线性投影 $P$，若 $\|I-P\|=\inf\{\|I-Q\|:Q\in\text{proj}(M)\}$，则称 $P$ 是**最优的** optimal；若 $\|P\|=\inf\{\|Q\|:Q\in \text{proj}(M)\}$，则称 $P$ 是**极小的** 

**引理 3.1** 设 $M$ 是 $X$ 中的 $n$ 维子空间，$\{\lambda_i\}_{i=1}^m\subset X^*$，则 $\{\lambda_i\}_{i=1}^m$ 在 $M$ 上线性无关的充要条件是 $\exist \{m_j\}_{j=1}^m\subset M$ 使得 $(\lambda_i m_j)_{i,j=1}^n=I_n$ 

> $\{\lambda_i\}_{i=1}^m$ 在 $M\triangleq \text{span}\{m_i^\prime\}_{i=1}^n$ 上线性无关的充要条件是矩阵 $G\triangleq (\lambda_i m_j^\prime)_{i,j=1}^n$ 可逆，因为
> $$
> G = \left( \begin{array} { c } { \lambda _ { 1 } } \\ { \lambda _ { 2 } } \\ { \vdots } \\ { \lambda _ { n } } \end{array} \right) \left( m _ { 1 } ^ { \prime } , m _ { 2 } ^ { \prime } , \cdots , m _ { n } ^ { \prime } \right) = \lambda \left( m ^ { \prime } \right) ^ \top
> $$
>
> 可逆，取 $m=(G^{-1})^\top m^\prime$，则
> $$
> \lambda m ^ \top = \lambda \left( (G ^ { - 1 })^\top m ^ { \prime } \right) ^ \top = \lambda \left( m ^ { \prime } \right) ^ \top G ^ { - 1 } = G \cdot G ^ { - 1 } = I _ { n }
> $$

**推论 3.2** 设 $M=\text{span}\{m_i\}_{i=1}^n$，则 $\exist\{\lambda_i\}_{i=1}^n\subset \Lambda$，使得 $\lambda_i m_j=\delta_{ij}$。

**定理 3.4** 设 $X$ 是可分的（即具有可数的稠密子集）赋范线性空间，$M\subset X$，$\dim(M)=n$，则存在从 $X$ 到 $M$ 的极小和最优的线性投影。

### 3.2.3 线性投影算子的范数

**定理 3.5** 设 $P$ 是从 $M$ 和 $\Lambda$ 所决定的线性投影算子，则
$$
\|P\|=\sup_{m\in M}\inf_{\lambda \in \Lambda}\frac{\|\lambda\|\|m\|}{|\lambda m|}
$$

---

令 $M\triangleq \text{span}\{m\}_{i=1}^n,\Lambda=\text{span}\{\lambda_i\}_{i=1}^n$，则
$$
\| P \| = \sup _ { \alpha } \inf _ { \beta } \frac { \left\| \sum _ { j = 1 } ^ { n } \alpha _ { j } m _ { j } \right\| \cdot \left\| \sum _ { i = 1 } ^ { n } \beta _ { i } \lambda _ { i } \right\| } { \left| \sum _ { i , j = 1 } ^ { n } \alpha _ { j } \beta _ { i } \lambda _ { i } m _ { j } \right| }
$$
若存在常数 $c_m,C_m,c_\lambda,C_\lambda$ 使得
$$
\begin{array} { l } { c _ { m } \| \alpha \| _ { \infty } \leqslant \left\| \sum _ { j = 1 } ^ { n } \alpha _ { j } m _ { j } \right\| \leqslant C _ { m } \| \alpha \| _ { \infty } } \\ { c _ { \lambda } \| \beta \| _ { 1 } \leqslant \left\| \sum _ { i = 1 } ^ { n } \beta _ { i } \lambda _ { i } \right\| \leqslant C _ { \lambda } \| \beta \| _ { 1 } } \end{array}
$$

> **中间步骤** 
>
> 那么
> $$
> c _ { \lambda } c _ { m } \sup_\alpha\inf_\beta \frac { \| \alpha \| _ { \infty } \| \beta \| _ { 1 } } { \left| \beta ^ \top \left( \lambda _ { i } m _ { j } \right) \alpha \right| } \leqslant \| P \| \leqslant C _ { \lambda } C _ { m } \sup_\alpha\inf_\beta \frac { \| \alpha \| _ { \infty } \| \beta \| _ { 1 } } { \left| \beta ^ \top \left( \lambda _ { i } m _ { j } \right) \alpha \right| }
> $$
> 注意到
> $$
> \begin{aligned}
> \inf _ { \alpha } \sup _ { \beta } \left( \frac { \left| \beta ^ \top \left( \lambda _ { i } m _ { j } \right) \alpha \right| } { \|\beta\|_1 }\cdot \frac{1}{\| \alpha \| _ { \infty }} \right)
> & = \inf _ { \alpha } \frac { \left\| \left( \lambda _ { i } m _ { j } \right) \alpha \right\| _ { \infty } } { \| \alpha \| _ { \infty } } \\
> & = \inf _ { \alpha ^ { \prime } } \frac { \left\| \alpha ^ { \prime } \right\| _ { \infty } } { \left\| \left( \lambda _ { i } m _ { j } \right) ^ { - 1 } \alpha ^ { \prime } \right\| _ { \infty } } \\
> & = \frac { 1 } { \sup _ { \alpha ^ { \prime } } \frac { \left\| \left( \lambda _ { i } m _ { j } \right) ^ { - 1 } \alpha ^ { \prime } \right\| _ { \infty } } { \left\| \alpha ^ { \prime } \right\| _ { \infty } } } = \frac { 1 } { \left\| \left( \lambda _ { i } m _ { j } \right) ^ { - 1 } \right\| _ { \infty } }
> \end{aligned}
> $$
>
> > **第一个等号** 
> >
> > 若 $(\lambda_i m_j)\alpha$ 在第 k 个分量达到绝对值最大，那么通过取 $\beta_j=\delta_{kj}$ 可得
> > $$
> > \sup _ { \beta } \frac { \left| \beta ^ \top \left( \lambda _ { i } m _ { j } \right) \alpha \right| } { \| \beta \| _ { 1 } } \geqslant \left\| \left( \lambda _ { i } m _ { j } \right) \alpha \right\| _ { \infty }
> > $$
> > 另一方面
> > $$
> > \frac { \left| \beta ^ \top \left( \lambda _ { i } m _ { j } \right) \alpha \right| } { \| \beta \| _ { 1 } } \leqslant \frac { \| \beta \| _ { 1 } \cdot \left\| \left( \lambda _ { i } m _ { j } \right) \alpha \right\| _ { \infty } } { \| \beta \| _ { 1 } } = \left\| \left( \lambda _ { i } m _ { j } \right) \alpha \right\| _ { \infty }
> > $$
> > **后边的等号** 
> >
> > 可以写成
> > $$
> > \inf_\alpha\frac{\|(\lambda_i m_j)\alpha\|_\infty}{\|\alpha\|_\infty}
> > =\min\{\lambda_i m_j\}_{i,j=1}^n
> > = \frac { 1 } { \left\| \left( \lambda _ { i } m _ { j } \right) ^ { - 1 } \right\| _ { \infty } }
> > $$
>

从而可得
$$
c _ { \lambda } c _ { m } \left\| \left( \lambda _ { i } m _ { j } \right) ^ { - 1 } \right\| _ { \infty } \leqslant \| P \| \leqslant C _ { \lambda } C _ { m } \left\| \left( \lambda _ { i } m _ { j } \right) ^ { - 1 } \right\| _ { \infty }
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

> **示例** 
>
> 取 $\tau=(-1,-0.6,-0.2,0.2,0.6,1)$，$L_\tau(t)$ 图像为
>
> ![image-20200105122616841](assets/image-20200105122616841.png)
>
> 取 Tchebycheff 点，$L_\tau(t)$ 图像为
>
> ![image-20200105130439657](assets/image-20200105130439657.png)

### 3.2.4 多项式插值节点的最优选择

设 $I=[-1,1],n=2k+1,t_i=\frac{i}{k}\ (i=-k,\dots,k)$，可得
$$
\lim_{n\to\infty} \|L_\tau (t)\|^{\frac{1}{n}}=2
$$
则 $\|P\|\sim 2^n$ 

> **验证** 
>
> ```matlab
> plot(2:1000,Elem(@(n) power(max(Lebesgue(-1:(2/(n-1)):1,(-1:0.001:(-1+(2/(n-1))))')),1/n),2:1000))
> ```
>
> ![image-20200105123732209](assets/image-20200105123732209.png)

---

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

> 设 $\Lambda\triangleq \text{span}\{\lambda_i\}_{i=1}^n$，$\lambda_i=[t_i]$，$\tau\in I_{0,0}^n$，$M=\text{span}\{m_i\}_{i=1}^n$，
> $$
> m_i(t)=l_i(t)=\prod_{j=1,j\neq i}^n\frac{t-t_j}{t_i-t_j}
> $$
>
> 由于
> $$
> \lambda=\sum_{i=1}^n\beta_i\lambda_i=\sum_{i=1}^n\beta_i[t_i]
> $$
> 故
> $$
> \|\lambda\|=\sum_{i=1}^n|\beta_i|=\|\beta\|_1\quad\Rightarrow\quad c_\lambda=C_\lambda=1
> $$
> 令 $L_\tau(t)=\sum_{i=1}^n |l_i(t)|$，称为 Lebesgue 函数，有
> $$
> \begin{array} { l } { \left\| \sum _ { i = 1 } ^ { n } \alpha _ { i } m _ { i } \right\| = \left\| \sum _ { i = 1 } ^ { n } \alpha _ { i } l _ { i } ( t ) \right\| \leqslant \| \alpha \| _ { \infty } \left\| L _ { \tau } ( t ) \right\| _ { \infty } } \\ { \left\| \sum _ { i = 1 } ^ { n } \alpha _ { i } m _ { i } \right\| = \sup _ { t } \left| \sum _ { i = 1 } ^ { n } \alpha _ { i } m _ { i } ( t ) \right| \geqslant \max _ { i } \left| \sum _ { i = 1 } ^ { n } \alpha _ { i } m _ { i } \right| _ { t = t _ { i } } = \max _ { l } \left| \alpha _ { l } \right| = \| \alpha \| _ { \infty } } \end{array}
> $$
> 又 $\left\| \left( \lambda _ { i } m _ { j } \right) ^ { - 1 } \right\| _ { \infty } = \left\| I _ { n } \right\| = 1$，则 $1 \leqslant \left\| P _ { n , r } \right\| \leqslant \left\| L _ { \tau } ( t ) \right\| _ { \infty }$，事实上可证明右侧等号成立，则 $1 \leqslant \left\| P _ { n , r } \right\| = \left\| L _ { \tau } ( t ) \right\| _ { \infty }$ 

$\tau^e$ 是 $[a,b]$ 上扩充的 Tchebycheff 点，有
$$
\|L_{n,\tau^e}\|\sim\frac{2}{\pi}\ln n+0.6
$$
其中
$$
t^e_i=\frac{1}{2}\left((a+b)+(a-b)\frac{\cos\left(\frac{2i-1}{2n}\pi\right)}{\cos\left(\frac{\pi}{2n}\right)}\right)\quad(i=1,\dots,n)
$$
虽然 $\lim_\limits{n \to \infty}\|P_{n,\tau^e}\|=\infty$，但因为阶为 $\ln n$，所以趋于无穷的速度不快。因而从逼近阶的角度，扩充的 Tchebycheff 插值节点 $\tau^e$ 可作为近似的最优插值节点

> **验证** 
>
> ```matlab
> N = 300;
> y = zeros(1,N-1);
> for n = 2:N
> 	tau = Tchebycheff(-1,1,n);
> 	delta = 1-tau(2);
> 	t = tau(2) : delta/n : 1;
> 	L = max(Lebesgue(tau, t'));
> 	y(n-1) = exp(pi/2*(L-0.6))/n;
> end
> plot(2:N,y);
> ```
>
> ![image-20200105131710301](assets/image-20200105131710301.png)

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
（即对 $\forall x\in X$，$\|P_n-O\|\to 0$ 当且仅当 $\|P_n\|$ 一致有界，且 $\lim M_n=X$，其中 $\lim M_n\triangleq \{x\in X,d(x,M_n)\to 0\}$）

