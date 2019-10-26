# 06. 极形式 / Blossom

## 06.1 回顾

贝塞尔到单项式

贝塞尔控制顶点记为 $\pmb{b}_i$，单项式控制顶点记为 $\pmb{p}_i$ 

### 06.1.1 二次

$$
\begin{aligned}
A_2&\triangleq\left(\begin{matrix}
1 & 0 & 0\\
-2 & 2 & 0\\
1 & -2 & 1\\
\end{matrix}\right)\\

\pmb{f}(t)
&=
\left(\begin{matrix}
1&t&t^2
\end{matrix}\right)
\left(\begin{matrix}
1 & 0 & 0\\
-2 & 2 & 0\\
1 & -2 & 1\\
\end{matrix}\right)
\left(\begin{matrix}
\pmb{b}_0\\
\pmb{b}_1\\
\pmb{b}_2\\
\end{matrix}\right)\\
&=
\left(\begin{matrix}
1&t&t^2
\end{matrix}\right)
A_2
\left(\begin{matrix}
\pmb{b}_0\\
\pmb{b}_1\\
\pmb{b}_2\\
\end{matrix}\right)\\
&=\left(\begin{matrix}
1&t&t^2
\end{matrix}\right)
\left(\begin{matrix}
\pmb{p}_0\\
\pmb{p}_1\\
\pmb{p}_2\\
\end{matrix}\right)\\
\end{aligned}\\
$$

则
$$
\begin{aligned}
A_2\left(\begin{matrix}
\pmb{b}_0\\
\pmb{b}_1\\
\pmb{b}_2\\
\end{matrix}\right)
&=
\left(\begin{matrix}
\pmb{p}_0\\
\pmb{p}_1\\
\pmb{p}_2\\
\end{matrix}\right)\\
\left(\begin{matrix}
\pmb{b}_0\\
\pmb{b}_1\\
\pmb{b}_2\\
\end{matrix}\right)
&=
A_2^{-1}
\left(\begin{matrix}
\pmb{p}_0\\
\pmb{p}_1\\
\pmb{p}_2\\
\end{matrix}\right)\\
\end{aligned}
$$

### 06.1.2 三次

$$
\begin{aligned}
A_3&\triangleq\left(\begin{matrix}
1 & 0 & 0 & 0\\
-3 & 3 & 0 & 0\\
3 & -6 & 3 & 0\\
-1 & 3 & -3 & 1\\
\end{matrix}\right)\\

\pmb{f}(t)
&=
\left(\begin{matrix}
1 & t & t^2 & t^3
\end{matrix}\right)
\left(\begin{matrix}
1 & 0 & 0 & 0\\
-3 & 3 & 0 & 0\\
3 & -6 & 3 & 0\\
-1 & 3 & -3 & 1\\
\end{matrix}\right)
\left(\begin{matrix}
\pmb{b}_0\\
\pmb{b}_1\\
\pmb{b}_2\\
\pmb{b}_3\\
\end{matrix}\right)\\
&=
\left(\begin{matrix}
1&t&t^2&t^3
\end{matrix}\right)
A_3
\left(\begin{matrix}
\pmb{b}_0\\
\pmb{b}_1\\
\pmb{b}_2\\
\pmb{b}_3\\
\end{matrix}\right)\\
&=
\left(\begin{matrix}
1&t&t^2&t^3
\end{matrix}\right)
\left(\begin{matrix}
\pmb{p}_0\\
\pmb{p}_1\\
\pmb{p}_2\\
\pmb{p}_3\\
\end{matrix}\right)
\end{aligned}\\
$$

则
$$
\begin{aligned}
A_3\left(\begin{matrix}
\pmb{b}_0\\
\pmb{b}_1\\
\pmb{b}_2\\
\pmb{b}_3\\
\end{matrix}\right)
&=
\left(\begin{matrix}
\pmb{p}_0\\
\pmb{p}_1\\
\pmb{p}_2\\
\pmb{p}_3\\
\end{matrix}\right)\\
\left(\begin{matrix}
\pmb{b}_0\\
\pmb{b}_1\\
\pmb{b}_2\\
\pmb{b}_3\\
\end{matrix}\right)
&=
A_3^{-1}
\left(\begin{matrix}
\pmb{p}_0\\
\pmb{p}_1\\
\pmb{p}_2\\
\pmb{p}_3\\
\end{matrix}\right)\\
\end{aligned}
$$

### 06.1.3 二次转三次

$$
\left(\begin{matrix}
1&t&t^2&t^3
\end{matrix}\right)
A_3\left(\begin{matrix}
\pmb{p}_0^{(3)}\\
\pmb{p}_1^{(3)}\\
\pmb{p}_2^{(3)}\\
\pmb{p}_3^{(3)}\\
\end{matrix}\right)
=
\left(\begin{matrix}
1&t&t^2&t^3
\end{matrix}\right)
\left(\begin{matrix}
&&&0\\
&A_2&&0\\
&&&0\\
0&0&0&0\\
\end{matrix}\right)
\left(\begin{matrix}
\pmb{p}_0^{(2)}\\
\pmb{p}_1^{(2)}\\
\pmb{p}_2^{(2)}\\
0\\
\end{matrix}\right)
$$

> 右边的第四列是什么不关键，重点是第 1、2、3 列和右边的第 4 行必须是 0

则
$$
\left(\begin{matrix}
\pmb{p}_0^{(3)}\\
\pmb{p}_1^{(3)}\\
\pmb{p}_2^{(3)}\\
\pmb{p}_3^{(3)}\\
\end{matrix}\right)
=
A_3^{-1}
\left(\begin{matrix}
&&&0\\
&A_2&&0\\
&&&0\\
0&0&0&0\\
\end{matrix}\right)
\left(\begin{matrix}
\pmb{p}_0^{(2)}\\
\pmb{p}_1^{(2)}\\
\pmb{p}_2^{(2)}\\
0\\
\end{matrix}\right)
$$

## 06.2 基础

### 06.2.1 仿射组合

> Affine Combinations

n 点的仿射组合为
$$
p_{\pmb\alpha}=\sum_{i=1}^n\alpha_i\pmb{p}_i
$$
其中 $\sum_{i=1}^n\alpha_i=1$ 

函数 $f$ 对参数 $x_i$ 是仿射的是指
$$
f \left( x _ { 1 } , \ldots , \sum _ { k = 1 } ^ { n } \alpha _ { k } x _ { i } ^ { ( k ) } , \ldots , x _ { m } \right) = \sum _ { k = 1 } ^ { n } \alpha _ { k } f \left( x _ { 1 } , \ldots , x _ { i } ^ { ( k ) } , \ldots , x _ { m } \right)
$$
其中 $\sum_{k=1}^n\alpha_k=1$ 

> 示例
>
> 两点线性（仿射）插值 linear (affine) interpolation
> $$
> \pmb{p}_\alpha = (1-\alpha)\pmb{p}_1+\alpha\pmb{p}_2
> $$
> ![image-20191026112320066](assets/image-20191026112320066.jpg)
>
> 三点的重心 barycentric 组合（“重心坐标 barycentric coordinates”）
> $$
> \pmb{p}=\alpha\pmb{p}_1+\beta\pmb{p}_2+\gamma\pmb{p}_3
> $$
> 其中 $\alpha+\beta+\gamma=1$ 
>
> 系数可用坐标表示
> $$
> \alpha = \frac { \operatorname { area } \left( \Delta \left( p _ { 2 } , p _ { 3 } , p \right) \right) } { \operatorname { area } \left( \Delta \left( p _ { 1 } , p _ { 2 } , p _ { 3 } \right) \right) } ,
> \beta = \frac { \operatorname { area } \left( \Delta \left( p _ { 1 } , p _ { 3 } , p \right) \right) } { \operatorname { area } \left( \Delta \left( p _ { 1 } , p _ { 2 } , p _ { 3 } \right) \right) } ,
> \gamma = \frac { \operatorname { area } \left( \Delta \left( p _ { 1 } , p _ { 2 } , p \right) \right) } { \operatorname { area } \left( \Delta \left( p _ { 1 } , p _ { 2 } , p _ { 3 } \right) \right) }
> $$
> ![image-20191026112750647](assets/image-20191026112750647.jpg)

### 06.2.3 极形式

> Polar Forms / Blossom
>

n 次 degree 多项式 polynomial $F:\mathbb{R}\to\mathbb{R}$ 的极形式 polar form 或开花 blossom $f:\mathbb{R}^d\to\mathbb{R}$ 是一个满足以下性质的 d 维函数

- 对角性 diagonality：$f(t,\dots,t)=F(t)$ 
- 对称性 symmetry：对任意置换 $\pi$，$f(t_1,\dots,t_d)=f(t_{\pi(1)},\dots,t_{\pi(d)})$ 
- 多放射 multi-affine：$f(t_1,\dots,\sum_\limits{k=1}^n\alpha_kt_i^{(k)},\dots,t_d)=\sum_{k=1}^n\alpha_k f(t_1,\dots,t_i^{(k)},\dots,t_d)$ 

### 06.2.4 性质

多项式 $F(t)$ 与极形式 $f(t_1,\dots,t_n)$ 是一一对应的
$$
\begin{aligned}
F(t)&=\sum_{i=0}^n c_i t^i\\
f(t)&=\sum_{i=0}^n c_i 
\frac{\sum_\limits{S\subseteq\{1,\dots,n\},|S|=i} \prod_\limits{j\in S}t_j}{C_n^i}\\
\end{aligned}
$$

> 示例
>
> - 0 次：$f=c_0$ 
> - 1 次：$f(t_1)=c_0+c_1t_1$ 
> - 2 次：$f(t_1,t_2)=c_0+c_1\frac{t_1+t_2}{2} + c_2t_1t_2$ 
> - 3 次：$f(t_1,t_2,t_3)=c_0+c_1\frac{t_1+t_2+t_3}{3}+c_2\frac{t_1t_2+t_2t_3+t_1t_3}{3}+c_3t_1t_2t_3$ 

### 06.2.5 泛化

$$
\begin{aligned}
F&:\mathbb{R}^m\to \mathbb{R}^n\\
f&:\mathbb{R}^{d\times m}\to \mathbb{R}^n
\end{aligned}
$$

满足性质

- 对角性 diagonality：$f(\pmb{t},\dots,\pmb{t})=F(\pmb{t})$ 
- 对称性 symmetry：对任意置换 $\pi$，$f(\pmb{t}_1,\dots,\pmb{t}_d)=f(\pmb{t}_{\pi(1)},\dots,\pmb{t}_{\pi(d)})$ 
- 多放射 multi-affine：$f(\pmb{t}_1,\dots,\sum_\limits{k=1}^n\alpha_k\pmb{t}_i^{(k)},\dots,\pmb{t}_d)=\sum_{k=1}^n\alpha_k f(\pmb{t}_1,\dots,\pmb{t}_i^{(k)},\dots,\pmb{t}_d)$ 

### 06.2.6 向量参数

我们需要区分点 point 和向量 vectors（点的差值）

使用“帽子”记号 $\hat{v}=p-q$ 来表示向量

1 向量：$\hat{1}=1-0,\hat{\pmb{1}}=[1,\dots,1]^\top-\pmb{0}$ 

极形式中向量的递归定义
$$
f(\underbrace{t_1,\dots,t_{n-k}}_{n-k},\underbrace{\hat{v}_1,\dots,\hat{v}_k}_k)=
f(\underbrace{t_1,\dots,t_{n-k}}_{n-k},p_1,\underbrace{\hat{v}_2,\dots,\hat{v}_{k-1}}_{k-1})-f(\underbrace{t_1,\dots,t_{n-k}}_{n-k},q_1,\underbrace{\hat{v}_2,\dots,\hat{v}_{k-1}}_{k-1})
$$
其中 $\hat{v}_i=p_i-q_i(i=1,\dots,k)$ 

### 06.2.7 导数

$$
\frac { \mathbb{d} ^ { k } } { \mathbb{d} t ^ { k } } F ( t ) = \frac { n ! } { ( n - k ) ! } f ( \underbrace { t , \ldots , t } _ { n - k }, \underbrace { \hat { 1 } , \ldots , \hat { 1 } } _ { k } )
$$

> 示例
> $$
> \begin{aligned}
> f \left( t _ { 1 } , t _ { 2 } , t _ { 3 } \right) &= c _ { 0 } + c _ { 1 } \frac { t _ { 1 } + t _ { 2 } + t _ { 3 } } { 3 } + c _ { 1 } \frac { t _ { 1 } t _ { 2 } + t _ { 1 } t _ { 3 } + t _ { 2 } t _ { 3 } } { 3 } + c _ { 3 } t _ { 1 } t _ { 2 } t _ { 3 }\\
> 
> F ^ { \prime } ( t )
> &= \frac { 3 ! } { 2 ! }f(t,t,\hat{1})\\
> &= \frac { 3 ! } { 2 ! } \left[f(t,t,1)-f(t,t,0)\right]\\
> &= \frac { 3 ! } { 2 ! } \left[ \left( c _ { 0 } + c_1\frac { 1 + t + t } { 3 } + c _ { 2 } \frac { 1 t + t t + 1 t } { 3 } + c _ { 3 } 1 t t \right) - \left( c _ { 0 } + c_1\frac { 0 + t + t } { 3 } + c _ { 2 } \frac { t t } { 3 } \right) \right]\\
> &= 3 \left( c _ { 1 } \frac { 1 } { 3 } + c _ { 2 } \frac { 2 t } { 3 } + c _ { 3 } t t \right)\\
> &= 3 c _ { 3 } t ^ { 2 } + 2 c _ { 2 } t + c _ { 1 }
> \end{aligned}
> $$

### 06.2.8 连续条件

下列等价

- $F$ 和 $G$ 在 $t$ 点 $C^k$ 连续
- $\forall t_1,\dots,t_k, f(t,\dots,t,t_1,\dots,t_k)=g(t,\dots,t,t_1,\dots,t_k)$ 
- $f ( t , \ldots , t , \underbrace{\hat { 1 } , \ldots , \hat { 1 }}_k ) = g ( t , \ldots , t , \underbrace{\hat { 1 } , \ldots , \hat { 1 }}_k )$

### 06.2.9 升阶

给定 d 次函数 $f(t_1,\dots,t_d)$，升阶得
$$
f ^ { ( + 1 ) } \left( t _ { 1 } , \ldots , t _ { d + 1 } \right) = \frac { 1 } { d + 1 } \sum _ { i = 1 } ^ { d + 1 } f \left( t _ { 1 } , \ldots , t _ { i - 1 } , t _ { i + 1 } , \ldots , t _ { d + 1 } \right)
$$

> 证明 $F^{(+1)}(t)=F(t)$ 
> $$
> \begin{aligned} \forall t : f ^ { ( + 1 ) } ( t , \ldots , t ) & = \left. \frac { 1 } { d + 1 } \sum _ { i = 1 } ^ { d + 1 } f \left( t _ { 1 } , \ldots , t _ { i - 1 } , t _ { i + 1 } , \ldots , t _ { d + 1 } \right) \right| _ { t _ { 1 } = \cdots t _ { d + 1 } = t } \\ & = \frac { 1 } { d + 1 } \sum _ { i = 1 } ^ { d + 1 } f ( t , \ldots , t ) \\ & = f ( t , \ldots , t ) \end{aligned}
> $$

## 06.3 Bezier 样条



## 06.4 B 样条

