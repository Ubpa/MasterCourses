# 6. 最小平方逼近

本章考虑内积空间中的逼近问题，范数为
$$
\|f\|_2=\sqrt{\int_T |f(t)|^2\rho(t)\mathrm{d}t}
$$
一般可把 $\cdot_2$ 忽略，写成 $\|f\|$ 

其中 $\rho(t)>0$ 是**权函数**（如果没提权函数是什么，就默认 $\rho(t)=1$）

> 典型内积空间有
> $$
> \begin{aligned}
> L _ { 2 , \rho } ( T ) &\triangleq \left\{ x : \| x \| ^ { 2 } = \int _ { T } | x ( t ) | ^ { 2 } \rho ( t ) \mathrm { d } t < + \infty \right\}\\
> l _ { 2 , \rho } ( n ) &\triangleq \left\{ x \in \mathbb { R } ^ { n } : \langle x , y \rangle = \sum _ { i = 1 } ^ { n } x \left( t _ { i } \right) y \left( t _ { i } \right) \rho \left( t _ { i } \right) \right\}
> \end{aligned}
> $$
> 
> > $l_{2,\rho}(n)$ 的定义很奇怪，$y$ 不知道是啥

向量 $x$ 与空间 $M$ 垂直 $x\perp M$ 指 $\forall m \in M$，$\langle x,m\rangle = 0$ 

对向量 $x$ 进行标准化 $\hat{x} \triangleq x/\|x\|=x/\sqrt{\langle x,x\rangle}$ 

向量 $x$ 在向量 $y$ 上的投影 $\text{proj}(x,y)$ 为

$$
\begin{aligned}
\text{proj}(x,y)
&= \langle x, \hat{y}\rangle\hat{y} \\
&= \left\langle x, \frac{y}{\|y\|}\right\rangle\frac{y}{\|y\|} \\
&= \frac{\langle x,y\rangle}{\langle y,y\rangle} y \\
\end{aligned}
$$

## 6.1 最佳逼近

**定理 6.1** 设 $X$ 是 Hilbert 空间，$M\subset X$ 是闭线性子空间（闭凸集），则 $\forall x \in X$，$\#B_M(x)=1$ 

> $\|x\|^2=\langle x,x \rangle$ 是匀凸的[^定义 1.4 的推论]，因此最佳逼近是**存在且唯一**的

**定理 6.2** 设 $X$ 是 Hilbert 空间，$M$ 是 $X$ 的子空间，$x\in X$，$m^*\in M$，则 $m^*\in \mathcal{B}_M(x)$ $\Leftrightarrow$ $(x-m^*)\perp M$ 

> **证明** 
>
> - 必要性（$\Rightarrow$）
>
>   ![image-20191109151227790](assets/image-20191109151227790.jpg)
>
>   > $d(x,M)=\|x-m\|$，而直角边更短，矛盾
>
>   假设 $(x-m^*)\not\perp M$，则 $\exist z \in M$，满足 $\left\langle x-m^*,z \right\rangle \neq 0$ 
>   $$
>   \begin{aligned}d(x,M)&= \|x-m^*\| \\&= \inf_{m\in M} \|x-m\| \\&\le \left\|x-m^* - \text{proj}(x-m^*,z)\right\|\\&= \left\|x-m^* - \frac{\langle x-m^*, z\rangle}{\langle z,z \rangle}\right\|\\&= \left\langle x-m^* - \frac{\langle x-m^*, z\rangle}{\langle z,z \rangle},x-m^* - \frac{\langle x-m^*, z\rangle}{\langle z,z \rangle} \right\rangle ^{\frac{1}{2}}\\&= \sqrt{\|x-m^*\|^2-\frac{\left\langle x-m^*,z \right\rangle^2}{\left\langle z,z \right\rangle}}\\&< \|x-m^*\|\end{aligned}
>   $$
>
> - 充分性（$\Leftarrow$）
>
>   $(x-m^*)\perp M \Rightarrow \forall m \in M,(x-m^*)\perp (m-m^*)$，则
>   $$
>   \begin{aligned}
>   \|x-m\|^2&=\|x-m^*+m^*-m\|^2\\
>   &=\|x-m^*\|^2+\|m^*-m\|^2\\
>   &\ge \|x-m^*\|^2
>   \end{aligned}
>   $$
>   则 $m^* \in \mathcal{B}_M(x)$ 
>

**推论 6.1** $M$ 是闭的线性子空间 $\Rightarrow$ 距离投影算子 $P_M$ 是线性算子，且 $\|P_M\|=1$ 

> **证明** 
>
> - 距离投影算子 $P_M$ 是线性算子
>
>   $P_M$ 是齐次的[^定理 1.10]，则只需证 $P_M(x+y)=P_Mx+P_My$ 
>
>   由 **定理 6.2** 知
>   $$
>   (x-P_Mx)\perp M,\quad (y-P_My)\perp M
>   $$
>   则
>   $$
>   (x+y-(P_Mx+P_My))\perp M
>   $$
>   再由 **定理 6.2** 知
>   $$
>   P_Mx+P_My = \mathcal{B}_M(x+y) = P_M(x,y)
>   $$
>
> - $\|P_M\|=1$ 
>
>   ![image-20191109160641939](assets/image-20191109160641939.jpg)
>
>   又因为
>   $$
>   \begin{aligned}\|P_Mx\|^2&\le \|P_M x\|^2 + \|x- P_Mx\|^2\\&\le \|P_Mx + x - P_Mx\|^2\\&\le \|x\|^2\end{aligned}
>   $$
>   则 $\|P_M\| \le 1$，又 $P_M M = M$，则 $\|P_M\| = 1$ 

**计算** $P_Mx$ 

设 $M\triangleq \text{span}\{m_i\}_{i=1}^n$，$m^*=P_Mx$，则 $\exist \pmb{\alpha}=\left[\begin{matrix}\alpha_1\\\vdots\\\alpha_n\end{matrix}\right] \in \mathbb{R}^n$，使得
$$
m^*=\sum_{j=1}^n\alpha_jm_j
$$
且 $x-P_Mx\perp M$，即
$$
\left\langle m_i,x-m^* \right\rangle=0 \quad(i=1,2,\dots,n)
$$
即
$$
\sum_{j=1}^n\left\langle m_i,m_j \right\rangle \alpha_j = \left\langle   m_i,x \right\rangle\quad(i=1,2,\dots,n)
$$
令 $G\triangleq \{\left\langle m_i,m_j \right\rangle\}_{i,j=1}^n$ 为 Gram 矩阵，$\pmb{b}=\{\left\langle m_i,x \right\rangle\}_{i=1}^n$，则上述方程组可写为 $G\pmb{\alpha}=\pmb{b}$。其中 $G$ 是对称正定阵，可分解为 $G=LDL^\top$，其中 $L$ 为下三角阵，$D$ 为对角阵。则 $G\pmb{\alpha}=\pmb{b}$ 等价于
$$
\left\{\begin{array}{l}
L\beta=\pmb{b},\\
L^\top\alpha = D^{-1}\beta
\end{array}\right.
$$
由于 $L$ 为三角阵，很容易解出 $\beta$ 和 $\alpha$ 

## 6.2 正交函数系

Hilbert 空间与赋范线性空间的根本区别是在内积空间中有**正交**的概念。

已知的规范正交函数系有

- 三角函数系 $\left\{\frac{1}{\sqrt{2}},\cos t,\sin t\right\}$ 关于 $\left\langle f,g \right\rangle=\frac{1}{\pi}\int_{-\pi}^\pi f(t)g(t) \mathrm{d}t$ 规范正交

- Legendre 多项式
  $$
  L_n(t)=\frac{1}{2^n n!}\frac{\mathrm{d}^n}{\mathrm{d}t^n}(t^2-1)^n
  $$
  是 $[-1,1]$ 上的正交多项式系
  
- Tchebycheff 多项式 $\{T_n(t)=\cos(n\arccos t)\}_{n=0}^\infty$ 是在 $[-1,1]$ 上对权函数 $\frac{1}{\sqrt{1-t^2}}$ 的正交多项式系

- Jacobi 多项式 $\left\{P_j^{(\alpha,\beta)} \right\}_{j=0}^\infty$ 是关于内积
  $$
  \left\langle f,g \right\rangle = \int_{-1}^1 f(t)g(t)(1-t)^\alpha(1+t)^\beta\mathrm{d}t\quad(-1<\alpha,\beta<0)
  $$
  的正交系。特别地，当 $\alpha=\beta=0$ 时，Jacobi 多项式就是 Legendre 多项式；当 $\alpha=\beta=-1/2$ 时，Jacobi 多项式就是 Tchebycheff 多项式
  
- Sturm-Liouville 型微分方程边值问题

设 $\{\varphi_i\}_{i=1}^\infty$ 是规范的正交函数系，即
$$
\left\langle \varphi_i,\varphi_k \right\rangle = \int_a^b \rho(t)\varphi_i(t)\varphi_k(t)\mathrm{d}t = \delta_{ik}
$$
$\forall f \in L_{2,\rho}[a,b]$，令
$$
c_k=\left\langle f,\varphi_k \right\rangle=\int_a^b\rho(t)f(t)\varphi_k(t)\mathrm{d}t
$$
则称
$$
\sum_{k=1}^\infty c_k\varphi_k(t)
$$
为 $f$ 的**形式上**的 Fourier 级数，而
$$
S_n(f)\triangleq\sum_{k=1}^n c_k \varphi_k
$$
称为 $f$ 的 Fourier 级数前 n 项的和

**引理 6.1** 

(1)
$$
\left\|f-S_n(f)\right\|_2=\min_\limits{\pmb{\alpha}\in \mathbb{R}^n} \left\|f-\sum_{k=1}^n a_k\varphi_k\right\|_2
$$

(2) 若数列 $\{c_k\}_{k=1}^\infty$ 满足
$$
\sum_{k=1}^\infty c_k^2 < + \infty
$$

则在 $L_{2,\rho}$ 中存在唯一的函数 $f(t)$ 使 $c_k=\left\langle f,\varphi_k \right\rangle$，且
$$
\lim_\limits{n\to \infty}\left\|f-\sum_{k=1}^nc_k\varphi_k\right\|_2\to 0
$$

> **证明** 
>
> (1)
> $$
> \begin{aligned}
> \left\|f-\sum_{k=1}^n a_k\varphi_k\right\|^2
> &= \|f\|^2-2\sum_{k=1}^na_k\left\langle f,\varphi_k \right\rangle + \sum_{k=1}^n a_k^2\\
> &= \|f\|^2 - \sum_{k=1}^n c_k^2 + \sum_{k=1}^n(a_k-c_k)^2
> \end{aligned}
> $$
> 当且仅当 $a_k=c_k$ 时取极小值
>
> (2)
>
> 令
> $$
> S_n(t)=\sum_{k=1}^n c_k\varphi_k(t)
> $$
> 当 $n$ 充分大且 $m>n$ 时，由 $\varphi_k(t)$ 的规范正交性有
> $$
> \|S_m-S_n\|^2=\sum_{k=n+1}^m c_k^2 < \epsilon
> $$
> 则 $\{S_n\}$ 是 Cauchy 列，由 $L_{2,\rho}$ 的**完备性**知，存在唯一的 $f\in L_{2,\rho}$ 使得
> $$
> \lim_\limits{n\to\infty}\|S_n-f\|_2\to 0
> $$
> 又
> $$
> \begin{aligned}
> \left\langle f-S_n,\varphi_k \right\rangle
> &\le \|f-S_n\|\|\varphi_k\|\\
> &=\|f-S_n\|
> \end{aligned}
> $$
> 则 $\lim_\limits{n\to\infty} \left\langle f-S_n,\varphi_k \right\rangle = 0$，因而 $\left\langle f,\varphi_k \right\rangle=\lim_\limits{n\to 0}\left\langle S_n,\varphi_k \right\rangle=c_k$ 

内积空间中任意一组线性无关的函数系都可以通过 **Schmidt 正交化** 得到等价的规范正交系

**引理 6.2** 设 $\omega_1(t),\dots,\omega_n(t),\dots$ 是 $L_{2,\rho}[a,b]$ 中一组线性无关函数系（数目有限或可数），再设 $\psi_1(t)=\omega_1$，
$$
\psi _ { n } ( t ) = \left| \begin{array} { c c c c } { \left\langle \omega _ { 1 } , \omega _ { 1 } \right\rangle } & { \cdots } & { \left\langle \omega _ { 1 } , \omega _ { n - 1 } \right\rangle } & { \omega _ { 1 } } \\ { \left\langle \omega _ { 2 } , \omega _ { 1 } \right\rangle } & { \cdots } & { \left\langle \omega _ { 2 } , \omega _ { n - 1 } \right\rangle } & { \omega _ { 2 } } \\ { \vdots } & { } & { \vdots } & { \vdots } \\ { \left\langle \omega _ { n } , \omega _ { 1 } \right\rangle } & { \cdots } & { \left\langle \omega _ { n } , \omega _ { n - 1 } \right\rangle } & { \omega _ { n } } \end{array} \right|
$$
以及 $\Delta_0\triangleq 1$，$\Delta_m\triangleq G(\omega_1,\dots,\omega_n)\triangleq \det\left(\left\{\left\langle \omega_i,\omega_j \right\rangle\right\}_{i,j=1}^n\right)$，其中 $G$ 称为 $\omega_1,\dots,\omega_n$ 的 Gram 行列式，则
$$
\varphi_k(t)=\frac{\psi_k(t)}{\sqrt{\Delta_k\Delta_{k-1}}}\quad(k\ge 1)
$$
是一组规范正交系，且
$$
\text{span}\{\varphi_i\}_{i=1}^k=\text{span}\{\omega_i\}_{i=1}^k\triangleq M_k\quad (k=1,2,\dots)
$$

> **证明** 
>
> 由 $\psi_n(t)$ 定义，显然有
> $$
> \left\langle \psi_n,\omega_k \right\rangle=
> \left\{\begin{array}{l}
> \Delta_n & k=n\\
> 0 & k < n
> \end{array}\right.
> $$
> 因而，当 $k\le n$ 时，
> $$
> \begin{aligned}
> \left\langle \varphi_n,\varphi_k \right\rangle
> &=\frac{\left\langle \psi_n,\psi_k \right\rangle}{\sqrt{\Delta_n\Delta_{n-1}\Delta_k\Delta_{k-1}}}\\
> &=\frac{\left\langle \psi_n,\Delta_{k-1}\omega_k+\sum_{i=1}^{k-1}\alpha_i\omega_i \right\rangle}{\sqrt{\Delta_n\Delta_{n-1}\Delta_k\Delta_{k-1}}}\\
> &=\delta_{kn}
> \end{aligned}
> $$
>
> > 由 $\psi_k$ 定义知其为 $\omega_1,\dots,\omega_k$ 的线性组合，且 $\omega_k$ 的系数就是 $\Delta_{k-1}$ 
>
> 又
> $$
> \varphi_{k+1}=\frac{\Delta_k}{\sqrt{\Delta_{k+1}\Delta_k}}\omega_{k+1}+\sum_{i=1}^k\alpha_i\omega_i\in M_{k+1}
> $$
> 但 $\varphi_{k+1}\notin M_k$，则 $\text{span}_{i=1}^{k+1}=M_{k+1}$ 
>
> > $\omega_1,\dots,\omega_k$ 线性无关 $\Rightarrow$ $\Delta_k\neq 0$ 

**定理 6.3**（Gram 定理）设 $M_n\triangleq \text{span}\{f_i\}_{i=1}^n$ 是内积空间 $H$ 中的 $n$ 维子空间，则 $\forall g\in H$，都有
$$
d^2(g,M_n)\triangleq d^2=\frac{G(f_1,\dots,f_n,g)}{G(f_1,\dots,f_n)}
$$

> **证明** 
>
> 记 $f^* = \sum_{i=1}^n\alpha_i f_i = \mathcal{B}_M(g)$，则 $(g-f^*)\perp M_n$，即 $(g-f^*)\perp f_i$，则 $\{\alpha_i\}_{i=1}^n$ 满足方程组
> $$
> \sum_{i=1}^n\alpha_i\left\langle f_i,f_j \right\rangle=\left\langle g,f_j \right\rangle\quad(j=1,\dots,n) \tag{1}
> $$
> 方程组系数行列式为 $G(f_1,\dots,f_n)$ 
>
> 又
> $$
> \begin{aligned}
> d^2
> &=\left\langle g-f^*,g-f^* \right\rangle\\
> &=\left\langle g-f^*,g \right\rangle - \left\langle g-f^*,f^* \right\rangle\\
> &=\left\langle g-f^*,g \right\rangle
> \end{aligned}
> $$
> 则
> $$
> \sum_{i=1}^n\alpha_i\left\langle g,f_i \right\rangle+d^2=\left\langle g,g \right\rangle \tag{2}
> $$
> (1) 和 (2) 组成 $n+1$ 个未知数 $(\alpha_1,\dots,\alpha_n,d^2)$ 和 $n+1$ 个方程的方程组，系数矩阵为
> $$
> \left( \begin{array} { c c c c c } { \left\langle f _ { 1 } , f _ { 1 } \right\rangle } & { \left\langle f _ { 1 } , f _ { 2 } \right\rangle } & { \cdots } & { \left\langle f _ { 1 } , f _ { n } \right\rangle } & { 0 } \\ { \vdots } & { \vdots } & { } & { \vdots } & { \vdots } \\ { \left\langle f _ { n } , f _ { 1 } \right\rangle } & { \left\langle f _ { n } , f _ { 2 } \right\rangle } & { \cdots } & { \left\langle f _ { n } , f _ { n } \right\rangle } & { 0 } \\ { \left\langle g , f _ { 1 } \right\rangle } & { \left\langle g , f _ { 2 } \right\rangle } & { \cdots } & { \left\langle g , f _ { n } \right\rangle } & { 1 } \end{array} \right)
> $$
> 行列式为 $G(f_1,\dots,f_n)$，用方程组右端替代系数矩阵最后一列得到 $G(f_1,\dots,f_n,g)$，则根据 Cramer 法则，有
> $$
> d^2=\frac{G(f_1,\dots,f_n,g)}{G(f_1,\dots,f_n)}
> $$

**推论 6.2** 若 $\{f_i\}_{i=1}^n$ 线性无关，则 $G(f_1,\dots,f_n)>0$ 

> **证明** 
>
> $G(f_1)=\left\langle f_1,f_1 \right\rangle >0$，又
> $$
> d^2(f_2,M_1)=\frac{G(f_1,f_2)}{G(f_1)}>0
> $$
> 则 $G(f_1,f_2)>0$，依次类推有 $G(f_1,\dots,f_k)>0\quad(k=3,4,\dots,n)$ 

**推论 6.3** $\forall m < n$，有
$$
G(f_1,\dots,f_n)\le G(f_1,\dots,f_m)G(f_{m+1},\dots,f_n)
$$
且等号成立的充要条件为
$$
\left\langle f_k,f_i \right\rangle=0\quad 
(k=1,\dots,m;i=m+1,\dots,n)
$$

> **证明** 
>
> 令 $M_{n,k}\triangleq \text{span}\{f_i\}_{i=k+1}^n$，由 $d(f_k,M_{n,k})\le d(f_k,M_{m,k})$ 和 **定理 6.3** 可得
> $$
> \frac{G(f_k,\dots,f_n)}{G(f_{k+1},\dots,f_n)}
> \le \frac{G(f_{k+1},\dots,f_m)}{G(f_{k+1},\dots,f_m)} \quad (k=1,\dots,m-1)
> $$
> 即
> $$
> \frac{G(f_k,\dots,f_n)}{G(f_k,\dots,f_m)}
> \le \frac{G(f_{k+1},\dots,f_n)}{G(f_{k+1},\dots,f_m)} \quad (k=1,\dots,m-1)
> $$
> 故
> $$
> \frac{G(f_1,\dots,f_n)}{G(f_1,\dots,f_m)}\le\frac{G(f_2,\dots,f_n)}{G(f_2,\dots,f_m)}\le\dots\le\frac{G(f_m,\dots,f_n)}{G(f_m)} \tag{1}
> $$
> 另外，由 $d(f_m,M_{n,m})\le\|f_m\|$ 知
> $$
> d^2(f_m,M_{n,m})\le\frac{G(f_m,\dots,f_n)}{G(f_{m+1},\dots,f_n)}\le G(f_m)=\|f_m\|^2 \tag{2}
> $$
> 由 (1) 和 (2) 可得
> $$
> G(f_1,\dots,f_n)\le G(f_1,\dots,f_m)G(f_{m+1},\dots,f_n)
> $$
> 上式等号成立时，要求 $d(f_m,M_{n,m})=\|f_m\|$ 和 $d(f_k,M_{n,k})= d(f_k,M_{m,k})\quad (k=1,\dots,m-1)$，前者再由 **定理 6.2** 可知 $(f_m-0)\perp M_{n,m}$，即
> $$
> \left\langle f_m,f_i \right\rangle = 0 \quad (i=m+1,\dots,n)
> $$
> 对 $k=m-1$，有 $d(f_{m-1},M_{n,m-1})=\|f_{m-1}-\alpha f_m\|$，由 **定理 6.2** 知
> $$
> (f_{m-1}-\alpha f_m)\perp M_{n,m-1}=\text{span}\{f_m,\dots,f_n\}
> $$
> 从而可得 $(f_{m-1}-\alpha f_m)\perp M_{n,m}$，因此 $f_{m-1}\perp M_{n,m}$，此时
> $$
> \left\langle f_{m-1},f_i \right\rangle = 0 \quad (i=m+1,\dots,n)
> $$
> 以此类推可得
> $$
> \left\langle f_k,f_i \right\rangle = 0\quad (k=1,\dots,m-2;i=m+1,\dots,n)
> $$

由以上推论进一步可知道，对于线性无关组 $\{f_i\}_{i=1}^n$，有
$$
G(f_1,\dots,f_n)\le\left\langle f_1,f_1 \right\rangle \dots \left\langle f_n,f_n \right\rangle
$$
且等号成立的条件为 $\left\langle f_i,f_k \right\rangle = 0$（$i\neq k$ 且 $i,k=1,\dots,n$）

## 6.3 正交多项式的性质

多项式组 $\{t_i\}_{i=0}^\infty$ 经 Schmidt 正交化可得到规范正交多项式系 $\{\varphi_i(t)\}_{i=0}^\infty$，其中 $\varphi_0=\psi_0=1$，
$$
\varphi_k(t)=\frac{\psi_k(t)}{\sqrt{\Delta_k\Delta_{k-1}}}
$$
是 $k$ 次多项式

**定理 6.4** $\sqrt{\Delta_k/\Delta_{k-1}}\varphi_k(t)$ 是首项系数为 $1$ 的 $k$ 次多项式，它使积分
$$
\left\langle p,p \right\rangle = \int_a^b \rho(t)p^2(t)\mathrm{d}t
$$

在所有首项系数为 $1$ 的 $k$ 次多项式中达到极小

> **证明** 
>
> $\psi_k(t)$ 首项系数为 $\Delta_{k-1}$，则易得 $\phi_k(t)$ 首项系数为 $1$ 
>
> 首项系数为 1 的 $k$ 次多项式 $p(t)$ 可表示为
> $$
> p(t)=\sqrt{\frac{\Delta_k}{\Delta_{k-1}}}\varphi_k(t) + \sum_{j=0}^{k-1}\alpha_j\varphi_j
> $$
> 由 $\{\varphi_i(t)\}_{i=0}^\infty$ 的正交性可得
> $$
> \left\langle p,p \right\rangle = \frac{\Delta_k}{\Delta_{k-1}} + \sum_{j=0}^{k-1}\alpha_j^2
> $$
> 此时 $\left\langle p,p \right\rangle$ 达到极小的充要条件为 $\alpha_i=0$，即
> $$
> p(t)=\sqrt{\frac{\Delta_k}{\Delta_{k-1}}}\varphi_k(t)
> $$

**定理 6.5** 设 $\{p_n(t)\}_{n=0}^\infty$ 是区间 $[a,b]$ 上关于权 $\rho(t)$ 的正交多项式系，$\deg(p_n(t))=n$，又设 $f\in C[a,b]$，且 $\left\langle f,p_i \right\rangle = 0\quad(i=0,\dots,n-1)$，则 $f$ 在 $(a,b)$ 中至少变号 $n$ 次或者恒等于 $0$。

> **证明** 
>
> 由 $\left\langle f,p_0 \right\rangle = 0$ 可得
> $$
> \int_a^b\rho(t)f(t)\mathrm{d}t = 0
> $$
> 则 $f$ 恒等于 $0$ 或者至少在 $[a,b]$ 中变号一次。假设 $f$ 在$(a,b)$ 上变号次数 $k<n$，记变号点为 $r_1<\dots<r_k$，构造多项式 $p(t)=\prod_\limits{i=1}^k(t-r_i)$，则
> $$
> \int_a^b \rho(t)f(t)p(t)\mathrm{d} t\neq 0
> $$
> 但 $\deg(p(t))<n$，与 $\left\langle f,p_i \right\rangle=0\quad(i=0,\dots,n-1)$ 矛盾

**推论 6.4** 设 $\{\varphi_n(t)\}_{n=0}^\infty$ 是 $[a,b]$ 上关于权 $\rho(t)$ 正交的多项式函数系，则 $\varphi_n(t)$ 的零点全部是单重的，且都在 $(a,b)$ 中

**推论 6.5** 设 $\{\varphi_n(t)\}_{n=0}^\infty$ 是 $[a,b]$ 上关于权 $\rho(t)$ 正交的多项式函数系，记 $M_n\triangleq\text{span}\{\varphi_i\}_{i=0}^n$，$\varphi(t)=\sum_{i=0}^n c_i\varphi_i(t)$ 从 $M_n$ 对连续函数 $f$ 的最小平方逼近，则 $\varphi$ 在 $[a,b]$ 中至少 $n+1$ 个点上插值与 $f$ 

> 由 定理 6.2 知 $(f-\varphi)\perp M\triangleq \text{span}\{\varphi_i\}_{i=0}^n$ 
>
> 由定理 6.5 可知 $f-\varphi$ 在 $(a,b)$ 中至少变号 $n+1$ 次，即 $\varphi$ 至少 $n+1$ 个点上插值与 $f$ 

**定理 6.6** (1) 和 (2) 等价

(1) $\{p_n(t)\}_{n=0}^\infty$ 是首相系数为 1 的正交多项式系，如
$$
\left\{ p _ { n } ( t ) = \sqrt { \frac { \Delta _ { n } } { \Delta _ { n - 1 } } \varphi _ { n } ( t ) } \right\} _ { n = 0 } ^ { \infty }
$$
(2) 递推关系
$$
\begin{array} { l } { p _ { n } ( t ) = \left( t - a _ { n } \right) p _ { n - 1 } ( t ) - b _ { n } p _ { n - 2 } ( t ) } \\ { p _ { 0 } = 1 , \quad p _ { 1 } = t - a _ { 1 } } \end{array}
$$
其中
$$
a _ { n } = \frac { \left\langle t p _ { n - 1 } , p _ { n - 1 } \right\rangle } { \left\langle p _ { n - 1 } , p _ { n - 1 } \right\rangle } , \quad b _ { n } = \frac { \left\langle t p _ { n - 1 } , p _ { n - 2 } \right\rangle } { \left\langle p _ { n - 2 } , p _ { n - 2 } \right\rangle }
$$
在实际中当我们需要计算正交多项式系时，采用的就是 **定理 6.6** 中的三项递推关系式，而不是用定义式
$$
p_n(t)=\sqrt{\frac{\Delta_n}{\Delta_{n-1}}}\varphi_n(t)
$$
**定理 6.7** 设 $\{p_n(t)\}_{n=0}^\infty$ 是首项系数为 1 的区间 $[a,b]$ 上的正交多项式系，则 $p_n(t)$ 和 $p_{n-1}(t)$ 的零点必互相交错。

> 若设 $p_n$ 在 $[a,b]$ 上的 $n$ 个不同零点 $\lambda_{n,i}$ 满足
> $$
> a<\lambda_{n,1}<\dots<\lambda_{n,n}<b
> $$
> 则
> $$
> \lambda_{n-1.i-1}<\lambda_{n,i}<\lambda_{n-1,i}\quad(i=1,2,\dots,n)
> $$
> 其中 $\lambda_{n-1,0}\triangleq a$，$\lambda_{n-1,n}\triangleq b$ 

人们常常希望用函数 $f$ 在 $n$ 个点的值的线性组合来逼近积分，即
$$
\int_a^b f(t) \mathrm{d}t \approx \sum_{k=1}^n A_k f(t_k)
$$
其中 $\{t_i\}_{i=1}^n$ 是 $[a,b]$ 中的点。Lagrange 插值多项式
$$
L(t) = \sum_{k=1}^n f(t_k)l_k(t)
$$
则
$$
\int _ { a } ^ { b } f ( t ) \rho ( t ) \mathrm { d } t \approx \sum _ { k = 1 } ^ { n } f \left( t _ { k } \right) \int _ { a } ^ { b } l _ { k } ( t ) \rho ( t ) \mathrm { d } t \triangleq \sum _ { k = 1 } ^ { n } A _ { k } \cdot f \left( t _ { k } \right)
$$
其中 $\{A_k\}$ 仅与 $\{t_k\}$ 和 $\rho(t)$ 有关，与 $f(t)$ 无关。当 $f$ 为小于 $n$ 次的多项式时，近似公式为等式。

Guass 发现当 $\{t_i\}_{i=1}^n$ 设置巧妙时，上述近似积分对所有次数小于 $2n$ 的多项式都准确

**定理 6.8** 设积分公式
$$
\int _ { a } ^ { b } f ( t ) \rho ( t ) \mathrm { d } t \approx  \sum _ { k = 1 } ^ { n } A _ { k } f \left( t _ { k } \right)
$$
对所有次数小于 $n$ 次的多项式准确，则该积分公式对所有次数小于 $2n$ 次的多项式 $f$ 准确的充要条件是 $\{t_i\}_{i=1}^n$ 是 $p _ { n } ( t ) = \sqrt{\frac{\Delta_n}{\Delta_{n-1}}} \varphi _ { n } ( t )$ 的零点

> **证明** 
>
> - 充分性
>
>   $f$ 可表示为 $f=p_nQ+R$，其中 $Q$ 和 $R$ 都是次数小于 $n$ 的多项式，则
>   $$
>   \begin{aligned}
>   \int _ { a } ^ { b } f ( t ) \rho ( t ) \mathrm { d } t
>   & = \int _ { a } ^ { b } p _ { n } ( t ) Q ( t ) \rho ( t ) \mathrm { d } t + \int _ { a } ^ { b } R \rho ( t ) \mathrm { d } t \\
>   & = \int _ { a } ^ { b } R \rho ( t ) \mathrm { d } t = \sum _ { k = 1 } ^ { n } A _ { k } R \left( t _ { k } \right) = \sum _ { k = 1 } ^ { n } A _ { k } f \left( t _ { k } \right) \end{aligned}
>   $$
>
>   > $\int _ { a } ^ { b } p _ { n } ( t ) Q ( t ) \rho ( t ) \mathrm { d } t$ 为 0 是因为 $\left\langle p_n,p_i \right\rangle = 0\quad(i=0,\dots,n-1)$ 
>
> - 必要性
>
>   构造
>   $$
>   f(t)=p_k(t)\prod_{i=1}^n(t-t_i)
>   $$
>   其中 $k<n$，$f(t)$ 为 $k+n(<2n)$ 次多项式，且 $f(t_j)=0\quad(t_j=t_1,\dots,t_n)$ 
>
>   由题设知积分公式准确，即
>   $$
>   \int_a^b f(t)\rho(t)\mathrm{d}t=\sum_{k=1}^nA_kf(t_k)=0
>   $$
>   此时
>   $$
>   \int _ { a } ^ { b } f ( t ) \rho ( t ) \mathrm { d } t = \int _ { a } ^ { b } p _ { k } ( t ) \prod _ { i = 1 } ^ { n } \left( t - t _ { i } \right) \rho ( t ) \mathrm { d } t = 0
>   $$
>   即 $\prod _ { i = 1 } ^ { n } \left( t - t _ { i } \right)$ 与 $p_k\ (k=0,\dots,n01)$ 都是首项系数为 1 的正交多项式，则
>   $$
>   p_n=\prod _ { i = 1 } ^ { n } \left( t - t _ { i } \right)
>   $$
>   即 $\{t_i\}_{i=1}^n$ 是 $p_n$ 的零点

**定理 6.9**（Stieltjes 定理）设 $f\in C[a,b]$，则对 Gauss 型积分公式
$$
\int _ { a } ^ { b } f ( t ) \rho ( t ) \mathrm { d } t \approx  \sum _ { k = 1 } ^ { n } A _ { nk } f \left( t _ { nk } \right)
$$
有
$$
\lim _ { n \rightarrow \infty } \sum _ { k = 1 } ^ { n } A _ { n k } f \left( t _ { n k } \right) = \int _ { a } ^ { b } f ( t ) \rho ( t ) \mathrm { d } t
$$

> **证明** 
>
> 先证 $A_{nk}>0$ 
>
> $p_n(t)$ 的零点为 $t_{nk}\ (k=1,\dots,n)$，故可令
> $$
> Q(t)\triangleq \frac{p_n(t)}{t-t_{nk}}
> $$
> 则 $Q^2(t)$ 的次数小于 $2n$，且 $Q^2(t_{ni})=0\ (i\neq k)$则
> $$
> 0 < \int _ { a } ^ { b } Q ^ { 2 } ( t ) \rho ( t ) \mathrm { d } t = \sum _ { i = 1 } ^ { n } A _ { n i } Q ^ { 2 } \left( t _ { n i } \right) = A _ { n k } \cdot Q ^ { 2 } \left( t _ { n k } \right)
> $$
> 即 $A_{nk}>0$ 
>
> 又 $f=I$ 时积分公式准确，即
> $$
> \int _ { a } ^ { b } \rho ( t ) \mathrm { d } t =  \sum _ { k = 1 } ^ { n } A _ { nk }
> $$
> 即 $\sum _ { k = 1 } ^ { n } A _ { nk }$ 与 $n$ 无关
>
> $\forall \epsilon >0$，$\exist p\in \mathcal{P}$，使得 $\|f-p\|_\infty<\epsilon /c$，其中 $c=2\int_a^b\rho(t)\mathrm{d}t$ 
>
> 故对充分大的 $n$，有
> $$
> \begin{aligned} \left| \int _ { a } ^ { b } f \cdot \rho ( t ) \mathrm { d } t - \sum _ { k = 1 } ^ { n } A _ { n k } f \left( t _ { n k } \right) \right| & = | \int f \rho ( t ) \mathrm { d } t - \int p \rho ( t ) \mathrm { d } t \\ & + \sum _ { k = 1 } ^ { n } A _ { n k } p \left( t _ { n k } \right) - \sum _ { k = 1 } ^ { n } A _ { n k } f \left( t _ { n k } \right) | \\ & \leqslant \int | f - p | \rho \mathrm { d } t + \sum _ { k = 1 } ^ { n } A _ { n k } \left| p \left( t _ { n k } \right) - f \left( t _ { n k } \right) \right| \\ & \leqslant \frac { \varepsilon } { c } \left( \int \rho \mathrm { d } t + \sum _ { k = 1 } ^ { n } A _ { n k } \right) = \varepsilon \end{aligned}
> $$

## 6.4 正交展开的收敛性

设 $\{\varphi_n\}_{n=0}^\infty$ 是 $[a,b]$ 上标准正交多项式，$\deg \varphi_n = n$，定义
$$
S_nf\triangleq\sum_{k=0}^n\left\langle f,\varphi_k \right\rangle\varphi_k
$$
已知 $\forall f \in L_{2,\rho}[a,b]$ 有
$$
\lim_\limits{n\to\infty}\|S_nf-f\|_2=0
$$
但 $\exist f$ 使得
$$
\lim_\limits{n\to\infty}\|S_nf-f\|_\infty\neq 0
$$
本节考虑一致逼近时 $f$ 需要满足的条件
$$
\lim_\limits{n\to\infty}\|S_nf-f\|_\infty = 0
$$
将 $S_nf$ 表示为积分算子的形式
$$
\begin{aligned} S _ { n } f ( t ) & = \sum _ { i = 0 } ^ { n } \left\langle f , \varphi _ { i } \right\rangle \varphi _ { i } = \int _ { a } ^ { b } f ( s ) \sum _ { i = 0 } ^ { n } \varphi _ { i } ( s ) \varphi _ { i } ( t ) \rho ( s ) \mathrm { d } s \\ & = \int _ { a } ^ { b } f ( s ) K _ { n } ( s , t ) \rho ( s ) \mathrm { d } s \end{aligned}
$$
其中
$$
K _ { n } ( s , t ) = \sum _ { i = 0 } ^ { n } \varphi _ { i } ( s ) \varphi _ { i } ( t )
$$
称为规范正交系的核

设 $\varphi_n(t)$ 中 $t^n$ 的系数为 $\lambda_n^{-1}$，则 $p_n(t)=\lambda_n\varphi_n(t)$ 是首项系数为 1 的正交多项式系

**定理 6.10**（Christoffe-Darboux 定理）
$$
\sum _ { i = 0 } ^ { n } \varphi _ { i } ( s ) \varphi _ { i } ( t ) = \lambda _ { n + 1 } \lambda _ { n } ^ { - 1 } \frac { \varphi _ { n + 1 } ( t ) \varphi _ { n } ( s ) - \varphi _ { n } ( t ) \varphi _ { n + 1 } ( s ) } { t - s }
$$

> **证明** 
>
> 证明过程运用运用 **定理 6.6** 的三项递推公式，较为繁琐，详见课本 P138

**定理 6.11** 设 $t_0\in[a,b]$，若 $\varphi_n(t_0)$ 对 $n$ 一致有界，又设 $f\in C[a,b]$ 且在 $t_0$ 处满足 Lipschitz 条件，即 $|f(t)-f(t_0)|<\alpha|t-t_0|$，则
$$
f(t_0)=\sum_{n=0}^\infty\left\langle f,\varphi_n \right\rangle\varphi_n(t_0)
$$

> **证明** 
>
> 首先证明 $\lambda_n\lambda_{n-1}^{-1}$ 一致有界，则
> $$
> \begin{aligned} \lambda _ { n } ^ { 2 } & = \left\langle p _ { n } , p _ { n } \right\rangle = \left\langle p _ { n } , t p _ { n - 1 } \right\rangle \leqslant C \left\langle \left| p _ { n } \right| , \left| p _ { n - 1 } \right| \right\rangle \\ & \leqslant C \left\langle \left| p _ { n } \right| , \left| p _ { n } \right| \right\rangle ^ { 1 / 2 } \left\langle \left| p _ { n - 1 } \right| , \left| p _ { n - 1 } \right| \right\rangle ^ { 1 / 2 } \\ & \leqslant C \left\| p _ { n } \right\| \cdot \left\| p _ { n - 1 } \right\| = C \lambda _ { n } \lambda _ { n - 1 } \end{aligned}
> $$
> 则 $\lambda_n\lambda_{n-1}^{-1}\le C$ 一致有界
>
> 令
> $$
> \begin{aligned} \varepsilon _ { n } & = f \left( t _ { 0 } \right) - \left( S _ { n } f \right) \left( t _ { 0 } \right) = \int _ { a } ^ { b } \left( f \left( t _ { 0 } \right) - f ( t ) \right) \sum _ { i = 0 } ^ { n } \varphi _ { i } \left( t _ { 0 } \right) \varphi _ { i } ( t ) \rho ( t ) \mathrm { d } t \\ & = \lambda _ { n + 1 } \lambda _ { n } ^ { - 1 } \int _ { a } ^ { b } \frac { f \left( t _ { 0 } \right) - f ( t ) } { t _ { 0 } - t } \left( \varphi _ { n + 1 } \left( t _ { 0 } \right) \varphi _ { n } ( t ) - \varphi _ { n + 1 } ( t ) \varphi _ { n } \left( t _ { 0 } \right) \right) \rho ( t ) \mathrm { d } t \end{aligned}
> $$
> 记
> $$
> h(t)=\frac{f(t_0)-f(t)}{t_0-t}
> $$
> 由 Lipschitz 条件知 $|h(t)|\le \alpha$，又 $\lambda_{n+1}\lambda_n^{-1}\le C$，$|\varphi_n(t_0)|$ 一致有界且 $\lim_\limits{n\to\infty}\left\langle |h|,\varphi_n \right\rangle=0$，因此 $\lim_\limits{n\to\infty}\epsilon_n=0$ 
>
> > 证明下 $\lim_\limits{n\to\infty}\left\langle |h|,\varphi_n \right\rangle=0$，这也是习题 2
> >
> > 从引理 6.1(1) 的证明可知
> > $$
> > \sum_{n=0}^\infty\left\langle |h|,\varphi_n \right\rangle^2\le \| |h| \|^2 = \| h \|^2 < +\infty
> > $$
> > 则
> > $$
> > \lim_{n\to\infty}\left\langle |h|,\varphi_n \right\rangle = 0
> > $$

**推论 6.6** 设 $f\in C[-1,1]$，且 $f$ 满足 Lipschitz 条件，即 $|f(t_1)-f(t_2)|\le\alpha|t_1-t_2|$，则
$$
f=\sum_{i=0}^\infty\left\langle f,T_i \right\rangle T_i(t)
$$
即 $\lim_\limits{n\to\infty}\|f-S_nf\|_\infty = 0$ 

## 参考

[^定义 1.4 的推论]: [**01_Introduction.md**](01_Introduction.md). 定义 1.4 的推论.
[^定理 1.10]: [**01_Introduction.md**](01_Introduction.md). 定理 1.10.


