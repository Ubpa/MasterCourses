# 09. B 样条及其性质

## 09.1 差商及其主要性质

**定义 9.1** 设给定节点
$$
t_1\le t_2\le \dots\le t_{r+1}=
\overbrace{\tau_1,\dots,\tau_1}^{l_1} 
< \dots<\overbrace{\tau_d,\dots,\tau_d}^{l_d},\quad \sum_{i=1}^d l_i=r+1
$$
和函数 $f$，将函数 $f$ 在点 $t_1,\dots,t_{r+1}$ 的 $r$ 次差商定义为
$$
\begin{aligned}[]
[t_1,t_2]f&\triangleq\left\{\begin{array}{ll}
\frac{f(t_2)-f(t_1)}{t_2-t_1},&t_1<t_2,\\
f^\prime(t_1),&t_1=t_2.
\end{array}\right.\\[]
[t_1,\dots,t_{r+1}]f&\triangleq\left\{\begin{array}{ll}
\frac{[t_2,\dots,t_{r+1}]f-[t_1,\dots,t_r]f}{t_{r+1}-t_1},&t_1<t_{r+1},\\
\frac{1}{r!}f^{(r)}(t_1),&t_1=t_{r+1}\\
\end{array}\right.
\end{aligned}
$$

---

存在唯一的 $r$ 次多项式 $p_r(x)$ 在点 $\{t_i\}_{i=1}^{r+1}$ 插值于函数 $f$，即满足
$$
D^{j-1}p_r(\tau_i)=D^{j-1}f(\tau_i)\quad(i=1,\dots,d;j=1,\dots,l_i)
$$
**定理 9.1** $[t_1,\dots,t_{r+1}]f$ 即为点 $\{t_i\}_{i=1}^{r+1}$ 插值于函数 $f$ 的 $r$ 次多项式 $p_r(x)$ 的 $x^r$ 项系数

---

定义矩阵
$$
M \left( \begin{array} { l l l } { t _ { 1 } , } & { t _ { 2 } , } & { \cdots , } & { t _ { m } } \\ { u _ { 1 } , } & { u _ { 2 } , } & { \cdots , } & { u _ { m } } \end{array} \right) = \left(
\begin{array} { c c c c }
{ u _ { 1 } \left( \tau _ { 1 } \right) } & { u _ { 2 } \left( \tau _ { 1 } \right) } & { \cdots } & { u _ { m } \left( \tau _ { 1 } \right) } \\
{ D u _ { 1 } \left( \tau _ { 1 } \right) } & { D u _ { 2 } \left( \tau _ { 1 } \right) } & { \cdots } & { D u _ { m } \left( \tau _ { 1 } \right) } \\
{ \vdots } & { \vdots } & { } & { \vdots } \\
{ D ^ { l _ { 1 } - 1 } u _ { 1 } \left( \tau _ { 1 } \right) } & { D ^ { l _ { 1 } - 1 } u _ { 2 } \left( \tau _ { 1 } \right) } & { \cdots } & { D ^ { l _ { 1 } - 1 } u _ { m } \left( \tau _ { 1 } \right) } \\
{ \vdots } & { \vdots } & { } & { \vdots } \\
{ u _ { 1 } \left( \tau _ { d } \right) } & { u _ { 2 } \left( \tau _ { d } \right) } & { \cdots } & { u _ { m } \left( \tau _ { d } \right) } \\
{ \vdots } & { \vdots } & { } & { \vdots } \\
{ D ^ { l _ { d } - 1 } u _ { 1 } \left( \tau _ { d } \right) } & { D ^ { l _ { d } - 1 } u _ { 2 } \left( \tau _ { d } \right) } & { \cdots } & { D ^ { l _ { d } - 1 } u _ { m } \left( \tau _ { d } \right) }
\end{array}
\right)
$$
以及相应行列式
$$
D \left( \begin{array} { c c c c } { t _ { 1 } , } & { t _ { 2 } , } & { \cdots , } & { t _ { m } } \\ { u _ { 1 } , } & { u _ { 2 } , } & { \cdots , } & { u _ { m } } \end{array} \right) = \operatorname { det } M \left( \begin{array} { c c c c } { t _ { 1 } , } & { t _ { 2 } , } & { \cdots , } & { t _ { m } } \\ { u _ { 1 } , } & { u _ { 2 } , } & { \cdots , } & { u _ { m } } \end{array} \right)
$$
**推论 9.1** 
$$
\left[ t _ { 1 } , t _ { 2 } , \cdots , t _ { r + 1 } \right] f = \frac { D \left( \begin{array} { c c c c c } { t _ { 1 } , } & { t _ { 2 } , } & { \cdots , } & { t _ { r } , } & { t _ { r + 1 } } \\ { 1 , } & { x , } & { \cdots , } & { x ^ { r - 1 } , } & { f } \end{array} \right) } { V \left( t _ { 1 } , t _ { 2 } , \cdots , t _ { r + 1 } \right) }
$$
其中 $V \left( t _ { 1 } , t _ { 2 } , \cdots , t _ { r + 1 } \right) = D \left( \begin{array} { c c c c } { t _ { 1 } , } & { t _ { 2 } , } & { \cdots , } & { t _ { r + 1 } } \\ { 1 , } & { x , } & { \cdots , } & { x ^ { r } } \end{array} \right)$ 为 Vandermonde 行列式

> **证明** 
>
> 插值多项式 $p_r(x)=\sum_{i=0}^r c_i x^i$，插值条件对应方程组的矩阵形式为
> $$
> M \left( \begin{array} { l l l } { t _ { 1 } , } & { t _ { 2 } , } & { \cdots , } & { t _ { m } } \\ { u _ { 1 } , } & { u _ { 2 } , } & { \cdots , } & { u _ { m } } \end{array} \right)
> \left(\begin{matrix}
> c_0\\c_1\\\vdots\\c_r
> \end{matrix}\right)=\left(\begin{matrix}
> f(\tau_1)\\\vdots\\D^{l_1-1}f(\tau_1)\\\vdots\\f(\tau_d)\\\vdots\\D^{l_d-1}f(\tau_d)
> \end{matrix}\right)
> $$
> 

**推论 9.2** $[t_1,\dots,t_{r+1}]f$ 是定义在所有光滑函数上的**线性泛函**，而且如果函数 $f$ 和 $g$ 在 $\{t_i\}_{i=1}^{r+1}$ 上满足 $D^{j-1}f(\tau_i)=D^{j-1}g(\tau_i)\ (i=1,\dots,d;j=1,\dots,l_i)$，则 $[t_1,\dots,t_{r+1}]f=[t_1,\dots,t_{r+1}]g$ 

**推论 9.3** 下述性质成立

(1) $[t_1,\dots,t_{r+1}]f=\frac{f^{(r)}(\zeta)}{r!}(t_1\le \zeta\le t_{r+1})$ 

(2) $[t_1,\dots,t_{r+1}]x^j=\rho_{j-r}(t_1,\dots,t_{r+1})$，其中
$$
\rho_l=\left\{\begin{array}{ll}
0,&l<0\\
1,&l=0\\
\sum_\limits{1\le \alpha_i\le \dots\le \alpha_l\le r+1}t_{\alpha_1}\dots t_{\alpha_l},&l>0
\end{array}\right.
$$
$\rho_l(t_1,\dots,t_{r+1})(l>0)$ 是 $C_{r+l}^{l}$ 项求和

**定理 9.2** 

(1) 若 $t_1<\dots<t_{r+1}$，则
$$
\left[ t _ { 1 } , \cdots , t _ { r + 1 } \right] f = \sum _ { i = 1 } ^ { r + 1 } \frac { f \left( t _ { i } \right) } { w ^ { \prime } \left( t _ { i } \right) } = \sum _ { i = 1 } ^ { r + 1 } \frac { f \left( t _ { i } \right) } { \prod _ { j = 1 , j \neq i } ^ { r + 1 } \left( t _ { i } - t _ { j } \right) }
$$
其中 $\omega(t)=\prod_{i=1}^{r+1}(t-t_i)$ 

> 由此可推出 $\left[ t _ { 1 } , \cdots , t _ { r + 1 } \right] f=[t_{\pi(1)},\dots,t_{\pi(r+1)}]f$，$\pi$ 是任意置换函数

(2) 设 $t_1\le t_2\le \dots\le t_{r+1}=\overbrace{\tau_1,\dots,\tau_1}^{l_1}<\dots<\overbrace{\tau_d,\dots,\tau_d}^{l_d}$，则
$$
\left[ t _ { 1 } , \cdots , t _ { r + 1 } \right] f = \sum_{i=1}^d\sum_{j=1}^{l_i}\alpha_{ij}D^{j-1}f(\tau_i)
$$
且 $\alpha_{i,l_i}\neq 0\ (i=1,\dots,d)$ 

**定理 9.3**（Leibniz 公式）对任意 $\{t_i\}_{i=1}^{r+1}$ 和光滑函数 $f$，$g$，都有
$$
\left[ t _ { 1 } , t _ { 2 } , \cdots , t _ { r + 1 } \right] f \cdot g = \sum _ { i = 1 } ^ { r + 1 } \left[ t _ { 1 } , t _ { 2 } , \cdots , t _ { i } \right] f \cdot \left[ t _ { i } , t _ { i + 1 } , \cdots , t _ { r + 1 } \right] g
$$
**推论 9.4** 差商满足消去性质，即
$$
[t_1,\dots,t_{r+1}](t-t_{r+1})f=[t_1,\dots,t_r]f
$$

> 由 **定理 9.3** 得
> $$
> \begin{aligned}[]
> [t_1,\dots,t_{r+1}](t-t_{r+1})f&=[t_1,\dots,t_r]f\cdot[t_r,t_{r+1}](t-t_{r+1})+[t_1,\dots,t_{r+1}]f\cdot[t_{r+1}](t-t_{r+1})\\
> &=[t_1,\dots,t_r]f
> \end{aligned}
> $$

**定理 9.4** 当 $\epsilon_i\to 0$ 时，如果 $\{t_{i,\epsilon_i}\}_{i=1}^{r+1}$ 趋于 $\{t_i\}_{i=1}^{r+1}$，则对光滑函数 $f$，有
$$
\lim_\limits{\begin{array}{cc}\epsilon_i\to0\\i=1,\dots,r+1\end{array}}[t_{1,\epsilon_1},\dots,t_{r+1}\epsilon_{r+1}]f=[t_1,\dots,t_{r+1}]f
$$
**定理 9.5** 设点列 $\{t_i\}_{i=1}^{r+1}$ 给定，固定 $1\le j\le r+1$，设 $t_j\neq t_i,i\neq j$ 时，对光滑函数 $f$，有
$$
\frac { \partial } { \partial t _ { j } } \left[ t _ { 1 } , \cdots , t _ { r + 1 } \right] f = \left[ t _ { 1 } , \cdots , t _ { j - 1 } , t _ { j } , t _ { j } , t _ { j + 1 } , \cdots , t _ { r + 1 } \right] f
$$

> **证明** 
> $$
> \begin{array} { l }
> { \left[ t _ { 1 } , t _ { 2 } , \cdots , t _ { j - 1 } , t _ { j } + \varepsilon , \cdots , t _ { r + 1 } \right] f - \left[ t _ { 1 } , t _ { 2 } , \cdots , t _ { r + 1 } \right] f } \\
> { \quad = \left[ t _ { 1 } , t _ { 2 } , \cdots , t _ { j - 1 } , t _ { j + 1 } , \cdots , t _ { r + 1 } , t _ { j } + \varepsilon \right] f - \left[ t _ { j } , t _ { 1 } , t _ { 2 } , \cdots , t _ { j - 1 } , t _ { j + 1 } , \cdots , t _ { r + 1 } \right] f } \\
> { \quad = \varepsilon \left[ t _ { j } , t _ { 1 } , \cdots , t _ { j - 1 } , t _ { j + 1 } , \cdots , t _ { r + 1 } , t _ { j } + \varepsilon \right] f } \end{array}
> $$
> 上式除以 $\varepsilon$，再令 $\varepsilon\to 0$，根据 **定理 9.4** 就证明了定理

**定理 9.6** 设
$$
t_1\le t_2\le \dots\le t_{r+1}=
\overbrace{\tau_1,\dots,\tau_1}^{l_1} 
< \dots<\overbrace{\tau_d,\dots,\tau_d}^{l_d},\quad \sum_{i=1}^d l_i=r+1
$$
则
$$
\frac{\part}{\part \tau_i}[t_1,\dots,t_{r+1}]f=l_i[\overbrace{\tau_1,\dots,\tau_1}^{l_1},\dots,\overbrace{\tau_i,\dots,\tau_i}^{l_i+1},\dots,\overbrace{\tau_d,\dots,\tau_d}^{l_d}]f
$$
**定理 9.7** 设 $0\le i\le r-1$ 是固定的整数，且
$$
\alpha _ { j } \triangleq \min _ { 1 \leqslant \nu \leqslant r + 1 - j } \left| t _ { \nu + j } - t _ { \nu } \right| > 0 \quad ( j = i + 1 , i + 2 , \cdots , r )
$$
则
$$
\left| \left[ t _ { 1 } , t _ { 2 } , \cdots , t _ { r + 1 } \right] f \right| \leqslant \sum _ { \nu = 0 } ^ { r - i } \frac { \left( \begin{array} { c } { r - i } \\ { \nu } \end{array} \right) \Big| \left[ t _ { \nu + 1 } , t _ { \nu + 2 } , \cdots , t _ { \nu + i + 1 } \right] f \Big| } { \alpha _ { i + 1 } \alpha _ { i + 2 } \cdots \alpha _ { r } }
$$
**定理 9.8** 给定 $h>0$，$r$ 是一正整数，定义函数 $f$ 的 $r$ 阶向前差分为
$$
\Delta_h^rf(t)=r!h^r[t,t+h,\dotsm,t+rh]f
$$
性质：

(1) $\Delta_h^r f(t)=\sum_{i=0}^r(-1)^{r-i}C_r^if(t+ih)$ 

(2) $\Delta_h^rx^i=r!h^r\delta_{ir}(i=0,\dots,r)$ 

(3) $|\Delta_h^rf(t)|\le 2^r\|f\|_\infty$ 

(4) $\Delta_h^rf(t)=\int_0^h\dots\int_0^h D^rf(t+s_1+\dots+s_r)\mathrm{d}s_1\dots\mathrm{d}s_r$ 

## 09.2 B 样条的定义及其性质

### 09.2.1 B 样条的定义

**定义 9.2** 设 $\{y_i\}_{i=-\infty}^{+\infty}$ 是一不减的实数序列。对给定的整数 $i$ 和 $m>0$ 以及所有的实数 $x$，
$$
Q _ { i } ^ { m } ( x ) \triangleq \left\{ \begin{array} { l l } { ( - 1 ) ^ { m } \left[ y _ { i } , y _ { i + 1 } , \cdots , y _ { i + m } \right] ( x - \cdot ) _ { + } ^ { m - 1 } } & { y _ { i } < y _ { i + m } } \\ { 0 } & { y _ { i } = y _ { i + m } } \end{array} \right.
$$
称为 $m$ 阶的、节点为 $y_i,y_{i+1},\dots,y_{i+m}$ 的 **B 样条** 

> B 样条 $Q_i^m(x)$ 是一个具有局部支集 $[y_i,y_{i+m}$) 的函数

若
$$
y_i\le \dots\le y_{i+m}=
\overbrace{\tau_1,\dots,\tau_1}^{m_1} 
< \dots<\overbrace{\tau_d,\dots,\tau_d}^{m_d},\quad \sum_{i=1}^d m_i=m+1
$$
则 $Q_i^m(x)$ 是 $m$ 阶的、节点为 $\tau_1,\dots,\tau_d$，重度向量为 $(m_1,\dots,m_d)$ 的样条函数

> $Q_i^m(x)$ 是多项式样条组成的函数

当 $m=1$ 时，由定义可得
$$
Q_i^1(x)=\left\{\begin{array}{ll}
\frac{1}{y_{i+1}-y_i},&y_i\le x < y_{i+1},\\
0,&\text{other}.
\end{array}\right.
$$
**定理 9.9** 

(1) 设 $y_i<y_{i+1}=\cdots=y_{i+m}$，则
$$
Q_i^m(x)=\left\{\begin{array}{ll}
\frac{(x-y_i)^{m-1}}{(y_{i+m}-y_i)^m},&y_i\le x < y_{i+m},\\
0,&\text{other}.
\end{array}\right.
$$
(2) 若 $y_i=\dots=y_{i+m-1}<y_{i+m}$，则
$$
Q_i^m(x)=\left\{\begin{array}{ll}
\frac{(y_{i+m}-x)^{m-1}}{(y_{i+m}-y_i)^m},&y_i\le x < y_{i+m},\\
0,&\text{other}.
\end{array}\right.
$$

### 09.2.2 B 样条的性质

**性质 1** B 样条函数满足如下递推关系：设 $m\ge 2$，$y_i<y_{i+m}$，则对所有的 $x\in \mathbb{R}$，都有
$$
Q_i^m(x)=\frac{(x-y_i)Q_i^{m-1}(x)+(y_{i+m}-x)Q_{i+1}^{m-1}(x)}{y_{i+m}-y_i}
$$
**性质 2** 设 $y_i<y_{i+m}$，$m>1$，$D_+$ 为右导数算子，则
$$
D_+Q_i^m(x)=(m-1)\frac{Q_i^{m-1}(x)-Q_{i+1}^{m-1}(x)}{y_{i+m}-y_i}
$$
**性质 3** 设 $y_i<y_{i+m}$，则：

(1)
$$
\left\{\begin{array}{ll}
Q_i^m(x)>0&y_i<x<y_{i+m}\\
Q_i^m(x)=0&\text{other}
\end{array}\right.
$$
(2) 在区间 $(y_i,y_{i+m})$ 的端点，
$$
\begin{array}{ll}
(-1)^{k+m-\alpha_i}D_+^kQ_i^m(y_i)=0 & k=0,\dots,m-1-\alpha_i\\
(-1)^{k+m-\alpha_i}D_+^kQ_i^m(y_i)>0 & k=m-\alpha_i,\dots,m-1
\end{array}
$$
且
$$
\begin{array}{ll}
(-1)^{m-\beta_{i+m}}D_-^kQ_i^m(y_{i+m})=0 & k=0,\dots,m-1-\beta_{i+m}\\
(-1)^{m-\beta_{i+m}}D_-^kQ_i^m(y_{i+m})>0 & k=m-\beta_{i+m},\dots,m-1
\end{array}
$$
其中
$$
\begin{aligned}
\alpha_i&\triangleq\max\{j:y_i=\dots=y_{i+j-1}\}\\
\beta_{i+m}&\triangleq\max\{j:y_{i+m}=\dots=y_{i+m-j+1}\}\\
\end{aligned}
$$
**性质 4** 

(1) 设 $y_l<y_{l+1}$，则在区间 $I_l\triangleq[y_l,y_{l+1}]$ 上，
$$
\mathcal{P}_m=\text{span}\{Q_i^m(x)\}_{i=l+1-m}^l
$$
(2) 如果 $l<r$，$y_{r-1}<y_r$，则 $\{Q_i^m(x)\}_{i=l-m+1}^{r-1}$ 在 $[y_l,y_r)$ 上是线性无关的

定义
$$
N_i^m(x)\triangleq(y_{i+m}-y_i)Q_i^m(x)
$$
并称 $N_i^m(x)$ 为 $m$ 阶的、节点为 $y_i,\dots,y_{i+m}$ 的**规范 B 样条**，显然 $m=1$ 时，
$$
N_i^1(m)=\left\{\begin{array}{ll}
1, &y_i\le x < y_{i+1},\\
0, &\text{other}
\end{array}\right.
$$
**性质 5** 规范 B 样条形成单位分解，即对任意 $x\in[y_j,y_{j+1})$，都有
$$
\sum_{i=j+1-m}^j N_i^m(x)=1
$$
**性质 6**（Marsden 恒等式）设 $l\le r$，$y_l< y_{r+1}$，则对任意 $y\in \mathbb{R}$，都有

(1)
$$
(y-x)^{m-1}=\sum_{i=l+1-m}^r\varphi_{i,m}(y)N_i^m(x)\quad(y_l\le x< y_{r+1})
$$
其中
$$
\varphi_{i,m}(y)=\prod_{\nu=1}^{m-1}(y-y_{i+\nu}),\quad \varphi_{i,1}(y)\triangleq 1
$$
(2) 特别地，对于 $j=1,\dots,m$ 
$$
x^{j-1}=\sum_{i=l+1-m}^r\xi_i^{(j)}N_i^m(x)\quad(y_l\le x<y_{r+1})
$$
其中
$$
\xi _ { i } ^ { ( j ) } \triangleq ( - 1 ) ^ { j - 1 } \frac { ( j - 1 ) ! } { ( m - 1 ) ! } D ^ { m - j } \varphi _ { i , m } ( 0 ) \quad ( l + 1 - m \leqslant i \leqslant r )
$$
定义对称函数 $\text{symm}_j(t_1,\dots,t_p)$：
$$
\varphi(t)=\prod_{i=1}^p(t-t_i)=\sum_{j=0}^pt^{p-j}(-1)^j\text{symm}_j(t_1,\dots,t_p)
$$
由定义易得
$$
\begin{aligned}
\text{symm}_0(t_1,\dots,t_p)&=1\\
\text{symm}_1(t_1,\dots,t_p)&=\sum_{i=1}^p t_i\\
\text{symm}_p(t_1,\dots,t_p)&=\prod_{i=1}^p t_i\\
\end{aligned}
$$
定义式两边在 $t=0$ 处取 $p-j$ 次导数，得
$$
\text{symm}_j(t_1,\dots,t_p)=(-1)^j\frac{D^{p-j}\varphi(0)}{(p-j)!}
$$
故
$$
\xi_i^{(j)}=\frac{\text{symm}_{j-1}(y_{i+1},\dots,y_{i+m-1})}{C_{m-1}^{j-1}}
$$
对性质 6 (2) 取 $j=2$ 得
$$
x = \sum _ { i = l + 1 - m } ^ { r } \frac { y _ { i + 1 } + y _ { i + 2 } + \cdots + y _ { i + m - 1 } } { m - 1 } N _ { i } ^ { m } ( x )
$$
**性质 7** 

(1)（差商的 Peano 表示）
$$
\left[ y _ { i } , y _ { i + 1 } , \cdots , y _ { i + m } \right] f = \int _ { y _ { i } } ^ { y _ { i + m } } \frac { ( - 1 ) ^ { j } D _ { + } ^ { j } Q _ { i } ^ { m } ( x ) D ^ { m - j } f ( x ) } { ( m - 1 ) ! } \mathrm { d } x
$$
(2)（矩量）
$$
\int_{y_i}^{y_{i+m}}(-1)^jD^j_+Q_i^m(x)\cdot x^\nu\mathrm{d}x=
\left\{\begin{array}{ll}
0,&\nu=0,\dots,j-1\\
\frac{\nu!(m-1)!}{(m+\nu-j)!}\rho_{\nu-j}(y_i,\dots,y_{i+m}),&\nu=j,\dots
\end{array}\right.
$$
特别地，
$$
\begin{aligned}
\int _ { y _ { i } } ^ { y _ { i + m } } Q _ { i } ^ { m } ( x ) \mathrm { d } x &= \frac { 1 } { m } \\
\int _ { y _ { i } } ^ { y _ { i + m } } x Q _ { i } ^ { m } ( x ) \mathrm { d } x &= \frac { y _ { i } + y _ { i + 1 } + \cdots + y _ { i + m } } { m ( m + 1 ) }
\end{aligned}
$$

> 第一个取 $j=0,\nu=0$；第二个取 $j=0,\nu=1$ 

性质 7 (1) 取 $j=0$ 得
$$
\left[ y _ { i } , y _ { i + 1 } , \cdots , y _ { i + m } \right] f = \int _ { y _ { i } } ^ { y _ { i + m } } \frac { Q _ { i } ^ { m } ( x ) D ^ { m } f ( x ) } { ( m - 1 ) ! } \mathrm { d } x
\triangleq \int _ { y _ { i } } ^ { y _ { i + m } } K(x) D ^ { m }f ( x )\mathrm { d } x
$$
其中 $K(x)=\frac { Q _ { i } ^ { m } ( x )   } { ( m - 1 ) ! }=\frac{1}{(m-1)!}[y_i,\dots,y_{i+m}](\cdot-x)_+^{m-1}$ 

记差商算子 $[y_i,\dots,y_{i+1}]$ 为 $L$，则
$$
L(f)=\int_{y_i}^{y_{i+m}}K(x)D^mf(x)\mathrm{d}x
$$
其中 $K(x)=\frac{1}{(m-1)!}L((\cdot-x)_+^{m-1})$ 

**定理 9.10** 设 $f$ 为光滑函数，线性泛函 $L$ 为
$$
L ( f ) \triangleq \int _ { a } ^ { b } \sum _ { i = 0 } ^ { m - 1 } a _ { i } ( x ) f ^ { ( i ) } ( x ) \mathrm { d } x + \sum _ { i = 1 } ^ { n } \sum _ { j = 0 } ^ { m - 1 } b _ { i j } f ^ { ( j ) } \left( x _ { i } \right)
$$
且对任意 $p\in \mathcal{P}_m$，都有 $L(p)=0$，则
$$
L(f)=\int_{a}^{b}K(x)D^mf(x)\mathrm{d}x
$$
其中
$$
K(y)=\frac{1}{(m-1)!}L_x[(x-y)^{m-1}_+]
$$
**推论 9.5** 如果核 $K(y)$ 在 $[a,b]$ 上不改变符号，则对任意 $f\in C^m[a,b]$，都有
$$
L(f)=\frac{f^{(m)}(\xi)}{m!}L(x^m)\quad(a\le \xi \le b)
$$
**性质 8** B 样条的内积：设 $y_i<y_{i+m}$，$y_j<y_{j+n}$，则
$$
\int_{-\infty}^{+\infty}Q_i^m(x)Q_j^n(x)\mathrm{d}(x)=\frac{(-1)^m(m-1)!(n-1)!}{(m+n-1)!}[y_i,\dots,y_{i+m}]_x[y_j,\dots,y_{j+n}]_y(y-x)^{m+n-1}_+
$$
**性质 9** B 样条对节点的连续性依赖：设 $y_i\le \dots\le y_{i+m}=\overbrace{\tau_1,\dots,\tau_d}^{l_1},\dots,\overbrace{\tau_d,\dots,\tau_d}^{l_d}\ (\sum_{i=1}^d l_i=m+1)$，$y_i<y_{i+m}$，$y_i^{(\nu)}\le \dots\le y_{i+m}^{(\nu)}$ 是点的序列，且当 $\nu\to\infty$ 时，$y_j^{(\nu)}\to y_j$。又设 $Q_i^m(x)$，$Q_{i,\nu}^m(x)$ 是分别与节点 $\{y_j\}_{j=i}^{i+m}$，$\{y_j^{(\nu)}\}_{j=i}^{i+m}$ 相联系的 B 样条，则对 $k=0,\dots,m-1$，有
$$
D _ { + } ^ { k } Q _ { i , \nu } ^ { m } ( x ) \rightarrow D _ { + } ^ { k } Q _ { i } ^ { m } ( x ) \quad \left( \nu \rightarrow \infty , x \in \mathbb { R } \backslash J _ { i } ^ { k } \right)
$$
其中
$$
J_i^k\triangleq\{\tau_j:l_j\ge m-k\}
$$
且收敛在不包含 $J_i^k$ 的任何闭集上是一致的

