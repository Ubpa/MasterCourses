# 02. Bezier Curves

## 2.1 曲线表示

隐式表达 $f(x,y)=0$ 的弊端

- 多个值对应同一个 x
- 未定义的导数 $\frac{\mathbf{d}y}{\mathbf{d}x}$ 
- 轴变换没有不变性

> 示例
>
> ![1570714620048](assets/1570714620048.jpg)

参数表示 $c(t)=(x(t),y(t))$ 

- 容易计算
- 参数 $t$ 能解释成时间
- 曲线能解释成移动例子的轨迹

## 2.2 De Casteljau 算法

### 2.2.1 算法描述

- 输入：$\pmb{b}_0,\pmb{b}_1,\dots,\pmb{b}_n \in \mathbb{R}^3$ 

- 输出：$\pmb{x}(t),t\in [0,1]$ 

- 几何构建 $\pmb{x}(t)$ 
  $$
  \begin{align}
  \pmb{b}_i^0(t)&=\pmb{b}_i,i=0,\dots,n\\
  \pmb{b}_i^r(t)&=(1-t)\pmb{b}_i^{r-1}(t)+t\pmb{b}_{i+1}^{r-1}(t), r=1,\dots,n,i=0,\dots,n-r\\
  \end{align}
  $$
- $\pmb{x}(t)=\pmb{b}_0^n(t)$ 

> 示例
>
> ![1570716274452](assets/1570716274452.jpg)

伪代码为

![1570716331031](assets/1570716331031.jpg)

### 2.2.2 性质

- 由 $\pmb{b}_0,\dots,\pmb{b}_n$ 构成的多边形称为 Bezier 多边形（控制多边形 control polygon）
- $\pmb{b}_i$ 是 Bezier 点（控制点 control point）
- 由 $\pmb{b}_0,\dots,\pmb{b}_n$ 和 De Casteljau 算法得到的曲线称为 Bezier 曲线
- De Casteljau 算法数值稳定（简单的凸组合 / 线性插值）
- 时间 $O(n^2)$，空间 $O(n)$ 
- $\pmb{x}(0)=\pmb{b}_0,\pmb{x}(1)=\pmb{b}_n$，其他点只逼近
- 凸包性：Bezier 曲线在 Bezier 多边形内部
- Variation diminishing：直线与 Bezier 曲线的交点数少于 Bezier 多边形
- Bezier 点的影响力：全局，伪局部
- 仿射不变性：仿射变化后 Bezier 曲线和 Bezier 多边形不变
- 对称性：$x(t)=[\pmb{b}_0,\dots,\pmb{b}_n]$ 与 $\pmb{x}'(t)=[\pmb{b}_n,\dots,\pmb{b}_0]$ 
- 线性精度：Bezier 曲线是线段 $\Leftrightarrow$ $\pmb{b_0},\dots,\pmb{b_n}$ 共线

## 2.3 解析式

$$
\begin{align}
\pmb{x}(t)&=\sum_{i=0}^n B_i^n(t)\pmb{b}_i\\
&=\sum_{i=0}^n C_n^ix^i(1-x)^{n-i}\pmb{b}_i\\
\end{align}
$$

其中 Bernstein 基是 $B_i^n(t)$ 

> 示例
>
> ![1570781724407](assets/1570781724407.jpg)

### 2.3.1 Bernstein 基的性质

- 递归计算：$B_i^n(t)=(1-t)B_i^{n-1}(t)+tB_{i-1}^{n-1}(t),B_0^0=1$ 
- 对称性：$B_i^n(t)=B_{n-i}^n(1-t)$ 
- 非负
  - $B_i^n(t)\ge 0,t\in[0,1]$ 
  - $B^n_i(t)>0,0<t<1$ 
  - $B_0^n(0)=1,B_1^n(0)=\dots=B_n^n(0)=0$ 
  - $B_0^n(0)=\dots=B_{n-1}^n(0)=0,B_0^n(0)=1$ 
- 导数：$\frac{\mathbb{d}}{\mathbb{d}t}B_i^n(t)=n[B_{i-1}^{n-1}(t)-B_i^{n-1}(t)]$ 

### 2.3.2 Bezier 曲线的性质

$$
\pmb{x}(t)=\sum_{i=0}^n B_i^n(t)\pmb{p}_i\\
$$

- 导数
  $$
  \pmb{x}'(t)=n\sum_{i=0}^{n-1} B_i^{n-1}(t)(\pmb{p}_{i+1}-\pmb{p}_i)\\
  
  \pmb{x}'(0)=n(\pmb{p}_1-\pmb{p}_0)\\
\pmb{x}'(1)=n(\pmb{p}_n-\pmb{p}_{n-1})\\
  
  \pmb{x}^{(r)}(t)=\prod_{i=0}^{r-1}(n-i)\sum_{i=0}^{n-r} B_i^{n-r}(t)\Delta^r\pmb{p}_i\\
  $$
  > 一阶差分 $\Delta \pmb{p}_i = \pmb{p}_{i+1}-\pmb{p}_i$ 
  >
  > 高阶差分 $\Delta^r \pmb{p}_i=\Delta(\Delta^{r-1}   \pmb{p}_i)=\Delta^{r-1} \pmb{p}_{i+1}-\Delta^{r-1} \pmb{p}_i$ 
  >
  > 如二阶差分 $\Delta^2 \pmb{p}_i=\Delta\pmb{p}_{i+1}-  \Delta\pmb{p}_i=\pmb{p}_{i+1}-2\pmb{p}_{i+1}+\pmb{p}_i$ 
  >
  > 貌似可以展开为 $\Delta^r\pmb{p}_i=\sum_{k=0}^{r}  (-1)^kC_r^k\pmb{p}_{i+r-k}$ 
  
- 端点：$\pmb{x}(0)=\pmb{p}_0,\pmb{x}(1)=\pmb{p}_n$ 

### 2.3.3 升阶 degree elevation

给定 $\pmb{p}_0,\dots,\pmb{p}_n$ 可得 $\pmb{x}(t)$，想生成 $n+2$ 个点来得到曲线 $\bar{\pmb{x}}(t)$，满足 $\bar{\pmb{x}}(t)=\pmb{x}(t)$ 

方法
$$
\bar{\pmb{p}}_0=\pmb{p}_0\\
\bar{\pmb{p}}_{n+1}=\pmb{p}_n\\
\bar{\pmb{p}}_{i}=\frac{i}{n+1}\pmb{p}_{i-1}+\left(1-\frac{i}{n+1}\right)\pmb{p}_i,i=1,\dots,n\\
$$

> 示例
>
> ![1570786423038](assets/1570786423038.jpg)

### 2.3.4 划分 subdivision

给定 $\pmb{b}_0,\pmb{b}_n\to \pmb{x}(t),t\in [0,1]$，想要两条曲线

- $\pmb{b}_0^{[1]},\dots,\pmb{b}_n^{[1]}\to \pmb{x}^{[1]}(t)$ 
- $\pmb{b}_0^{[2]},\dots,\pmb{b}_n^{[2]}\to \pmb{x}^{[2]}(t)$ 

两条曲线合并可得到 $\pmb{x}=\pmb{x}^{[1]}\cup \pmb{x}^{[2]}$ 

结果 $\pmb{b}^{[1]}_i = \pmb{b}_0^{(i)},\pmb{b}_i^{[2]}=\pmb{b}^{(n-i)}_i(i=0,\dots,n)$  

![1571038016040](assets/1571038016040.jpg)

### 2.3.5 曲线范围 curve range

![1571038696436](assets/1571038696436.jpg)

## 2.4 矩阵表示

三次 Bezier 曲线 $P(t) = V_0B_{0,3}+V_1B_{1,3}+V_2B_{2,3}+V_3B_{3,3}$ 
$$
\begin{aligned}
B_{0,3}&=(1-t)^3\\
B_{1,3}&=3t(1-t)^2\\
B_{2,3}&=3t^2(1-t)\\
B_{3,3}&=t^3\\
\end{aligned}
$$

可写成矩阵形式
$$
P(t)=
\left[\begin{matrix}
t^3 & t^2 & t & 1
\end{matrix}\right]
\left(\begin{matrix}
-1 &  3 & -3 &  1\\
 3 & -6 &  3 &  0\\
-3 &  3 &  0 &  0\\
 1 &  0 &  0 &  0
\end{matrix}\right)
\left[\begin{matrix}
V0\\
V1\\
V2\\
V3\\
\end{matrix}\right]
$$
切向量
$$
P^\prime(t)=
\left[\begin{matrix}
3t^2 & 2t & 1 & 0
\end{matrix}\right]
\left(\begin{matrix}
-1 &  3 & -3 &  1\\
 3 & -6 &  3 &  0\\
-3 &  3 &  0 &  0\\
 1 &  0 &  0 &  0
\end{matrix}\right)
\left[\begin{matrix}
V0\\
V1\\
V2\\
V3\\
\end{matrix}\right]
$$
