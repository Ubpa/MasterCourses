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
4. $\int_0^\pi (ns+1)^2L_n(s)\mathrm{d}s = O(1)$ 

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
> & = c \frac { 1 } { n^ { r - 3 } } \int _ { 0 } ^ { \frac { n\pi } { 2 } } \frac { \sin ^ { 4 } u } { u ^ { 4 - r } } \mathrm { d } u
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
> > 参考书中引理 5.2 (4) 的另一证法的 (5.1.3) 式和 (5.1.4) 式
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
>   定义
>   $$
> (\Delta^0_{n,r}f)(t)\triangleq-\int_{-\pi}^\pi\sum_{k=1}^rC_k^r(-1)^kf(t+ks)L_{\lceil n/r \rceil,r}(s)\mathrm{d}s
>$$
> 
>> 高阶差分公式为
> > $$
> > \Delta_h^r f(t)=\sum_{i=0}^r(-1)^{r-i}C^i_rf(t+ih)
> > $$
> > 对比 $(\Delta_{n,r}^0 f)(t)$，有
>> $$
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
>& \leqslant \int _ { - \pi } ^ { \pi } \omega _ { r } ( f , | s | ) L _ { \lceil n/r \rceil , r } ( s ) \mathrm { d } s \\
> & \leqslant \omega _ { r } \left( f , \frac { 1 } { \lceil n/r \rceil } \right) \int _ { - \pi } ^ { \pi } \left( \lceil n/r \rceil | s | + 1 \right) ^ { r } L _ { n ^ { \prime } , r } \mathrm { d } s \\
>& \leqslant C _ { r } \omega _ { r } \left( f , \frac { 1 } { n } \right) \end{aligned}
> $$

### 5.1.2 Bernstein 逆定理

**定理 5.4** 设 $\varphi(u)$ 为单调下降的非负函数，序列 $0<u_k\le u_{k+1}\le\dots\le u_l$ 满足 $2\le u_i/u_{i-1}\le 4\quad(i=k+1,k+2,\dots,l)$，则 $\forall p \in \mathbb{R}$，$\exist M_p$，满足
$$
\sum _ { i = k } ^ { l } u _ { i } ^ { p } \varphi \left( u _ { i } \right) \leqslant M _ { p } \sum _ { \left[ \frac { 1 } { 2 } u _ { k } \right] \leqslant n < u _ { l } } ( n + 1 ) ^ { p - 1 } \varphi ( n )
$$

> 将无规律的样本点转换成均匀点
>
> 证明
>
> 令 $u_{k-1}=u_k/2$，则
> $$
> \begin{aligned}
> \sum_{i=k}^lu_i^p\varphi(u_i)
> &=\sum_{i=k}^lu_i^{p-1}\varphi(u_i)u_i\\
> &\le 2\sum_{i=k}^l u_i^{p-1}\varphi(u_i)(u_i-u_{i-1})
> \end{aligned}
> $$
> 当 $t\in[n,n+1]$ 时，有 $t^{p-1}\varphi(t)\le (n+1)^{p-1}\varphi(n)$ 
>
> 当 $p<1$ 时
> $$
> \begin{aligned}
> \sum_{i=k}^l u_i^{p-1}\varphi(u_i)(u_i-u_{i-1})
> &\le \int_{u_{k-1}}^{u_l}t^{p-1}\varphi(t)\mathrm{d}t\\
> &\le \sum_{\lfloor u_{k-1}\rfloor\le n < u_l} n^{p-1}\varphi(n)\\
> &\le M_p \sum_{\lfloor u_{k-1}\rfloor\le n < u_l} (n+1)^{p-1}\varphi(n)\\
> \end{aligned}
> $$
>
> > 图示
> >
> > ![image-20191031111214552](assets/image-20191031111214552.jpg)
> > 
>
> 当 $p>1$ 时
> $$
> \begin{aligned}
> \sum_{i=k}^l u_i^{p-1}\varphi(u_i)(u_i-u_{i-1})
> &\le \sum_{i=k}^l (4u_{i-1})^{p-1}\varphi(u_i)(u_i-u_{i-1})\\
> &\le 4^{p-1}\int_{u_{k-1}}^{u_l}t^{p-1}\varphi(t)\mathrm{d}t\\
> &\le 4^{p-1} \sum_{\lfloor u_{k-1}\rfloor\le n < u_l} (n+1)^{p-1}\varphi(n)\\
> &= M_p \sum_{\lfloor u_{k-1}\rfloor\le n < u_l} (n+1)^{p-1}\varphi(n)\\
> \end{aligned}
> $$

**推论 5.1** 
$$
\sum _ { i = k } ^ { l } \left( 2 ^ { i } \right) ^ { p } \varphi \left( 2 ^ { i } \right) \leqslant M _ { p } \sum _ { \lfloor 2 ^ { k - 1 } \rfloor \leqslant n < 2 ^ { l }} ( n + 1 ) ^ { p - 1 } \varphi ( n )
$$

> 定理 5.4 中取 $u_i=2^i$ 即可

**定理 5.5**（Bernstein 逆定理）$\exist M_p$，$\forall f \in \overset{\circ}{C},h>0$，有
$$
\omega _ { p } ( f , h ) \leqslant M_p h ^ { p } \sum _ { 0 \leqslant n \leqslant h^{-1} } ( n + 1 ) ^ { p - 1 } d ( f , \overset{\circ} { \mathcal { P } } _ { n } )
$$
> 令 $\|f-T_n\|_\infty=d(f,\overset{\circ}{\mathcal{P}}_n)\triangleq E_n(f)$ 
>
> > 即 $T_n=B_{\overset{\circ}{\mathcal{P}}_n}(f)$ 
>
> 当 $h>1$ 时，$n$ 仅能取 0，有
> $$
> \begin{aligned}
> \omega_p(f,h)
> &= \omega_p(f-T_0,h)\\
> &\le2^p \|f-T_0\|_\infty\\
> &=2^p d(f,\overset{\circ}{\mathcal{P}}_0)\\
> &\le 2^p h^pd(f,\overset{\circ}{\mathcal{P}}_0)\\
> \end{aligned}
> $$
> 下设 $h\le1$，取 $k\in\mathbb{Z}$ 使得 $2^k\le h^{-1} < 2^{k+1}$，有
> $$
> \begin{aligned}
> \left| \Delta _ { h } ^ { p } f ( t ) \right| & \leqslant \left| \Delta _ { h } ^ { p } T _ { 2 ^ { k } } ( t ) \right| + \left| \Delta _ { h } ^ { p } \left( f - T _ { 2 ^ { k } } \right) ( t ) \right| \\
> & \leqslant h ^ { p } \left\| T _ { 2 ^ { k } } ^ { ( p ) } \right\| _ { \infty } + \omega _ { p } \left( f - T _ { 2 ^ { k } } , h \right) \leqslant h ^ { p } \left\| T _ { 2 ^ { k } } ^ { ( p ) } \right\| _ { \infty } + 2 ^ { p } \left\| f - T _ { 2 ^ { k } } \right\| _ { \infty }
> \end{aligned}
> $$
> 下边分别估计 $\left\| T _ { 2 ^ { k } } ^ { ( p ) } \right\|$ 和 $\left\| f - T _ { 2 ^ { k } } \right\| _ { \infty }$ 的上界
> $$
> \begin{aligned}
> \left\| T _ { 2 ^ { k } } ^ { ( p ) } \right\|
> & \leqslant \left\| \left( T _ { 1 } - T _ { 0 } \right) ^ { ( p ) } \right\| + \sum _ { i = 1 } ^ { k } \left\| \left( T _ { 2 ^ { i } } - T _ { 2 ^ { i - 1 } } \right) ^ { ( p ) } \right\| \\
> & \leqslant 1 ^ { p } \left\| T _ { 1 } - T _ { 0 } \right\| + \sum _ { i = 1 } ^ { k } \left( 2 ^ { i } \right) ^ { p } \left\| T _ { 2 ^ { i } } - T _ { 2 ^ { i - 1 } } \right\| \\
> & \leqslant \varphi ( 1 ) + \varphi ( 0 ) + \sum _ { i = 1 } ^ { k } \left( 2 ^ { i } \right) ^ { p } \left\| T _ { 2 ^ { i } } - T _ { 2 ^ { i - 1 } } \right\| \\
> & \leqslant 2 \varphi ( 0 ) + \sum _ { i = 1 } ^ { k } \left( 2 ^ { i } \right) ^ { p } \left( \varphi \left( 2 ^ { i } \right) + \varphi \left( 2 ^ { i - 1 } \right) \right) \\
> & = 2 \varphi ( 0 ) + 2 ^ { p + 1 } \sum _ { i = 0 } ^ { k - 1 } \left( 2 ^ { i } \right) ^ { p } \varphi \left( 2 ^ { i } \right) \\
> & \leqslant 2 \varphi ( 0 ) + M _ { p } \sum _ { 0 \leqslant n \leqslant 2 ^ { k - 1 } } ( n + 1 ) ^ { p - 1 } \varphi ( n ) \\
> & \leqslant M _ { p } \sum _ { n=0 }^{2^k} ( n + 1 ) ^ { p - 1 } \varphi ( n ) 
> \end{aligned}
> $$
>
> > 第 1 行：绝对值不等式
> >
> > 第 2 行：[Bernstein 不等式](04_Polynomial.md) 
> >
> > 第 3 行：$\|T_a-T_b\|=\|T_a-f+f-T_b\|\le\|f-T_a\|+\|f-T_b\|$ 
> >
> > 第 4 行：单调性
> >
> > 第 6 行：推论 5.1
> >
> > 第 7 行：将 $\varphi(0)$ 放到后边的和式内，$M_p$ 增 2 即可
>
> $$
> \sum _ { n = 1 } ^ { 2 ^ { k } } ( n + 1 ) ^ { p - 1 } \varphi ( n ) \geqslant \varphi \left( 2 ^ { k } \right) \sum _ { n = 1 } ^ { 2 ^ { k } } ( n + 1 ) ^ { p - 1 } \geqslant M _ { p } ^ { \prime \prime } 2 ^ { k p } \varphi \left( 2 ^ { k } \right)
> $$
>
> 即 $2^p\varphi(2^k)\le M_p 2^{-kp}\sum _ { n=0  }^{2^k} ( n + 1 ) ^ { p - 1 } \varphi ( n ) $ 
>
> > 上式用了不等式
> > $$
> > \sum _ { n = 1 } ^ { 2 ^ { k } } ( n + 1 ) ^ { p - 1 } \geqslant \int _ { 1 } ^ { 2 ^ { k } + 1 } t ^ { p - 1 } \mathrm { d } t = \frac { 1 } { p } \left( \left( 2 ^ { k } + 1 \right) ^ { p } - 1 \right) \geqslant M _ { p } 2 ^ { k p }
> > $$
>
> 结合两个估计可得
> $$
> \begin{aligned}
> \left| \Delta _ { h } ^ { p } f ( t ) \right|
> &\leqslant M _ { p } \left( h ^ { p } + 2 ^ { - k p } \right) \sum _ { n = 0 } ^ { 2 ^ { k } } ( n + 1 ) ^ { p - 1 } \varphi ( n )\\
> &\leqslant M _ { p }  h ^ { p } \sum _ { 0\leqslant n\leqslant h^{-1} } ^ { 2 ^ { k } } ( n + 1 ) ^ { p - 1 } \varphi ( n )\\
> \end{aligned}
> $$
>
> > 上式用到了
> > $$
> > h^p\le2^{-kp}<2^ph^p
> > $$
> > 

**推论 5.2**（Bernstein）设 $0<\alpha <1$，则 $d(f,\overset{\circ}{\mathcal{P}}_n)=O(n^{-\alpha}) \Leftrightarrow \omega(f,h)=O(h^\alpha)$ 

> 必要性
>
> 由 [Jackson-Stechkin 定理](#5.1.1 Jackson 型定理) 知
> $$
> d(f,\overset{\circ}{\mathcal{P}}_n)=O(\omega(f,1/n))=O(n^\alpha)
> $$
> 充分性
>
> 由 Bernstein 逆定理（定理 5.5），取 $p=1$ 得
> $$
> \begin{aligned} \omega ( f , h ) & \leqslant C h \sum _ { 0 \leqslant n \leqslant h ^ { - 1 } } d \left( f , \overset{\circ}{\mathcal { P }} _ { n } \right) \\
> & \leqslant C _ { 1 } h \sum _ { 0 \leqslant n \leqslant h ^ { - 1 } } n ^ { - \alpha } + C _ { 2 } h d \left( f , \overset{\circ} { \mathcal { P } } _ { 0 } \right) \\
> & \leqslant C _ { 1 } h \int _ { 0 } ^ { h^{-1} } t ^ { - \alpha } \mathrm { d } t + C _ { 2 } h \leqslant C h ^ { \alpha } \end{aligned}
> $$

**推论 5.3** $d(f,\overset{\circ}{\mathcal{P}}_n)=O(n^{-1}) \Leftrightarrow \omega_2(f,h)=O(h)$ 

> 必要性
>
> 由 [Jackson-Zygmund 定理](#5.1.1 Jackson 型定理) 知
> $$
> d(f,\overset{\circ}{\mathcal{P}}_n)=O(\omega_2(f,1/n))=O(n^{-1})
> $$
> 充分性
>
> 由 Bernstein 逆定理（定理 5.5），取 $p=2$ 得
> $$
> \begin{aligned}
> \omega_2(f,h)&\le Mh^2\sum_{0\le n\le h^{-1}}(n+1)d(f,\overset{\circ}{P}_n)\\
> &= Mh^2\left(d(f,\overset{\circ}{P}_0)+\sum_{1\le n\le h^{-1}}(n+1)d(f,\overset{\circ}{P}_n)\right)\\
> &\le Mh^2\left(\|f\|+\sum_{1\le n\le h^{-1}}(n+1)n^{-1}\right)\\
> &\le Mh^2\left(\|f\|+\int_{1}^{h^{-1}}\frac{t+1}{t}\mathrm{d}t\right)\\
> &\le Mh^2\left(\|f\|+h^{-1}\right)=O(h)\\
> \end{aligned}
> $$
>
> > 因为我们关注的是 $h\to 0$ 的情形，所以上式的 $h$ 项更关键

**定理 5.6** 设整数 $p\ge 1$，
$$
\sum_{n=1}^\infty n^{p-1}E_n(f)<\infty
$$
则 $f\in \overset{\circ}{C}^{(p)}$，且
$$
d \left( f ^ { ( p ) } , \overset{\circ} { \mathcal { P } } _ { n } \right) \leqslant M _ { p } \sum _ { k = \left[ \frac { m } { 2 } \right] } ^ { \infty } k ^ { p - 1 } E _ { k } ( f )
$$

> 由定理 5.1 知，
> $$
> f=\lim_{r\to\infty}T_{2^rm}=T_m+\sum_{i=1}^\infty (T_{2^im}-T_{2^{i-1}m})
> $$
>
> 则
> $$
> \begin{aligned} \sum _ { i = 1 } ^ { \infty } \left\| \left( T _ { 2 ^ { i } m } - T _ { 2 ^ { i - 1 } m } \right) ^ { ( j ) } \right\| & \leqslant \sum _ { i = 1 } ^ { \infty } \left( 2 ^ { i } m \right) ^ { j } \left\| T _ { 2 ^ { i } m } - T _ { 2 ^ { i - 1 } m } \right\| \\ & \leqslant 2 \sum _ { i = 1 } ^ { \infty } \left( 2 ^ { i } m \right) ^ { j } E _ { 2 ^ { i - 1 } m } = 2 ^ { j + 1 } \sum _ { i = 0 } ^ { \infty } \left( 2 ^ { i } m \right) ^ { j } \varphi \left( 2 ^ { i } m \right)\\
> &\leqslant M _ { p } \sum _ { n = \left[ \frac { m } { 2 } \right] } ^ { \infty } ( n + 1 ) ^ { j - 1 } \varphi ( n ) < \infty
> \end{aligned}
> $$
>
> 其中 $\varphi(n)=E_n(f)$ 
>
> > 上边不等号的推演类似于定理 5.5
>
> 由于求导后的级数一致收敛，所以 $f\in \overset{\circ}{C}^{(p)}$，且
> $$
> \begin{aligned} \left\| f ^ { ( p ) } - T _ { m } ^ { ( p ) } \right\| & \leqslant \sum _ { i = 1 } ^ { \infty } \left\| \left( T _ { 2 ^ i m } - T _ { 2 ^ { i - 1 } m }\right) ^ { ( p ) } \| \right.\\ & \leqslant M _ { p } ^ { \prime } \sum _ { n = \left( \frac { m } { 2 } \right) } ^ { \infty } ( n + 1 ) ^ { p - 1 } E _ { n } ( f ) \leqslant M _ { p } \sum _ { n = \left( \frac { m } { 2 } \right) } ^ { \infty } n ^ { p - 1 } E _ { n } ( f ) \end{aligned}
> $$

**推论 5.4** 设 $0<\alpha<1$，则
$$
f\in \overset{\circ}{\text{Lip}}_\alpha^{(p)}\triangleq\{f\in \overset{\circ}{C}^{(p)} : f^{(p)}\in \text{Lip} \alpha\} \Leftrightarrow d(f,\overset{\circ}{\mathcal{P}}_n)=O\left(\frac{1}{n^{p+\alpha}}\right)
$$

> 充分性
>
> 由 Jackson-Stechkin 定理，得
> $$
> d \left( f , \overset{\circ} { \mathcal { P } } _ { n } \right) = O \left( \omega _ { p + 1 } ( f , 1 / n ) \right) = O \left( n ^ { - p } \omega \left( f ^ { ( p ) } , 1 / n \right) \right) = O \left( n ^ { - p - \alpha } \right)
> $$
>
> > 第一个等号：Jackson-Stechkin 定理
> >
> > 第二个等号：连续模性质
> >
> > 第三个等号：左侧结论
>
> 必要性
>
> 由右侧可得
> $$
> \sum _ { n = 1 } ^ { \infty } n ^ { p - 1 } E _ { n } ( f ) = O \left( \sum _ { 1 } ^ { \infty } n ^ { - 1 - \alpha } \right) < \infty
> $$
> 则由定理 5.6 可得 $f\in \overset{\circ}{C}^{(p)}$，且
> $$
> \begin{align}
> \begin{aligned} d \left( f ^ { ( p ) } , \overset{\circ} { \mathcal { P } } _ { n } \right) & \leqslant M _ { p } ^ { \prime } \sum _ { k = \left[ \frac { n } { 2 } \right] } ^ { \infty } k ^ { p - 1 } E _ { k } ( f ) \leqslant M _ { p } ^ { \prime \prime } \sum _ { k = \left[ \frac { n } { 2 } \right] } ^ { \infty } k ^ { p - 1 } \cdot k ^ { - p - \alpha } \\ & \leqslant M _ { p } \int _ { \left[ \frac { n } { 2 } \right] } ^ { \infty } t ^ { - 1 - \alpha } \mathrm { d } t = O \left( n ^ { - \alpha } \right) \end{aligned}
> \end{align}
> $$
> 
> 由推论 5.2 知 $\omega(f^{(p)},h)=O(h^\alpha)$，即 $f^{(p)} \in \text{Lip}\alpha$，即 $f\in \overset{\circ}{\text{Lip}}_\alpha^{(p)}$ 

