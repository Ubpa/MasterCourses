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

> 差商是一个线性泛函，如果跟之前的**点泛函**联系起来，其实不需要第一条公式

---

存在唯一的 $r$ 次多项式 $p_r(x)$ 在点 $\{t_i\}_{i=1}^{r+1}$ 插值于函数 $f$，即满足
$$
D^{j-1}p_r(\tau_i)=D^{j-1}f(\tau_i)\quad(i=1,\dots,d;j=1,\dots,l_i)
$$
> 插值条件

**定理 9.1** $[t_1,\dots,t_{r+1}]f$ 即为在点 $\{t_i\}_{i=1}^{r+1}$ 插值于函数 $f$ 的 $r$ 次多项式 $p_r(x)$ 的 $x^r$ 项系数

> **证明** 
>
> （数学归纳法）
>
> - 当 $r=1$ 时
>
> > - 若 $t_1<t_2$ 
> >
> > > $$
> > > p_1(x)=\frac{f(t_2)-f(t_1)}{t_2-t_1}(x-t_1)+f(t_1)
> > > $$
> > >
> > > 一次项系数为
> > > $$
> > > \frac{f(t_2)-f(t_1)}{t_2-t_1}=[t_1,t_2]f
> > > $$
> >
> > - 若 $t_1=t_2$ 
> >
> > > $$
> > > p_1(x)=f^\prime(t_1)(x-t_1)+f(t_1)
> > > $$
> > >
> > > 一次项系数为
> > > $$
> > > f^\prime(t_1)=[t_1,t_2]f
> > > $$
> > >
> >
> > 综合以上两点知 $r=1$ 时定理成立
>
> - 设次数为 $r$ 时定理成立，即在 $t_1,\dots,t_r$ 插值于 $f$ 的 $r-1$ 次多项式 $p_{r-1}(x)$ 的 $x^{r-1}$ 项系数为 $[t_1,\dots,t_r]f$；在 $t_2,\dots,t_{r+1}$ 插值于 $f$ 的 $r-1$ 次多项式 $q_{r-1}(x)$ 的 $x^{r-1}$ 项系数为 $[t_2,\dots,t_{r+1}]f$ 
>
> > - 当 $t_1< t_{r+1}$ 时
> >
> > > $$
> > > p_r(x)=\frac{(x-t_1)q_{r-1}(x)+(t_{r+1}-x)p_{r-1}(x)}{t_{r+1}-t_1}
> > > $$
> > >
> > > 为 $r$ 次的 $x^r$ 系数为
> > > $$
> > > \frac{[t_2,\dots,t_{r+1}]f-[t_1,\dots,t_r]f}{t_{r+1}-t_1}=[t_1,\dots,t_{r+1}]f
> > > $$
> > > 的多项式，且由于
> > > $$
> > > \begin{aligned}
> > > &D^{j-1}p_r(\tau_i)\\
> > > =&\frac{1}{t_{r+1}-t_1}\Big((j-1)D^{j-2}q_{r-1}(\tau_i)+(\tau_i-t_1)D^{j-1}q_{r-1}(\tau_i)\\
> > > &+(t_{r+1}-\tau_i)D^{j-1}p_{r-1}(\tau_i)-(j-1)D^{j-2}p_{r-1}(\tau_i)\Big)\\
> > > =&D^{j-1}f(\tau_i)\quad(i=1,\dots,d;j=1,\dots,l_i)
> > > \end{aligned}
> > > $$
> > > 故 $p_r(x)$ 在 $\{t_i\}_{i=1}^{r+1}$ 上插值于函数 $f$ 
> >
> > - 当 $t_1=t_{r+1}$ 时
> >
> > > $$
> > > p_r(x)=p_{r-1}(x)+\frac{f^{(r)}(t_1)}{r!}(x-t_1)^r
> > > $$
> > >
> > > 的 $x^r$ 项系数为
> > > $$
> > > \frac{f^{(r)}(t_1)}{r!}=[t_1,\dots,t_{r+1}]f
> > > $$
> >
> > 综合以上两点知次数为 $r+1$ 时定理也成立
>
> 综上，由归纳法知定理成立

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
> M \left( \begin{array} { l l l } { t _ { 1 } , } & { t _ { 2 } , } & { \cdots , } & { t _ { r+1 } } \\ { 1 , } & { x , } & { \cdots , } & { x ^r } \end{array} \right)
> \left(\begin{matrix}
> c_0\\c_1\\\vdots\\c_r
> \end{matrix}\right)=\left(\begin{matrix}
> f(\tau_1)\\\vdots\\D^{l_1-1}f(\tau_1)\\\vdots\\f(\tau_d)\\\vdots\\D^{l_d-1}f(\tau_d)
> \end{matrix}\right)
> $$
>
> 由 Cramer 法则得
> $$
> [t_1,\dots,t_{r+1}]f=c_r=\frac{
> D\left( \begin{array} { l l l }
> { t _ { 1 } , } & { t _ { 2 } , } & { \cdots , } & { t _ { r }, }  & { t _ { r + 1 } }\\
> { 1 , } & { x , } & { \cdots , } & { x ^r, } & { f }
> \end{array} \right)
> }
> {
> D \left( \begin{array} { l l l } { t _ { 1 } , } & { t _ { 2 } , } & { \cdots , } & { t _ { r+1 } } \\ { 1 , } & { x , } & { \cdots , } & { x ^r } \end{array} \right)
> }
> $$

**推论 9.2** $[t_1,\dots,t_{r+1}]f$ 是定义在所有光滑函数上的**线性泛函**，而且如果函数 $f$ 和 $g$ 在 $\{t_i\}_{i=1}^{r+1}$ 上满足 $D^{j-1}f(\tau_i)=D^{j-1}g(\tau_i)\ (i=1,\dots,d;j=1,\dots,l_i)$，则 $[t_1,\dots,t_{r+1}]f=[t_1,\dots,t_{r+1}]g$ 

> **证明** 
>
> $p_r$ 是在 $\{t_i\}_{i=1}^{r+1}$ 上的插值于函数 $f$ 的 $r$ 次多项式
>
> $q_r$ 是在 $\{t_i\}_{i=1}^{r+1}$ 上的插值于函数 $g$ 的 $r$ 次多项式
>
> 则 $\forall \alpha,\beta\in \mathbb{R}$，$\alpha p_r+\beta q_r$ 是在 $\{t_i\}_{i=1}^{r+1}$ 上的插值于函数 $\alpha f+\beta g$ 的 $r$ 次多项式
>
> 因此 $\alpha p_r + \beta q_r$ 的 $x^r$ 项系数为
> $$
> [t_1,\dots,t_{r+1}](\alpha f+\beta g)=\alpha[t_1,\dots,t_{r+1}]f+\beta[t_1,\dots,t_{r+1}]g
> $$

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
$\rho_l(t_1,\dots,t_{r+1})(l>0)$ 是 $C_{r+l}^{l}=\frac{(r+l)!}{r!l!}$ 项求和，则 $\rho_{j-r}(t_1,\dots,t_{r+1})(j>r)$ 是 $C_{j}^{j-r}=\frac{j!}{r!(j-r)!}$ 项求和

> (1) 可推得 $[t_1,\dots,t_{r+1}]\mathcal{P}_r = 0$，即 $[t_1,\dots,t_{r+1}]\perp \mathcal{P}_r$ 
>
> ---
>
> **证明** 
>
> - (1)
>
> > 插值条件 $D^{j-1}p_r(\tau_i)=D^{j-1}f(\tau_i)\ (i=1,\dots,d;j=1,\dots,l_i)$ 
> >
> > 由微分的 Rolle 中值定理知，$\exist \zeta \in [t_1,t_{r+1}]$，使得
> > $$
> > D^r(f-p_r(x))\Big|_{x=\zeta}=0
> > $$
> > 即 $f^{(r)}(\zeta)-r![t_1,\dots,t_{r+1}]f=0$ 
>
> - (2)
>
> > - 当 $j\le r$ 时
> >
> > > 由 (1) 显然可得 (2) 成立
> >
> > - 当 $j>r$ 时
> >
> > > - 当 $t_1=t_{r+1}$ 时
> > >
> > > > 由 (1) 显然可得 (2) 成立
> > >
> > > - 当 $t_1<t_{r+1}$ 时
> > >
> > > > （数学归纳法）
> > > >
> > > > - 当 $r=1$ 时
> > > >
> > > > > (2) 显然成立
> > > >
> > > > - 设次数为 $r-1$ 时，命题正确
> > > >
> > > > > $$
> > > > > \begin{aligned} \left[ t _ { 1 } , t _ { 2 } , \cdots , t _ { r + 1 } \right] x ^ { j } & = \frac { \left[ t _ { 2 } , t _ { 3 } , \cdots , t _ { r + 1 } \right] x ^ { j } - \left[ t _ { 1 } , t _ { 2 } , \cdots , t _ { r } \right] x ^ { j } } { t _ { r + 1 } - t _ { 1 } } \\ & = \frac { \rho _ { j - r + 1 } \left( t _ { 2 } , t _ { 3 } , \cdots , t _ { r + 1 } \right) - \rho _ { j - r + 1 } \left( t _ { 1 } , t _ { 2 } , \cdots , t _ { r } \right) } { t _ { r + 1 } - t _ { 1 } } \end{aligned}
> > > > > $$
> > > > >
> > > > > 利用恒等式
> > > > > $$
> > > > > \rho _ { l } \left( t _ { 1 } , t _ { 2 } , \cdots , t _ { r + 1 } \right) = t _ { 1 } \rho _ { l - 1 } \left( t _ { 1 } , t _ { 2 } , \cdots , t _ { r + 1 } \right) + \rho _ { l } \left( t _ { 2 } , t _ { 3 } , \cdots , t _ { r + 1 } \right)
> > > > > $$
> > > > > 可得
> > > > > $$
> > > > > \begin{aligned} \left[ t _ { 1 } , t _ { 2 } , \cdots , t _ { r + 1 } \right] x ^ { j } & = \frac { - t _ { 1 } \rho _ { j - r } \left( t _ { 1 } , t _ { 2 } , \cdots , t _ { r + 1 } \right) + t _ { r + 1 } \rho _ { j - r } \left( t _ { 1 } , t _ { 2 } , \cdots , t _ { r + 1 } \right) } { t _ { r + 1 } - t _ { 1 } } \\ & = \rho _ { j - r } \left( t _ { 1 } , t _ { 2 } , \cdots , t _ { r + 1 } \right) \end{aligned}
> > > > > $$
> > > > > 即次数为 $r$ 时，命题仍然正确
> > > >
> > > > 综合，由归纳法知 (2) 成立

**定理 9.2** 

(1) 若 $t_1<\dots<t_{r+1}$，则
$$
\left[ t _ { 1 } , \cdots , t _ { r + 1 } \right] f = \sum _ { i = 1 } ^ { r + 1 } \frac { f \left( t _ { i } \right) } { w ^ { \prime } \left( t _ { i } \right) } = \sum _ { i = 1 } ^ { r + 1 } \frac { f \left( t _ { i } \right) } { \prod _ { j = 1 , j \neq i } ^ { r + 1 } \left( t _ { i } - t _ { j } \right) }
$$
其中 $\omega(t)=\prod_{i=1}^{r+1}(t-t_i)$ 

> - 交换性：分母处与 $t$ 次序无关 $\left[ t _ { 1 } , \cdots , t _ { r + 1 } \right] f=[t_{\pi(1)},\dots,t_{\pi(r+1)}]f$，$\pi$ 是任意置换函数
> - 系数：$[\alpha t_1,\dots,\alpha t_{r+1}]f = \sum _ { i = 1 } ^ { r + 1 } \frac { f \left( \alpha t _ { i } \right) } { \prod _ { j = 1 , j \neq i } ^ { r + 1 } \left( \alpha t _ { i } - \alpha t _ { j } \right) } = \frac{1}{\alpha^r} \sum _ { i = 1 } ^ { r + 1 } \frac { f \left( \alpha t _ { i } \right) } { \prod _ { j = 1 , j \neq i } ^ { r + 1 } \left( t _ { i } - t _ { j } \right) }$ 

(2) 设 $t_1\le t_2\le \dots\le t_{r+1}=\overbrace{\tau_1,\dots,\tau_1}^{l_1}<\dots<\overbrace{\tau_d,\dots,\tau_d}^{l_d}$，则
$$
\left[ t _ { 1 } , \cdots , t _ { r + 1 } \right] f = \sum_{i=1}^d\sum_{j=1}^{l_i}\alpha_{ij}D^{j-1}f(\tau_i)
$$
且 $\alpha_{i,l_i}\neq 0\ (i=1,\dots,d)$ 

> **证明** 
>
> - (1)
>
> > 由 **推论 9.1** 知
> > $$
> > \left[ t _ { 1 } , t _ { 2 } , \cdots , t _ { r + 1 } \right] f = \frac { D \left( \begin{array} { c c c c c } { t _ { 1 } , } & { t _ { 2 } , } & { \cdots , } & { t _ { r } , } & { t _ { r + 1 } } \\ { 1 , } & { x , } & { \cdots , } & { x ^ { r - 1 } , } & { f } \end{array} \right) } { V \left( t _ { 1 } , t _ { 2 } , \cdots , t _ { r + 1 } \right) }
> > $$
> > 将 $D \left( \begin{array} { c c c c c } { t _ { 1 } , } & { t _ { 2 } , } & { \cdots , } & { t _ { r } , } & { t _ { r + 1 } } \\ { 1 , } & { x , } & { \cdots , } & { x ^ { r - 1 } , } & { f } \end{array} \right)$ 按最后一列展开，得
> > $$
> > D \left( \begin{array} { c c c c c } { t _ { 1 } , } & { t _ { 2 } , } & { \cdots , } & { t _ { r } , } & { t _ { r + 1 } } \\ { 1 , } & { x , } & { \cdots , } & { x ^ { r - 1 } , } & { f } \end{array} \right)=\sum_{i=1}^{r+1}(-1)^{r+1+i}f(t_i)V(t_1,\dots,t_{i-1},t_{i+1},\dots,t_{r+1})
> > $$
> > 故
> > $$
> > \begin{aligned}
> > \left[ t _ { 1 } , t _ { 2 } , \cdots , t _ { r + 1 } \right] f
> > &= \sum_{i=1}^{r+1}(-1)^{r+1+i}f(t_i)\frac{V(t_1,\dots,t_{i-1},t_{i+1},\dots,t_{r+1})}{V \left( t _ { 1 } , t _ { 2 } , \cdots , t _ { r + 1 } \right)}\\
> > &=\sum_{i=1}^{r+1}(-1)^{r+1+i}f(t_i)\frac{1}{(t_i-t_1)\dots(t_i-t_{i-1})(t_{i+1}-t_i)\dots(t_{r+1}-t_i)}\\
> > &=\sum_{i=1}^{r+1}\frac{f(t_i)}{\omega^\prime(t_i)}\\
> > \end{aligned}
> > $$
>
> - (2)
>
> > 由 **推论 9.1** 且将右式分子的行列式按最后一列展开，得
> > $$
> > \left[ t _ { 1 } , t _ { 2 } , \cdots , t _ { r + 1 } \right] f = \sum _ { i = 1 } ^ { d } \sum _ { j = 1 } ^ { l _ { i } } \alpha _ { i j } D ^ { j - 1 } f \left( \tau _ { i } \right)
> > $$
> > 其中
> > $$
> > \alpha_{i,l_i}\triangleq\frac{V(\overbrace{\tau_1,\dots,\tau_1}^{l_1},\dots,\overbrace{\tau_i,\dots,\tau_i}^{l_i-1},\dots,\overbrace{\tau_d,\dots,\tau_d}^{l_d})}{V(t_1,\dots,t_{r+1})}(-1)^{r+1+\sum_{j=1}^il_j}
> > $$
> > 不为 0

**定理 9.3**（Leibniz 公式）对任意 $\{t_i\}_{i=1}^{r+1}$ 和光滑函数 $f$，$g$，都有
$$
\left[ t _ { 1 } , t _ { 2 } , \cdots , t _ { r + 1 } \right] f \cdot g = \sum _ { i = 1 } ^ { r + 1 } \left[ t _ { 1 } , t _ { 2 } , \cdots , t _ { i } \right] f \cdot \left[ t _ { i } , t _ { i + 1 } , \cdots , t _ { r + 1 } \right] g
$$
> **证明** 
>
> （数学归纳法）
>
> - 当 $r=0$ 时
>
> > 显然成立
>
> - 假设次数为 $r-1$ 时命题正确
>
> > - 当 $t_1=t_{r+1}$ 时
> >
> > > $$
> > > \begin{aligned}
> > > &\sum _ { i = 1 } ^ { r + 1 } \left[ t _ { 1 } , t _ { 2 } , \cdots , t _ { i } \right] f \cdot \left[ t _ { i } , t _ { i + 1 } , \cdots , t _ { r + 1 } \right] g\\
> > > = & \sum _ { i = 1 } ^ { r + 1 } \frac { D ^ { i - 1 } f \left( t _ { 1 } \right) } { ( i - 1 ) ! } \frac { D ^ { r + 1 - i } g \left( t _ { 1 } \right) } { ( r + 1 - i ) ! } \\
> > > = & \frac { 1 } { r ! } \sum _ { i = 0 } ^ { r } D ^ { i } f \left( t _ { 1 } \right) \cdot D ^ { r - i } g \left( t _ { 1 } \right) \left( \begin{array} { c } { r } \\
> > > { i } \end{array} \right) \\
> > > = & \frac { D ^ { r } f \cdot g \left( t _ { 1 } \right) } { r ! } \\
> > > = & [t_1,\dots,t_{r+1}]f\cdot g
> > > \end{aligned}
> > > $$
> >
> > - 当 $t_1<t_{r+1}$ 时
> >
> > > $$
> > > \begin{aligned}
> > > &\left[ t _ { 1 } , t _ { 2 } , \cdots , t _ { r + 1 } \right] f \cdot g \\
> > > =& \frac { \left[ t _ { 2 } , t _ { 3 } , \cdots , t _ { r + 1 } \right] f \cdot g - \left[ t _ { 1 } , t _ { 2 } , \cdots , t _ { r } \right] f \cdot g } { t _ { r + 1 } - t _ { 1 } } \\
> > > = &\frac { \sum _ { i = 2 } ^ { r + 1 } \left[ t _ { 2 } , t _ { 3 } , \cdots , t _ { i } \right] f \cdot \left[ t _ { i } , t _ { i + 1 } , \cdots , t _ { r + 1 } \right] g - \sum _ { i = 1 } ^ { r } \left[ t _ { 1 } , t _ { 2 } , \cdots , t _ { i } \right] f \cdot \left[ t _ { i } , t _ { i + 1 } , \cdots , t _ { r } \right] g } { t _ { r + 1 } - t _ { 1 } }\\
> > > = & \frac { 1 } { t _ { r + 1 } - t _ { 1 } } \left\{ \sum _ { i = 2 } ^ { r + 1 } \left( \left( t _ { i } - t _ { 1 } \right) \left[ t _ { 1 } , t _ { 2 } , \cdots , t _ { i } \right] f + \left[ t _ { 1 } , t _ { 2 } , \cdots , t _ { i - 1 } \right] f \right) \left[ t _ { i } , t _ { i + 1 } , \cdots , t _ { r + 1 } \right] g \right.\\
> > > &\left. - \sum _ { i = 1 } ^ { r } \left[ t _ { 1 } , t _ { 2 } , \cdots , t _ { i } \right] f \left( - \left( t _ { r + 1 } - t _ { i } \right) \left[ t _ { i } , t _ { i + 1 } , \cdots , t _ { r + 1 } \right] g + \left[ t _ { i + 1 } , t _ { i + 2 } , \cdots , t _ { r + 1 } \right] g \right) \right\}\\
> > > = &\frac { 1 } { t _ { r + 1 } - t _ { 1 } } \left\{ \sum _ { i = 2 } ^ { r + 1 } \left( t _ { i } - t _ { 1 } \right) \left[ t _ { 1 } , t _ { 2 } , \cdots , t _ { i } \right] f \left[ t _ { i } , t _ { i + 1 } , \cdots , t _ { r + 1 } \right] g \right.\\
> > > &\left. \quad + \sum _ { i = 1 } ^ { r } \left( t _ { r + 1 } - t _ { i } \right) \left[ t _ { 1 } , t _ { 2 } , \cdots , t _ { i } \right] f \left[ t _ { i } , t _ { i + 1 } , \cdots , t _ { r + 1 } \right] g \right\}\\
> > > = &\sum _ { i = 1 } ^ { r + 1 } \left[ t _ { 1 } , t _ { 2 } , \cdots , t _ { i } \right] f \left[ t _ { i } , t _ { i + 1 } , \cdots , t _ { r + 1 } \right] g
> > > \end{aligned}
> > > $$
> > > 即次数为 $r$ 时命题仍成立
>
> 综上，由归纳法知命题成立

**推论 9.4** 差商满足消去性质，即
$$
[t_1,\dots,t_{r+1}](t-t_{r+1})f=[t_1,\dots,t_r]f
$$

> **证明** 
>
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

(1) $\Delta_h^r f(t)=\sum_{i=0}^r(-1)^{r-i}\mathrm{C}_r^if(t+ih)$ 

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

> B 样条 $Q_i^m(x)$ 是一个具有**局部支集** $[y_i,y_{i+m}$) 的函数
>
> > **证明** 
> >
> > 当 $x<y_i$ 时，$(x-y)_+^{m-1}=0,y=y_i,\dots,y_{i+m}$ 
> >
> > 当 $x\ge y_{i+m}$ 时，$(x-y)^{m-1}_+=(x-y)^{m-1}\in \mathcal{P}_m$，由 **推论 9.3 (1)** 知 $\left[ y _ { i } , y _ { i + 1 } , \cdots , y _ { i + m } \right](x-y)^{m-1}=0$ 

若
$$
y_i\le \dots\le y_{i+m}=
\overbrace{\tau_1,\dots,\tau_1}^{m_1} 
< \dots<\overbrace{\tau_d,\dots,\tau_d}^{m_d},\quad \sum_{i=1}^d m_i=m+1
$$
则 $Q_i^m(x)$ 是 $m$ 阶的、节点为 $\tau_1,\dots,\tau_d$，重度向量为 $(m_1,\dots,m_d)$ 的**样条函数** 

> $Q_i^m(x)$ 是多项式样条组成的函数

当 $m=1$ 时，由定义可得
$$
Q_i^1(x)=\left\{\begin{array}{ll}
\frac{1}{y_{i+1}-y_i},&y_i\le x < y_{i+1},\\
0,&\text{other}.
\end{array}\right.
$$
> **证明** 
> $$
> \begin{aligned}
> Q_i^1(x)
> &=-[y_i,y_{i+1}](x-\cdot)^0_+\\
> &=[y_i,y_{i+1}](\cdot-x)^0_+\\
> &=\frac{(y_{i+1}-x)^0_+-(y_{i}-x)^0_+}{y_{i+1}-y_i}\\
> &=\left\{\begin{array}{ll}
> \frac{1}{y_{i+1}-y_i},&y_i\le x < y_{i+1},\\
> 0,&\text{other}.
> \end{array}\right.
> \end{aligned}
> $$

**定理 9.9** 

(1) 设 $y_i<y_{i+1}=\cdots=y_{i+m}$，则
$$
Q_i^m(x)=\left\{\begin{array}{ll}
\frac{(x-y_i)^{m-1}}{(y_{i+m}-y_i)^m},&y_i\le x < y_{i+m},\\
0,&\text{other}.
\end{array}\right.
$$
(2) 若 $y_i=\dots=y_{i+m-1}<y_{i+m}$，则有 
$$
Q_i^m(x)=\left\{\begin{array}{ll}
\frac{(y_{i+m}-x)^{m-1}}{(y_{i+m}-y_i)^m},&y_i\le x < y_{i+m},\\
0,&\text{other}.
\end{array}\right.
$$

> **证明** 
>
> > 只证明 (1)，(2) 类似
>
> 已知 $Q_i^m(x)$ 具有局部支集 $[y_i,y_{i+m})$ 
>
> 当 $y_i\le x<y_{i+m}$ 时
>
> 根据 **推论 9.1**，有
> $$
> \begin{aligned}
> Q_i^m(x)
> &=(-1)^m[y_i,\overbrace{y_{i+m},\dots,y_{i+m}}^m](x-\cdot)^{m-1}_+\\
> &=(-1)^m\frac{
> D\left(\begin{array}{lllll}
> y_i,&y_{i+m},&\dots,&y_{i+m},&y_{i+m}\\
> 1,&y,&\dots,&y^{m-1},&(x-y)^{m-1}_+
> \end{array}\right)
> }{V(y_i,y_{i+m},\dots,y_{i+m})}
> \end{aligned}
> $$
> 分子为
> $$
> \left|\begin{matrix}
> 1 & y_i & y_i^2 & \dots & y_i^{m-1} & (x-y_i)^{m-1}\\
> 1 & y_{i+m} & y_{i+m}^2 & \dots & y_{i+m}^{m-1} & 0 \\
>  & 1 & 2y_{i+m} & \dots & (m-1)y_{i+m}^{m-2} & 0 \\
>  & & 2 & \dots & (m-1)(m-2)y_{i+m}^{m-3} & 0 \\
>  & & & \ddots & \vdots& \vdots\\
>  & & & & (m-1)! & 0
> \end{matrix}\right|=(-1)^m(x-y_i)^{m-1}\prod_{\nu = 1}^{m-1}\nu !
> $$
> 对于分母，将 $y_i$ 视为变量，记 $f(y_i)=V(y_i,y_{i+m},\dots,y_{i+m})$，具体写为
> $$
> \left|\begin{matrix}
> 1 & y_i & y_i^2 & \dots & y_i^m\\
> 1 & y_{i+m} & y_{i+m}^2 & \dots  & y_{i+m}^m \\
>  & 1 & 2y_{i+m} & \dots  & my_{i+m}^{m-1} \\
>  & & 2 & \dots  & m(m-1)y_{i+m}^{m-2} \\
>  & & & \ddots& \vdots\\
>  & & & & m!
> \end{matrix}\right|
> $$
> 易知
> $$
> f(y_{i+m})=f^\prime(y_{i+m})=\dots=f^{(m-1)}(y_{i+m})=0
> $$
> 因此 $f(y_i)=c(y_{i+m}-y_i)^m$，由于 $y_i^m$ 的系数为
> $$
> (-1)^m\prod_{\nu=1}^{m-1}\nu!=c(-1)^m
> $$
> 则
> $$
> V(y_i,y_{i+m},\dots,y_{i+m})=(y_{i+m}-y_i)^m\prod_{\nu=1}^{m-1}\nu!
> $$
> 故
> $$
> Q_i^m(x)=\frac{(x-y_i)^{m-1}}{(y_{i+m}-y_i)^m}
> $$



### 09.2.2 B 样条的性质

**性质 1** B 样条函数满足如下递推关系：设 $m\ge 2$，$y_i<y_{i+m}$，则对所有的 $x\in \mathbb{R}$，都有
$$
Q_i^m(x)=\frac{(x-y_i)Q_i^{m-1}(x)+(y_{i+m}-x)Q_{i+1}^{m-1}(x)}{y_{i+m}-y_i}
$$
> 令
> $$
> \alpha_{i,m}(x)=\frac{x-y_i}{y_{i+m}-y_i}
> $$
> 则
> $$
> \begin{aligned}
> Q_i^m(x)
> &=\alpha_{i,m}(x)Q_i^{m-1}(x)+(1-\alpha_{i,m}(x))Q_{i+1}^{m-1}(x)\\
> &=\text{lerp}(Q_i^{m-1}(x), Q_{i+1}^{m-1}(x), \alpha_{i,m}(x))
> \end{aligned}
> $$
> 再结合
> $$
> Q_i^1(x)=\left\{\begin{array}{ll}
> \frac{1}{y_{i+1}-y_i},&y_i\le x < y_{i+1},\\
> 0,&\text{other}.
> \end{array}\right.
> $$
> 就是 $Q_i^m(x)$ 的**等价定义** 
>
> ---
>
> **证明** 
>
> - 当 $x<y_i$ 或 $x\ge y_{i+m}$ 时
>
> > 左右两边皆为 $0$ 
>
> - 当 $y_i\le x\le y_{i+m}$ 时
>
> > - 当 $y_i<y_{i+1}=\dots=y_{i+m}$ 时
> >
> > > 由 **定理 9.9 (1)** 得
> > > $$
> > > Q_i^m(x)=\frac{(x-y_i)^{m-1}}{(y_{i+m}-y_i)^m},\ Q_{i}^{m-1}=\frac{(x-y_i)^{m-2}}{(y_{i+m-1}-y_i)^{m-1}}
> > > $$
> > > 又 $Q_{i+1}^{m-1}(x)=0$，从而定理成立
> >
> > - 当 $y_i = \dots = y_{i+m-1}<y_{i+m}$ 时
> >
> > > 同上
> >
> > - 其他，即 $y_{i+1}<y_{i+m}$ 且 $y_i<y_{i+m-1}$ 
> >
> > > $$
> > > \begin{aligned}
> > > Q _ { i } ^ { m } ( x ) = & ( - 1 ) ^ { m } \left[ y _ { i } , y _ { i + 1 } , \cdots , y _ { i + m } \right] ( x - \cdot ) _ { + } ^ { m - 2 } \cdot ( x - \cdot) \\
> > > = & ( - 1 ) ^ { m } \left[ y _ { i } , y _ { i + 1 } , \cdots , y _ { i + m } \right] ( x - ) _ { + } ^ { m - 2 } \cdot \left( x - y _ { i } \right) \\
> > > & + ( - 1 ) ^ { m } \left[ y _ { i + 1 } , y _ { i + 2 } , \cdots , y _ { i + m } \right] ( x - \cdot ) _ { + } ^ { m - 2 } \cdot \left[ y _ { i } , y _ { i + 1 } \right] ( x - \cdot ) \\
> > > = & ( - 1 ) ^ { m } \frac { x - y _ { i } } { y _ { i + m } - y _ { i } } \Big\{ - \left[ y _ { i } , y _ { i + 1 } , \cdots , y _ { i + m - 1 } \right] ( x - \cdot ) _ { + } ^ { m - 2 }\\
> > > & + \left[ y _ { i + 1 } , y _ { i + 2 } , \cdots , y _ { i + m } \right] ( x - \cdot ) _ { + } ^ { m - 2 } \Big\} + Q _ { i + 1 } ^ { m - 1 } ( x ) \\ 
> > > = & \frac { \left( x - y _ { i } \right) Q _ { i } ^ { m - 1 } ( x ) + \left( y _ { i + m } - x \right) Q _ { i + 1 } ^ { m - 1 } ( x ) } { y _ { i + m } - y _ { i } } 
> > > \end{aligned}
> > > $$
> > >
> > > > 第一个等号：拆处一项
> > > >
> > > > 第二个等号：Leibniz 公式
> > > >
> > > > 第三个等号：$[y_i,y_{i+1}](x-\cdot)=-1$，差商递推

**性质 2** 设 $y_i<y_{i+m}$，$m>1$，$D_+$ 为右导数算子，则
$$
D_+Q_i^m(x)=(m-1)\frac{Q_i^{m-1}(x)-Q_{i+1}^{m-1}(x)}{y_{i+m}-y_i}
$$
> **证明** 
>
> - 当 $y_i$ 或 $y_{i+m}$ 是 $m$ 重点时
>
> > 用定理 **定理 9.9** 即可证得
>
> - 当 $y_i<y_{i+m-1}$ 且 $y_{i+1}<y_{i+m}$ 时
>
> > $$
> > \begin{aligned}
> > D_+Q_i^m(x)
> > & = ( - 1 ) ^ { m } \left[ y _ { i } , y _ { i + 2 } , \cdots , y _ { i + m } \right] D _ { + } ( x - \cdot ) _ { + } ^ { m - 1 } \\
> > & = ( - 1 ) ^ { m } ( m - 1 ) \left[ y _ { i } , y _ { i + 1 } , \cdots , y _ { i + m } \right] ( x - \cdot ) _ { + } ^ { m - 2 }\\
> > & = ( - 1 ) ^ { m } ( m - 1 ) \frac { \left[ y _ { i + 1 } , y _ { i + 2 } , \cdots , y _ { i + m } \right] ( x - \cdot ) _ { + } ^ { m - 2 } - \left[ y _ { i } , y _ { i + 1 } , \cdots , y _ { i + m - 1 } \right] ( x - \cdot ) _ { + } ^ { m - 2 } } { y _ { i + m } - y _ { i } }\\
> > & = ( m - 1 ) \frac { Q _ { i } ^ { m - 1 } ( x ) - Q _ { i + 1 } ^ { m - 1 } ( x ) } { y _ { i + m } - y _ { i } }
> > \end{aligned}
> > $$
> > 第一个等号：$D_+$ 和 $[y_i,\dots,y_{i+m}]$ 可交换顺序
> >
> > 第二个等号：$D_+$ 作用于截断幂函数
> >
> > 第三个等号：差商定义
> >
> > 第四个等号：$Q$ 定义
>

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
> **证明** 
>
> (1)
>
> 支集外为 0 参考定义处的证明
>
> 当 $y_i\le x<y_{i+m}$ 时，（归纳法）
>
> - 当 $m=1$ 时
>
> > $$
> > Q_{i}^1(x)=\frac{1}{y_{i+m}-y_i}>0
> > $$
>
> - 假设 $m-1$ 时成立
>
> > 由 **性质 1** 得
> > $$
> > Q_i^m(x)=\frac{(x-y_i)Q_i^{m-1}(x)+(y_{i+m}-x)Q_{i+1}^{m-1}(x)}{y_{i+m}-y_i}
> > $$
> > 由于 $x-y_i,y_{i+m}-x,y_{i+m}-y_i>0$，由归纳假设 $Q_i^{m-1}(x)$ 与 $Q_{i+1}^{m-1}$ 中至少一个严格大于 $0$，则 $Q_i^m(x)>0$ 
>
> (2)
>
> 证左端点，右端点类似
>
> 当 $x<y_i$ 时，$Q_i^m(x)=0$，$y_i$ 是 $\alpha_i$ 重点，则 $Q_i^m(x)$ 在点 $y_i$ 应有 $m-1-\alpha_i$ 次连续导数，则
> $$
> D_+^kQ_i^m(y_i)=0 \quad (k=0,\dots,m-1-\alpha_i)
> $$
>
> - 若 $\alpha_i=m$ 
>
> > 则根据 **定理 9.9** 有
> > $$
> > (-1)^kD^k_+Q_i^m(y_i)>0\quad(k=0,\dots,m-1)
> > $$
>
> - 若 $\alpha_i<m$ 
>
> > （归纳法）
> >
> > - 当 $m=2$ 时
> >
> > > 有 $\alpha_i=1$，则
> > > $$
> > > D_+Q_i^2(y_i)=\frac{1}{(y_{i+1}-y_i)(y_{i+2}-y_{i})}>0
> > > $$
> >
> > - 设 $m-1$ 时成立
> >
> > > 即
> > > $$
> > > ( - 1 ) ^ { k + m - 1 - \alpha _ { i } } D _ { + } ^ { k } Q _ { i } ^ { m - 1 } \left( y _ { i } \right) > 0 \quad \left( k = m - 1 - \alpha _ { i } , \cdots , m - 2 \right)
> > > $$
> > > 等价于
> > > $$
> > > \begin{array} { l } { ( - 1 ) ^ { k + m - \alpha _ { i } } D _ { + } ^ { k - 1 } Q _ { i } ^ { m - 1 } \left( y _ { i } \right) > 0 \quad \left( k = m - \alpha _ { i } , \cdots , m - 1 \right) } \\
> > > { ( - 1 ) ^ { k + m - \alpha _ { i + 1 } } D _ { + } ^ { k - 1 } Q _ { i + 1 } ^ { m - 1 } \left( y _ { i + 1 } \right) > 0 \quad \left( k = m - 1 - \alpha _ { i + 1 } , \cdots , m - 1 \right) } \end{array}
> > > $$
> > > 由于
> > > $$
> > > \alpha _ { i } = \left\{ \begin{array} { l l } { 1 } & { y _ { i } < y _ { i + 1 } } \\ { \alpha _ { i + 1 } + 1 } & { y _ { i } = y _ { i + 1 } } \end{array} \right.
> > > $$
> > > 则
> > > $$
> > > ( - 1 ) ^ { k + m - \alpha _ { i } - 1 } D _ { + } ^ { k - 1 } Q _ { i + 1 } ^ { m - 1 } \left( y _ { i } \right) \geqslant 0 \quad \left( k = m - \alpha _ { i } , \cdots , m - 1 \right)
> > > $$
> > >
> > > > 当 $y_i<y_{i+1}$ 时，上式为 0
> > > >
> > > > 当 $y_i=y_{i+1}$ 时，$\alpha_i=\alpha_{i+1}+1$ 
> > >
> > > 再由 **性质 2** 可得
> > > $$
> > > \begin{array} { c } { ( - 1 ) ^ { k + m - \alpha _ { i } } D _ { + } ^ { k } Q _ { i } ^ { m } \left( y _ { i } \right) = ( - 1 ) ^ { k + m - \alpha _ { i } } ( m - 1 ) \frac { D _ { + } ^ { k - 1 } Q _ { i } ^ { m - 1 } \left( y _ { i } \right) - D _ { + } ^ { k - 1 } Q _ { i + 1 } ^ { m - 1 } \left( y _ { i } \right) } { y _ { i + m } - y _ { i } } > 0 } \\ { \left( k = m - \alpha _ { i } , \cdots , m - 1 \right) } \end{array}
> > > $$

根据性质 1、2、3 可大概估计下样条的形状

> **示例** 
>
> ![image-20191125193105672](assets/image-20191125193105672.jpg)

**性质 4** 

(1) 设 $y_l<y_{l+1}$，则在区间 $I_l\triangleq[y_l,y_{l+1}]$ 上，
$$
\mathcal{P}_m=\text{span}\{Q_i^m(x)\}_{i=l+1-m}^l
$$
(2) 如果 $l<r$，$y_{r-1}<y_r$，则 $\{Q_i^m(x)\}_{i=l-m+1}^{r-1}$ 在 $[y_l,y_r)$ 上是线性无关的

> **证明** 
>
> (1)
>
> 因为 $Q_i^m(x)\Big|_{I_l}\in \mathcal{P}_m$ 且 $\{Q_i^m(x)\}_{i=l+1-m}^l$ 有 $m$ 个元素，故只需证它们在 $I_l$ 上线性无关
>
> 设 $\forall x \in I_l$，
> $$
> s(x)=\sum_{i=l+1-m}^lc_iQ_i^m(x)=0
> $$
> 若 $c_i$ 不全为 $0$，令 $c_p$ 是 $\{c_i\}$ 中第一个非零的系数（$l+1-m\le p\le p$）。令
> $$
> y _ { p } \leqslant y _ { p + 1 } \leqslant \cdots \leqslant y _ { l } = \overbrace { \tau _ { 1 } , \cdots , \tau _ { 1 } } ^ { l _ { 1 } } < \cdots < \overbrace { \tau _ { d } , \cdots , \tau _ { d } } ^ { l _ { d } }
> $$
> 有 $\sum_{i=1}^d l_i\le m$，且
> $$
> s ( x ) = \sum _ { i = p } ^ { l } c _ { i } Q _ { i } ^ { m } ( x ) = \sum _ { j = 1 } ^ { d } \sum _ { k = 1 } ^ { l _ { j } } \alpha _ { j k } \left( x - \tau _ { j } \right) _ { + } ^ { m - k }
> $$
> 其中 $\alpha_{1l_1}\neq 0$，令
> $$
> \widetilde{s}(x)=\sum_{j=1}^d\sum_{k=1}^{l_j}\alpha_{jk}(x-\tau_j)^{m-k}_+
> $$
> 当 $x<\tau_1$ 时，$\widetilde{s}(x)=0$；当 $x>\tau_d$ 时，$\widetilde{s}(x)$ 为一 $m$ 阶多项式；当 $x\in I_l$ 时，$\widetilde{s}(x)=s(x)=0$。故 $\widetilde{s}(x)$ 是一个具有局部支集的非平凡的样条。
>
> $\sum_{i=1}^d l_i\le m$ 且根据 **引理 8.1**，矛盾
>
> 故 $c_i$ 全为 $0$ 
>
> (2)
>
> 当 $x\in [y_l,y_{r})$ 时
> $$
> s(x)=\sum_{i=l+1-m}^{r-1} c_iQ_i^{m-1}(x)=0
> $$
>
> 由 (1) 证明通过挪动区间易得 $c_i=0$ 

定义规范 $B$ 样条
$$
N_i^m(x)\triangleq(y_{i+m}-y_i)Q_i^m(x)
$$
$m=1$ 时有
$$
N_i^m(x)\triangleq(y_{i+m}-y_i)Q_i^m(x)
$$
并称 $N_i^m(x)$ 为 $m$ 阶的、节点为 $y_i,\dots,y_{i+m}$ 的**规范 B 样条**，显然 $m=1$ 时，
$$
N_i^1(x)=\left\{\begin{array}{ll}
1, &y_i\le x < y_{i+1},\\
0, &\text{other}
\end{array}\right.
$$
> **补充** 
> $$
> \begin{aligned}
> D_+N_i^m(x)
> &=(m-1)\left(Q_i^{m-1}(x)-Q_{i+1}^{m-1}(x)\right)\\
> &=(m-1)\left(\frac{N^{m-1}_i(x)}{y_{i+m-1}-y_i}-\frac{N_{i+1}^{m-1}(x)}{y_{i+m}-y_{i+1}}\right)
> \end{aligned}
> $$

**性质 5** 规范 B 样条形成**单位分解**，即对任意 $x\in[y_j,y_{j+1})$，都有
$$
\sum_{i=j+1-m}^j N_i^m(x)=1
$$
> **直观理解** 
>
> ![image-20191124231127051](assets/image-20191124231127051.jpg)
>
> **证明** 
>
> （数学归纳法）
>
> - 当 $m=1$ 时
>
> > $$
> > N_j^1(x)=1
> > $$
>
> - 假设当阶数为 $m-1$ 时成立
>
> > $$
> > \begin{aligned} \sum _ { i = j + 1 - m } ^ { j } N _ { i } ^ { m } ( x ) & = \sum _ { i = j + 1 - m } ^ { j } \left[\left( x - y _ { i } \right) Q _ { i } ^ { m - 1 } ( x ) + \left( y _ { i + m } - x \right) Q _ { i + 1 } ^ { m - 1 } ( x )\right] \\
> > & = \sum _ { i = j + 1 - m } ^ { j } \left( x - y _ { i } + y _ { i + m - 1 } - x \right) Q _ { i } ^ { m - 1 } ( x ) \\
> > & = \sum _ { i = j + 2 - m } ^ { j } N _ { i } ^ { m - 1 } ( x ) = 1 \end{aligned}
> > $$
> >
> > > 第一个等号利用了 **性质 1** 
> > >
> > > 第二个等号利用了 $Q_{j+1-m}^{m-1}(x)=0=Q_{j+1}^{m-1}(x),\ x\in[y_j,y_{j+1})$ 
> > >
> > > 第三个等号利用了 $N_{j+1-m}^{m-1}(x)=0,\ x\in[y_j,y_{j+1})$ 
> > >
> > > 第四个等号利用了假设

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
> **证明** 
>
> (1)
>
> （数学归纳法）
>
> - 当 $m=1$ 时
>
> > 右边为
> > $$
> > \sum_{i=l}^r N_i^1(x)=1
> > $$
> > $N_i^1(x)$ 只在 $[y_i,y_{i+1})$ 上为 $1$，故和式在 $[y_l,y_{r+1})$ 上为 $1$ 
>
> - 假设阶数为 $m-1$ 时成立
>
> > $$
> > \begin{aligned}
> >  &\sum_{i=l+1-m}^r\varphi_{i.m}(y)N_i^m(x)\\
> > =&\sum_{i=l+1-m}^r\varphi_{i.m}(y)\Big(\left( x - y _ { i } \right) Q _ { i } ^ { m - 1 } ( x ) + \left( y _ { i + m } - x \right) Q _ { i + 1 } ^ { m - 1 } ( x )\Big)\\
> > =&\sum_{i=l+2-m}^r Q_i^{m-1}(x)\Big((x-y_i)\varphi_{i,m}(y)+(y_{i+m-1}-x)\varphi_{i-1,m}(y)\Big)\\
> > =&\sum_{i=l+2-m}^r Q_i^{m-1}(x)\varphi_{i,m-1}(y)\Big((x-y_i)(y-y_{i+m-1})+(y_{i+m-1}-x)(y-y_i)\Big)\\
> > =&\sum_{i=l+2-m}^r Q_i^{m-1}(x)\varphi_{i,m-1}(y)(y-x)(y_{i+m-1}-y_i)\\
> > =&(y-x)\sum_{i=l+2-m}^r \varphi_{i,m-1}(y)N_i^{m-1}(x)\\
> > =&(y-x)^{m-1}
> > \end{aligned}
> > $$
> >
> > > 第一个等号： **性质 1** 
> > >
> > > 第二个等号：求和中两项对 $Q$ 关于 $i$ 进行统一（首尾有零项，类似 **性质 5** 证明），然后由于 $Q_{l+1-m}^{m-1}(x)=0$ 而少一个求和项
> > >
> > > 第三个等号：根据 $\varphi$ 的定义，提取公因子 $\varphi_{i,m-1}$ 
> > >
> > > 第五个等号： $N$ 的定义
> > >
> > > 第六个等号：假设
>
> (2)
>
> 在 $y=0$ 处求对 $y$ 的 $m-j$ 次导数，得到
> $$
> ( - 1 ) ^ { j - 1 } \frac { ( m - 1 ) ! } { ( j - 1 ) ! } x ^ { j - 1 } = \sum _ { i = 1 + 1 - m } ^ { r } D ^ { m - j } \varphi _ { i , m } ( 0 ) N _ { i } ^ { m } ( x )
> $$
> 移项即可

---

定义**对称函数** $\text{symm}_j(t_1,\dots,t_p)$：
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
因而
$$
\text{symm}_{j-1}(t_{i+1},\dots,t_{i+m-1})=(-1)^{j-1}\frac{D^{m-j}\varphi_{i,m}(0)}{(m-j)!}
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

> **证明** 
>
> (1)
>
> 设 $f\in L_1^{m-j}[a,b]$ ，由带**积分余项**的 Taylor 公式知
> $$
> \begin{aligned}
> f ( x ) & = \sum _ { k = 0 } ^ { m - j - 1 } \frac { D ^ { k } f ( a ) ( x - a ) ^ { k } } { k ! } + \int _ { a } ^ { x } \frac { ( x - y ) ^ { m - j - 1 } D ^ { m - j } f ( y ) } { ( m - j - 1 ) ! } \mathrm { d } y \\
> & = \sum _ { k = 0 } ^ { m - j - 1 } \frac { D ^ { k } f ( a ) ( x - a ) ^ { k } } { k ! } + \int _ { a } ^ { b } \frac { ( x - y ) _ { + } ^ { m - j - 1 } D ^ { m - j } f ( y ) } { ( m - j - 1 ) ! } \mathrm { d } y
> \end{aligned}
> $$
> 两边作用差商算子 $[y_i,\dots,y_{i+m}]$，得
> $$
> \left[ y _ { i } , y _ { i + 2 } , \cdots , y _ { i + m } \right] f = \int _ { y _ { i } } ^ { y _ { i + m } } \frac { \left[ y _ { i } , y _ { i + 2 } , \cdots , y _ { i + m } \right] ( \cdot - y ) _ { + } ^ { m - j - 1 } D ^ { m - j } f ( y ) } { ( m - j - 1 ) ! } \mathrm { d } y
> $$
> 注意到
> $$
> \begin{array} { l } { D _ { + , y } ^ { j } ( \cdot - y ) _ { + } ^ { m - 1 } = ( - 1 ) ^ { j } \frac { ( m - 1 ) ! } { ( m - j - 1 ) ! } ( \cdot - y ) _ { + } ^ { m - j - 1 } } \\ { ( \cdot - y ) ^ { m - 1 } = ( \cdot - y ) _ { + } ^ { m - 1 } + ( - 1 ) ^ { m - 1 } ( y - \cdot ) _ { + } ^ { m - 1 } } \end{array}
> $$
> 则
> $$
> \begin{aligned}
> \left[ y _ { i } , y _ { i + 2 } , \cdots , y _ { i + m } \right] f
> &= \int _ { y _ { i } } ^ { y _ { i + m } } \frac { (-1)^j D^j_y \left[ y _ { i } , y _ { i + 2 } , \cdots , y _ { i + m } \right] ( \cdot - y ) _ { + } ^ { m-1 } D ^ { m - j } f ( y ) } { ( m - 1 ) ! } \mathrm { d } y\\
> &= \int _ { y _ { i } } ^ { y _ { i + m } } \frac { (-1)^j D^j_y Q_i^m(y) D ^ { m - j } f ( y ) } { ( m - 1 ) ! } \mathrm { d } y\\
> \end{aligned}
> $$
>
> > 根据 **推论 9.3 (1)**，$\left[ y _ { i } , y _ { i + 2 } , \cdots , y _ { i + m } \right](\cdot-y)^{m-1}=0$ 
>
> (2)
>
> 令 (1) 中 $f(x)=x^{m-j+\nu}$ 再结合 **推论 9.1** 即可
>
> 对于两特别式，第一个取 $j=0,\nu=0$；第二个取 $j=0,\nu=1$ 

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
> **证明** 
>
> 设 $f\in L_1^{m-j}[a,b]$ ，由带**积分余项**的 Taylor 公式知
> $$
> f ( x ) = \sum _ { j = 0 } ^ { m-1 } \frac { D ^ { j } f ( a ) ( x - a ) ^ { j } } { j ! } + \int _ { a } ^ { b } \frac { ( x - y ) ^ { m - 1 }_+ D ^ { m } f ( y ) } { ( m - 1 ) ! } \mathrm { d } y
> $$
> 且对任意 $p\in \mathcal{P}_m$ 都有 $L(p)=0$，则
> $$
> L(f) = \int _ { a } ^ { b } \frac { L_x( x - y ) ^ { m - 1 }_+ D ^ { m } f ( y ) } { ( m - 1 ) ! } \mathrm { d } y=\int_a^b K(y)D^mf(y)\mathrm{d}y
> $$

**推论 9.5** 如果核 $K(y)$ 在 $[a,b]$ 上不改变符号，则对任意 $f\in C^m[a,b]$，都有
$$
L(f)=\frac{f^{(m)}(\xi)}{m!}L(x^m)\quad(a\le \xi \le b)
$$
> **证明** 
>
> 由中值定理知
> $$
> L(f)=\int_a^b K(y)D^mf(y)\mathrm{d}y=f^{(m)}(\xi)\int_a^bK(y)\mathrm{d}y
> $$
> 又
> $$
> L(x^m)=m!\int_a^b K(x)\mathrm{d}x=m!\int_a^bK(y)\mathrm{d}y
> $$
> 则
> $$
> L(f)=\frac{f^{(m)}(\xi)}{m!}L(x^m)
> $$

**性质 8** B 样条的内积：设 $y_i<y_{i+m}$，$y_j<y_{j+n}$，则
$$
\int_{-\infty}^{+\infty}Q_i^m(x)Q_j^n(x)\mathrm{d}(x)=\frac{(-1)^m(m-1)!(n-1)!}{(m+n-1)!}[y_i,\dots,y_{i+m}]_x[y_j,\dots,y_{j+n}]_y(y-x)^{m+n-1}_+
$$
> **证明** 
>
> 性质 7(1) 取 $j=0$，则
> $$
> [y_i,\dots,y_{i+m}]f=\int_{y_i}^{y_{i+m}}\frac{Q_i^m(x)D^mf(x)}{(m-1)!}\mathrm{d}x
> $$
> 取
> $$
> f(x)=[y_j,\dots,y_{j+n}]_y(y-x)^{m+n-1}_+
> $$
> 则
> $$
> \begin{aligned}
>  &[y_i,\dots,y_{i+m}]_x[y_j,\dots,y_n]_y(y-x)^{m+n-1}_+\\
> =&\int_{y_i}^{y_{i+m}}\frac{Q_i^m(x)D^m_x[y_j,\dots,y_{j+n}]_y(y-x)^{m+n-1}_+}{(m-1)!}\mathrm{d}x\\
> =&\frac{(-1)^m(m+n-1)!}{(m-1)!(n-1)!}\int_{-\infty}^{+\infty}Q_i^m(x)Q_j^n(x)\mathrm{d}(x)
> \end{aligned}
> $$
> 由于 $Q_i^m(x)$ 的支集为 $(y_i,y_{i+m})$，所以上式的积分限可以代换为从 $-\infty$ 到 $+\infty$ 

**性质 9** B 样条对节点的连续性依赖：设
$$
y_i\le \dots\le y_{i+m}=\overbrace{\tau_1,\dots,\tau_d}^{l_1},\dots,\overbrace{\tau_d,\dots,\tau_d}^{l_d}\ (\sum_{i=1}^d l_i=m+1)
$$
$y_i<y_{i+m}$，$y_i^{(\nu)}\le \dots\le y_{i+m}^{(\nu)}$ 是点的序列，且当 $\nu\to\infty$ 时，$y_j^{(\nu)}\to y_j$。又设 $Q_i^m(x)$，$Q_{i,\nu}^m(x)$ 是分别与节点 $\{y_j\}_{j=i}^{i+m}$，$\{y_j^{(\nu)}\}_{j=i}^{i+m}$ 相联系的 B 样条，则对 $k=0,\dots,m-1$，有
$$
D _ { + } ^ { k } Q _ { i , \nu } ^ { m } ( x ) \rightarrow D _ { + } ^ { k } Q _ { i } ^ { m } ( x ) \quad \left( \nu \rightarrow \infty , x \in \mathbb { R } \backslash J _ { i } ^ { k } \right)
$$
其中
$$
J_i^k\triangleq\{\tau_j:l_j\ge m-k\}
$$
且收敛在不包含 $J_i^k$ 的任何闭集上是一致的

### 09.2.3 扩充分割

建立空间 $\mathcal{S}(\mathcal{P}_m,\mathfrak{M},\Delta)$ 的一个具有局部支集的基底，空间维数为 $m+K$，其中 $K$ 为分割 $\Delta$ 的节点数（计算重节点）。在 $K$ 个节点上仅能定义 $K-m$ 个 B 样条，不能构成空间 $\mathcal{S}$ 的基底，因此必须加进 $2m$ 个点，但不能在区间 $(x_0,x_{K+1})$ 内部增加，否则就改变了空间 $\mathcal{S}$ 

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

> 第 2 个等号用了定理 9.8 (1)

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

> **证明** 
> $$
> \begin{aligned} Q _ { i } ^ { m } ( x ) & = ( - 1 ) ^ { m } \left[ y _ { i } , y _ { i } + h , \cdots , y _ { i } + m h \right] ( x - \cdot ) _ { + } ^ { m - 1 } \\ & = ( - 1 ) ^ { m } [ 0 , h , \cdots , m h ] \left( x - y _ { i } - \cdot \right) _ { + } ^ { m - 1 } \\ & = ( - 1 ) ^ { m } [ 0,1 , \cdots , m ] \left( x - y _ { i } - \cdot h \right) _ { + } ^ { m - 1 } \cdot \frac { 1 } { h ^ { m } } \\ & = ( - 1 ) ^ { m } [ 0,1 , \cdots , m ] \left( \frac { x - y _ { i } } { h } - \cdot \right) _ { + } ^ { m - 1 } \cdot \frac { 1 } { h } \\ & = \frac { 1 } { h } Q ^ { m } \left( \frac { x - y _ { i } } { h } \right) \end{aligned}
> $$
> 又
> $$
> N^m_i(x)=mhQ^m_i(x)=mQ^m\left(\frac{x-y_i}{h}\right)=N^m\left(\frac{x-y_i}{h}\right)
> $$

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

> 第 2 条是对称性
>
> **证明** 
>
> （归纳法）
>
> - 当 $m=1$ 时显然成立
> - 设 $m-1$ 时成立
>
> > $$
> > \begin{aligned}
> > N^m(m-x)
> > &=(m-x)Q^{m-1}(m-x)+xQ^{m-1}(m-1-x)\\
> > &=(m-x)Q^{m-1}(x-1)+xQ^{m-1}(x)\\
> > &=N^m(x)
> > \end{aligned}
> > $$
>
> 综上，由归纳法知成立

**性质 3** 
$$
\begin{aligned}
D_+N^m(x)&=N^{m-1}(x)-N^{m-1}(x-1)\\
D^j_+N^m(x)&=\nabla ^jN^{m-j}(x)=\sum_{k=0}^j(-1)^k\mathrm{C}_j^k N^{m-j}(x-k)
\end{aligned}
$$

> $\nabla$ 是向后差分算子，即 $\nabla f(x)=f(x)-f(x-1)$ 
>
> ---
>
> **证明** 
>
> 定义平移算子 $E^{-1}$ 为
> $$
> E^{-1}f(x)\triangleq f(x-1)
> $$
> 则
> $$
> D_+N^m(x)=N^{m-1}(x)-N^{m-1}(x-1)=\nabla N^{m-1}(x)\triangleq(I-E^{-1})N^{m-1}(x)
> $$
> 所以
> $$
> D^j_+N^m(x)=\nabla^jN^{m-j}(x)=(I-E^{-1})^jN^{m-j}(x)=\sum_{k=0}^j(-1)^k\mathrm{C}_k^jN^{m-j}(x-k)
> $$

**性质 4** 
$$
\Delta ^mf(0)=\int_0^mN^m(x)D^mf(x)\mathrm{d}x
$$

> **证明** 
> $$
> \begin{aligned}
> \Delta^mf(0)
> &=m![0,\dots,m]f(\cdot)\\
> &=m\int_0^m Q^m(x)D^mf(x)\mathrm{d} x\\
> &=\int^m_0N^m(x)D^mf(x)\mathrm{d}x
> \end{aligned}
> $$
>
> > 第 1 个等号：$\Delta$ 定义
> >
> > 第 2 个等号：性质 7 (1)

**性质 5** 
$$
N^m(x)=\left(N^1 \star N^{m-1}\right)(x)=\int_0^1 N^{m-1}(x-t)\mathrm{d}t\quad(m\ge 2)
$$

> **证明** 
> $$
> \begin{aligned}
> \left(N^1 \star N^{m-1}\right)(x)
> &=\int_\mathbb{R} N^1(t)N^{m-1}(x-t)\mathrm{d}t\\
> &=\int _0^1 N^{m-1}(x-t)\mathrm{d}t\\
> &=(-1)^{m-1}(m-1)[0,\dots,m-1]\int_0^1(x-t-\cdot)^{m-2}_+\mathrm{d}t\\
> &=(-1)^{m-1}[0,\dots,m-1]\Big((x-1-\cdot)^{m-1}-(x-\cdot)^{m-1}\Big)\\
> &=(-1)^{m-1}[1,\dots,m](x-\cdot)^{m-1}-[0,\dots,m-1](x-\cdot)^{m-1}\\
> &=(-1)^{m-1}m[0,\dots,m](x-\cdot)^{m-1}\\
> &=N^m(x)
> \end{aligned}
> $$
>
> ---
>
> **推论** 
> $$
> N^m(x)=\left(N^i\star N^{m-i}\right)(x)
> $$

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

> 卷积的 Fourier 变换就是变换的乘积

**性质 7** 对每个连续函数 $f(x)$，都有
$$
\int_\mathbb{R}f(x)N^m(x)\mathrm{d}x=\int_0^1\dots\int_0^1f(x_1+\dots+x_m)\mathrm{d}x_1\dots\mathrm{d}x_m
$$

> **证明** 
> $$
> \begin{aligned} \int _ { - \infty } ^ { + \infty } f ( x ) N ^ { m } ( x ) \mathrm { d } x & = \int _ { 0 } ^ { \infty } f ( x ) \int _ { 0 } ^ { 1 } N ^ { m - 1 } \left( x - x _ { 1 } \right) \mathrm { d } x _ { 1 } \mathrm { d } x \\ & = \int _ { 0 } ^ { \infty } f ( x ) \int _ { 0 } ^ { 1 } \cdots \int _ { 0 } ^ { 1 } N ^ { 1 } \left( x - x _ { 1 } - \cdots - x _ { m - 1 } \right) \mathrm { d } x _ { 1 } \mathrm { d } x _ { 2 } \cdots \mathrm { d } x _ { m - 1 } \mathrm { d } x \\ & = \int _ { 0 } ^ { 1 } \cdots \int _ { 0 } ^ { 1 } \int _ { x _ { 1 } + x _ { 2 } + \cdots + x _ { m - 1 } } ^ { 1 + x _ { 1 } + \cdots + x _ { m - 1 } } f ( x ) \mathrm { d } x \mathrm { d } x _ { 1 } \cdots \mathrm { d } x _ { m - 1 } \\ & = \int _ { 0 } ^ { 1 } \cdots \int _ { 0 } ^ { 1 } f \left( x _ { 1 } + x _ { 2 } + \cdots + x _ { m } \right) \mathrm { d } x _ { 1 } \mathrm { d } x _ { 2 } \cdots \mathrm { d } x _ { m } \end{aligned}
> $$

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

> **证明** 
>
> (1)
> $$
> \begin{aligned}
> \left(M^1\star M^{m-1}\right)(x)
> &=\int_0^1M^1(t)M^{m-1}(x-t)\mathrm{d}t\\
> &=\int_0^1N^1\left(t+\frac{1}{2}\right)N^{m-1}\left(x-t+\frac{m-1}{2}\right)\mathrm{d}t\\
> &=\int_{-\frac{1}{2}}^{\frac{1}{2}}N^{m-1}\left(x-t+\frac{m-1}{2}\right)\mathrm{d}t\\
> &=\int_0^1 N^{m-1}\left(x+\frac{m}{2}-t\right)\mathrm{d}t\\
> &=N^{m}\left(x+\frac{m}{2}\right)\\
> &=M^m(x)
> \end{aligned}
> $$
> 再利用卷积的性质即可
>
> (2)
> $$
> \hat{M}^1(\omega)
> =\int_\mathbb{R}M^1(x)\mathrm{e}^{-\sqrt{-1}\omega x}\mathrm{d}x
> =\int_{-\frac{1}{2}}^{\frac{1}{2}}\mathrm{e}^{-\mathrm{i}\omega x}\mathrm{d}\omega
> =\frac{\sin\frac{\omega}{2}}{\omega/2}
> $$
> 则
> $$
> \hat{M}^m(\omega)=\left(\hat{M}^1(\omega)\right)^m=\left(\frac{\sin\frac{\omega}{2}}{\omega/2}\right)^m=\psi_m(u)
> $$

