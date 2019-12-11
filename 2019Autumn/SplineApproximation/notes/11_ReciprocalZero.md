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

## 11.2 对偶基

> 本章思路
>
> 逼近问题 $\Rightarrow$ 找对偶基 $\Rightarrow$ 特殊法 \ 通法一 \ 通法二 $\Rightarrow$ 通法一的估计

已知样条空间 $\mathcal{S}(\mathcal{P}_m,\mathfrak{M},\Delta)$ 的维数为 $m+K$，它有一组 B 样条基 $\{N_i^m(x)\}_{i=1}^{n}\ (n=m+K)$ 

问题：$\forall f\in C[a,b]$，求 $Qf\in \mathcal{S}(\mathcal{P}_m,\mathfrak{M},\Delta)$ 逼近 $f$，显然 $Qf$ 可表为
$$
Qf=\sum_{i=1}^n c_iN_i^m(x)
$$
其中 $c_i$ 依赖于 $f$，记为 $c_i(f)$，常选择这种依赖关系为线性关系，即 $c_i(f)=\lambda_if$，其中 $\lambda_i$ 为 $C[a,b]$ 上的连续线性泛函，有
$$
Qf=\sum_{i=1}^n(\lambda_if)N_i^m(x)
$$
因此，定义算子 $Q$ 等价于**确定一组线性泛函** $\{\lambda_i\}_{i=1}^n$ 

要求 $Q$ 对 $\mathcal{S}$ 不变，即 $\forall s\in \mathcal{S},Qs=s$，等价于
$$
\lambda_i(N^m_j(x))=\delta_{ij}\quad(i,j=1,\dots,n)
$$

> **证明** 
>
> 设
> $$
> s=\sum_{i=1}^n c_iN^m_i(x)
> $$
> 则
> $$
> Qs=\sum_{i=1}^n\lambda_i(s)N_i^m(x)=s=\sum_{i=1}^nc_iN^m_i(x)
> $$
> 即
> $$
> c_i=\lambda_i(s)=\sum_{j=1}^n c_j\lambda_i(N^m_j(x))
> $$
> 即
> $$
> \lambda_i(N^m_j(x))=\delta_{ij}\quad(i,j=1,\dots,n)
> $$

**定义 11.2** 设 $\{\lambda_i\}_{i=1}^n$ 是一组定义在空间 $\mathcal{S}=\text{span}\{N^m_i(x)\}_{i=1}^n$ 上的连续线性泛函，若 $\lambda_i(N^m_j(x))=\delta_{ij}\ (i,j=1,\dots,n)$ 成立，则称 $\{\lambda_i\}_{i=1}^n$ 为 $\mathcal{S}$ 上关于 $\{N^m_i(x)\}_{i=1}^n$ 的**对偶基** 

---

$s=\sum_{i=1}^n c_i N^m_i$ 中 $\|s\|_\infty$ 与 $\|c\|_\infty$ 的关系
$$
\|s\|_\infty\le \|c\|_\infty\le \max_{1\le j\le n}\|\lambda_j\|\|s\|_\infty
$$

> $\|s\|_\infty=\max_\limits{x}|s(x)|$，$\|c\|_\infty=\max_j |c_j|$，$\|\lambda_j\|\triangleq \sup_\limits{s\in\mathcal{S}}\frac{|\lambda_js|}{\|s\|_\infty}$ 
>
> ---
> 
> **证明** 
> $$
> \begin{aligned}
> \|s\|_\infty
> &=\left\|\sum_{i=1}^nc_iN^m_i(x)\right\|\\
> &\le \|c\|_\infty\left\|\sum_{i=1}^nN_i^m(x)\right\|\\
> &=\|c\|_\infty\\
> &=\max_j|\lambda_j s|\\
> &\le \max_{1\le j\le n}\|\lambda_j\|\|s\|_\infty
> \end{aligned}
> $$

---

当 $m=1,2$ 时，可用点泛函和局部积分的方法构造对偶基 $\{\lambda_i\}_{i=1}^n$ 

**m = 1** 

- 点泛函

> $$
> \lambda_j=[y_j]\quad(j=1,\dots,n)
> $$
>
> 可验证 $\lambda_jN^1_i=N^1_i(y_j)=\delta_{ij}$，则 $\{\lambda_i\}_{i=1}^n$ 是对偶基，且 $\|\lambda_j\|=1$ 
>
> > $$
> > \|\lambda_j\|=\sup_{s\in\mathcal{S}} \frac{|\lambda_js|}{\|s\|_\infty}=\sup_{s\in\mathcal{S}} \frac{|N^1_j(y_j)|}{\|s\|_\infty}\le 1
> > $$
> >
> > 且当 $s=N^1_j$ 时，$\frac{|s(y_j)|}{\|s\|_\infty}=1$，故 $\|\lambda_j\|=1$ 

- 局部积分

> $$
> \lambda_js=\int_{y_j}^{y_{j+1}}\frac{s(t)}{y_{j+1}-y_j}\mathrm{d}t\quad(j=1,\dots,n)
> $$
>
> 可验证 $\lambda_jN^1_i=N^1_i(y_j)=\delta_{ij}$，则 $\{\lambda_i\}_{i=1}^n$ 是对偶基，且 $\|\lambda_j\|=1$ 

**m = 2** 

- 点泛函

> $$
> \lambda _ { j } s \triangleq \left\{ \begin{array} { l l } { s \left( y _ { j + 1 } \right) } & { y _ { j } < y _ { j + 1 } < y _ { j + 2 } } \\ { s \left( y _ { j + 1 } + \right) } & { y _ { j } = y _ { j + 1 } < y _ { j + 2 } } \\ { s \left( y _ { j + 1 } - \right) } & { y _ { j } < y _ { j + 1 } = y _ { j + 2 } } \end{array} \right.
> $$
>
> 对于不同的节点，$N^2_j(x)$ 的图像如图 11.1 所示
>
> ![image-20191211165440132](assets/image-20191211165440132.png)
>
> 显然有
> $$
> \lambda_jN^2_i(x)=\delta_{ij}
> $$
> 且 $\|\lambda_j\|=1$ 

- 局部积分

> 设 $0<\epsilon<1$，定义
> $$
> \lambda_js=\int_{y_j}^{y_{i+2}}s(t)\varphi_j(t)\mathrm{d}t
> $$
> 若 $h_{j+1}=y_{j+2}-y_{j+1}>0$，则有
> $$
> \varphi_j(t)=\left\{\begin{array}{ll}
> \frac{1+\epsilon}{\epsilon h_{j+1}}&y_{j+1}\le t<y_{j+1}+\epsilon h_{j+1}\\
> \frac{-\epsilon}{(1-\epsilon)h_{j+1}} &y_{j+1}+\epsilon h_{j+1}\le t<y_{j+2}\\
> 0 & \text{other}
> \end{array}\right.
> $$
> 若 $h_j=y_{j+1}-y_j>0$，则
> $$
> \varphi_j(t)=\left\{\begin{array}{ll}
> \frac{-\epsilon}{\epsilon (1-\epsilon)h_{j+1}}&y_{j+1}\le t<y_{j+1}+(1-\epsilon) h_{j+1}\\
> \frac{1+\epsilon}{\epsilon h_{j+1}} &y_{j+1}+(1-\epsilon) h_{j+1}\le t<y_{j+2}\\
> 0 & \text{other}
> \end{array}\right.
> $$
> 不难验证 $\lambda_j N^2_j(x)=\delta_{ij}$，且
> $$
> \left| \lambda _ { j } s \right| = \left| \int _ { y _ { j } } ^ { y _ { j + 2 } } s \cdot \varphi _ { j } ( t ) \mathrm { d } t \right| \leqslant \| s \| _ { \infty } \int _ { y _ { j } } ^ { y _ { j + 2 } } | \varphi ( t ) | \mathrm { d } t \leqslant ( 1 + 2 \varepsilon ) \| s \| _ { \infty }
> $$
> 因而
> $$
> \|\lambda_j\|\le 1+2\epsilon
> $$

**定理 11.4** 设 $y_i\le \dots\le y_{n+m}$，$y_i<y_{i+m}$，$\mathcal{S}\triangleq \text{span}\{N^m_i(x)\}_{i=1}^n$，则存在 $\{\lambda_i\}_{i=1}^n$ 满足

(1)
$$
\lambda_iN^m_j(x)=\delta_{ij}
$$

(2)
$$
|\lambda_jf|\le(2m-1)9^{m-1}h_{j}^{-1/p}\|f\|_{L_p[\widetilde{I}_j]}\quad(1\le p\le \infty)
$$

其中
$$
\widetilde{I}_j\triangleq(y_j,y_{j+m}),\quad h_j\triangleq y_{i+m}-y_j\quad(j=1,\dots,n)
$$

> $$
> \lambda_js\triangleq\int_{y_j}^{y_{j+m}}s(x)D^m\psi_j(x)\mathrm{d}x\quad(j=1,\dots,n)
> $$
>
> 其中
> $$
> \psi_j(x)=G_j(x)\varphi_j(x)
> $$
> 其中
> $$
> G_j(x)=g\left(\frac{2x-y_j-y_{j+m}}{y_{j+m-y_j}}\right),\quad \varphi_j(x)=\frac{1}{(m-1)!}\prod_{i=1}^{m-1}(x-y_{j+i})\in \mathcal{P}_m
> $$
> 其中 $g(x)$ 是 **定理 11.3** 的过渡函数，则可知
> $$
> \left\{\begin{array}{ll}
> G_j(x)=0&x\le y_j\\
> 0\le G_j(x)\le 1 & y_j\le x\le y_{j+m}\\
> G_j(x)=1 & x\ge y_{j+m}
> \end{array}\right.
> $$

(2) 估计的上界很粗略，现考虑其可以小到什么程度

记
$$
D(m,\Delta)\triangleq\max_{1\le i\le n}\|\lambda_i\|
$$
其中 $\{\lambda_i\}_{i=1}^n$ 是 $\{N^m_i\}_{i=1}^n$ 的对偶基，定义
$$
D(m)\triangleq \sup_\Delta\{D(m,\Delta):y_i<y_{i+m} (i=1,\dots,n)\}
$$
由 $\|s\|_\infty\le \|c\|_\infty\le \max_{1\le j\le n}\|\lambda_j\|\|s\|_\infty$ 知
$$
\frac { \| c \| _ { \infty } } { \| s \| _ { \infty } } \leqslant \max _ { 1 \leqslant i \leqslant n } \left\| \lambda _ { i } \right\| = D ( m , \Delta )
$$
为得到 $D(m,\Delta)$ 的下界，令
$$
\tilde { D } ( m , \Delta ) = \sup \frac { \| c \| _ { \infty } } { \left\| \sum _ { i = 1 } ^ { n } c _ { i } N _ { i } ^ { m } \right\| _ { \infty } } \leqslant D ( m , \Delta )
$$
相应地定义
$$
\tilde { D }(m)\triangleq\sup_{\Delta}\{\widetilde{D}(m,\Delta):y_i<y_{i+m}\}
$$
显然有
$$
\tilde { D }(m)\le D(m)
$$
**定理 11.5** 设
$$
d_m=\frac{\mathrm{C}_{2m-3}^{m-2}}{\mathrm{C}_{m-2}^{\lfloor\frac{m-2}{2}\rfloor}}
$$
则
$$
\begin{array} { l } { d _ { m } \leqslant \tilde { D } ( m ) \leqslant D ( m ) \leqslant ( 2 m - 1 ) 9 ^ { m - 1 } } \\ { \frac { m - 1 } { m } 2 ^ { m - \frac { 3 } { 2 } } \leqslant d _ { m } \leqslant \frac { m } { m - 1 } 2 ^ { m - \frac { 3 } { 2 } } } \end{array}
$$

> 猜想 $d_m=D(m)$，已证 $m=1,\dots,10$ 时成立，但对任意 $m$，还没有被证明

---

一 B 样条到其他 B 样条空间的距离估计如下
$$
\begin{aligned} d \left( N _ { i } ^ { m } , \operatorname { span } \left( N _ { j } ^ { m } \right) _ { j = 1 , j \neq i } ^ { n } \right) & = \inf \left\{ \left\| \sum _ { j = 1 } ^ { n } c _ { j } N _ { j } ^ { m } ( x ) \right\| : c _ { i } = 1 \right\} \\ & \geqslant \inf \left\{ \frac { \| c \| _ { \infty } } { \tilde { D } ( m , \Delta ) } : c _ { i } = 1 \right\} \\ & = \frac { 1 } { \tilde { D } ( m , \Delta ) } \inf \left\{ \| c \| _ { \infty } : c _ { i } = 1 \right\} \\ & \geqslant \frac { 1 } { \tilde { D } ( m , \Delta ) } \geqslant \frac { 1 } { D ( m , \Delta ) } \\ & \geqslant \frac { 1 } { D ( m ) } \geqslant \frac { 1 } { ( 2 m - 1 ) 9 ^ { m - 1 } } \end{aligned}
$$
**定理 11.6** 定义算子
$$
\lambda_jf\triangleq \sum_{r<m}(-1)^r\varphi_j^{m-1-r}(\tau_j)f^{(r)}(\tau_j)\quad(j=1,\dots,n)
$$
其中 $\tau_j\in (y_j,y_{j+m})$，如果 $\tau_j$ 是某一节点，则 $\tau_j$ 可用 $\tau_j+$ 或 $\tau_j-$ 代替，$\varphi_j$ 定义在 **定理 11.4**，则
$$
\lambda_jN^m_i(x)=\delta_{ij}\quad(i,j=1,\dots,n)
$$
