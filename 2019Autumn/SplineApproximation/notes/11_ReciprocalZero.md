# 11. 对偶基和样条的零点

## 11.1 完全 B 样条

**第一类 Tchebycheff 多项式** 
$$
T_m(x)=\cos(m\arccos x) \quad (-1\le x\le 1)
$$
性质

- $T_m(x)$ 是关于 $x$ 的 $m$ 次的多项式
- $T_m(x)$ 的递推公式

> $$
> \begin{aligned}
> T_0(x)&=1\\
> T_1(x)&=x\\
> T_m(x)&=2xT_{m-1}(x)-T_{m-2}(x)\quad(m=2,3,\dots)
> \end{aligned}
> $$
>
> 即
> $$
> T_m(x)=2^{m-1}x^m+\dots\quad(m\ge 1)
> $$

-  $T_m(-1)=(-1)^m$，$T_m(1)=1$，$T_m(-x)=(-1)^mT_m(x)$ 

> 当 $m=2k\ (k\in N)$ 时，$T_m$ 是偶函数；否则，$T_m$ 是奇函数

- $T^\prime_m(x)$ 的零点为 $\cos\frac{\pi i}{m}\ (i=1,\dots,m-1)$，$T_m(x)$ 在这些零点上取极值
- $T_m(x)$ 满足微分方程

> $$
> (1-x^2)T_m^{\prime\prime}-xT_m^\prime(x)+m^2T_m(x)=0
> $$

- 最佳一致逼近定理：一切首项系数为 1 的 $n$ 次多项式中，$\omega_n(x)=T_n(x)/2^{n-1}$ 对零的偏差最小。即对任意 $n$ 次首项系数为 1 的多项式 $p_n(x)$，都有

> $$
> \| w_n(x) \|_{C[-1,1]}\le \|p_n(x)\|_{C[-1,1]}
> $$

**定义 11.1** 设 $y_i=\cos\frac{m-i}{m}\pi\ (i=0,\dots,m)$，
$$
B^*_m(x)\triangleq (-1)^m m[y_0,\dots,y_{m}](x-\cdot)^{m-1}_+ 
$$
则称 $B^*_m(x)$ 为 $m$ 阶**完全 B 样条** 

> $y_0=\cos\pi=-1$，$y_m=\cos 0=1$ 

$B^*_m(x)$ 支集为 $[-1,1]$。当 $m=2,3$ 时，
$$
\begin{aligned}
B^*_2(x)&=2[-1,0,1](x-\cdot)_+
=\left\{\begin{array}{ll}
x+1 & -1\le x\le 0\\
1-x & 0\le x\le 1\\
0 & \text{other}
\end{array}\right.\\
B^*_3(x)&=-3\left[-1,-\frac{1}{2},\frac{1}{2},1\right](x-\cdot)^2_+=\left\{\begin{array}{ll}
2(x+1)^2 & -1\le x\le - \frac{1}{2}\\
1-2x^2 & -\frac{1}{2}\le x\le \frac{1}{2}\\
2(1-x)^2 & \frac{1}{2}\le x\le 1\\
0 & \text{other}
\end{array}\right.
\end{aligned}
$$

> **图例** 
>
> ![image-20191210150930251](assets/image-20191210150930251.png)

$B^*_m(x)$ 是偶函数

> $$
> \begin{aligned} B _ { m } ^ { * } ( - x ) & = ( - 1 ) ^ { m } m \left[ y _ { 0 } , y _ { 1 } , \cdots , y _ { m } \right] ( - x - \cdot ) _ { + } ^ { m - 1 } \\
> & = ( - 1 ) ^ { m } m \left[ - y _ { 0 } , - y _ { 1 } , \cdots , - y _ { m } \right] ( - x + \cdot ) _ { + } ^ { m - 1 } \cdot ( - 1 ) ^ { m } \\
> & = m \left[ y _ { 0 } , y _ { 1 } , \cdots , y _ { m } \right] ( - x + \cdot ) _ { + } ^ { m - 1 } \\
> & = ( - 1 ) ^ { m } m \left[ y _ { 0 } , y _ { 1 } , \cdots , y _ { m } \right] ( x - \cdot ) _ { + } ^ { m - 1 }\\
> & = B _ { m } ^ { * } ( x )
> \end{aligned}
> $$

**定理 11.1** 
$$
\int_{-1}^1 B^*_m(x)\mathrm{d}x=1\\
\left|D^{m-1}_+B^*_m(x)\right|=2^{m-2}(m-1)!\quad \left(x\in[-1,1]\right)
$$

> **证明** 
>
> 上式可用 [B 样条的性质 7(2)](09_BSpline.md) 证
>
> 下证下式
>
> 先计算
> $$
> [y_0,\dots,y_m]f=\sum_{i=0}^m\frac{f(y_i)}{\omega^\prime(y_i)}
> $$
> 其中
> $$
> \omega(x)=\prod_{i=0}^m(x-y_i)=(x^2-1)\frac{T_m^\prime(x)}{m2^{m-1}}
> $$
> 上式两边对 $x$ 求导，并利用 $T_m(x)$ 满足的微分方程，得
> $$
> m2^{m-1}\omega^\prime(x)=2xT_m^\prime(x)+(x^2-1)T_m^{\prime\prime}(x)=m^2T_m(x)+xT_m^\prime(x)
> $$
> 当 $i=1,\dots,m-1$ 时，$T_m^\prime(y_i)=0$，且 $T_m(y_i)=(-1)^{m-1}$，则
> $$
> \omega^{\prime}(y_i)=(-1)^{m-i}\frac{m}{2^{m-1}}\quad(i=1,\dots,m-1)
> $$
>
> 另
> $$
> \begin{aligned}
> \omega^\prime(1)&=\frac{m^2T_m(1)+T_m^\prime(1)}{m2^{m-1}}=\frac{m^2+m^2}{m2^{m-1}}=\frac{m}{2^{m-2}}\\
> \omega^\prime(-1)&=\frac{m^2T_m(-1)+T_m^\prime(-1)}{m2^{m-1}}=\frac{m(-1)^m}{2^{m-2}}\\
> \end{aligned}
> $$
> 因此
> $$
> \begin{aligned}
> &(-1)^m[y_0,\dots,y_m]f\\
> =&(-1)^m\sum_{i=0}^m\frac{f(y_i)}{\omega^\prime(y_i)}\\
> =&\frac{2^{m-2}}{m}\Big(f(y_0)+(-1)^1 2f(y_1)+\dots+(-1)^{m-1}2f(y_{m-1})+(-1)^mf(y_m)\Big)\\
> 
> \end{aligned}
> $$
> 则
> $$
> \begin{aligned}
>  & D^{m-1}_+B^*_m(x)\\
> =& m(m-1)!(-1)^m[y_0,\dots,y_m](x-\cdot)^0_+\\
> =& 2^{m-2}(m-1)!\Big((x-y_0)^0_++(-1)^1 2(x-y_1)^0_++\cdots+(-1)^{m-1}2(x-y_{m0-1})^0_++(-1)^m(x-y_m)^0_+\Big)\\
> \end{aligned}
> $$
> 则当 $y_i<x<y_{i+1}\ (i=0,\dots,m-1)$ 时，
> $$
> D^{m-1}_+B^*_m(x)=(-1)^i2^{m-2}(m-1)!
> $$

**定理 11.2** 对于 $0\le j\le m-2$，有
$$
\left\|D^j_+B^*_m(x)\right\|_{C[-1,1]}\le \frac{2^{j+1}(m-1)!}{(m-j-2)!}
$$
**定理 11.3** 令
$$
g(x)=\left\{\begin{array}{ll}
0 & x<-1\\
\int_{-1}^xB^*_m(t)\mathrm{d}t & -1\le x\le 1\\
1 & x\ge 1
\end{array}\right.
$$
则 $g(x)\in L^m_\infty(\mathbb{R})$，且它是极小化问题
$$
\min_{f\in U}\left\|D^m f\right\|_{L_\infty}
$$
的解，其中
$$
U\triangleq\{f\in L^m_\infty(\mathbb{R):f(x)=0,x\le -1;f(x)=1,x\ge 1}\}
$$

> $m$ 阶导绝对值最小

