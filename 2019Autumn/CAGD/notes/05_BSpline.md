# 05. B-Splines

> “B”指的是 Basis，不是 Bezier

## 5.1 De Boor Recursion：uniform case

两 $C^{-1}$ 连续基函数混合一下得到 $C^0$ 连续函数

![1571310596659](assets/1571310596659.jpg)

然后将混合的函数偏移后再混合一次得到 $C^1$ 连续函数

![1571310682893](assets/1571310682893.jpg)

不断进行

![1571310758244](assets/1571310758244.jpg)

这样 k 阶均匀 B-spline 基函数如下
$$
\begin{aligned}
N_i^1(t)&=\left\{\begin{matrix}
1,&\text{if}\quad 1\le t < i+1 \\
0,&\text{otherwise}\\
\end{matrix}\right.\\
N_i^k(t)
&=\frac{t-i}{(i+k-1)-i}N_i^{k-1}(t)+\frac{(i+k)-t}{(i+k)-(i+1)}N_{i+1}^{k-1}(t)\\
&=\frac{t-i}{k-1}N_i^{k-1}(t)+\frac{i+k-t}{k-1}N_{i+1}^{k-1}(t)
\end{aligned}
$$

> $N_i^k$ 是第 $k$ 阶均匀 B-Spiline 基函数，性质如下
>
> - $N_i^k(t)>0,i < t < i+k$ 
> - $N_i^k(t)=0,t\in(-\infty,i]\cup[i+k,+\infty)$ 
> - $N_i^k(t)$  是 $C^{k-2}$ 阶连续
> - $N_i^k(t)$ 由分段多项式函数组成，次数是 $k-1$ 

## 5.2 泛化情况

给定结序列 $t_0,t_1,\dots,t_{n+k}$，满足 $t_0<t_1<\dots<t_{n+k}$ （$(t_0,t_1,\dots,t_{n+k})$ 称为结向量）。
$$
\begin{aligned}
N_{i,1}(t) &= \left\{\begin{matrix}
1, &t_i \le t < t_{i+1} \\
0, &\text{otherwise} \\
\end{matrix}\right. \\
N_{i,k}(t) &= \frac{t-t_i}{t_{i+k-1}-t_i}N_{i,k-1}(t)+\frac{t_{i+k}-t}{t_{i+k}-t_{i+1}}N_{i+1,k-1}(t)
\end{aligned}
$$

> $N_{i,k}$ 性质
>
> - $i=0,1,\dots,n$，$k\in \mathbb{Z}^+$ 
>
> - $N_{i,k}(t)>0,t_i<t<t_{i+k}$，其中涉及了 $t_i,t_{i+1},\dots,t_{i+k}$，共 k+1 个，中间有 **k 段**，$[t_i,t_{i+k}]$ 称为 $N_{i,k}$ 的**支撑区间** support interval
>
> - $N_{i,k}(t)=0,t\in(-\infty,t_i]\cup[t_{i+k},\infty)$ 
>
> - $N_{i,k}(t)$ 在 $[t_i,t_{i+k}]$ 上 $C^{k-2}$ 阶连续
>
> - $N_{i,k}(t)$ 由分段多项式函数组成，次数是 $k-1$ 
>
> - 放宽条件 $t_0\le t_1\le \dots \le t_{n+k}$，可以连续重复多次，重复 m 次，则阶数下降 m 次，当重复 k 次及以上时，函数值视为 0，此时 $t_i=t_{i+1}=\dots=t_{i+k},N_{i,k}(t)=0$。重复 m 次，则在 $[t_i,t_{i+k}]$ 上 $C^{k-2-m}$ 连续。
>
>   > 重复 1 次是指 $t_i=t_{i+1}$，重复 m 次是指 $t_i=t_{i+1}=\dots=t_{i+m}$。
>
> - $\sum_{i=0}^n N_{i,k}(t)=1,t \in [t_{k-1},t_{n+1}]$ 
>
>   > 每一段内会受到 k 个基函数的影响

## 5.3 B-spline 曲线

给定

- 控制点：$\pmb{d}_0,\dots,\pmb{d}_n\in \mathbb{R}^3$，$n+1$ 个
- 结向量：$T=(t_0,\dots,t_n,\dots,t_{n+k})$，$n+k+1$ 个，比控制点多 k 个

> 因为 $N_{n,k}$ 需要 $t_n,t_{n+1},\dots,t_{n+k}$ 

则 k 阶的 B-spline 曲线 $\pmb{x}(t)$ 定义为
$$
\pmb{x}(t)=\sum_{i=0}^n N_{i,k}(t)\pmb{d}_i
$$
$\pmb{d}_i$ 称为 de Boor points

> 这种定义并不能插值 $\pmb{d}_i$ 
>
> **示例** 
>
> ![1571318743885](assets/1571318743885.jpg)
>
> 这里只展示了 $t_3\le t \le t_6$ 的部分曲线，这段比较关键，因为 $\sum_{i=0}^n N_{i,k}(t)=1,t \in [t_{k-1},t_{n+1}]$。

结可以重复多次，当重复 k 次及以上时，函数值视为 0，没有贡献。

当 $t_0=t_1=\dots=t_{k-1}$ 且 $t_{n+1}=t_{n+2}=\dots=t_{n+k}$ 时，相应的 B-spline 曲线 $\pmb{x}(t)$ 的性质

- $t\in[t_{k-1},t_{n+1}]$，总共 $n-k+2$ 段
- $\pmb{x}(t_{k-1})=\pmb{d}_0$，$\pmb{x}(t_{n+1})=\pmb{d}_n$ 
- $\dot{\pmb{x}}(t_0)=\frac{k-1}{t_k-t_{k-1}}(\pmb{d}_1-\pmb{d}_0)$ 
- 含 **n-k+2 段**多项式 **k-1 阶**的曲线，$C^{k-2}$ 连续
- 重复 m 次，则 $C^{k-m-2}$ 连续
- 移动 $\pmb{d}_i$ 只影响 $[t_i,t_{i+k}]$ 

> 示例
>
> ![1571318988415](assets/1571318988415.jpg)
>
> 通过重复结，舍去了不必要的区间

$T=(t_0,\dots,t_{2k-1})=( \underbrace{0,\dots,0}_k, \underbrace{1,\dots,1}_k)$ 对应的 $N_{i,k}(i=0,\dots,k-1)$ 是 Bernstein 基 $B_i^{k-1}$。

计算 B-spline 曲线的方法

- 使用  B-spline 函数

- de Boor 算法（类似 de Casteljau 算法）

  给定 de Boor points $\pmb{d}_0,\dots,\pmb{d}_n$ 和结序列 $t_0=\dots=t_{k-1}<t_k<\dots<t_n<t_{n+1}=\dots=t_{n+k}$ 

  想要 $\pmb{x}(t)$ 

  ![1571320573794](assets/1571320573794.jpg)

## 5.4 插值

给定

- 控制点：$\pmb{k}_0,\dots,\pmb{k}_n$，$n+1$ 个
- 结序列：$s_0,\dots,s_n$，$n+1$ 个

想要分段三次插值 B-spline 曲线 $\pmb{x}$ 满足插值条件
$$
\pmb{x}(s_i)=\pmb{k}_i \quad i=0,\dots,n
$$
方法

- $k = 4$ 

- 重复首尾结 $k-1=3$ 次，则总共 $n+2k-1=n+7$ 个结，对应 $n+7-k=n+3$ 个 de Boor points，结向量为
  $$
  \begin{array}{c}
  T=&(t_0,&t_1,&t_2,&t_3,&t_4,&\dots,&t_{n+2},&t_{n+3},&t_{n+4},&t_{n+5},&t_{n+6}&)\\
  &(s_0,&s_0,&s_0,&s_0,&s_1,&\dots,&s_{n-1},&s_n,    &s_n,    &s_n,    &s_n    &)
  \end{array}
  $$
  
- 插值条件
  $$
  \begin{aligned}
  \pmb{x} \left( s _ { 0 } \right) & =  \pmb{k} _ { 0 } = \pmb{d} _ { 0 } \\
  \pmb{x} \left( s _ { i } \right) & = \pmb{k} _ { i } = N _ { i , 4 } \left( s _ { i } \right) \pmb{d} _ { i } + N _ { i + 1,4 } \left( s _ { i } \right) \pmb{d} _ { i + 1 } + N _ { i + 2,4 } \left( s _ { i } \right) \pmb{d} _ { i + 2 } \\
  \pmb{x} \left( s _ { n } \right) & = \pmb{k} _ { n } = \pmb{d} _ { n + 2 } \end{aligned}
  $$

  > 由于 $N_{i,4}$ 影响的范围是 $[t_i,t_{i+4}]$，而 $s_i=t_{i+3}$，所以会被 $N_{i,4},N_{i+1,4},N_{i+2,4},N_{i+3,4}$ 影响，因此 $\pmb{x}(s_i)$ 只涉及了相应的四项。

  总共 $n+1$ 个条件，但有 $n+3$ 个 de Boor pionts，还缺 2 个

- 自然边界条件
  $$
  \begin{aligned}
  \ddot { \pmb{x} } \left( s _ { 0 } \right) = 0 & \Leftrightarrow \frac { d _ { 2 } - d _ { 1 } } { s _ { 2 } - s _ { 0 } } = \frac { d _ { 1 } - d _ { 0 } } { s _ { 1 } - s _ { 0 } } \\
  \ddot { \pmb{x} } \left( s _ { n } \right) = 0 & \Leftrightarrow \frac { d _ { n + 2 } - d _ { n + 1 } } { s _ { n } - s _ { n - 1 } } = \frac { d _ { n + 1 } - d _ { n } } { s _ { n } - s _ { n - 2 } }
  \end{aligned}
  $$

这样得到一个三对角系统
$$
\left[\begin{matrix}
1\\
\alpha_0 & \beta_0 & \gamma_0\\
 & \alpha_1 & \beta_1 & \gamma_1\\
 & & & \cdot\\
 & & & & \cdot\\
 & & & & & \cdot\\
 & & & &\alpha_{n-1} & \beta_{n-1} & \gamma_{n-1}\\
 & & & & & \alpha_{n} & \beta_{n} & \gamma_{n}\\
 & & & & & & & 1\\
\end{matrix}\right]

\left[\begin{matrix}
\pmb{d}_0\\
\pmb{d}_1\\
\pmb{d}_2\\
\cdot\\
\cdot\\
\cdot\\
\pmb{d}_n\\
\pmb{d}_{n+1}\\
\pmb{d}_{n+2}
\end{matrix}\right]

=

\left[\begin{matrix}
\pmb{k}_0\\
0\\
\pmb{k}_1\\
\cdot\\
\cdot\\
\cdot\\
\pmb{k}_{n-1}\\
0\\
\pmb{k}_n\\
\end{matrix}\right]
$$
其中
$$
\begin{aligned} \alpha _ { 0 } & = s _ { 2 } - s _ { 0 } \\ \beta _ { 0 } & = - \left( s _ { 2 } - s _ { 0 } \right) - \left( s _ { 1 } - s _ { 0 } \right) \\ \gamma _ { 0 } & = s _ { 1 } - s _ { 0 } \\\\
\alpha _ { n } & = s _ { n } - s _ { n - 1 } \\ \beta _ { n } & = - \left( s _ { n } - s _ { n - 1 } \right) - \left( s _ { n } - s _ { n - 2 } \right) \\ \gamma _ { n } & = s _ { n } - s _ { n - 2 } \\\\
\alpha _ { i } & = N_{i,4}(s_i) \\ \beta _ { i } & = N _ { i + 1,4 } \left( s _ { i } \right) \\ \gamma _ { i } & = N _ { i + 2,4 } \left( s _ { i } \right) \\ & \text { for } i = 1 , \ldots , n - 1 \end{aligned}
$$
使用 Thomas 算法，时间复杂度 $O(n)$ 

> $$
> \left[ \begin{array} { c c c c c } { b _ { 1 } } & { c _ { 1 } } & { } & { } & { 0 } \\ { a _ { 2 } } & { b _ { 2 } } & { c _ { 2 } } & { } & { } \\ { } & { a _ { 3 } } & { b _ { 3 } } & { . } & { } \\ { } & { } & { . } & { . } & { c _ { n - 1 } } \\ { 0 } & { } & { } & { a _ { n } } & { b _ { n } } \end{array} \right] \left[ \begin{array} { c } { x _ { 1 } } \\ { x _ { 2 } } \\ { . } \\ { . } \\ { x _ { n } } \end{array} \right] = \left[ \begin{array} { c } { d _ { 1 } } \\ { d _ { 2 } } \\ { . } \\ { . } \\ { d _ { n } } \end{array} \right]
> $$
>
> 前向消除步骤
>
> ![1571323775348](assets/1571323775348.jpg)
>
> 后向替换步骤
>
> ![1571323794125](assets/1571323794125.jpg)

## 5.5 Bezier 曲线转 B-splines

给定

- 控制点：$\pmb{k}_0,\dots,\pmb{k}_n$ 
- 结序列：$t_0,\dots,t_n$ 
- 2 个端点条件
- $C^2$ 连续、插值条件

从而得到 $\pmb{b}_0,\dots,\pmb{b}_{3n}$ 

现想得到相同曲线的 B-spline 形式

- 结向量 $T=(t_0,t_0,t_0,t_0,t_1,\dots,t_{n-1},t_n,t_n,t_n,t_n)$ 

  > 总共 $n+7$ 个顶点，则有 $n+3$ 个 de Boor pionts，即 $\pmb{d}_0,\dots,\pmb{d}_{n+2}$ 

- $\pmb{d}_0,\dots,\pmb{d}_{n+2}$ 满足
  $$
  \begin{aligned} \pmb{d} _ { 0 } & = \pmb{b} _ { 0 } \\ \pmb{d} _ { 1 } & = \pmb{b} _ { 1 } \\ \pmb{d} _ { i } & = \pmb{b} _ { 3 i - 4 } + \frac { \Delta _ { i - 1 } } { \Delta _ { i - 2 } } \left( \pmb{b} _ { 3 i - 4 } - \pmb{b} _ { 3 i - 5 } \right) \text { for } i = 2 , \ldots , n \\ \pmb{d} _ { n + 1 } & = \pmb{b} _ { 3 n - 1 } \\ \pmb{d} _ { n + 2 } & = \pmb{b} _ { 3 n } \end{aligned}
  $$
  其中 $\Delta_i= t_{i+1}-t_i,t=0,\dots,n-1$ 

> 示例
>
> ![1571324448351](assets/1571324448351.jpg)

