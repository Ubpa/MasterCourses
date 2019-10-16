# 03. 线性插值

$P_M$ 不是线性算子，虽然 $P_Mx=B_M(x)$，但难以严格求出，即使计算近似解也要大量计算。人们往往用 $x$ 到 $M$ 的线性投影 $Px$ 来逼近 $x$。虽然理论上 $Px$ 不如 $P_Mx$ 好，但 $P$ 是线性算子，且 $Px$ 易于计算。

## 3.1 线性插值问题

### 3.1.1 问题的提出

X 是线性空间，$M\triangleq \text{span}\{m_i(t)\}_{i=1}^n\subset X$，$\dim (M) = n$，$\{\lambda_i\}_{i=1}^n\subset X^*$，所谓**线性插值问题**，是指 $\forall x \in X$，求 $m=Px\in M$，使得 $Px$ 在 $\{\lambda_i\}_{i=1}^n$ 上插值与 $x$，即
$$
\lambda_i(Px)=\lambda_ix\quad(i=1,2,\dots,n)
$$
或者换个记法，令 $\Lambda\triangleq \text{span}\{\lambda_i\}_{i=1}^n$，希望将 $x$ 分解为 $x=m+(x-m)$，其中 $m\in M$，$x-m\in \Lambda_\perp\triangleq\{y\in X:\lambda y = 0,\forall \lambda \in \Lambda\}$ 

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

> 方程简记为 $G\pmb{\alpha}=\pmb{b}$，其中$\pmb{\alpha}=\left[\begin{matrix}\alpha_1 \\ \dots \\ \alpha_n \end{matrix}\right]$，$\pmb{b}=\left[\begin{matrix}\lambda_1x\\\dots\\\lambda_n x\end{matrix}\right]$，则 $\pmb{\alpha}=G^{-1}\pmb{b}$ 

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

**定义 3.2** 给定一个线性投影 $P$，若 $\|I-P\|=\inf\{\|I-Q\|:Q\in\text{proj}(M)\}$，则称 $P$ 是最优的；若 $\|P\|=\inf\{\|Q\|:Q\in \text{proj}(M)\}$，则称 $P$ 是极小的

**引理 3.1** 设 $M$ 是 $X$ 中的 $n$ 维子空间，$\{\lambda_i\}_{i=1}^m\subset X^*$，则 $\{\lambda_i\}_{i=1}^m$ 在 $M$ 上线性无关的充要条件是 $\exist \{m_j\}_{j=1}^m\subset M$ 使得 $(\lambda_i m_j)_{i,j=1}^n=I_n$。

**推论 3.2** 设 $M=\text{span}\{m_i\}_{i=1}^n$，则 $\exist\{\lambda_i\}_{i=1}^n\subset \Lambda$，使得 $\lambda_i m_j=\delta_{ij}$。

**定理 3.4** 设 $X$ 是可分的（即具有可数的稠密子集）赋范线性空间，$M\subset X$，$\dim(M)=n$，则存在从 $X$ 到 $M$ 的极小和最优的线性投影。

## 3.2.3 线性投影算子的范数

**定理 3.5** 设 $P$ 是从 $M$ 和 $\Lambda$ 所决定的线性投影算子，则
$$
\|P\|=\sup_{m\in M}\inf_{\lambda \in \Lambda}\frac{\|\lambda\|\|m\|}{|\lambda m|}
$$
