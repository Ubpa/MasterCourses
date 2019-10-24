# 04. 多项式的性质和平滑模

## 4.1 多项式的性质

> 多项式范数与其导数范数的关 系

### 4.1.1 Bernstein 不等式

**定理 4.1**（Bernstein 不等式） $\forall f \in \overset{\circ}{\mathcal{P}}_n=\text{span}\{1,\sin rt, cos rt\}_{r=1}^n$，都有 $\|f^\prime\|_\infty\le n \|f\|_\infty$ 

**推论 4.1** 对于 $p\in\mathcal{P}_{n+1}$，$\|p\|_{[-1,1]} \le M$，我们有
$$
|p^\prime(t)|\le\frac{nM}{\sqrt{1-t^2}}
$$
其中 $-1<t<1$ 

> 证明
>
> 令 $t=\cos\theta$，$\theta\in (0,\pi)$，则 $p(t)=p(\cos\theta)\subset \overset{\circ}{\mathcal{P}}_n$，$\|p(\cos\theta)\|=\|p(t)\|_{[-1,1]}\le M$ 
>
> 由定理 4.1 知，
> $$
> \left\|\frac{\mathbb{d}}{\mathbb{d}\theta}p(\cos\theta)\right\|\le nM
> $$
> 而
> $$
> \frac { \mathrm { d } } { \mathrm { d } \theta } p ( \cos \theta ) = p ^ { \prime } ( t ) \frac { \mathrm { d } t } { \mathrm { d } \theta } = - p ^ { \prime } ( t ) \sin \theta = - p ^ { \prime } ( t ) \sqrt { 1 - t ^ { 2 } }
> $$
> 则
> $$
> |p^\prime(t)|\le\frac{nM}{\sqrt{1-t^2}} \quad(-1<t<1)
> $$

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
\|T^\prime_n(t)\|\le n\|T_n(t)\|
$$
> 证明
>
> 设 $\|T^\prime_n\|=|T_n^\prime(t_0)|$（即 $t_0=\mathop{\arg\max}_\limits{t}|T_n^\prime(t)|$），则存在实数 $\alpha$ 使得
> $$
> e^{\sqrt{-1}\alpha}T_n^\prime(t_0)=|T^\prime_n(t_0)|
> $$
>
> > 将 $|T_n^\prime|$ 取最大值时的位置旋转到实数轴的正半轴上
>
> 令 $S_n(t)=\mathfrak{R}(e^{\sqrt{-1}\alpha}T_n(t))$，满足
> $$
> \begin{aligned}
> \|S_n\| &\le \|T_n\|\\
> S_n^\prime(t)&=\mathfrak{R}(e^{\sqrt{-1}\alpha}T_n^\prime(t))\\
> S^\prime_n(t_0)&=\mathfrak{R}(e^{\sqrt{-1}\alpha}T_n^\prime(t_0))=e^{\sqrt{-1}\alpha}T_n^\prime(t_0)=|T_n^\prime(t_0)|=\|T_n^\prime\|\\
> |S^\prime_n(t_0)|&\le \|S_n^\prime\|
> \end{aligned}
> $$
>
> > $S_n$ 就是 $T_n$ 的旋转投影
> >
> > ~~拥有众多好性质，真是优秀的函数~~ 
>
> 又 $S_n$ 是实系数的 n 次三角多项式，利用定理 4.1 Bernstein 不等式，有 $\|S_n^\prime\|\le n\|S_n\|$ 
>
> 则
> $$
> \|T_n^\prime\|=S_n^\prime(t_0)\le\|S_n^\prime\|\le n\|S_n\|\le n\|T_n\|
> $$

**推论 4.3** 对于圆 $|z|\le 1$ 内复系数多项式 $p_n(z)=\sum_{k=0}^na_kz^k$，令
$$
\|p_n\|\triangleq\max_\limits{|z|\le 1}|p_n(z)|
$$
则
$$
\|p^\prime_n(z)\|\le n\|p_n\|
$$

> 证明
>
> 在 $|z|=1$ 上考虑 $p_n$ 和 $p^\prime_n$，即 $z=e^{\sqrt{-1}t}(t\in \mathbb{R})$，此时
> $$
> p _ { n } ( z ) = \sum _ { k = 0 } ^ { n } a _ { k } z ^ { k } = \sum _ { k = 0 } ^ { n } a _ { k } \mathrm { e } ^ { \sqrt { - 1 k t } } \triangleq T _ { n } ( t )
> $$
> 是 n 次复系数三角多项式
>
> 由**最大模原理**得，对 $|z|=1$ 有
> $$
> \begin{aligned} \left| p _ { n } ^\prime ( z ) \right| & = \left| T _ { n } ^ { \prime } ( t ) \right| \leqslant n \left\| T _ { n } \right\| = n \max _ { | z | = 1 } \left| p _ { n } ( z ) \right| \\ & = n \max _ { | z | \leqslant 1 } \left| p _ { n } ( z ) \right| = n \left\| p _ { n } ( z ) \right\| \end{aligned}
> $$
>
> > 不等号用了推论 4.2
> >
> > 第 2 个等号，$\|T_n\|$ 是在 $|z|=1$ 上的
> >
> > 第 3 个等号用了最大模原理
>
> 再由最大模原理
> $$
> \|p^\prime_n\|=\max_{|z|\le1}|p_n^\prime(z)|=\max_{|z|=1}|p_n^\prime(z)|\le n \|p_n(z)\|
> $$
>
> > 第 2 个等号用了最大模原理
> >
> > 不等号用了上边的结论 $\left| p _ { n } ^\prime ( z ) \right| \le n \left\| p _ { n } ( z ) \right\|$ 

### 4.1.2 Markov 不等式

**定理 4.2** 设 $p\in \mathcal{P}_n$ 是 $[-1,1]$ 上 $n-1$ 次多项式，若 $\|\sqrt{1-t^2}p(t)\|\le M$，则 $\|p\|\le nM$ 

**定理 4.3**（Markov 不等式）设 $p_n\in \mathcal{P}_{n+1}$，且在 $[-1,1]$ 中 $\|p_n\|\le M$，则 $\|p^\prime_n(t)\|\le n^2M$ 

## 4.2 连续模



## 4.3 平滑模

