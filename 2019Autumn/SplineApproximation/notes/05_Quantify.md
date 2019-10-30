# 05. 最佳逼近的定量理论

## 5.1 周期函数类上最佳逼近的正逆定理

**定理 5.1** 对任意 $f\in \overset{\circ}{C}$ 以及任意 $\epsilon > 0$，都存在三角多项式 $T$，使得 $\|f-T\| < \epsilon$ 

> $f$ 的 Fourier 级数前 n 项和为
> $$
> \begin{aligned}
> S_n(f)&=\frac{1}{2\pi}\int_{-\pi}^\pi f(s)\mathrm{d}s
> +\frac{1}{\pi}\sum_{r=1}^{n}\left(\cos rt\int_{-\pi}^\pi f(s)\cos rs\mathrm{d}s+\sin rt\int_{-\pi}^\pi f(s)\sin rs\mathrm{d}s\right)\\
> &=\frac{1}{2\pi}\int_{-\pi}^\pi f(s)\mathrm{d}s
> +\frac{1}{\pi}\sum_{r=1}^{n}\int_{-\pi}^\pi f(s)(\cos rs\cos rt+\sin rs\sin rt)\mathrm{d}s\\
> &=\frac{1}{2\pi}\int_{-\pi}^\pi f(s)\mathrm{d}s
> +\frac{1}{\pi}\sum_{r=1}^{n}\int_{-\pi}^\pi f(s)\cos r(s-t)\mathrm{d}s\\
> &=\frac{1}{\pi}\int_{-\pi}^\pi \left(\frac{1}{2}+\sum_{r=1}^{n}\cos r(s-t)\right)f(s) \mathrm{d}s\\
> \end{aligned}
> $$
> 令
> $$
> D_n(t)\triangleq \frac{\sin (n+\frac{1}{2})t}{2\sin \frac{t}{2}}=\frac{1}{2}+\cos t+\dots+\cos nt \in \overset{\circ}{\mathcal{P}}_n
> $$
>
> >  图示
> >
> >  ```matlab
> >  close all;
> >  figure(1);
> >  hold on;
> >  grid on;
> >  
> >  t = -pi : 0.01: pi;
> >  
> >  for n = 0:4
> >  	DnT = sin((n+1/2)*t) ./ (2 * sin(t/2));
> >  	plot(t, DnT);
> >  end
> >  legend('n=0','n=1','n=2','n=3','n=4');
> >  ```
> >
> >  ![image-20191029183048748](assets/image-20191029183048748.jpg)
>
> 则
> $$
> S_n(f)=\frac{1}{\pi}\int_{-\pi}^\pi D_n(s-t) f(s) \mathrm{d}s=\frac{1}{\pi}(D_n\star f)(t)
> $$
> 其中 $(f\star g)(t)=\int_{-\pi}^\pi f(t-s)g(s)\mathrm{d}s$ 
>
> 令
> $$
> \begin{aligned}
> \sigma_n(f)&=\overline{S_n}f=\frac{\sum_{i=0}^{n-1}S_i}{n}f\\
> &=\frac{1}{\pi n}\sum_{i=0}^{n-1}(D_n\star f)(t)\\
> &=\frac{1}{\pi n}\left(\left(\sum_{i=0}^{n-1}D_n\right)\star f\right)(t)\\
> \end{aligned}
> $$
> 令
> $$
> \begin{aligned}
> F_n(t)
> &=2\sum_{i=0}^{n-1}D_i(t) \in \overset{\circ}{\mathcal{P}}_{n-1}\\
> &=\frac{1}{\sin^2\frac{t}{2}}\sum_{i=0}^{n-1}\sin\frac{t}{2}\sin\left(i+\frac{1}{2}\right)t\\
> &=\frac{1}{\sin^2\frac{t}{2}}\sum_{i=0}^{n-1}\frac{1}{2}(\cos it - \cos(i+1)t)\\
> &=\frac{1-\cos nt}{2\sin^2\frac{t}{2}}\\
> &=\left(\frac{\sin \frac{n}{2}t}{\sin \frac{t}{2}}\right)^2\\
> \end{aligned}
> $$
>
> > 示例
> >
> > ```matlab
> > close all;
> > figure(1);
> > hold on;
> > grid on;
> > 
> > t = -pi : 0.01: pi;
> > 
> > for n = 0:4
> > 	FnT = (sin((n/2)*t) ./ (sin(t/2))).^2;
> > 	plot(t, FnT);
> > end
> > legend('n=0','n=1','n=2','n=3','n=4');
> > ```
> >
> > ![image-20191030101127735](assets/image-20191030101127735.jpg)
>
> 则
> $$
> \sigma_n(f)=\frac{1}{2\pi n}(F_n\star f)(t)
> $$
>
> 显然 $\sigma_n(f)$ 是正线性算子
>
> > $F_n(t)\ge 0$，则 $\forall f\ge0$，$\sigma_n(f) \ge 0$ 
>
> 取 $P_s(t) = 1-\cos(t-s)=1-\cos s\cos t - \sin s \sin t \ge 0$ 
>
> 当 $t=s$ 时，$P_s(t)=0$，且
>
> $$
> \begin{aligned}
> \sigma_n(1)&=1\\
> \lim_{n\to \infty}\sigma_n(\cos t)&=\cos t\\
> \lim_{n\to \infty}\sigma_n(\sin t)&=\sin t\\
> \end{aligned}
> $$
> 则由 [Bohman-Korovkin 定理](02_UniformApproximation.md)，$\forall f \in \overset{\circ}{C}$，有
> $$
> \lim_{n\to\infty}\|\sigma_n(f)-f\|_\infty=0
> $$

光滑性 $\leftrightarrow$ 逼近速度，$\rightarrow$ 是正定理，$\leftarrow$ 是逆定理

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

> Jackson 核图示
>
> ![image-20191030110112863](assets/image-20191030110112863.jpg)

**引理 5.1** $L_n(t)$ 满足如下性质

1. $L_n(t)=L_n(-t)$ 
2. $\int_{-\pi}^\pi L_n(t)=1$，由 1 得 $2\int_0^\pi L_n(t)=1$ 
3. $L_n(t) \in \overset{\circ}{\mathcal{P}}_{2n-2}$ 
4. $\int_0^\pi (ns+1)L_n^2(s)\mathrm{d}s = O(1)$ 

> 1，2 显然
>
> 3，$F_n \in \overset{\circ}{\mathcal{P}}_{n-1}$，则 $L_n(t)=\lambda_n^{-1} J_n(t)=\lambda_n^{-1} F_n^2(t)\in \overset{\circ}{\mathcal{P}}_{2n-2}$ 
>
> 下边证 4
> $$
> \begin{aligned}
> \int _ { 0 } ^ { \pi } t ^ { r } J _ { n } ( t ) \mathrm { d } t
> & = \int _ { 0 } ^ { \pi } t ^ { r } \left( \frac { \sin \frac { n t } { 2 } } { \sin ( t / 2 ) } \right) ^ { 4 } \mathrm { d } t\\
> & = \int _ { 0 } ^ { \pi } \left(\frac{t/2}{\sin(t/2)}\right)^4 t ^ { r } \left( \frac { \sin \frac { n t } { 2 } } { t / 2 } \right) ^ { 4 } \mathrm { d } t \\
> & = c \int _ { 0 } ^ { \pi } t ^ { r } \left( \frac { \sin \frac { n t } { 2 } } { t / 2 } \right) ^ { 4 } \mathrm { d } t \\
> & = c \int _ { 0 } ^ { \frac { n\pi } { 2 } } \left( \frac { 2 u } { n } \right) ^ { r } \left( \frac { \sin u } { u } \right) ^ { 4 } n ^ { 4 } \cdot \frac { 2 } { n } \mathrm { d } u \\
> & = c \left( \frac { 2 } { n } \right) ^ { r - 3 } \int _ { 0 } ^ { \frac { n\pi } { 2 } } \frac { \sin ^ { 4 } u } { u ^ { 4 - r } } \mathrm { d } u
> \end{aligned}
> $$
> 第三个等号时积分中值定理，其中 $u=\frac{nt}{2}$ 
>
> 当 $r\le 2$ 时
> $$
> \int_0^\infty\frac{\sin^4 u}{u^{4-r}}\mathrm{d}u < +\infty
> $$
> > $$
> > \begin{aligned}
> > \int_0^\infty\frac{\sin^4 u}{u^{4-r}}\mathrm{d}u&=\int_0^\epsilon\frac{\sin^4 u}{u^{4-r}}\mathrm{d}u+\int_\epsilon^\infty\frac{\sin^4 u}{u^{4-r}}\mathrm{d}u\\
> > &\le M+\int_\epsilon^\infty u^{r-4} \mathrm{d}u\\
> > &=M+\frac{\epsilon^{r-3}}{r-3}\\
> > \end{aligned}
> > $$
>
> 则
> $$
> \int _ { 0 } ^ { \pi } t ^ { r } J _ { n } ( t ) \mathrm { d } t = c n^{3-r}
> $$
>
> 注意到 $\lambda_n = O(n^3)$ 
>
> > $$
> > \begin{aligned}
> > \lambda_n &= \int _{-\pi}^\pi J_n(t) \mathrm{d}t \\
> > &\le \int _{-\pi}^\pi \|J_n\|_\infty \mathrm{d}t \\
> > &\le \int _{-\pi}^\pi J_n(0) \mathrm{d}t \\
> > &\le \int _{-\pi}^\pi n^4 \mathrm{d}t \\
> > &\le n^3|^{\pi}_{-\pi} \\
> > \end{aligned}
> > $$
> >
> > 故 $\lambda_n = O(n^3)$ 
>
> 从而有
> $$
> \int _ { 0 } ^ { \pi } t ^ { r } L _ { n } ( t ) \mathrm { d } t = \frac { c } { \lambda _ { n } } \int _ { 0 } ^ { \pi } t ^ { r } J _ { n } ( t ) \mathrm { d } t = c \frac { n ^ { 3 - r } } { n ^ { 3 } } = O \left( n ^ { - r } \right) \quad ( r = 0,1,2 )
> $$
> 进而有
> $$
> \int _ { 0 } ^ { \pi } ( n t + 1 ) ^ { 2 } L _ { n } ( t ) \mathrm { d } t = O ( 1 )
> $$

**定理 5.2**（Jackson-Zygmund） $\exist M$，$\forall f \in \overset{\circ}{C}$，有
$$
d(f,\overset{\circ}{\mathcal{P}}_n)\le M\omega_2\left(f,\frac{1}{n}\right)
$$
> $$
> \begin{aligned}
> |f(t)-(L_nf)(t)|
> &=\left|\int_{-\pi}^\pi(f(t)-f(t+s))L_n(s)\mathrm{d}s\right|\\
> &=\left|\int_0^\pi(f(t)-f(t+s)+f(t)-f(t-s))L_n(s)\mathrm{d}s\right|\\
> &=\left|\int_0^\pi\Delta_s^2f(t-s) L_n(s)\mathrm{d}s\right|\\
> &\le\int_0^\pi\left|\Delta_s^2f(t-s)\right| L_n(s)\mathrm{d}s\\
> &\le\int_0^\pi\omega_2(f,s) L_n(s)\mathrm{d}s\\
> &=\int_0^\pi\omega_2\left(f,ns\frac{1}{n}\right) L_n(s)\mathrm{d}s\\
> &\le \omega_2\left(f,\frac{1}{n}\right) \int_0^\pi (ns+1)^2 L_n(s)\mathrm{d}s\\
> &= M\omega_2\left(f,\frac{1}{n}\right)\\
> \end{aligned}
> $$
>
> 注意到 $\text{range} L_n\subset\overset{\circ}{\mathcal{P}}_{2n-2}$，而不是 $\overset{\circ}{\mathcal{P}}_{n}$，但
> $$
> \omega _ { 2 } \left( f , \frac { 1 } { n } \right) = \omega _ { 2 } \left( f , \frac { 2 n - 2 } { n } \frac { 1 } { 2 n - 2 } \right) \leqslant 4 \omega _ { 2 } \left( f , \frac { 1 } { 2 n - 2 } \right)
> $$
> 则
> $$
> d \left( f , \overset{\circ} { \mathcal { P } } _ { 2 n - 2 } \right) \leqslant M \omega _ { 2 } \left( f , \frac { 1 } { 2 n - 2 } \right)
> $$
> 又
> $$
> d \left( f , \overset{\circ}{\mathcal { P }} _ { 2 n - 1 } \right) \leqslant d \left( f ,\overset{\circ}{\mathcal { P }} _ { 2 n - 2 } \right) \leqslant M \omega _ { 2 } \left( f , \frac { 1 } { 2 n - 2 } \right) \leqslant M ^ { \prime } \omega _ { 2 } \left( f , \frac { 1 } { 2 n - 1 } \right)
> $$
> 从而
> $$
> d \left( f , \overset{\circ} { \mathcal { P } } _ { n } \right) \leqslant M \omega _ { 2 } \left( f , \frac { 1 } { n } \right)
> $$
>
> > 奇数偶数情形都证好了，所以才有这个结论

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

> 证明类似引理 5.1

**引理 5.3** 
$$
\int_{-\pi}^\pi L_{\lceil n/r \rceil,r}(s)f(t+ks)\mathrm{d}s \in \overset{\circ}{\mathcal{P}}_n\quad(k=1,\dots,r)
$$
**定理 5.3**（Jackson-Stechkin 定理）$\forall r \in \mathbb{Z}^+$，$\forall f \in \overset{\circ}{C}$，$\exist C_r$，使得
$$
d(f,\overset{\circ}{\mathcal{P}}_n)\le C_r\omega_r\left(f,\frac{1}{n}\right)
$$

> 定理 5.2 是定理 5.3 的特殊情况（$r=2$）
>
> 证
>
> 定义
> $$
> (\Delta^0_{n,r}f)(t)\triangleq-\int_{-\pi}^\pi\sum_{k=1}^rC_k^r(-1)^kf(t+ks)L_{\lceil n/r \rceil,r}(s)\mathrm{d}s
> $$
>
> > 高阶差分公式为
> > $$
> > \Delta_h^r f(t)=\sum_{i=0}^r(-1)^{r-i}C^i_rf(t+ih)
> > $$
> > 对比 $(\Delta_{n,r}^0 f)(t)$，有
> > $$
> > \Delta_s^r f(t) = (-1)^{r}(f(t)-(\Delta_{n,r}^0f)(t))
> > $$
> > 因此
> > $$
> > |\Delta_s^r f(t)| = |f(t)-(\Delta_{n,r}^0f)(t)|
> > $$
>
> 由引理 3 得 $(\Delta^0_{n,r}f)(t) \in \overset{\circ}{\mathcal{P}}_n$ 
>
> 则
> $$
> \begin{aligned} \left| f - I _ { n , r } f ( t ) \right| & = \left| \int _ { - \pi } ^ { \pi } \left( \Delta _ { s } ^ { r } f \right) ( t ) L _ { \lceil n/r \rceil , r } ( s ) \mathrm { d } s \right| \\
> & \leqslant \int _ { - \pi } ^ { \pi } \omega _ { r } ( f , | s | ) L _ { \lceil n/r \rceil , r } ( s ) \mathrm { d } s \\
> & \leqslant \omega _ { r } \left( f , \frac { 1 } { \lceil n/r \rceil } \right) \int _ { - \pi } ^ { \pi } \left( \lceil n/r \rceil | s | + 1 \right) ^ { r } L _ { n ^ { \prime } , r } \mathrm { d } s \\
> & \leqslant C _ { r } \omega _ { r } \left( f , \frac { 1 } { n } \right) \end{aligned}
> $$

