# 04. 多项式的性质和平滑模

## 4.1 多项式的性质

> 多项式范数与其导数范数的关 系

### 4.1.1 Bernstein 不等式

**定理 4.1** $\forall f \in \overset{\circ}{\mathcal{P}}_n=\text{span}\{1,\sin rt, cos rt\}_{r=1}^n$，都有 $\|f^\prime\|_\infty\le n \|f\|_\infty$ 

**推论 4.1** 对于 $p\in\mathcal{P}_{n+1}$，$\|p\|_{[-1,1]} \le M$，我们有
$$
|p^\prime(t)|\le\frac{nM}{\sqrt{1-t^2}}
$$
其中 $-1<t<1$ 

**推论 4.2** 对于复系数的三角多项式
$$
T_n(t)=\sum_{k=0}^nc_k e^{\sqrt{-1}kt}
$$
我们有
$$
\|T^\prime_n(t)\|\le n\|T_n(t)\|
$$
**推论 4.3** 对于圆 $|z|\le 1$ 内复系数多项式 $p_n(z)=\sum_{k=0}^na_kz^k$，令
$$
\|p_n\|\triangleq\max_\limits{|z|\le 1}|p_n(z)|
$$
则
$$
\|p^\prime_n(z)\|\le n\|p_n\|
$$

### 4.1.2 Markov 不等式

**定理 4.2** 设 $p\in \mathcal{P}_n$ 是 $[-1,1]$ 上 $n-1$ 次多项式，若 $\|\sqrt{1-t^2}p(t)\|\le M$，则 $\|p\|\le nM$ 

**定理 4.3**（Markov 不等式）设 $p_n\in \mathcal{P}_{n+1}$，且在 $[-1,1]$ 中 $\|p_n\|\le M$，则 $\|p^\prime_n(t)\|\le n^2M$ 

## 4.2 连续模



## 4.3 平滑模

