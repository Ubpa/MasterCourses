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
>
> ---
>
> 两者都是只有 $n+1$ 个变量，即自由度为 $n+1$，只需提供四个采样点即可确定函数

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

### 06.3.1 Bezier 曲线

#### 06.3.1.1 极形式

用极形式表示 Bezier 曲线
$$
\begin{aligned} f ( t , \ldots , t ) & = ( 1 - t ) f ( t , \ldots , t , 0 ) + t f ( t , \ldots , t , 1 ) \\
& = ( 1 - t ) [ ( 1 - t ) f ( t , \ldots , t , 0,0 ) + t f ( t , \ldots ,t, 0,1 ) ] + t [ ( 1 - t ) f ( t , \ldots , t , 1,0 ) + t f ( t , \ldots , t , 1,1 ) ] \\
& = ( 1 - t ) ^ { 2 } f ( t , \ldots , t , 0,0 ) + 2 t ( 1 - t ) t f ( t , \ldots , 0,1 ) + t ^ { 2 } f ( t , \ldots , t , 1,1 ) \\ & = \cdots \\ & = \sum _ { i = 0 } ^ { n } \left( \begin{array} { c } { n } \\ { i } \end{array} \right) t ^ { i } ( 1 - t ) ^ { n - i } f (\underbrace{0,\dots,0}_{n-i},\underbrace{1,\dots,1}_i)\\
& = \sum _ { i = 0 } ^ { n } B_n^i(t) f (\underbrace{0,\dots,0}_{n-i},\underbrace{1,\dots,1}_i)\end{aligned}
$$
因此 $f (\underbrace{0,\dots,0}_{n-i},\underbrace{1,\dots,1}_i)=\pmb{p}_i$ 

> 示例
>
> 对于 3 次 Bezier 曲线，极形式为 $\pmb{p}(t_1,t_2,t_3)$，四个样本点为
> $$
> \begin{aligned}
> \pmb{p}(0,0,0)&=\pmb{p}_0\\
> \pmb{p}(0,0,1)&=\pmb{p}_1\\
> \pmb{p}(0,1,1)&=\pmb{p}_2\\
> \pmb{p}(1,1,1)&=\pmb{p}_3\\
> \end{aligned}
> $$
> 由此可确定出极形式内的四个参数 $c_0,c_1,c_2,c_3$，由此求出极形式 $\pmb{p}(t_1,t_2,t_3)$，Bezier 曲线即为 $\pmb{p}(t,t,t)$ 
>
> ![image-20191026170726697](assets/image-20191026170726697.jpg)

#### 06.3.1.2 de Castlejau 算法

- Bezier 点：$\pmb{p}_i^{(0)}(t)=f(\underbrace{0,\dots,0}_{d-i},\underbrace{1,\dots,1}_{i})$ 
- 内部点：$\pmb{p}_i^{(j)}(t)=f(\underbrace{0,\dots,0}_{d-i-j},\underbrace{1,\dots,1}_{i},\underbrace{t,\dots,t}_{j})$ 
- 迭代计算：$\pmb{p}_i^{(j)}(t)=(1-t)\pmb{p}_i^{(j-1)}+t\pmb{p}_{i+1}^{(j-1)}(t)$ 

> 示例
>
> ![image-20191026171958768](assets/image-20191026171958768.jpg)
>
> 每次线性组合就是需要底下一层的两个
>
> $i+1$ 个 1 的项与 $i$ 个 1 的项线性组合后得到 $i$ 个 1 且 $t$ 多一个的项

#### 06.3.1.3 泛化

$f(t)$ 是 $t\in [u,v]$ 的 d 阶 Bezier 曲线，$\pmb{p}$ 是 $f$ 的极形式，则 Bezier 点用极形式表示为
$$
\pmb{b}_i=p(\underbrace{u,\dots,u}_{d-i},\underbrace{v,\dots,v}_i)
$$

> 示例
>
> 三次 Bezier 曲线
>
> $\pmb{p}(u,u,u),\pmb{p}(u,u,v),\pmb{p}(u,v,v),\pmb{p}(v,v,v)$ 
>
> ![image-20191026172459228](assets/image-20191026172459228.jpg)

#### 06.3.1.4 変基

给定 n 次多项式 $\pmb{p}(t)$，想要 Bezier 曲线的控制点 $\{\pmb{b}_i\}_{i=0}^n$ 

解决方法

- $\pmb{p}(t)\mapsto \pmb{b}(t_1,\dots,t_n)$ 
- 控制点 $\pmb{b}_i=\pmb{b}(\underbrace{0,\dots,0}_{n-i},\underbrace{1,\dots,1}_i)$，$i=0,\dots,n$ 

> 示例
>
> $p(t)=1+2t+3t^2-t^3$ 
>
> - 线性代数
>   $$
>   \left( \begin{array} { c c c c } { 1 } & { 0 } & { 0 } & { 0 } \\ { - 3 } & { 3 } & { 0 } & { 0 } \\ { 3 } & { - 6 } & { 3 } & { 0 } \\ { - 1 } & { 3 } & { - 3 } & { 1 } \end{array} \right) ^ { - 1 } \left( \begin{array} { c } { 1 } \\ { 2 } \\ { 3 } \\ { - 1 } \end{array} \right) = \left( \begin{array} { c } { 1 } \\ { 5 / 3 } \\ { 10 / 3 } \\ { 5 } \end{array} \right)
>   $$
>
> - 极形式
>   $$
>   \pmb{b} \left( t _ { 0 } , t _ { 1 } , t _ { 2 } \right) = 1 + 2 \frac { t _ { 0 } + t _ { 1 } + t _ { 2 } } { 3 } + 3 \frac { t _ { 0 } t _ { 1 } + t _ { 1 } t _ { 2 } + t _ { 0 } t _ { 2 } } { 3 } - t _ { 0 } t _ { 1 } t _ { 2 }
>   $$
>   则
>   $$
>   \begin{aligned}
>   \pmb{b}(0,0,0)&=1\\
>   \pmb{b}(0,0,1)&=\frac{5}{3}\\
>   \pmb{b}(0,1,1)&=\frac{10}{3}\\
>   \pmb{b}(1,1,1)&=5\\
>   \end{aligned}
>   $$

### 06.3.1 多曲线段

![image-20191026203411697](assets/image-20191026203411697.jpg)

两条曲线段
$$
\{ \boldsymbol { p } ( 0,0,0 ) , \boldsymbol { p } ( 0,0,1 ) , \boldsymbol { p } ( 0,1,1 ) , \boldsymbol { p } ( 1,1,1 ) \} , \{ p ( 1,1,1 ) , \boldsymbol { p } ( 1,1,2 ) , \boldsymbol { p } ( 1,2,2 ) , \boldsymbol { p } ( 2,2,2 ) \}
$$

#### 06.3.1.1 导数

$$
\frac { \mathbb{d} } { \mathbb{d} t } F ( t ) = d f ( t , \ldots , t , \hat { 1 } ) = d ( f ( t , \ldots , t , 1 ) - f ( t , \ldots , t , 0 ) )
$$

![image-20191026203616107](assets/image-20191026203616107.jpg)

#### 06.3.1.2 细分

![image-20191026203655630](assets/image-20191026203655630.jpg)

#### 06.3.1.3 升阶

在 [06.2.9 升阶](#06.2.9 升阶) 介绍了升阶，对 Bezier 曲线 $\pmb{b}(t_1,\dots,t_d)$ 升阶得到
$$
\pmb{b} ^ { ( + 1 ) } \left( t _ { 1 } , \ldots , t _ { d + 1 } \right) = \frac { 1 } { d + 1 } \sum _ { i = 1 } ^ { d + 1 } \pmb{b} \left( t _ { 1 } , \ldots , t _ { i - 1 } , t _ { i + 1 } , \ldots , t _ { d + 1 } \right)
$$
升阶后的曲线 $\pmb{b}^{(+1)}$ 的 $d+2$ 个控制点 $\pmb{b}^{(+1)}_0,\dots,\pmb{b}^{(+1)}_{d+1}$ 为

- 当 $i=1,\dots,d$ 时
  $$
  \begin{aligned}
  \pmb{b}_i^{(+1)}
  &=\pmb{b}^{(+1)}(\underbrace{0,\dots,0}_{d+1-i},\underbrace{1,\dots,1}_i)\\
  &=\frac{i}{d+1}\pmb{b}(\underbrace{0,\dots,0}_{d+1-i},\underbrace{1,\dots,1}_{i-1}) + \left(1-\frac{i}{d+1}\right)\pmb{b}(\underbrace{0,\dots,0}_{d-i},\underbrace{1,\dots,1}_i)\\
  &=\frac{i}{d+1}\pmb{b}_{i-1} + \left(1-\frac{i}{d+1}\right)\pmb{b}_i\\
  \end{aligned}
  $$

- 其他
  $$
  \begin{aligned}
  \pmb{b}_0^{(+1)}&=\pmb{b}_0\\
  \pmb{b}_{d+1}^{(+1)}&=\pmb{b}_d\\
  \end{aligned}
  $$
  > 将 $\pmb{b}_{-1}$ 和 $\pmb{b}_{d+1}$ 视为 $\pmb{0}$ 的话可以并入上边的公式

多次升阶

> TODO ... 
>
> PPT 上是错误的

重复升阶可以收敛到 Bezier 曲线上

## 06.4 B 样条

### 06.4.1 极形式

分段多项式曲线的极形式是存在且唯一的

给定 $k$ 阶（$k-1$ 次）B 样条 $\pmb{x}$ 

- 结向量 $T=(t_0,\dots,t_{n+k})$ 
- de Boor 点 $\pmb{d}_0,\dots,\pmb{d}_n$ 

$\underline { \pmb{x} }(u_1,\dots,u_{k-1})$ 是 $\pmb{x}(t)$ 的极形式，则 de Boor 点可表示为
$$
\pmb{d}_i=\underline{\pmb{x}}(t_{i+1},\dots,t_{i+k-1})
$$

> 示例
>
> $k=4,n=5$ 
>
> ![image-20191026221904996](assets/image-20191026221904996.jpg)

有一个很重要的点，$\underline{\pmb{x}}$ 是用 $k$ 个点确定的，然而总共是 $n+1$ 个点，所以不是用一个 $\underline{\pmb{x}}$ 就能表示出整个 $\pmb{x}$，而是分段的表示。

每一段 $[t_i,t_{i+1})$ 就对应一条曲线，总共 $n-k+2$ 条 $k-1$ 次曲线，连接处 $C^{k-2}$ 连续。对应的控制点为 $\pmb{d}_{i-(k-1)},\dots,\pmb{d}_i$，由此可确定相应的 $\underline{\pmb{x}}$。

### 06.4.2 极形式下的 de Boor 算法

想要求 $\pmb{x}(t)$，确定出 $t$ 前后 $k-1$ 个结
$$
r_{k-1}\le\dots\le r_1\le t < s_1\le \dots \le s_{k-1}
$$
则中间节点为
$$
\pmb{x} _ { j } ^ { (l) } ( t ) = \underline { \pmb{x} } ( r _ { k-1-l-j } , \dots , r _ { 1 }, \underbrace{t , \ldots , t}_l , s _ { 1 } , \dots , s _ { j } )
$$
其中 $l=0,\dots,k-1$，$j=0,\dots,k-1-l$ 

最终曲线是
$$
\pmb{x}(t)=\pmb{x}_0^{(k-1)}(t)=\underline{\pmb{x}}(\underbrace{t,\dots,t}_{k-1})
$$

> 一段示例
>
> $k=4$ 
>
> ![image-20191026224855162](assets/image-20191026224855162.jpg)
>
> 插值示例
>
> ![image-20191026225014185](assets/image-20191026225014185.jpg)
>
> 一般示例
>
> ![image-20191026230412977](assets/image-20191026230412977.jpg)
>
> 连续曲线是最终求得的曲线，这是多段拼接起来的，每段曲线相关的控制点在同一虚线框内标出。

