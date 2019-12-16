# 1. 拟合

## 1.1 插值

### 1.1.1 问题一般形式

$B=\{b_i\}_{i=1}^n$，$f(x)=\sum_{i=1}^nc_ib_i(x)\in B$，有
$$
y_i=f(x_i)=\sum_{j=1}^nc_jb_j(x_i) \quad (j=1,\dots,n)
$$
设 $M=(b_j(x_i))_{i,j=1}^n$，$\pmb{y}=(y_i)_{i=1}^n$，$\pmb{c}=(c_i)_{i=1}^n$，则上式变为
$$
M\pmb{c}=\pmb{y}
$$
则 $c=M^{-1}y$ 

### 1.1.2 多项式插值

$B=\{x^{j-1}\}_{j=1}^n$，则
$$
M=\left[\begin{matrix}
1 & x_1 &\dots &x_1^{n-1}\\
1 & x_2 &\dots &x_2^{n-1}\\
\vdots & \vdots &\vdots &\vdots\\
1 & x_n &\dots &x_n^{n-1}\\
\end{matrix}\right]
$$

### 1.1.3 拉格朗日插值

$$
f(x)=\sum_{i=1}^ny_il_i(x)
$$

其中
$$
l_i(x)=\frac{\prod_{j\neq i}(x-x_j)}{\prod_{j\neq i}(x_i-x_j)}
$$

## 1.2 逼近

### 1.2.1 Bernstein 多项式

$$
B_n(f,x)=\sum_{i=0}^nf(x_i)B^n_i(x)
$$

其中 $B^n_i(x)=\mathrm{C}_n^ix^i(1-x)^{n-i}$，$x_i=\frac{i}{n}\ (i=0,\dots,n)$ 

误差估计
$$
|f(x)-B_n(f,x)|<\frac{9}{4}m_{f,n}
$$
其中 $m_{f,n}=\min_\limits{|x_i-x_j|<1/\sqrt{n},\ i\neq j} |f(x_i)-f(x_j)|$ 

### 1.2.2 最小二乘逼近

函数空间 $B=\{b_i\}_{i=1}^n$，样本点 $\{(x_i,y_i)\}_{i=1}^m$，目标函数 $f(x)=\sum_{i=1}^nc_ib_i(x)$，设 $M=(b_j(x_i))_{i,j=1}^{m,n}$，$\pmb{y}=(y_i)_{i=1}^m$，$\pmb{c}=(c_i)_{i=1}^n$，则
$$
\pmb{c}=(M^\top M)^{-1}M^\top \pmb{y}
$$

# 2. Bezier 曲线

## 2.1 Bernstein 基

$$
B^n_i(t)=\mathrm{C}_n^i x^i(1-x)^{n-i}
$$

> **示例** 
>
> ![1570781724407](assets/1570781724407.jpg)
>
> - 规范：$\sum_{i=0}^n B^n_i(t)=1$ 
> - 对称性：$B_i^n(t)=B_{n-i}^n(1-t)$ 
> - 非负
>   - $B_i^n(t)\ge 0,t\in[0,1]$ 
>   - $B^n_i(t)>0,0<t<1$ 
>   - $B_0^n(0)=1,B_1^n(0)=\dots=B_n^n(0)=0$ 
>   - $B_0^n(0)=\dots=B_{n-1}^n(0)=0,B_0^n(0)=1$ 

- 递推：$B_i^n(t)=(1-t)B_i^{n-1}(t)+tB_{i-1}^{n-1}(t)$，设 $B_0^0=1$，$B^n_i(t)=0$（$i<0$ 或 $i>n$）
- 导数：$\frac{\mathbb{d}}{\mathbb{d}t}B_i^n(t)=n[B_{i-1}^{n-1}(t)-B_i^{n-1}(t)]$ 
- 最值点：$B^n_i(t)$ 在 $t=\frac{i}{n}$ 处取最大值
- 升阶：$(1-t)B^n_i(t)=\left(1-\frac{i}{n+1}\right)B^{n+1}_i(t)$，$tB^n_i(t)=\frac{i+1}{n+1}B^{n+1}_{i+1}(t)$ 

> **运算框架** 
>
> ![image-20191215232028823](assets/image-20191215232028823.png)

## 2.2 Bezier 曲线

$$
\pmb{x}(t)=\sum_{i=0}^n B_i^n(t)\pmb{p}_i\\
$$

导数
$$
\pmb{x}^{(r)}(t)=c_r\sum_{i=0}^{n-r}B^{n-r}_i(t)\Delta^r\pmb{p}_i
$$
其中 $\Delta^r p_i = \sum_{j=0}^r\mathrm{C}_r^j(-1)^j\pmb{p}_{i+r-j}$，$c_r=\prod_\limits{i=1}^r(n-i+1)$ 

端点
$$
\begin{aligned}
\pmb{x}^{(r)}(0)&=\prod_{i=1}^r(n-i+1)\Delta^r\pmb{p}_0\\
\pmb{x}^{(r)}(1)&=\prod_{i=1}^r(n-i+1)\Delta^r\pmb{p}_{n-r}\\
\end{aligned}
$$

> **示例** 
> $$
> \begin{aligned}
> \pmb{x}^\prime(t)&=n\sum_{i=0}^{n-1}B^{n-1}_i(t)\left(\pmb{p}_{i+1}-\pmb{p}_i\right)\\
> \pmb{x}^{(2)}(t)&=n(n-1)\sum_{i=0}^{n-2}B^{n-2}_i(t)\left(\pmb{p}_{i+2}-2\pmb{p}_{i+1}+\pmb{p}_i\right)\\
> \pmb{x}^{(3)}(t)&=n(n-1)(n-2)\sum_{i=0}^{n-3}B^{n-3}_i(t)\left(\pmb{p}_{i+3}-3\pmb{p}_{i+2}+3\pmb{p}_{i+1}-\pmb{p}_i\right)\\
> \pmb{x}^\prime(0)&=n\left(\pmb{p}_{1}-\pmb{p}_0\right)\\
> \pmb{x}^\prime(1)&=n\left(\pmb{p}_{n}-\pmb{p}_{n-1}\right)\\
> \end{aligned}
> $$

## 2.3 曲线性质

### 2.3.1 光滑性

$b_i(t)$ 光滑

### 2.3.2 伪局部性

$b_i(t)$ 有局部支撑

对于 Bezier 曲线，$\pmb{b}_i$ 影响最大处位于 $t=\frac{i}{n}$ 

### 2.3.3 仿射无关性

仿射变换 $f(x)=Ax+b$，曲线 $\pmb{x}(t)=\sum_{i=0}^nb_i(t)\pmb{p}_i$ 

仿射不变性：$f(\pmb{x}(t))=\sum_{i=0}^nb_i(t)f(\pmb{p}_i)$，化简可得 $\sum_{i=0}^nb_i(t)=1$ 

### 2.3.4 凸包性

$\{\pmb{p}_i\}_{i=1}^n$ 的凸组合 $\sum_{i=1}^n\lambda_i\pmb{p}_i$，其中 $0\le \lambda_i\le 1$，且 $\sum_{i=1}^n\lambda_i=1$ 

$\pmb{x}(t)=\sum_{i=0}^nb_i(t)\pmb{p}_i$ 是凸组合 $\Leftrightarrow$ $\sum_{i=0}^nb_i(t)=1,0\le b_i(t)\le 1$ 

### 2.3.5 变差缩减性

若 Bezier 曲线的特征多边形 $P_0P_1\dots P_n$ 是一个平面图形，则平面内任意直线与 $P(t)$ 的交点个数不多于该直线与其特征多边形的交点个数，这一性质叫**变差缩减性质**。此性质反映了 Bezier 曲线比其特征多边形的波动小，也就是说 Bezier 曲线比特征多边形的折线更光顺

## 2.4 De Casteljau 算法

输入：$\{\pmb{b}_i\}_{i=0}^n$ 

输出：$\pmb{x}(t),t\in [0,1]$ 

算法：
$$
\begin{array}{ll}
\pmb{b}^0_i(t)=\pmb{b}_i\quad &i=0,\dots,n\\
\pmb{b}^r_i(t)=(1-t)\pmb{b}^{r-1}_i(t)+t\pmb{b}^{r-1}_{i+1}(t) &r=1,\dots,n;i=0,\dots,n-r
\end{array}
$$
则 $\pmb{b}^n_0(t)$ 就是 $\pmb{x}(t)$ 

> **运算框架** 
>
> ![image-20191216020438929](assets/image-20191216020438929.png)

## 2.5 升阶

输入：$\{\pmb{b}_i\}_{i=0}^n$，相应 Bezier 曲线 $\pmb{x}(t)$ 

输出：$\{\overline{\pmb{b}}_i\}_{i=0}^{n+1}$，相应 Bezier 曲线 $\overline{\pmb{x}}(t)$，满足 $\overline{\pmb{x}}(t)=\pmb{x}(t)$ 

算法：
$$
\bar{\pmb{p}}_{i}=\frac{i}{n+1}\pmb{p}_{i-1}+\left(1-\frac{i}{n+1}\right)\pmb{p}_i\\
$$
$\pmb{p}_{-1},\pmb{p}_{n+1}$ 任意

## 2.6 细分

输入：$\{\pmb{b}_i\}_{i=0}^n$，相应 Bezier 曲线 $\pmb{x}(t)$ 

输出：

- $\pmb{b}_0^{[1]},\dots,\pmb{b}_n^{[1]}\to \pmb{x}^{[1]}(t)$ 
- $\pmb{b}_0^{[2]},\dots,\pmb{b}_n^{[2]}\to \pmb{x}^{[2]}(t)$ 

两条曲线合并可得到 $\pmb{x}=\pmb{x}^{[1]}\cup \pmb{x}^{[2]}$ 

算法：

用 De Casteljau 算法得到
$$
\begin{matrix}
b^n_0\\
b^{n-1}_0&b^{n-1}_1\\
\dots\\
b^0_0&b^0_1&\dots&b^0_n
\end{matrix}
$$


则 $\pmb{b}^{[1]}_i = \pmb{b}_0^{i},\pmb{b}_i^{[2]}=\pmb{b}^{n-i}_i(i=0,\dots,n)$ 

## 2.7 矩阵表示

三次 Bezier 曲线 $\pmb{x}(t) = \sum_{i=0}^3B^n_i(t)\pmb{p}_i$ 
$$
\begin{aligned}
B^3_0(t)&=(1-t)^3\\
B^3_1(t)&=3t(1-t)^2\\
B^3_2(t)&=3t^2(1-t)\\
B^3_3(t)&=t^3\\
\end{aligned}
$$

可写成矩阵形式
$$
\pmb{x}(t)=
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
\pmb{p}_0\\
\pmb{p}_1\\
\pmb{p}_2\\
\pmb{p}_3\\
\end{matrix}\right]
$$
切向量
$$
\pmb{x}^\prime(t)=
\left[\begin{matrix}3t^2 & 2t & 1 & 0\end{matrix}\right]
\left(\begin{matrix}
-1 &  3 & -3 &  1\\
3 & -6 &  3 &  0\\
-3 &  3 &  0 &  0\\
1 &  0 &  0 &  0
\end{matrix}\right)
\left[\begin{matrix}\pmb{p}_0\\\pmb{p}_1\\\pmb{p}_2\\\pmb{p}_3\\\end{matrix}\right]
$$

# 3. 曲线微分几何

## 3.1 参数曲线

曲线 $c(t)$，速度向量 $c^\prime(t)$，速度 $|c^\prime(t)|$ 

正则：$c^\prime(t)\neq 0$ 

切向量：$\pmb{t}=\frac{c^\prime}{\|c^\prime\|}$ ![1569480907474](assets/1569480907474.jpg)

法平面 N 过 $c$ 且垂直于 $c'$ ![1569481208928](assets/1569481208928.jpg)

副法向 $\pmb{b}=\frac{c'\times c''}{\|c'\times c''\|}$，密切平面 T 过 $c$ 且垂直于副法向 $\pmb{b}$ ![1569481598504](assets/1569481598504.jpg)

主法向 $\pmb{n}=\pmb{b}\times\pmb{t}$，从切平面 R 垂直于主法向 $\pmb{n}$ ![1569482371745](assets/1569482371745.jpg)

曲率 $\kappa(t)=\frac{\|c'(t)\times c''(t)\|}{\|c'(t)\|^3}$ 

平面正则曲线曲率 $\kappa ( t ) = \frac { \left| x ^ { \prime } y ^ { \prime \prime } - x ^ { \prime \prime } y ^ { \prime } \right| } { \left( x ^ { \prime 2 } + y ^ { \prime 2 } \right) ^ { \frac { 3 } { 2 } } }$，带符号曲率 $\kappa ( t ) = \frac { x ^ { \prime } y ^ { \prime \prime } - x ^ { \prime \prime } y ^ { \prime } } { \left( x ^ { \prime 2 } + y ^ { \prime 2 } \right) ^ { \frac { 3 } { 2 } } }$ 

扰率 $\tau(t)=\frac{(c'\times c'')\cdot c'''}{\|c'\times c''\|^2}$ 

## 3.2 弧长参数化曲线

> $f(t)$，$\dot{f}=\frac{\mathrm{d}f}{\mathrm{d}t}$ 
>
> $f^\prime=\frac{\mathrm{d}f}{\mathrm{d}s}$ 

从 $0$ 到 $t$ 的弧长 $s(t)=\int_0^t\|\dot{c}(\tau)\|\mathbb{d}\tau$，则 $\dot{s}=\|\dot{c}\|>0$ 

弧长参数化曲线 $c(s)$ 有
$$
\left\|c^\prime\right\|
=\left\|\frac{\mathbb{d} c}{\mathbb{d}s}\right\|
=\left\|\frac{\mathbb{d} c/\mathbb{d} t}{\mathbb{d} s/\mathbb{d} t}\right\|
=\left\|\frac{\dot{c}}{\dot{s}}\right\|=1
$$
$\|c^\prime\|=1,c^\prime\perp c^{\prime\prime}$ 

主法向
$$
\pmb{n}=\frac{c''}{\|c''\|}
$$
曲率
$$
\kappa=\|c^{\prime\prime}\|
$$

## 3.3 Frenet 曲线

Frenet 曲线 $c(s)$ 是一种弧长参数化曲线，要求 $c^\prime,\dots,c^{(n)}$ 线性无关

Frenet 坐标系基向量 $\{e_i\}_{i=1}^n$ 可对 $\{c^{(i)}\}_{i=1}^n$ 正交化得到

对于弧长参数化平面曲线
$$
e_1(s)=c^\prime(s)\\
e_2(s)=R^{90^\circ}e_1(s)=\frac{c^{\prime\prime}(s)}{\|c^{\prime\prime}(s)\|}\\
$$
坐标系方程
$$
\left( \begin{array} { l } { e _ { 1 } ( s ) } \\ { e _ { 2 } ( s ) } \end{array} \right) ^ { \prime } = \left( \begin{array} { c c } { 0 } & { \kappa ( s ) } \\ { - \kappa ( s ) } & { 0 } \end{array} \right) \left( \begin{array} { l } { e _ { 1 } ( s ) } \\ { e _ { 2 } ( s ) } \end{array} \right)\\
$$
其中有符号曲率 $\kappa ( s ) = \left\langle e _ { 1 } ^ { \prime } ( s ) , e _ { 2 } ( s ) \right\rangle$ 

密切圆半径 $\frac{1}{\kappa(s)}$，圆心 $c(s)+\frac{1}{\kappa(s)}e_2(s)$ 

弧长函数的导数
$$
\frac{\mathrm{d}f}{\mathrm{d}s}=\frac{\mathrm{d}f/\mathrm{d}t}{\mathrm{d}s/\mathrm{d}t}=\frac{\dot{f}}{\|\dot{c}\|}
$$
则一般参数化平面曲线的 Frenet 坐标系
$$
e_1(s(t))=c^\prime(s(t))=\frac{\dot{c}(t)}{\|\dot{c}(t)\|}\\
e_2(s(t))=R^{90^\circ}e_1(s(t))\\
\kappa ( s(t) ) = \left\langle e _ { 1 } ^ { \prime } ( s(t) ) , e _ { 2 } ( s(t) ) \right\rangle=\frac{\left\langle \ddot{c}(t),R^{90^\circ}\dot{c}(t) \right\rangle}{\|\dot{c}(t)\|^3}
$$
