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

**推论 9.2** $[t_1,\dots,t_{r+1}]f$ 是定义在所有光滑函数上的线性泛函，而且如果函数 $f$ 和 $g$ 在 $\{t_i\}_{i=1}^{r+1}$ 上满足 $D^{j-1}f(\tau_i)=D^{j-1}g(\tau_i)\ (i=1,\dots,d;j=1,\dots,l_i)$，则 $[t_1,\dots,t_{r+1}]f=[t_1,\dots,t_{r+1}]g$ 

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

