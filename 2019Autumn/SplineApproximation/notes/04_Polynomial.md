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

> 证明
>
> $T_n(t)$ 零点 $\xi_i=\cos\frac{2i-1}{2n}\pi$ 
>
> 若 $t\in [\xi_n,\xi_i]$，则 $\sqrt{1-t^2}\ge\sqrt{1-\xi_1^2}=\sin\frac{\pi}{2n}\ge\frac{1}{n}$，故
> $$
> \begin{aligned}
> |p(t)|\le n\sqrt{1-t^2}|p(t)|\le nM
> \end{aligned}
> $$
> 当 $t\in[-1,1]\backslash[\xi_n,\xi_1]$ 时，$t-\xi_i(i=1,\dots,n)$ 同号
>
> 在 $\xi_i(i=1,2,\dots,n)$ 插值于 $p(t)$ 的 Lagrange 插值多项式即为 $p(t)$，则
> $$
> p(t)=\sum_{i=1}^n p(\xi_i)\frac{w(t)}{(t-\xi_i)w^\prime(t)}
> $$
> 其中 $w(t)=\prod_\limits{i=1}^n(t-\xi_i)$ 
>
> 由于
> $$
> \begin{aligned}
> T_n(t) &= 2^{n-1}w(t)\\
> T_n^\prime(\xi_i) &= \frac{(-1)^{i-1}n}{\sqrt{1-\xi_i^2}}
> \end{aligned}
> $$
> 则
> $$
> \begin{aligned}
> p(t)&=\sum_{i=1}^n p(\xi_i)\frac{w(t)}{(t-\xi_i)w^\prime(t)}\\
> &=\sum_{i=1}^n p(\xi_i)\frac{T_n(t)}{(t-\xi_i)T_n^\prime(t)}\\
> &=\frac{1}{n}\sum_{i=1}^n \sqrt{1-\xi_i^2}p(\xi_i)\frac{(-1)^{i-1}T_n(t)}{t-\xi_i}\\
> \end{aligned}
> $$
> 故
> $$
> \begin{aligned}
> |p(t)|
> &\le\frac{1}{n}\sum_{i=1}^n\left|\sqrt{1-\xi_i^2}p(\xi_i)\frac{T_n(t)}{t-\xi_i}\right|\\
> &\le\frac{M}{n}\sum_{i=1}^n\left|\frac{T_n(t)}{t-\xi_i}\right|\\
> &=\frac{M}{n}\left|\sum_{i=1}^n\frac{T_n(t)}{t-\xi_i}\right|\\
> &=\frac{M}{n}\left|T_n^\prime(t)\right|\\
> &\le nM
> \end{aligned}
> $$
>
> > 第一行是绝对值不等式
> >
> > 第二行是定理已知条件
> >
> > 第三行是因为 $t-\xi_i(i=1,\dots,n)$ 同号
> >
> > 第四行是 $T_n^\prime(x)=\sum_{i=1}^n\frac{T_n(x)}{(x-\xi_i)}$ 
> >
> > 第五行是 $|T^\prime_n(x)|= n \left|\frac{\sin (n\theta)}{\sin\theta}\right|\le n^2$ 

**定理 4.3**（Markov 不等式）设 $p_n\in \mathcal{P}_{n+1}$，且在 $[-1,1]$ 中 $\|p_n\|\le M$，则 $\|p^\prime_n(t)\|\le n^2M$ 

> 证明
>
> 由[推论 4.1](#4.1.1 Bernstein 不等式) 知
> $$
> |p^\prime(t)|\le\frac{nM}{\sqrt{1-t^2}}
> $$
> 则
> $$
> \left|\sqrt{1-t^2}\frac{p^\prime(t)}{n}\right|\le M
> $$
> 由定理 4.2 知
> $$
> \left|\frac{p^\prime(t)}{n}\right|\le nM
> $$
> 即
> $$
> \|p^\prime(t)\|\le n^2M
> $$

当 $p_n(t)=T_n(t)=\cos(n\arccos t)$ 时，定理 4.3 不等式等号成立。$M=1$，且
$$
T_n^\prime(1)=n\lim_\limits{\theta\to 0}\frac{\sin n\theta}{\sin \theta}=n^2
$$

## 4.2 连续模

**定义 4.1** 设 $f\in C(I)$，$\rho(t_1,t_2)$ 为 $t_1$ 和 $t_2$ 之间的距离，其中 $t_1,t_2\in I$，函数
$$
\omega_f(h)\triangleq\sup_\limits{\rho(t_1,t_2)\le h}|f(t_1)-f(t_2)|
$$
是从 $[0,+\infty]$ 到 $[0,\infty]$ 的映射，称为函数 $f$ 的连续模，不致歧义时记为 $\omega(h)$ 

性质

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
\omega_{I,f,r}(h)\triangleq\sup_\limits{0\le s\le h}\|\Delta_s^rf(t)\|_{\infty(I)}
$$
不致歧义时，记为 $\omega_r(h)$。$\omega_r(0)=0$ 

性质

- $\omega_r(h)$ 单调增
- $\omega_{r,f_1+f_2}(h)\le\omega_{r,f_1}(h)+\omega_{r,f_2}(h)$ 
- $\omega_{r,f}(h) \le 2^j\omega_{r-j,f}(h)$，特别地，$\omega_{r,f}(h)\le 2^r \|f\|_\infty$ 
- $\forall k \in \mathbb{Z}^+,\omega_r(kh)\le k^r\omega_{r}(h)$；$\forall \lambda>0,\omega_r(\lambda h)\le \lambda\omega_r(h)$ 
- $\forall f \in C^{(j)}[a,b](0\le j\le r-1),\omega_{r,f}(h)\le h^j\omega_{r-j,f^{(j)}}(h)$；$\forall f\in C^{(r)}[a,b],\omega_{r,f}(h)\le h^r\|f^{(r)}\|_\infty$ 
- 若 $\omega_{r,f}(h) > 0(h>0)$，则 $\lim_\limits{h\to 0}\frac{\omega_{r,f}(h)}{h^r}>0$ 
- 若 $f \in C^{(r)}[a,b]$，则 $\lim_\limits{h\to 0}\frac{\omega_{r,f}(h)}{h^r}=0\Leftrightarrow f\in \mathcal{P}_r$ 

