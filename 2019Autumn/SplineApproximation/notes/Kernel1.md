# 8. 多项式样条的基本空间

## 8.1 定义、维数和基函数

设 $[a,b]$ 是有限的闭区间，分割
$$
\Delta\triangleq\{x_i\}_{i=1}^k,\quad a=x_0<x_1<\dots<x_{k}<x_{k+1}=b
$$
把区间 $[a,b]$ 分成 $k+1$ 个小区间 $I_i\triangleq [x_i,x_{i+1})\ (i=0,1,\dots,k-1)$ 和 $I_k\triangleq[x_k,x_{k+1}]$。又设 $\mathfrak{M}\triangleq (m_1,\dots,m_k)$ 是一个矢量，其中 $m_i$ 为满足 $1\le m_i \le m$ 的正整数

![image-20191114162930390](assets/image-20191114162930390.jpg)

**定义 8.1** 称空间
$$
\begin{aligned}
\mathcal { S } \left( \mathcal { P } _ { m } , \mathfrak { M } , \Delta \right) \triangleq \{ & s : s ( x ) = s _ { i } ( x ) \in \mathcal { P } _ { m } , x \in I _ { i } ( i = 0,1 , \cdots , k ) , D ^ { j } s _ { i - 1 } \left( x _ { i } \right) \\
&= D ^ { j } s _ { i } \left( x _ { i } \right) \left( i = 1,2 , \cdots , k ; j = 0,1 , \cdots , m - 1 - m _ { i } \right)\}
\end{aligned}
$$
为 $m$ 阶的、**重度向量**为 $\mathfrak{M}$ 的、以 $x_1,\dots,x_k$ 为节点的多项式样条空间

**定理 8.1** 

(1) 对任意 $s(x)\in \mathcal{S}(\mathcal{P}_m,\mathfrak{M},\Delta)$，必存在 $p(x)\in \mathcal{P}_m$，和实数 $\{\alpha_{ij}\}_{i,j=1}^{k,m_i}$ 使得
$$
s ( x ) = p ( x ) + \sum _ { i = 1 } ^ { k } \sum _ { j = 1 } ^ { m _ { i } } \alpha _ { i j } \left( x - x _ { i } \right) _ { + } ^ { m - j }=\sum _ { i = 0 } ^ { k } \sum _ { j = 1 } ^ { m _ { i } } \alpha _ { i j } \left( x - x _ { i } \right) _ { + } ^ { m - j }
$$

> 截断幂函数的性质
>
> - $x^m=x^m_++(-1)^m(-x)^m_+$ 
> - $(x^m_+)^\prime=mx^{m-1}_+$ 
> - $\int_a^b x^m_+\mathrm{d}x=\frac{1}{m+1}x^{m+1}_+\Big|^b_a$ 

(2) 空间 $\mathcal{S}$ 的维数为 $\dim(\mathcal{S})=m+\sum_{i=1}^k m_i$ 

## 8.2 局部基的构造

# 9. B 样条及其性质

## 9.1 差商及其主要性质

- 节点：$t_1\le t_2\le \dots\le t_{r+1}=
  \overbrace{\tau_1,\dots,\tau_1}^{l_1} 
  < \dots<\overbrace{\tau_d,\dots,\tau_d}^{l_d},\quad \sum_{i=1}^d l_i=r+1$ 
- 定义：$[t_1,\dots,t_{r+1}]f\triangleq\left\{\begin{array}{ll}
  \frac{[t_2,\dots,t_{r+1}]f-[t_1,\dots,t_r]f}{t_{r+1}-t_1},&t_1<t_{r+1},\\
  \frac{1}{r!}f^{(r)}(t_1),&t_1=t_{r+1}\\
  \end{array}\right.$ 
- $[t_1,\dots,t_{r+1}]f$ 即为在点 $\{t_i\}_{i=1}^{r+1}$ 插值于函数 $f$ 的 $r$ 次多项式 $p_r(x)$ 的 $x^r$ 项系数
- 矩阵：$M \left( \begin{array} { l l l } { t _ { 1 } , } & { t _ { 2 } , } & { \cdots , } & { t _ { m } } \\ { u _ { 1 } , } & { u _ { 2 } , } & { \cdots , } & { u _ { m } } \end{array} \right) = \left(
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
  \right)$ 
- 矩阵：$D \left( \begin{array} { c c c c } { t _ { 1 } , } & { t _ { 2 } , } & { \cdots , } & { t _ { m } } \\ { u _ { 1 } , } & { u _ { 2 } , } & { \cdots , } & { u _ { m } } \end{array} \right) = \operatorname { det } M \left( \begin{array} { c c c c } { t _ { 1 } , } & { t _ { 2 } , } & { \cdots , } & { t _ { m } } \\ { u _ { 1 } , } & { u _ { 2 } , } & { \cdots , } & { u _ { m } } \end{array} \right)$ 
- 行列式：$\left[ t _ { 1 } , t _ { 2 } , \cdots , t _ { r + 1 } \right] f = \frac { D \left( \begin{array} { c c c c c } { t _ { 1 } , } & { t _ { 2 } , } & { \cdots , } & { t _ { r } , } & { t _ { r + 1 } } \\ { 1 , } & { x , } & { \cdots , } & { x ^ { r - 1 } , } & { f } \end{array} \right) } { V \left( t _ { 1 } , t _ { 2 } , \cdots , t _ { r + 1 } \right) }\\V \left( t _ { 1 } , t _ { 2 } , \cdots , t _ { r + 1 } \right) = D \left( \begin{array} { c c c c } { t _ { 1 } , } & { t _ { 2 } , } & { \cdots , } & { t _ { r + 1 } } \\ { 1 , } & { x , } & { \cdots , } & { x ^ { r } } \end{array} \right)$ 
- 导数：$[t_1,\dots,t_{r+1}]f=\frac{f^{(r)}(\zeta)}{r!}\ (t_1\le \zeta\le t_{r+1})$ 
- 幂：$[t_1,\dots,t_{r+1}]x^j=\rho_{j-r}(t_1,\dots,t_{r+1})=\left\{\begin{array}{ll}0,&j<r\\1,&j=r\\\sum_\limits{1\le \alpha_1\le \dots\le \alpha_{j-r}\le r+1}t_{\alpha_1}\dots t_{\alpha_{j-r}},&j>r\end{array}\right.$ 
- 展开式：$\left[ t _ { 1 } , \cdots , t _ { r + 1 } \right] f = \sum _ { i = 1 } ^ { r + 1 } \frac { f \left( t _ { i } \right) } { w ^ { \prime } \left( t _ { i } \right) } = \sum _ { i = 1 } ^ { r + 1 } \frac { f \left( t _ { i } \right) } { \prod _ { j = 1 , j \neq i } ^ { r + 1 } \left( t _ { i } - t _ { j } \right) }\\\omega(t)=\prod_{i=1}^{r+1}(t-t_i)$ 
  - 交换性：$\left[ t _ { 1 } , \cdots , t _ { r + 1 } \right] f=[t_{\pi(1)},\dots,t_{\pi(r+1)}]f$ 
  - 系数：$[\alpha t_1,\dots,\alpha t_{r+1}]f = \sum _ { i = 1 } ^ { r + 1 } \frac { f \left( \alpha t _ { i } \right) } { \prod _ { j = 1 , j \neq i } ^ { r + 1 } \left( \alpha t _ { i } - \alpha t _ { j } \right) } = \frac{1}{\alpha^r} \sum _ { i = 1 } ^ { r + 1 } \frac { f \left( \alpha t _ { i } \right) } { \prod _ { j = 1 , j \neq i } ^ { r + 1 } \left( t _ { i } - t _ { j } \right) }=\frac{1}{\alpha^r}[t_1,\dots,t_{r+1}]f(\alpha\cdot)$ 
- 样本点：$\left[ t _ { 1 } , \cdots , t _ { r + 1 } \right] f = \sum_{i=1}^d\sum_{j=1}^{l_i}\alpha_{ij}D^{j-1}f(\tau_i),\alpha_{i,l_i}\neq 0\ (i=1,\dots,d)$ 
- 因式：$\left[ t _ { 1 } , t _ { 2 } , \cdots , t _ { r + 1 } \right] f \cdot g = \sum _ { i = 1 } ^ { r + 1 } \left[ t _ { 1 } , t _ { 2 } , \cdots , t _ { i } \right] f \cdot \left[ t _ { i } , t _ { i + 1 } , \cdots , t _ { r + 1 } \right] g$ 
- 消去：$[t_1,\dots,t_{r+1}](t-t_{r+1})f=[t_1,\dots,t_r]f$ 
- 导数：$\frac{\part}{\part \tau_i}[t_1,\dots,t_{r+1}]f=l_i[\overbrace{\tau_1,\dots,\tau_1}^{l_1},\dots,\overbrace{\tau_i,\dots,\tau_i}^{l_i+1},\dots,\overbrace{\tau_d,\dots,\tau_d}^{l_d}]f$ 
- 差分：$\Delta_h^rf(t)=r!h^r[t,t+h,\dotsm,t+rh]f$ 
  - $\Delta_h^r f(t)=\sum_{i=0}^r(-1)^{r-i}\mathrm{C}_r^if(t+ih)$ 
  - $|\Delta_h^rf(t)|\le 2^r\|f\|_\infty$ 
  - $\Delta_h^rf(t)=\int_0^h\dots\int_0^h D^rf(t+s_1+\dots+s_r)\mathrm{d}s_1\dots\mathrm{d}s_r$ 

## 9.2 B 样条的定义及其性质

### 9.2.1 B 样条的定义

- 定义：$Q _ { i } ^ { m } ( x ) \triangleq \left\{ \begin{array} { l l } { ( - 1 ) ^ { m } \left[ y _ { i } , y _ { i + 1 } , \cdots , y _ { i + m } \right] ( x - \cdot ) _ { + } ^ { m - 1 } } & { y _ { i } < y _ { i + m } } \\ { 0 } & { y _ { i } = y _ { i + m } } \end{array} \right.$ 
- 负：$[y_i,\dots,y_{i+m}](\cdot-x)^{m-1}_+=(-1)^m[t_i,\dots,t_{i+m}](x-\cdot)^{m-1}_+$ 
- 1 阶：$Q_i^1(x)=\left\{\begin{array}{ll}
  \frac{1}{y_{i+1}-y_i},&y_i\le x < y_{i+1},\\
  0,&\text{other}.
  \end{array}\right.$ 
- m 重
  - $y_i<y_{i+1}=\cdots=y_{i+m},Q_i^m(x)=\left\{\begin{array}{ll}
    \frac{(x-y_i)^{m-1}}{(y_{i+m}-y_i)^m},&y_i\le x < y_{i+m},\\
    0,&\text{other}.
    \end{array}\right.$ 
  - $y_i=\dots=y_{i+m-1}<y_{i+m},Q_i^m(x)=\left\{\begin{array}{ll}
    \frac{(y_{i+m}-x)^{m-1}}{(y_{i+m}-y_i)^m},&y_i\le x < y_{i+m},\\
    0,&\text{other}.
    \end{array}\right.$ 

### 9.2.2 B 样条的性质

- 递推：$Q_i^m(x)=\frac{(x-y_i)Q_i^{m-1}(x)+(y_{i+m}-x)Q_{i+1}^{m-1}(x)}{y_{i+m}-y_i}$ 
- 导数：$D_+Q_i^m(x)=(m-1)\frac{Q_i^{m-1}(x)-Q_{i+1}^{m-1}(x)}{y_{i+m}-y_i}$ 
- 基
  - $I_l\triangleq[y_l,y_{l+1}], \mathcal{P}_m=\text{span}\{Q_i^m(x)\}_{i=l+1-m}^l$ 
  - 如果 $l<r$，$y_{r-1}<y_r$，则 $\{Q_i^m(x)\}_{i=l-m+1}^{r-1}$ 在 $[y_l,y_r)$ 上是线性无关的
- 规范：$N_i^m(x)\triangleq(y_{i+m}-y_i)Q_i^m(x),N_i^1(x)=\left\{\begin{array}{ll}
  1, &y_i\le x < y_{i+1},\\
  0, &\text{other}
  \end{array}\right.$ 
- 剖分：$\forall x\in[y_j,y_{j+1}),\sum_{i=j+1-m}^j N_i^m(x)=1$ 
- Marsden
  - $(y-x)^{m-1}=\sum_{i=l+1-m}^r\varphi_{i,m}(y)N_i^m(x)\quad(y_l\le x< y_{r+1})\\\varphi_{i,m}(y)=\prod_{\nu=1}^{m-1}(y-y_{i+\nu})$ 
  - $x^{j-1}=\sum_{i=l+1-m}^r\xi_i^{(j)}N_i^m(x)\quad(y_l\le x<y_{r+1})\\\xi _ { i } ^ { ( j ) } \triangleq ( - 1 ) ^ { j - 1 } \frac { ( j - 1 ) ! } { ( m - 1 ) ! } D ^ { m - j } \varphi _ { i , m } ( 0 ) \quad ( l + 1 - m \leqslant i \leqslant r )$ 
- 对称函数
  - 定义：$\varphi(t)=\prod_{i=1}^p(t-t_i)=\sum_{j=0}^pt^{p-j}(-1)^j\text{symm}_j(t_1,\dots,t_p)$ 
  - 特殊：$\text{symm}_0(t_1,\dots,t_p)=1\\
    \text{symm}_1(t_1,\dots,t_p)=\sum_{i=1}^p t_i\\
    \text{symm}_p(t_1,\dots,t_p)=\prod_{i=1}^p t_i$ 
  - 公式：$\text{symm}_j(t_1,\dots,t_p)=(-1)^j\frac{D^{p-j}\varphi(0)}{(p-j)!}$ 
  - Marsden：$\xi_i^{(j)}=\frac{\text{symm}_{j-1}(y_{i+1},\dots,y_{i+m-1})}{C_{m-1}^{j-1}}\\x = \sum _ { i = l + 1 - m } ^ { r } \frac { y _ { i + 1 } + y _ { i + 2 } + \cdots + y _ { i + m - 1 } } { m - 1 } N _ { i } ^ { m } ( x )$ 
- Peano
  - $\left[ y _ { i } , y _ { i + 1 } , \cdots , y _ { i + m } \right] f = \int _ { y _ { i } } ^ { y _ { i + m } } \frac { ( - 1 ) ^ { j } D _ { + } ^ { j } Q _ { i } ^ { m } ( x ) D ^ { m - j } f ( x ) } { ( m - 1 ) ! } \mathrm { d } x$ 
  - $\int_{y_i}^{y_{i+m}}(-1)^jD^j_+Q_i^m(x)\cdot x^\nu\mathrm{d}x=
    \left\{\begin{array}{ll}
    0,&\nu=0,\dots,j-1\\
    \frac{\nu!(m-1)!}{(m+\nu-j)!}\rho_{\nu-j}(y_i,\dots,y_{i+m}),&\nu=j,\dots
    \end{array}\right.$ 
    - $\int _ { y _ { i } } ^ { y _ { i + m } } Q _ { i } ^ { m } ( x ) \mathrm { d } x = \frac { 1 } { m }$ 
    - $\int _ { y _ { i } } ^ { y _ { i + m } } x Q _ { i } ^ { m } ( x ) \mathrm { d } x = \frac { y _ { i } + y _ { i + 1 } + \cdots + y _ { i + m } } { m ( m + 1 ) }$ 
- 内积：$\int_{-\infty}^{+\infty}Q_i^m(x)Q_j^n(x)\mathrm{d}(x)=\frac{(-1)^m(m-1)!(n-1)!}{(m+n-1)!}[y_i,\dots,y_{i+m}]_x[y_j,\dots,y_{j+n}]_y(y-x)^{m+n-1}_+$ 

### 9.2.3 扩充分割

建立空间 $\mathcal{S}(\mathcal{P}_m,\mathfrak{M},\Delta)$ 的一个具有局部支集的基底，空间维数为 $m+K$，其中 $K$ 为分割 $\Delta$ 的节点数（计算重节点）。在 $K$ 个节点上仅能定义 $K-m$ 个 B 样条，不能构成空间 $\mathcal{S}$ 的基底，因此必须加进 $2m$ 个点，但不能在区间 $(x_0,x_{K+1})$ 内部增加，否则就改变了空间 $\mathcal{S}$ 

> 一个 B 样条需要顺序的 $m+1$ 个节点，而 $\mathcal{S}$ 总共有 $K$ 个节点，因此可以定义 $K-(m+1)+1=K-m$ 个 B 样条
>
> 引进 $2m$ 个点后，节点数变为 $K+2m$，可以定义 $K+m$ 个 B 样条

**定义 9.3** 对给定的 $a<x_1<\dots<x_k<b$ 和 $1\le m_i\le m\ (i=1,\dots,k)$，若 $y_1\le \cdots\le y_{2m+K}$ 满足
$$
y_1\le \cdots\le y_m\le a,\quad b\le y_{m+K+1}\le \dots\le y_{2m+K}\\
y_{m+1}\le \dots \le y_{m+K}=\overbrace{x_1,\dots,x_1}^{m_1}<\cdots<\overbrace{x_k,\dots,x_k}^{m_k}
$$
则称 $\{y_i\}^{2m+K}_{i=1}$ 为空间 $\mathcal{S}(\mathcal{P}_m,\mathfrak{M},\Delta)$ 的**扩充分割** 

$\{y_i\}_{i=1}^{2m+K}$ 一种特殊的取法是
$$
y_1=\dots=y_m=a,\quad y_{m+K+1}=\dots=y_{2m+K}=b
$$
这样就在 $\{y_i\}_{i=1}^{2m+K}$ 上定义了 $m+K$ 个 B 样条 $\{B_i(x)\}_{i=1}^{m+K}$ 
$$
B_i(x)=(-1)^m(y_{i+m}-y_i)[y_i,\dots,y_{i+m}](x-\cdot)^{m-1}_+
$$
即为 $N_i^m(x)$ 

当限制 $x\in [a,b]$ 时，$B_i(x)\in \mathcal{S}$，由于 $\{B_i(x)\}_{i=1}^{m+K}$ 的线性无关，故得到
$$
\mathcal{S}(\mathcal{P_m},\mathfrak{M},\Delta)=\text{span}\{B_i(x)\}_{i=1}^{m+K}
$$
即 $\{B_i(x)\}_{i=1}^{m+K}$ 构成空间 $\mathcal{S}$ 具有局部支集的基

根据 B 样条的定义，它是**右连续**的，因而必须定义
$$
B_{m+K}(b)=\lim_{x\to b-0}B_{m+K}(x)
$$
当 $b$ 不是 $m$ 重点时，上述定义式左、右极限无区别，但当 $b$ 为 $m$ 重点时，必须取左极限，这是为了保证 $B_{m+K}\in \mathcal{S}$，否则由于右连续性，$B_{m+K}(b)=0$，这样在区间 $I_k=[x_k,b]$ 中，$B_{m+K}$ 就不是一个多项式了

## 9.3 等距节点对应的 B 样条

### 9.3.1 定义

等距节点是指 $y_{i+1}-y_i=h$ 对所有的 $i$ 成立

（基本 B 样条）令
$$
\begin{aligned}
Q^m(x)
&\triangleq (-1)^m[0,\dots,m](x-\cdot)^{m-1}_+\\
&=\frac{(-1)^m\Delta^m(x-\cdot)^{m-1}_+}{m!}\\
&=\sum_{i=0}^m\frac{(-1)^i\mathrm{C}_m^i(x-i)^{m-1}_+}{m!}
\end{aligned}
$$

相应的规范 B 样条为
$$
N^m(x)=mQ^m(x)
$$
**定理 9.11** 设 $y_{i+j}=y_i+jh\ (j=0,\dots,m)$，则
$$
\begin{aligned}
Q_i^m(x)&=\frac{1}{h}Q^m\left(\frac{x-y_i}{h}\right)\\
N_i^m(x)&=\frac{1}{h}N^m\left(\frac{x-y_i}{h}\right)
\end{aligned}
$$

### 9.3.2 性质

**性质 1** 
$$
\int_0^m N^m(x)\mathrm{d}x=1
$$
**性质 2** 
$$
\begin{aligned}
N^m(x)&=xQ^{m-1}(x)+(m-x)Q^{m-1}(x-1)\\
N^m(x)&=N^m(m-x)
\end{aligned}
$$

**性质 3** 
$$
\begin{aligned}
D_+N^m(x)&=N^{m-1}(x)-N^{m-1}(x-1)\\
D^j_+N^m(x)&=\nabla ^jN^{m-j}(x)=\sum_{k=0}^j(-1)^k\mathrm{C}_j^k N^{m-j}(x-k)
\end{aligned}
$$

> $\nabla$ 是向后差分算子，即 $\nabla f(x)=f(x)-f(x-1)$ 

**性质 4** 
$$
\Delta ^mf(0)=\int_0^mN^m(x)D^mf(x)\mathrm{d}x
$$

**性质 5** 
$$
N^m(x)=\left(N^1 \star N^{m-1}\right)(x)=\int_0^1 N^{m-1}(x-t)\mathrm{d}t\quad(m\ge 2)
$$

**性质 6** B 样条的 Fourier 变换
$$
\begin{aligned}
\hat{N}^m(\omega)
&=\int_\mathbb{R}N^m(x)\mathrm{e}^{-\mathrm{i}\omega x}\mathrm{d}x\\
&=\left(\hat{N}^1(\omega)\right)^m\\
&=\left(\int_0^1 \mathrm{e}^{-\mathrm{i}\omega x}\mathrm{d}x\right)^m\\
&=\left(\frac{1-\mathrm{e}^{-\mathrm{i}\omega}}{\mathrm{i}\omega}\right)^m
\end{aligned}
$$
其中 $\mathrm{i} = \sqrt{-1}$ 

**性质 7** 对每个连续函数 $f(x)$，都有
$$
\int_\mathbb{R}f(x)N^m(x)\mathrm{d}x=\int_0^1\dots\int_0^1f(x_1+\dots+x_m)\mathrm{d}x_1\dots\mathrm{d}x_m
$$

---

等距节点关于原点对称的 B 样条
$$
M^m(x)\triangleq (-1)^mm\left[-\frac{m}{2},-\frac{m}{2}+1,\dots,\frac{m}{2}\right]=N^m\left(x+\frac{m}{2}\right)
$$
关于原点对称
$$
M^m(x)= N^m\left(x+\frac{m}{2}\right)=N^m\left(m-x-\frac{m}{2}\right)=N^m\left(-x+\frac{m}{2}\right)=M^m(-x)
$$
**定理 9.12** 对所有的 $1\le i\le m-1$，有

(1)
$$
M^m(x)=\left(M^i\star M^{m-i}\right)(x)=\int_{\mathbb{R}}M^i(t)M^{m-i}(x-t)\mathrm{d}t
$$
(2)
$$
M^m(x)=\frac{1}{2\pi}\int_\mathbb{R}\psi_m(\omega)e^{\mathrm{i}\omega x}\mathrm{d}\omega
$$
即 $\psi_m(\omega)$ 是 $M^m(x)$ 的 Fourier 变换

# 10. 样条函数的计算

## 10.1 样条函数及其导数值的计算

样条——开花
$$
s(x)=\sum_{i=l+1-m}^lc^{[0]}_iN^m_i(x)
$$
导数——算一阶再开花
$$
D_+s(x)=\sum_{i=l+2-m}^l c^{[1]}_iN^{m-1}_i(x)=s^\prime(x)\\
c^{[1]}_i = \frac{(m-1)(c^{[0]}_i-c^{[0]}_{i-1})}{y_{i+m-1}-y_i}
$$

## 10.2 对称多项式和开花算法

### 10.2.1 多项式的开花

- $b(u)=\sum_{i=0}^n b_iB^n_i(u)\\b_i=b(\underbrace{0,\dots,0}_{n-i},\underbrace{1,\dots,1}_i)$ 
- $b(u)=\sum_{i=0}^n b(\underbrace{a,\dots,a}_{n-i},\underbrace{b,\dots,b}_{i})B^n_i(u)\\B^n_i(u)=\mathrm{C}_n^i\left(\frac{u-a}{b-a}\right)^i\left(\frac{b-u}{b-a}\right)^{n-i}=\mathrm{C}_n^it^i(1-t)^{n-i},t=\frac{u-a}{b-a}$ 

### 10.2.2 多项式开花的算法

**定理 10.3** 设已知 $n+1$ 个值 $b(t_{i+1},\dots,t_{i+n})\ (i=0,\dots,n)$，为了计算 $b(u_1,\dots,u_n)$ 

**定理 10.4** 设 $s(u)=\sum_i c_iN^m_i(x)$，当 $u\in[y_j,y_{j+1})$ 时，$s(u)=s_j(u)$。设 $s_j(u_1,\dots,u_{m-1})$ 是 $s_j(u)$ 的开花，则
$$
s(u)=s_j(u)=s_j(u,\dots,u)=\sum_{i=j-m+1}^j s_j(y_{i+1},\dots,y_{i+m-1})N^{m-1}_i(u)
$$

# 11. 对偶基和样条的零点

## 11.1 完全 B 样条

**第一类 Tchebycheff 多项式** 

- $T_m(x)=\cos(m\arccos x) \quad (-1\le x\le 1)$ 
- $T_m(x)$ 是关于 $x$ 的 $m$ 次的多项式
- $T_m(x)$ 的递推公式：$T_0(x)=1\\
  T_1(x)=x\\
  T_m(x)=2xT_{m-1}(x)-T_{m-2}(x)\quad(m=2,3,\dots)$
- $T_m(-1)=(-1)^m$，$T_m(1)=1$，$T_m(-x)=(-1)^mT_m(x)$ 
- $T^\prime_m(x)$ 的零点为 $\cos\frac{\pi i}{m}\ (i=1,\dots,m-1)$，$T_m(x)$ 在这些零点上取极值
- $T_m(x)$ 满足微分方程 $(1-x^2)T_m^{\prime\prime}(x)-xT_m^\prime(x)+m^2T_m(x)=0$ 

**完全 B 样条** 

- $y_i=\cos\frac{m-i}{m}\pi\ (i=0,\dots,m),B^*_m(x)\triangleq (-1)^m m[y_0,\dots,y_{m}](x-\cdot)^{m-1}_+$ 
- $B _ { m } ^ { * } ( - x ) = B _ { m } ^ { * } ( x )$ 
- $\int_{-1}^1 B^*_m(x)\mathrm{d}x=1$ 

## 11.2 对偶基

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

**定义 11.2** 设 $\{\lambda_i\}_{i=1}^n$ 是一组定义在空间 $\mathcal{S}=\text{span}\{N^m_i(x)\}_{i=1}^n$ 上的连续线性泛函，若 $\lambda_i(N^m_j(x))=\delta_{ij}\ (i,j=1,\dots,n)$ 成立，则称 $\{\lambda_i\}_{i=1}^n$ 为 $\mathcal{S}$ 上关于 $\{N^m_i(x)\}_{i=1}^n$ 的**对偶基** 

---

$s=\sum_{i=1}^n c_i N^m_i$ 中 $\|s\|_\infty$ 与 $\|c\|_\infty$ 的关系
$$
\|s\|_\infty\le \|c\|_\infty\le \max_{1\le j\le n}\|\lambda_j\|\|s\|_\infty
$$

当 $m=1,2$ 时，可用点泛函和局部积分的方法构造对偶基 $\{\lambda_i\}_{i=1}^n$ 

**m = 1** 

- 点泛函

> $$
> \lambda_j=[y_j]\quad(j=1,\dots,n)
> $$

- 局部积分

> $$
> \lambda_js=\int_{y_j}^{y_{j+1}}\frac{s(t)}{y_{j+1}-y_j}\mathrm{d}t\quad(j=1,\dots,n)
> $$

**m = 2** 

- 点泛函

> $$
> \lambda _ { j } s \triangleq \left\{ \begin{array} { l l } { s \left( y _ { j + 1 } \right) } & { y _ { j } < y _ { j + 1 } < y _ { j + 2 } } \\ { s \left( y _ { j + 1 } + \right) } & { y _ { j } = y _ { j + 1 } < y _ { j + 2 } } \\ { s \left( y _ { j + 1 } - \right) } & { y _ { j } < y _ { j + 1 } = y _ { j + 2 } } \end{array} \right.
> $$

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
> \varphi_j(t)=\left\{\begin{array}{ll}\frac{-\epsilon}{\epsilon (1-\epsilon)h_{j+1}}&y_{j+1}\le t<y_{j+1}+(1-\epsilon) h_{j+1}\\\frac{1+\epsilon}{\epsilon h_{j+1}} &y_{j+1}+(1-\epsilon) h_{j+1}\le t<y_{j+2}\\0 & \text{other}\end{array}\right.
> $$

## 11.3 样条函数零点的性质

### 11.3.1 扩充的 Rolle 定理和多项式的 Budan-Fourier 定理

**定理 11.7**（扩充的 Rolle 定理）设 $f\in AC[c,d]$，$c,d$ 分别为 $f$ 的左右 Rolle 点，则 $Df$ 在区间中至少有一次符号改变或一个零点。如果 $Df$ 在 $(c,d)$ 上是连续的，则它在这个区间上至少有一个零点

**符号改变** 

- $S^-(v)\le S^+(v)$ 
- $S^+(v_1,-v_2,\dots,(-1)^{r-1}v_r)+S^-(v_1,v_2,\dots,v_r)=r-1$ 
- $S^-_I(f)\le S^+_I(f)$ 

**定理 11.8**（Budan-Fourier 定理）

(1) 设 $0\neq p\in \mathcal{P}_m$，则
$$
Z^*_{(a,b)}(p)\le S^-[p(a),Dp(a),\dots,D^{m-1}p(a)]-S^-[p(b),Dp(b),\dots,D^{m-1}p(b)]
$$
(2) 如果 $p$ 的确是 $m$ 阶多项式（即 $D^{m-1}p$ 为一非零常数），则
$$
\begin{aligned}
Z^*_{(a,b)}(p)\le&m-1-S^+[p(a),-Dp(a),\dots,(-1)^{m-1}D^{m-1}p(a)]\\
&-S^+[p(b),Dp(b),\dots,D^{m-1}p(b)]
\end{aligned}
$$

- 多项式的 Descartes 法则：$Z^*_{(0,\infty)}\left(\sum_{i=1}^m c_it^{i-1}\right)\le S^-(c_1,\dots,c_m)$ 

### 11.3.2 样条函数的零点

**定义 11.8** 对给定样条函数 $s\in \mathcal{S}(\mathcal{P}_m,\mathfrak{M},\Delta)$ 和某一实数 $t\in \mathbb{R}$，如果 $s$ 不在任何包含 $t$ 的区间上恒等于 0，且
$$
\begin{aligned}
s(t-)=D_-s(t)=\dots=D^{l-1}_-s(t) = 0\neq D^l_-s(t)\\
s(t+)=D_+s(t)=\dots=D^{r-1}_+s(t) = 0\neq D^r_+s(t)\\
\end{aligned}
$$
则称 $s$ 在 $t$ 有一孤立零点，且重数
$$
z=\left\{\begin{array}{ll}
\alpha+1 & \alpha 是偶数，且 s 在 t 点改变符号\\
\alpha+1 & \alpha 是奇数，且 s 在 t 点不改变符号\\
\alpha & \text{other}
\end{array}\right.
$$
其中 $\alpha\triangleq \max(l,r)$ 

> 函数 $f$ 在 $t$ 点改变符号，是指对充分小的 $\epsilon >0,f(t-\epsilon)f(t+\epsilon)<0$ 
>
> 如果 $s$ 在 $t$ 点有一个越过 $x$ 轴的跳跃（即 $r=l=0$，$s$ 在 $t$ 点改变符号），根据定义，$t$ 点应为 $s$ 的 1 重零点

**定义 11.9** 若对 $-\infty< x<x_p$，$s(x)=0$，且对某些 $x_p<y<x_{p+1}$，有 $s(y)\neq 0$，以及 $s(x_p+)=D_+s(x_p)=\dots=D^{r-1}_+s(x_p)=0\neq D^r_+s(x_p)$，则称 $s$ 在 $x_p$ 有 $r$ 重零点

类似地，若对 $x_q<x<+\infty$，$s(x)=0$，且对某些 $x_{q-1}<y<x_q$，有 $s(y)\neq 0$，以及 $s(x_q-)=D_-(s)(x_q)=\dots=D^{r-1}_-s(x_q)=0\neq D^r_-(x_q)$，则称 $s$ 在 $x_q$ 有 $r$ 重零点

对于内部零区间，即 $s(x)=0(x\in (x_p,x_q))$，若
$$
\begin{aligned}
s(x_p-)=D_-(s)(x_p)=\dots=D^{l-1}_-s(x_p)=0\neq D^l_-(x_p)\\
s(x_q+)=D_+s(x_q)=\dots=D^{r-1}_+s(x_q)=0\neq D^r_+s(x_q)
\end{aligned}
$$
则称 $s$ 有一 $z$ 重零点，其中
$$
z=\left\{\begin{array}{ll}
\alpha+1 & \alpha为偶数，且 s 经过区间 (x_p,x_q) 改变符号\\
\alpha+1 & \alpha为奇数，且 s 经过区间 (x_p,x_q) 不改变符号\\
\alpha   & \text{other}
\end{array}\right.
$$
其中 $\alpha\triangleq\max\{l,r\}$ 

> 若样条函数 $s$ 在某一区间中恒等于 0，则该区间的端点或者是 $\pm \infty$，或者是样条节点
>
> 样条函数 $s$ 经过零区间 $(x_p,x_q)$ 改变符号，是指对任意 $\epsilon>0$，都存在 $x_p-\epsilon<t_1<x_p<x_q<t_2<x_q+\epsilon$，使得 $s(t_1)s(t_2)<0$ 

**定义 11.10** 给定样条函数 $s\in \mathcal{S}$，设 $T_1,\dots,T_d$ 是样条 $s$ 重度分别为 $Z(T_1),\dots,Z(T_d)$ 的零点，则称
$$
Z(s)=\sum_{i=1}^d Z(T_i)
$$
为样条 $s$ 在 $\mathbb{R}$ 上的**零点数** 

**定理 11.9** 设 $s\in \mathcal{S}(\mathcal{P}_m,\mathfrak{M},\Delta)$，则 $D_+s(x)$ 对所有的 $x$ 存在，且 $D_+s$ 是一右连续函数，同时
$$
D_+s\in \mathcal{S}(\mathcal{P}_{m-1},\mathfrak{M}^\prime,\Delta)
$$
其中
$$
\mathfrak{M}^\prime=(m_1^\prime,\dots,m_k^\prime),\quad m_i^\prime=\min(m-1,m_i)
$$
**定理 11.10**（样条函数的 Rolle 定理）设 $s\in \mathcal{S}(\mathcal{P}_m,\mathfrak{M},\Delta)$，且 $s$ **连续**，则
$$
Z_{[a,b]}(D_+s)\ge  Z_{[a,b]}(s)-1
$$
**定理 11.11** 对所有的 $0\neq s\in \mathcal{S}(\mathcal{P}_m,\mathfrak{M},\Delta)$，有
$$
Z(s)\le m+K-1
$$
**推论 11.2** 设 $y_1\le y_2\le \dots \le y_{n+m}(n>m)$，且 $y_i<y_{i+m}(i=1,\dots,n)$。设 $N^m_i(x)$ 是相应的 B 样条，则对在 $(y_1,y_{n+m})$ 的任何子区间中不恒为 0 的样条函数 $s=\sum_{i=1}^nc_iN^m_i(x)$，有
$$
Z_{(y_1,y_{n+m})}(s)\le n-1
$$
**定理 11.12**（Budan-Fourier）$\forall s\in\mathcal{S}(\mathcal{P}_m,\mathfrak{M},\Delta)$，设 $s(x)=p_i(x)\in \mathcal{P}_m (x\in [x_i,x_{i+1});i=0,1,\dots,k$，且只要有一多项式片是严格 $m$ 阶的，又设 $p_0$ 和 $p_k$ 分别是严格的 $d_0$ 阶和 $d_k$ 阶的，则
$$
\begin{aligned}
Z_{(a,b)}(s)\le&m+K-1-S^+[s(a),-D_+s(a),\dots,(-1)^{d_0-1}D^{d_0-1}_+s(a)]\\
&-S^+[s(b-),D_-s(b),\dots,D^{d_k-1}_-s(b)]
\end{aligned}
$$

# 12. 样条的插值与逼近

## 12.1 Tchebycheff 系统和弱的 Tchebycheff 系统

### 12.1.1 Tchebycheff 系统

**定义 12.1** 设函数组 $U\triangleq\{u_i(t)\}_{i=1}^m\subset C[I]$，$U$ 称为 $I$ 上的 **T 系统**，是指 $\forall \tau\in I^m_{0,0}$，有
$$
D\left(\begin{array}{c}\tau\\ U\end{array}\right)\triangleq 
D\left(\begin{array}{c}
t_1,&\dots,&t_m\\
u_1,&\dots,&u_m
\end{array}\right)>0
$$
**定义 12.2** 一个 $m$ 维线性空间 $\mathcal{U}$ 被称为 **Tchebycheff 空间**（简称为 **T 空间**）是指该空间有一组基构成 T 系统

**定理 12.1** 如果 $U\triangleq \{u_i(t)\}_{i=1}^m$ 是区间 $I$ 上的 $T$ 系统，则对所有不全为 0 的实数 $\{c_i\}_{i=1}^m$，有
$$
Z_I\left(\sum_{i=1}^m c_iu_i\right)\le m-1
$$
**定理 12.2** 如果 $\mathcal{U}$ 是一个 T 空间，则对于 $\mathcal{U}$ 中的任一基 $U\triangleq \{u_i\}_{i=1}^n$，都有或者 $U$ 或者 $\widehat{U}\triangleq \{u_1,\dots,u_{m-1},-u_m\}$ 是一个 T 系统

**定义 12.3** $\{u_i\}_{i=1}^m$ 称为**完全的 T 系统** complete Tchebycheff system，简称为 **CT 系统**，指对于 $k=1,2,\dots,m$，$\{u_i\}_{i=1}^k$ 是一个 T 系统

**定义 12.4** $\{u_i\}_{i=1}^m$ 对所有的 $1\le i_1<\dots<i_k\le m$ 和任意 $1\le k \le m$，$\{u_{i_p}\}_{p=1}^k$ 都是一个 T 系统，则称 $\{u_i\}_{i=1}^k$ 为有序的**完全 T 系统** order complete Tchebycheff system，简称为 **OCT 系统** 

**定理 12.3**（Descartes 符号规则） 设 $\{u_i\}_{i=1}^m$ 是一个 OCT 系统，则对任意不全为 0 的实数 $\{c_i\}_{i=1}^m$，都有
$$
Z\left(\sum_{i=1}^m c_iu_i\right)\le S^-(c_1,\dots,c_m)
$$
**定义 12.5** 设 $U\triangleq \{u_i\}_{i=1}^m\subset C^{m-1}[I]$，区间 $I\subset \mathbb{R}$，称 $U$ 是 $I$ 上**扩充的 T 系统**（简称 ET 系统），是指对所有的 $t_1\le \dots \le t_m \in I$，都有
$$
D\left(\begin{array}{c}t_1,&\dots,&t_m\\u_1,&\dots,&u_m\end{array}\right)> 0
$$

**定理 12.4** 设 $U\triangleq \{u_i\}_{i=1}^m$ 是区间 $I$ 上的 ET 系统，则对不全为 0 的实数 $\{c_i\}_{i=1}^m$，有
$$
Z_I^{m-1}\left(\sum_{i=1}^mc_iu_i\right)\le m-1
$$
反之，如果 $C^{m-1}[I]$ 中的一组函数 $U\triangleq \{u_i\}_{i=1}^m$ 对所有不全为零的 $\{c_i\}_{i=1}^m$，上述不等式成立，则 $U$ 或者 $\widetilde{U}\triangleq\{u_1,\dots,u_{m-1},-u_m\}$ 是 $I$ 上的 ET 系统

**定理 12.5** 如果 $U\triangleq\{u_i\}_{i=1}^m$ 是一个 OCET 系统，则对于任何不全为 0 的实数 $\{c_i\}_{i=1}^m$，有
$$
Z^{m-1}_I\left(\sum_{i=1}^m c_iu_i\right)\le S^-(c_1,\dots,c_m)
$$

### 12.1.2 弱的 Tchebycheff 系统

**定义 12.6** 设集合 $I\subseteq \mathbb{R}$，$U\triangleq\{u_i\}_{i=1}^m\subset B[I]$ 是定义在 $I$ 上的有界实值函数。如果 $\{u_i\}_{i=1}^m$ 在 $I$ 上是线性无关的，且 $\forall \tau \in I^m_{0,0}$，都有
$$
D\left(\begin{array}{c}\tau\\ U\end{array}\right)\ge 0
$$
成立，则称 $U$ 是 $I$ 上的 **WT 系统** 

**推论 12.1** 设 $U\triangleq \{u_i\}_{i=1}^m$ 是区间 $I$ 上的 T 系统，那么 $U$ 在 $I$ 的任何子集 $J$ 上是 WT 系统

**推论 12.2** 设 $U\triangleq \{u_i\}_{i=1}^m$ 是区间 $I$ 上的 T 系统，定义函数 $\{\widetilde{u}_i\}_{i=1}^m$ 为
$$
\widetilde{u}_i(x)=\left\{\begin{array}{ll}
u_i(x)& x\in I\backslash J\\
0 & x\in J
\end{array}\right.
\quad (i=1,\dots.m)
$$
其中 $J$ 是 $I$ 的任意子集，且 $I\backslash J$ 中至少有 $m$ 个点，则 $\widetilde{U}\triangleq\{\widetilde{u}_i\}_{i=1}^m$ 是 $I$ 上的 WT 系统

**定理 12.6** 设 $U=\{u_i\}_{i=1}^m$ 是定义在集合 $I$ 上的线性无关的 $m$ 个函数，如果 $U$ 是 WT 系统，则对于任意不全为 0 的实数 $\{c_i\}_{i=1}^m$ 都有
$$
S^-_I\left(\sum_{i=1}^m c_iu_i \right)\le m-1
$$
反之，若上述不等式对任意不全为零的 $\{c_i\}_{i=1}^m$ 都成立，则 $U$ 或 $\widetilde{U}\triangleq \{u_1,\dots,u_{m-1},-u_m\}$ 是 $I$ 上的 WT 系统

**推论 12.3** 样条空间 $\mathcal{S}(\mathcal{P}_m,\mathfrak{M},\Delta)$ 是一个 WT 空间

**定理 12.7** 设 $\{u_i\}_{i=1}^m$ 是 $I$ 上的 OCWT 系统，则对所有不全为 0 的 $\{c_i\}_{i=1}^m$，有
$$
S^-_I\left(\sum_{i=1}^m c_iu_i\right)\le S^-(c_1,\dots,c_m)
$$

## 12.2 样条插值和变差缩减性质

设 $y_1\le \dots \le y_{n+m}$ ，$y_i<y_{i+m}\ (i=1,\dots, n)$ 且 $\{N^m_i(x)\}$ 为与这些节点相联系的规范 B 样条 

**定理 12.8**（Schoenberg-Whittney 定理）设 $t_1<\dots<t_n$，则矩阵
$$
M\left(\begin{array}{c}
t_1,&\dots,&t_n\\
N^m_1,&\dots,&N^m_n
\end{array}\right)\triangleq (N^m_j(t_i))^n_{i,j=1}
$$
非奇异的充要条件为
$$
t_i\in \sigma_i\triangleq\{x|N^m_i(x)\neq 0\}\quad (i=1,\dots,n)
$$
**推论 12.4** 设 $t_1<\dots<t_n$，则对任意给定的实数 $\{v_i\}_{i=1}^n$，存在唯一的样条 $s(x)=\sum_{i=1}^nc_iN^m_i(x)$ 满足
$$
s(t_i)=v_i\quad(i=1,\dots,n)
$$
的充要条件是
$$
t_i\in \sigma_i\quad (i=1,\dots,n)
$$
$s(x)$ 的系数 $\{c_i\}_{i=1}^n$ 由方程组
$$
MC=V
$$
决定，其中
$$
M\triangleq (N^m_j(t_i))_{i,j=1}^n,\quad V=(v_1,\dots,v_n)^\top,\quad C=(c_1,\dots,c_n)^\top
$$
**推论 12.5** $\exist s\in \mathcal{S}(\mathcal{P}_m,\mathfrak{M},\Delta)$ 使得
$$
Z(s)=Z^1(s)=m+K-1
$$
其中 $Z^1$ 表示只数单的、不同的零点和跳跃零点

**推论 12.6** $\{N^m_i(x)\}_{i=1}^n$ 是 WT 系统，即对任意 $t_1<\dots<t_n$，都有
$$
D\left(\begin{array}
{c}t_1,&\dots,&t_n\\
N^m_1,&\dots,&N^m_n
\end{array}\right)
\ge 0
$$
且当 $t_i\in \sigma_i\ (i=1,\dots,n)$ 时，$D>0$ 

**定理 12.9** 对任意整数列 $1\le \nu_1 < \dots < \nu_p\le n$ 和任意点列 $t_1<\dots<t_p$，有
$$
D\left(\begin{array}
{c}t_1,&\dots,&t_p\\
N^m_{\nu_1},&\dots,&N^m_{\nu_p}
\end{array}\right)
\ge 0
$$
且 $D>0$ 的充要条件为 $t_i\in \sigma_{v_i}\ (i=1,\dots,p)$，其中 $\sigma_i\triangleq \{x|N^m_i(x)\neq  0\}$ 

**推论 12.7**（变差缩减 Variation-diminishing V-D 性质）对所有不全为 0 的 $\{c_i\}_{i=1}^m$，有
$$
S^-_{\mathbb{R}}\left(\sum_{i=0}^n c_iN^m_i(x)\right)\le S^-(c_1,\dots,c_m)
$$
**定义 12.7** **修改的 Hermite 插值问题**定义如下。设 $t_1\le \dots \le t_n$ 且给定 $\{v_i\}_{i=1}^n$，令
$$
d_i=\max\{j|t_i=t_{i-1}=\dots=t_{i-j}\}\quad(i=1,\dots,n-1)
$$
给定充分光滑的函数 $\{\varphi\}_{i=1}^n$，求 $s(x)\triangleq \sum_{i=1}^n c_i$ 使满足
$$
D^{d_i}_+s(t_i)=v_i\quad(i=1,\dots,n)
$$
**定理 12.10** 设 $t_1\le \dots \le t_n$，则
$$
D\left(\begin{array}{c}
t_1,&\dots,&t_n\\
N^m_1,&\dots,&N^m_n
\end{array}\right)\triangleq \det(D^{d_i}_+ N_j(t_i))_{i,j=1}^n\ge 0
$$
且不等式严格成立的充要条件为
$$
t_i\in \sigma_i=(y_i,y_{i+m})\cup\{x|D^{d_i}_+N^m_i(x)\neq 0\}
$$


## 12.3 样条逼近

### 12.3.1 局部样条逼近方法和到样条空间的距离

分割 $\Delta$ 为 $a=x_0<x_1<\dots<x_k<x_{k+1}=b$，扩充分割 $\overline{\Delta}$ 为

$$
a=y_1=\dots=y_m<y_{m+1}\le y_{m+2}\le \dots\le y_n<y_{n+1}=\dots=y_{n+m}=b
$$
且 $y_i<y_{i+m}\ (i=1,\dots,n)$，设 $\{N^m_i(x)\}_{i=1}^n$ 为相应的 B 样条，$\mathcal{S}=\text{span}\{N^m_i\}_{i=1}^n$ 

$\forall g\in C[a,b]$，估计
$$
\text{dist}(g,\mathcal{S})\triangleq \min_{s\in \mathcal{S}}\|g-s\|_\infty
$$
令
$$
Ag=\sum_{i=1}^n g(\tau_i)N^m_i(x)\in \mathcal{S}\quad (a\le x\le b)
$$
其中
$$
\tau_1\le \dots\le \tau_n\in [a,b]
$$
可推得
$$
\text{dist}(g,\mathcal{S})\le \|g-Ag\|\le C_m\omega(g;h)
$$
如果 $g$ 仅仅是一连续函数，不具有更高的光滑性质，则逼近阶不能提高

**定理 12.11** 对于 $j=0,\dots,m-1$，存在常数 $C_{m,j}$，使得 $\forall g\in C^j[a,b]$，都有
$$
\text{dist}(g,\mathcal{S})\le C_{m,j}h^j\omega(g^{(j)};h)
$$
如果 $g\in C^m[a,b]$，则
$$
\text{dist}(g,\mathcal{S})\le C_mh^m\|g^{(m)}\|
$$

### 12.3.2 Schoenberg 变差缩减样条逼近的阶

> 形如 $Ag=\sum_{i=1}^n g(\tau_i)N^m_i(x)\in \mathcal{S}\quad (a\le x\le b)$ 的逼近函数一般不能达到 $O(h^m)$，本节的 Schoenberg V-D 逼近也是如此

Schoenberg 的 V-D 逼近
$$
Vg\triangleq \sum_{i=1}^n g(t_i^*)N^m_i(x)
$$
其中
$$
t_i^*\triangleq \frac{y_{i+1}+\dots+y_{i+m-1}}{m-1}\quad(i=1,\dots,n)
$$
当 $g\in C^2[a,b]$ 时，有
$$
\|g-Vg\|_\infty=O(h^2)
$$
且 $\forall l\in \mathcal{P}_2$，有 $Vl=l$ 

当 $k=0,a=0,b=1$ 时，有 $\overline{\Delta}$ 为 $0=y_0=\dots=y_m<y_{m+1}=\dots=y_{2m}=1$，则
$$
N^m_i(x)=B^{m-1}_{i-1}(x)
$$
则
$$
\begin{aligned}
Vf&=\sum_{i=1}^mf(t_i^*)N^m_i(x)\\
&=\sum_{i=0}^{m-1}f(t_{i+1}^*)B^{m-1}_i(x)\\
&=\sum_{i=0}^{m-1}f\left(\frac{i}{m-1}\right)B^{m-1}_i(x)\\
&=B^{m-1}(f;x)
\end{aligned}
$$
为与函数 $f$ 相联系的 $m-1$ 阶的 Bernstein 多项式

### 12.3.3 给出最好逼近阶的局部逼近格式

令
$$
Ag=\sum_{i=1}^n(\mu_ig)N^m_i(x)
$$
其中 $\mu_i$ 是定义在 $C[a,b]$ 上的连续线性泛函，选择
$$
\mu_ig=\sum_{j=1}^m\beta_{ij}g(\tau_{ij})
$$
取
$$
\tau_{ij}\in \text{supp}\{N^m_i(x)\}\triangleq [y_i,y_{i+m})
$$
使得对任意 $g$ 满足 $g(x)=0,x\in [y_i,y_{i+m})$，则有 $\mu_ig=0$。故对任意函数 $g$，有
$$
|\mu_ig|=|\mu_i(g-\widetilde{g})|\le \|\mu_i\|\|g\|_{[y_i,y_{i+m}]}
$$
其中
$$
\widetilde{g}(x)=\left\{\begin{array}{ll}
0&x\in [y_i,y_{i+m}]\\
g(x)& x\notin [y_i,y_{i+m}]
\end{array}\right.
$$
故
$$
\|Ag\|_{[y_j,y_{j+1}]}=\left\|\sum_{i=j+1-m}^j(\mu_ig)N^m_i(x)\right\|_{[y_j,y_{j+1}]}\le \left(\max_i\|\mu_i\|\right)\|g\|_{[y_{j+1-m},y_{j+m}]}
$$
表明在区间 $[y_j,y_{j+1}]$ 上 $Ag$ 的范数仅仅依赖于函数 $g$ 在区间 $[y_{j+1-m},y_{j+m}]$ 上的值

**定理 12.12** 设 $Ag\triangleq \sum_{i=1}^n(\mu_ig)N^m_i(x)$，其中 $\mu_i$ 为 $C[a,b]$ 上的连续线性泛函，且满足
$$
|\mu_ig|\le \|\mu_i\|\|g\|_{[y_i,y_{i+m}]}
$$
又设算子 $A$ 满足
$$
Ap=p,\quad \forall p\in \mathcal{P}_m
$$
则 $\forall g\in C^m[a,b]$，有
$$
\|g-Ag\|\le (1+\max_i\|\mu_i\|)C_m\|g^{(m)}\|h^m
$$

**定理 12.13** 设
$$
Ag=\sum_{i=1}^n(\mu_ig)N^m_i(x)
$$
其中对于 $i=1,\dots,n$，$j=1,\dots,m$，有
$$
\tau_{ij}\in [y_i,y_{i+m}]\\\mu_ig\triangleq \sum_{j=1}^m\beta_{ij}g(\tau_{ij})=\sum_{j=1}^m\alpha_{ij}[\tau_{i1},\dots,\tau_{i.j}]g
$$
其中
$$
\alpha_{i,j}\triangleq \sum_{\nu=1}^j\frac{\xi_i^{(\nu)}D^{\nu-1}\psi_{ij}(0)}{(\nu-1)!}\\\psi_{ij}(t)\triangleq\prod_{r=1}^{j-1}(t-\tau_{ir})
$$
则 $\forall p\in \mathcal{P}_m$，有
$$
Ap=p
$$

