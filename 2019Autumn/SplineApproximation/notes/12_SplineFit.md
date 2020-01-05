# 12. 样条的插值与逼近

用样条 $s\in \mathcal{S}(\mathcal{P}_m,\mathfrak{M},\Delta)$ 来插值或逼近给定的函数 $f$ 

## 12.1 Tchebycheff 系统和弱的 Tchebycheff 系统

### 12.1.1 Tchebycheff 系统

Haar 系统 $D\left(\begin{array}{c}\tau\\ U\end{array}\right)$，$\forall \tau,\overline{\tau}\in I^m_{0,0}$ 有
$$
D\left(\begin{array}{c}\tau\\ U\end{array}\right)D\left(\begin{array}{c}\overline{\tau}\\ U\end{array}\right)>0
$$

> 因为 $U\subset C[I]$，因而 $D\left(\begin{array}{c}\tau\\ U\end{array}\right)$ 是 $(t_i)_{i=1}^m$ 的连续函数，又 $\forall \tau \in I^m_0$，都有 $D\left(\begin{array}{c}\tau\\ U\end{array}\right)\neq 0$，则 $\forall \tau,\overline{\tau}\in I^m_{0,0}$，都有 $D\left(\begin{array}{c}\tau\\ U\end{array}\right)$ 和 $D\left(\begin{array}{c}\overline{\tau}\\ U\end{array}\right)$ 符号相同

**定义 12.1** 设函数组 $U\triangleq\{u_i(t)\}_{i=1}^m\subset C[I]$，$U$ 称为 $I$ 上的 **T 系统**，是指 $\forall \tau\in I^m_{0,0}$，有
$$
D\left(\begin{array}{c}\tau\\ U\end{array}\right)\triangleq 
D\left(\begin{array}{c}
t_1,&\dots,&t_m\\
u_1,&\dots,&u_m
\end{array}\right)>0
$$
> Harr 系统满足 $D\left(\begin{array}{c}\tau\\ U\end{array}\right)>0$ 或 $D\left(\begin{array}{c}\tau\\ U\end{array}\right)<0$ 
>
> 而 T 系统则规定了 $D\left(\begin{array}{c}\tau\\ U\end{array}\right)>0$ 
>
> 因此 T 系统是 Harr 系统

**定义 12.2** 一个 $m$ 维线性空间 $\mathcal{U}$ 被称为 **Tchebycheff 空间**（简称为 **T 空间**）是指该空间有一组基构成 T 系统

> T 空间是 Harr 空间

**定理 12.1** 如果 $U\triangleq \{u_i(t)\}_{i=1}^m$ 是区间 $I$ 上的 $T$ 系统，则对所有不全为 0 的实数 $\{c_i\}_{i=1}^m$，有
$$
Z_I\left(\sum_{i=1}^m c_iu_i\right)\le m-1
$$

> 定理 2.6

**定理 12.2** 如果 $\mathcal{U}$ 是一个 T 空间，则对于 $\mathcal{U}$ 中的任一基 $U\triangleq \{u_i\}_{i=1}^n$，都有或者 $U$ 或者 $\widehat{U}\triangleq \{u_1,\dots,u_{m-1},-u_m\}$ 是一个 T 系统

> $D\left(\begin{array}{c}\tau\\ \widehat{U}\end{array}\right)=-D\left(\begin{array}{c}\tau\\ U\end{array}\right)$ 
>
> Harr 空间是 T 空间

**定义 12.3** $\{u_i\}_{i=1}^m$ 称为**完全的 T 系统** complete Tchebycheff system，简称为 **CT 系统**，指对于 $k=1,2,\dots,m$，$\{u_i\}_{i=1}^k$ 是一个 T 系统

> CT 系统是 T 系统，T 系统不一定是 CT 系统
>
> **示例** 
>
> $U=\{\cos x,\sin x\}$ 是 $[0,\pi)$ 上的 T 系统，因为 $\forall (t_1,t_2)\in I^2_{0,0}$，有
> $$
> D\left(\begin{array}{c}t_1,&t_2\\\cos x,&\sin x\end{array}\right)
> =\left|\begin{array}{c}\cos t_1&\sin t_1\\\cos t_2&\sin t_2\end{array}\right|=\sin(t_2-t_1)>0
> $$
> 但 $U$ 不是一个 CT 系统，因为 $\cos x$ 在 $[0,\pi)$ 上改变符号

**定义 12.4** $\{u_i\}_{i=1}^m$ 对所有的 $1\le i_1<\dots<i_k\le m$ 和任意 $1\le k \le m$，$\{u_{i_p}\}_{p=1}^k$ 都是一个 T 系统，则称 $\{u_i\}_{i=1}^k$ 为有序的**完全 T 系统** order complete Tchebycheff system，简称为 **OCT 系统** 

> $\{t^{i-1}\}_{i=1}^m$ 是 $(0,+\infty)$ 上的 OCT 系统

**定理 12.3**（Descartes 符号规则） 设 $\{u_i\}_{i=1}^m$ 是一个 OCT 系统，则对任意不全为 0 的实数 $\{c_i\}_{i=1}^m$，都有
$$
Z\left(\sum_{i=1}^m c_iu_i\right)\le S^-(c_1,\dots,c_m)
$$
**定义 12.5** 设 $U\triangleq \{u_i\}_{i=1}^m\subset C^{m-1}[I]$，区间 $I\subset \mathbb{R}$，称 $U$ 是 $I$ 上**扩充的 T 系统**（简称 ET 系统），是指对所有的 $t_1\le \dots \le t_m \in I$，都有
$$
D\left(\begin{array}{c}t_1,&\dots,&t_m\\u_1,&\dots,&u_m\end{array}\right)> 0
$$

> 重的列用的是导函数

**定理 12.4** 设 $U\triangleq \{u_i\}_{i=1}^m$ 是区间 $I$ 上的 ET 系统，则对不全为 0 的实数 $\{c_i\}_{i=1}^m$，有
$$
Z_I^{m-1}\left(\sum_{i=1}^mc_iu_i\right)\le m-1
$$
反之，如果 $C^{m-1}[I]$ 中的一组函数 $U\triangleq \{u_i\}_{i=1}^m$ 对所有不全为零的 $\{c_i\}_{i=1}^m$，上述不等式成立，则 $U$ 或者 $\widetilde{U}\triangleq\{u_1,\dots,u_{m-1},-u_m\}$ 是 $I$ 上的 ET 系统

**定理 12.5** 如果 $U\triangleq\{u_i\}_{i=1}^m$ 是一个 OCET 系统，则对于任何不全为 0 的实数 $\{c_i\}_{i=1}^m$，有
$$
Z^{m-1}_I\left(\sum_{i=1}^m c_iu_i\right)\le S^-(c_1,\dots,c_m)
$$

> **示例** 
>
> $\{t^{i-1}\}_{i=1}^m$ 是 $(0,+\infty)$ 上的 OCET 系统

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

> **证明** 
>
> 如果 $t_1<\dots<t_m\in I\backslash J$，则
> $$
> D\left(\begin{array}{c} t_1,&\dots,&t_m\\\widetilde{u}_1,&\dots,&\widetilde{u}_m\end{array}\right)=D\left(\begin{array}{c} t_1,&\dots,&t_m\\u_1,&\dots,&u_m\end{array}\right)> 0
> $$
> 对于任意 $\{t_i\}_{i=1}^m\subset I$，只要有某个 $\widetilde{t}_j\in J$，则必有
> $$
> D\left(\begin{array}{c} t_1,&\dots,&t_m\\\widetilde{u}_1,&\dots,&\widetilde{u}_m\end{array}\right)=0
> $$
> 从而 $\widetilde{U}$ 是 $I$ 上的 WT 系统

**定理 12.6** 设 $U=\{u_i\}_{i=1}^m$ 是定义在集合 $I$ 上的线性无关的 $m$ 个函数，如果 $U$ 是 WT 系统，则对于任意不全为 0 的实数 $\{c_i\}_{i=1}^m$ 都有
$$
S^-_I\left(\sum_{i=1}^m c_iu_i \right)\le m-1
$$
反之，若上述不等式对任意不全为零的 $\{c_i\}_{i=1}^m$ 都成立，则 $U$ 或 $\widetilde{U}\triangleq \{u_1,\dots,u_{m-1},-u_m\}$ 是 $I$ 上的 WT 系统

**推论 12.3** 样条空间 $\mathcal{S}(\mathcal{P}_m,\mathfrak{M},\Delta)$ 是一个 WT 空间

> **证明** 
>
> 显然
> $$
> S^-(s)\le Z(s)
> $$
> 由定理 11.11 可知
> $$
> S^-(s)\le m+K-1
> $$
> 而 $\dim(\mathcal{S})=m+K$，由 WT 系统的表征定理可知 $\mathcal{S}$ 是一个 WT 空间

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
给定充分光滑的函数 $\{\varphi\}_{i=1}^n$，求 $s(x)\triangleq \sum_{i=1}^n c_i$

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

> **证明** 
>
> $\forall p\in \mathcal{P}_m$，由 $Ap=p$ 可得
> $$
> g-Ag=g-p-(Ag-p)=g-p-A(g-p)
> $$
> 则
> $$
> \begin{aligned}
> \|g-Ag\|_{[y_j,y_{j+1}]}&\le\|g-p\| _{[y_j,y_{j+1}]}+\left(\max_i\|\mu_i\|\right)\|g-p\|_{[y_{j+1-m},y_{j+m}]}\\
> &\le \left(1+\max_i\|\mu_i\|\right)\|g-p\|_{[y_{j+1-m},y_{j+m}]}\\
> &\le \left(1+\max_i\|\mu_i\|\right)d_{[y_{j+1-m},y_{j+m}]}(g;\mathcal{P}_m)\\
> &\le \left(1+\max_i\|\mu_i\|\right) C_m\|g^{(m)}\|h^m
> \end{aligned}
> $$

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

> **证明** 
>
> 断言：$\mu_ix^{r-1}=\xi_i^{(r)}\quad (i=1,\dots,n;r=1,\dots,m)$ 
>
> 则 $\forall p(x)=\sum_{r=1}^mc_rx^{r-1}\in \mathcal{P}_m$，有
>$$
> \begin{aligned}
> Ap
> &=\sum_{r=1}^mc_rA(x^{r-1})\\
> &=\sum_{r=1}^mc_r\sum_{i=1}^n\mu_ix^{r-1}N^m_i(x)\\
> &=\sum_{r=1}^mc_r\sum_{i=1}^n\xi_i^{(r)}N^m_i(x)\\
> &=\sum_{r=1}^mc_rx^{r-1}\\
> &=p
> \end{aligned}
> $$

