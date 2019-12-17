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

### 2.3.3 仿射不变性

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

# 4. Bezier 样条

## 4.1 插值问题

### 4.1.1 设定

- 输入
  - 控制点 control points：$\pmb{k}_0,\dots,\pmb{k}_n\in \mathbb{R}^3$ 
  - 结序列 knot sequence：$t_0,\dots,t_n\in \mathbb{R},t_0<t_1<\dots<t_n$  
- 输出：$\pmb{x}(t)\ (t_0\le t\le t_n)$，满足 $\pmb{x}(t_i)=\pmb{k}_i$ 

### 4.1.2 局部参数化

给定

- $\pmb{y}(u)$：$[0,1]$ 上的 Bezier 曲线
- $\pmb{x}(u)$：$[t_i,t_{i+1}]$ 上的 Bezier 曲线

令 $u(t)=\frac{t-t_i}{t_{i+1}-t_i}$ 

则 $\pmb{x}(t)=\pmb{y}(u(t))$，局部参数 u 从 0 到 1，全局参数 t 从 $t_i$ 到 $t_{i+1}$，则导数为
$$
\begin{aligned}\pmb{x}^{(r)}(t)=\frac{y^{(r)}(u(t))}{(t_{i+1}-t_i)^r}\end{aligned}
$$

### 4.1.3 参数化

根据控制点 $\{\pmb{k}_i\}_{i=0}^n$ 生成结序列 $\{t_i\}_{i=0}^n$ 

$t_0=0$，设 $d_i=\|\pmb{k}_i-\pmb{k}_{i-1}\|$ 

- 等距：$t_{i}-t_{i-1}=\text{const}\ (i=1,\dots,n)$ 
- Chordal：$t_{i}-t_{i-1}=d_i\ (i=1,\dots,n)$ 
- Centripetal：$t_{i}-t_{i-1}=\sqrt{d_i}\ (i=1,\dots,n)$ 
- Foley：$t_i-t_{i-1}=d_i\left(1+\frac{3}{2}\left(\frac{\hat{\alpha}_id_i}{d_i+d_{i+1}}+\frac{\hat{\alpha}_{i-1}d_{i-1}}{d_{i-1}+d_i}\right)\right)$，其中 $\hat{\alpha}_i=\min\left(\pi-\alpha_i,\frac{\pi}{2}\right)$，$\alpha_i=\text{angle}\left(\pmb{k}_{i-1},\pmb{k}_{i},\pmb{k}_{i+1}\right)$ 

## 4.2 连续性

给定两条曲线

- $\pmb{x}_1(t),t\in[t_0,t_1]$ 
- $\pmb{x}_2(t),t\in[t_1,t_2]$ 

### 4.2.1 参数连续

$\pmb{x}_1(t)$ 和 $\pmb{x}_2(t)$ 在 $\tau$ 处 $C^r$ 连续是指它们的从 $0^\text{th}$ 到 $r^\text{th}$ **导数向量**在 $\tau$ 相等

> - $C^0$：位置连续
> - $C^1$：接合处一阶导数（速度）连续
> - $C^2$：接合处一阶和二阶导数（加速度）连续
>
> ![1570881266929](assets/1570881266929.jpg)

### 4.2.2 几何连续

$\pmb{x}_1(t)$ 和 $\pmb{x}_2(t)$ 在 $\tau$ 处 $G^r$ 连续是指它们能**重参数化**使得它们在 $\tau$ 处 $C^r$ 连续。

> - $G^0=C^0$：位置连续
> - $G^1$：切向连续
> - $G^2$：切向和曲率连续

### 4.2.3 Bezier 样条交点连续

两条 n 阶 bezier 曲线
$$
\begin{align}
\pmb{k}_{j-1}=\pmb{b_0}^-,\pmb{b}_1^-,\dots,\pmb{b_n}^-=&\pmb{k}_j\\
&\pmb{k}_{j}=\pmb{b_0}^+,\pmb{b}_1^+,\dots,\pmb{b_n}^+=\pmb{k}_{j+1}\\
\end{align}
$$
**$C^1$ 连续** 

- 一阶导相等

$$
\frac { \boldsymbol { b } _ { n } ^ { - } - \boldsymbol { b } _ { n - 1 } ^ { - } } { \Delta_{j-1} } = \frac { \boldsymbol { b } _ { 1 } ^ { + } - \boldsymbol { b } _ { 0 } ^ { + } } { \Delta_j }
$$

![1570887364311](assets/1570887364311.jpg)

**$G^1$ 连续** 

$\pmb{b}_{n-1}^-$，$\pmb{k_j}$，$\pmb{b}_1^+$ 共线j即可，比 $C^1$ 连续限制少

![1570887873827](assets/1570887873827.jpg)

**$C^2$ 连续** 

- $C^1$ 连续
- 二阶导相等

$$
\frac { \boldsymbol { b } _ { n } ^ { - } - 2\boldsymbol { b } _ { n - 1 } ^ { - }+\boldsymbol{b}^-_{n-2} } { \Delta_{j-1}^2 } = \frac { \boldsymbol { b } _ { 2 } ^ { + } - 2\boldsymbol { b } _ { 1 } ^ { + } + \boldsymbol{b}^+_0 } { \Delta_j^2 }
$$

**$G^2$ 连续** 

- $G_1$ 连续
- 五点 $\boldsymbol { b } _ { n - 2 } ^ { - } , \boldsymbol { b } _ { n - 1 } ^ { - } , \boldsymbol { k } _ { j } , \boldsymbol { b } _ { 1 } ^ { + } , \boldsymbol { b } _ { 2 } ^ { + }$ 共面
- 二阶导差值与切线平行 $\ddot{\pmb{x}}_2(t_i)-\ddot{\pmb{x}}_1(t_i)\|\dot{\pmb{x}}(t_i)$ ![1570932618930](assets/1570932618930.jpg)
- 面积比 $\frac { \operatorname { area } \left( \boldsymbol { b } _ { n - 2 } ^ { - } , \boldsymbol { b } _ { n - 1 } ^ { - } , \boldsymbol { k } _ { j } \right) } { \operatorname { area } \left( \boldsymbol { k } _ { j } , \boldsymbol { b } _ { 1 } ^ { + } , \boldsymbol { b } _ { 2 } ^ { + } \right) } = \frac { a ^ { 3 } } { b ^ { 3 } }$ ![1570932788624](assets/1570932788624.jpg)

## 4.3 三次 Bezier 样条

> 每个样条有四个顶点 $\pmb{b}_0,\pmb{b}_1,\pmb{b}_2,\pmb{b}_3$，因此是一个三次多项式，所以端点可以 2 阶连续

给定

- 控制点：$\pmb{k}_0,\dots,\pmb{k}_1\in\mathbb{R}^3$ 
- 结序列：$t _ { 0 } , \ldots , t _ { n } \in \mathbb { R }, t_0<t_1<\dots<t_n$ 

想要得到 Bezier 点 $\pmb{b}_0,\dots,\pmb{b}_{3n}$ 来插值 $C^2$ 连续分段三次 Bezier 样条曲线

> 示例
>
> ![1570933408265](assets/1570933408265.jpg)

有 $3n+1$ 个点

- 插值条件 $\pmb{b}_{3i}=\pmb{k}_i(i=0,\dots,n)$，共 $n+1$ 个方程
- 在 $\pmb{k}_i(i=1,\dots,n-1)$ 处 $C^2$ 连续，则一阶导和二阶导相等，则共 $2n-2$ 个方程

共 $3n -1$ 个方程

需要**两个**额外的条件，即端点条件

- Bessel 端点条件：$\pmb{k}_0$ 处一阶导等于插值 $\left\{ \boldsymbol { k } _ { 0 } , \boldsymbol { k } _ { 1 } , \boldsymbol { k } _ { 2 } \right\}$ 的抛物线在 $\pmb{k}_0$ 处的一阶导，另一端也如此
- 自然端点条件：$\begin{array} { l } { \ddot { \pmb{x} } \left( t _ { 0 } \right) = 0 \Leftrightarrow \pmb{b} _ { 1 } = \frac { \pmb{b} _ { 2 } + \pmb{b} _ { 0 } } { 2 } } \\ { \ddot { \pmb{x} } \left( t _ { n } \right) = 0 \Leftrightarrow \pmb{b} _ { 3 n - 1 } = \frac { \pmb{b} _ { 3 n - 2 } + \pmb{b} _ { 3 n } } { 2 } } \end{array}$ 
- 闭合：$\begin{array} { l } { \dot { \pmb{x} } \left( t _ { 0 } \right) = \dot { \pmb{x} } \left( t _ { n } \right) } \\ { \ddot { \pmb{x} } \left( t _ { 0 } \right) = \ddot { \pmb{x} } \left( t _ { n } \right) } \end{array}$ 

# 5. B 样条

> 参考 [《样条函数与逼近论》9. B 样条及其性质 和 10. 样条函数的计算](../../SplineApproximation/notes) 
>
> B 样条 $\leftrightarrow$ Bernstein 基
>
> B 样条曲线 $\leftrightarrow$ Bezier 曲线
>
> B 样条曲线插值 $\leftrightarrow$ Bezier 样条

## 5.1 基础

**定义** 

给定结序列 $\{t_i\}_{i=0}^{n+k}$，满足 $t_0<\dots<t_{n+k}$，则 
$$
\begin{aligned}
N_{i,1}(t) &= \left\{\begin{matrix}
1, &t_i \le t < t_{i+1} \\
0, &\text{otherwise} \\
\end{matrix}\right. \\
N_{i,r}(t) &= \frac{t-t_i}{t_{i+r-1}-t_i}N_{i,r-1}(t)+\frac{t_{i+r}-t}{t_{i+r}-t_{i+1}}N_{i+1,r-1}(t) \quad (r=2,\dots,k;i=0,\dots,n+k-r)
\end{aligned}
$$
**连续性** 

$N_{i,r}(t)$ 由 $k$ 段 $k-1$ 次多项式拼成，则 $C^{k-2}$ 连续，总共有 $n+1$ 个 B 样条

放宽条件 $t_0\le t_1\le \dots \le t_{n+k}$，可以连续重复多次，重复 m 次，则阶数下降 m 次，当重复 k 次及以上时，函数值视为 0，此时 $t_i=t_{i+1}=\dots=t_{i+k},N_{i,k}(t)=0$。重复 m 次，则在 $t_i$ 处 $C^{k-2-m}$ 连续

> 重复 1 次是指 $t_i=t_{i+1}$，重复 m 次是指 $t_i=t_{i+1}=\dots=t_{i+m}$ 

**规范性** 

$\sum_{i=0}^n N_{i,k}(t)=1,t \in [t_{k-1},t_{n+1}]$ 

> 每一段内会受到 k 个基函数的影响，首尾处小于 1

## 5.2 B 样条曲线

给定

- 控制点：$\pmb{d}_0,\dots,\pmb{d}_n\in \mathbb{R}^3$，$n+1$ 个，$\pmb{d}_i$ 称为 de Boor points
- 结向量：$T=(t_0,\dots,t_n,\dots,t_{n+k})$，$n+k+1$ 个，比控制点多 k 个

> 因为 $N_{n,k}$ 需要 $t_n,t_{n+1},\dots,t_{n+k}$ 

则 k 阶的 B-spline 曲线 $\pmb{x}(t)$ 定义为
$$
\pmb{x}(t)=\sum_{i=0}^n N_{i,k}(t)\pmb{d}_i\quad (t_{k-1}\le t\le t_{n+1})
$$

> **示例** 
>
> ![1571318743885](assets/1571318743885.jpg)

当 $t_0=t_1=\dots=t_{k-1}$ 且 $t_{n+1}=t_{n+2}=\dots=t_{n+k}$ 时，相应的 B-spline 曲线 $\pmb{x}(t)$ 的性质

- $t\in[t_{k-1},t_{n+1}]$，总共 $n-k+2$ 段（因此 $n\ge k-1$）
- $\pmb{x}(t_{k-1})=\pmb{d}_0$，$\pmb{x}(t_{n+1})=\pmb{d}_n$ 
- $\dot{\pmb{x}}(t_0)=\frac{k-1}{t_k-t_{k-1}}(\pmb{d}_1-\pmb{d}_0)$ 
- 含 **n-k+2 段**多项式 **k-1 阶**的曲线，$C^{k-2}$ 连续
- 重复 m 次，则 $C^{k-m-2}$ 连续
- 移动 $\pmb{d}_i$ 只影响 $[t_i,t_{i+k}]$ 
- $n=k-1$ 且 $t_0=\dots=t_{k-1}=0,t_k=\dots=t_{2k-1}=1$ 时，B 样条为 Bezier 曲线（从[开花算法](#6.3 B 样条)易于理解）

> **示例** 
>
> ![1571318743885](assets/1571318743885.jpg)

## 5.3 De Boor 算法

**输入** 

- $\{\pmb{d}_0\}_{i=0}^n$ 
- $\{t_i\}_{i=0}^{n+k}$，其中 $t_0=\dots=t_{k-1}<t_k<\dots<t_{n}<t_{n+1}=\dots=t_{n+k}$ 

**输出** 

k 阶 B-Spline 样条 $\pmb{x}(t)$ 

**算法** 

![1571320573794](assets/1571320573794.jpg)

> **运算框架** 
>
> ![image-20191216215819923](assets/image-20191216215819923.png)

## 5.4 3 次 B 样条曲线插值

**输入** 

- 插值点：$\{\pmb{k}_i\}_{i=0}^n$ 
- 结：$\{s_i\}_{i=0}^n$ 

**输出** 

4 阶 3 次 B 样条曲线 $\pmb{x}(t) \quad(s_0\le t\le s_n)$，且满足 $\pmb{x}(s_i)=\pmb{k}_i$ 

**方法** 

- 3 次 $\Rightarrow k=4$ 
- $n$ 段 $[t_i,t_{i+1})$ $\Rightarrow$ $n+3$ 个 de Boor 点 $\{\pmb{d}_i\}_{i=0}^{n+2}$，$n+7$ 个结 $\{t_i\}_{i=0}^{n+6}$，其中 $t_0=t_1=t_2=t_3,t_{n+3}=t_{n+4}=t_{n+5}=t_{n+6},t_{i+3}=s_i\ (i=0,\dots,n)$，即 $\begin{array}{c}
  (t_0,&t_1,&t_2,&t_3,&t_4,&\dots,&t_{n+2},&t_{n+3},&t_{n+4},&t_{n+5},&t_{n+6}&)\\
  (s_0,&s_0,&s_0,&s_0,&s_1,&\dots,&s_{n-1},&s_n,    &s_n,    &s_n,    &s_n    &)
  \end{array}$ 

则条件有
$$
\begin{aligned}
\pmb{x} \left( s _ { 0 } \right) & =  \pmb{k} _ { 0 } = \pmb{d} _ { 0 } \\
\pmb{x} \left( s _ { i } \right) & = \pmb{k} _ { i } = N _ { i , 4 } \left( s _ { i } \right) \pmb{d} _ { i } + N _ { i + 1,4 } \left( s _ { i } \right) \pmb{d} _ { i + 1 } + N _ { i + 2,4 } \left( s _ { i } \right) \pmb{d} _ { i + 2 } \quad (i=1,\dots,n-1)\\
\pmb{x} \left( s _ { n } \right) & = \pmb{k} _ { n } = \pmb{d} _ { n + 2 } \end{aligned}
$$
有 $n+1$ 个条件，还缺两个端点条件

- 自然边界条件

$$
\begin{aligned}
\ddot { \pmb{x} } \left( s _ { 0 } \right) = 0 & \Leftrightarrow \frac { d _ { 2 } - d _ { 1 } } { s _ { 2 } - s _ { 0 } } = \frac { d _ { 1 } - d _ { 0 } } { s _ { 1 } - s _ { 0 } } \\
\ddot { \pmb{x} } \left( s _ { n } \right) = 0 & \Leftrightarrow \frac { d _ { n + 2 } - d _ { n + 1 } } { s _ { n } - s _ { n - 1 } } = \frac { d _ { n + 1 } - d _ { n } } { s _ { n } - s _ { n - 2 } }
\end{aligned}
$$

可得到一个三对角系统
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

> **示例** 
>
> ![1571324448351](assets/1571324448351.jpg)

# 6. 极形式和开花算法

## 6.1 极形式

### 6.1.1 一维

n 次多项式 polynomial $F:\mathbb{R}\to\mathbb{R}$ 的极形式 polar form 或开花 blossom $f:\mathbb{R}^n\to\mathbb{R}$ 是一个满足以下性质的 d 维函数

- 对角性 diagonality：$f(t,\dots,t)=F(t)$ 
- 对称性 symmetry：对任意置换 $\pi$，$f(t_1,\dots,t_d)=f(t_{\pi(1)},\dots,t_{\pi(d)})$ 
- 多仿射 multi-affine：$f(t_1,\dots,\sum_\limits{k=1}^n\alpha_kt_i^{(k)},\dots,t_d)=\sum_{k=1}^n\alpha_k f(t_1,\dots,t_i^{(k)},\dots,t_d)$，其中 $\sum_{k=1}^n\alpha_k=1$ 

$$
\begin{aligned}
F(t)&=\sum_{i=0}^n c_i t^i\\
f(t_1,\dots,t_n)&=\sum_{i=0}^n c_i 
\frac{\sum_\limits{S\subseteq\{1,\dots,n\},|S|=i} \prod_\limits{j\in S}t_j}{\mathrm{C}_n^i}\\
\end{aligned}
$$

> **示例** 
>
> - 0 次：$f=c_0$ 
> - 1 次：$f(t_1)=c_0+c_1t_1$ 
> - 2 次：$f(t_1,t_2)=c_0+c_1\frac{t_1+t_2}{2} + c_2t_1t_2$ 
> - 3 次：$f(t_1,t_2,t_3)=c_0+c_1\frac{t_1+t_2+t_3}{3}+c_2\frac{t_1t_2+t_2t_3+t_1t_3}{3}+c_3t_1t_2t_3$ 
>
> ---
>
> 两者都是只有 $n+1$ 个变量，即自由度为 $n+1$，只需提供 n+1 个采样点即可确定函数

### 6.1.2 多维

$$
\begin{aligned}F&:\mathbb{R}^m\to \mathbb{R}^n\\f&:\mathbb{R}^{d\times m}\to \mathbb{R}^n\end{aligned}
$$

满足性质

- 对角性 diagonality：$f(\pmb{t},\dots,\pmb{t})=F(\pmb{t})$ 
- 对称性 symmetry：对任意置换 $\pi$，$f(\pmb{t}_1,\dots,\pmb{t}_d)=f(\pmb{t}_{\pi(1)},\dots,\pmb{t}_{\pi(d)})$ 
- 多仿射 multi-affine：$f(\pmb{t}_1,\dots,\sum_\limits{k=1}^n\alpha_k\pmb{t}_i^{(k)},\dots,\pmb{t}_d)=\sum_{k=1}^n\alpha_k f(\pmb{t}_1,\dots,\pmb{t}_i^{(k)},\dots,\pmb{t}_d)$，其中 $\sum_{k=1}^n\alpha_k=1$ 

### 6.1.3 向量

我们需要区分点 point 和向量 vectors（点的差值）

使用“帽子”记号 $\hat{v}=p-q$ 来表示向量

1 向量：$\hat{1}=1-0,\hat{\pmb{1}}=[1,\dots,1]^\top-\pmb{0}$ 

极形式中向量的递归定义
$$
f(\underbrace{t_1,\dots,t_{n-k}}_{n-k},\underbrace{\hat{v}_1,\dots,\hat{v}_k}_k)=
f(\underbrace{t_1,\dots,t_{n-k}}_{n-k},p_1,\underbrace{\hat{v}_2,\dots,\hat{v}_{k-1}}_{k-1})-f(\underbrace{t_1,\dots,t_{n-k}}_{n-k},q_1,\underbrace{\hat{v}_2,\dots,\hat{v}_{k-1}}_{k-1})
$$
其中 $\hat{v}_i=p_i-q_i(i=1,\dots,k)$ 

### 6.1.4 导数

$$
F^{(r)}(t) = c_r f ( \underbrace { t , \ldots , t } _ { n - r }, \underbrace { \hat { 1 } , \ldots , \hat { 1 } } _ { r } )
$$

其中 $c_r=\prod_{i=1}^r(n-i+1)$ 

### 6.1.5 连续

下列等价

- $F$ 和 $G$ 在 $t$ 点 $\mathrm{C}^k$ 连续
- $\forall t_1,\dots,t_k, f(t,\dots,t,t_1,\dots,t_k)=g(t,\dots,t,t_1,\dots,t_k)$ 
- $f ( t , \ldots , t , \underbrace{\hat { 1 } , \ldots , \hat { 1 }}_r ) = g ( t , \ldots , t , \underbrace{\hat { 1 } , \ldots , \hat { 1 }}_r )\quad(r=1,\dots,k)$ 

### 6.1.6 升阶

给定 d 次函数 $f(t_1,\dots,t_d)$，升阶得
$$
f ^ { ( + 1 ) } \left( t _ { 1 } , \ldots , t _ { d + 1 } \right) = \frac { 1 } { d + 1 } \sum _ { i = 1 } ^ { d + 1 } f \left( t _ { 1 } , \ldots , t _ { i - 1 } , t _ { i + 1 } , \ldots , t _ { d + 1 } \right)
$$

> 证明 $F^{(+1)}(t)=F(t)$ 
> $$
> \begin{aligned} \forall t : f ^ { ( + 1 ) } ( t , \ldots , t ) & = \left. \frac { 1 } { d + 1 } \sum _ { i = 1 } ^ { d + 1 } f \left( t _ { 1 } , \ldots , t _ { i - 1 } , t _ { i + 1 } , \ldots , t _ { d + 1 } \right) \right| _ { t _ { 1 } = \cdots t _ { d + 1 } = t } \\ & = \frac { 1 } { d + 1 } \sum _ { i = 1 } ^ { d + 1 } f ( t , \ldots , t ) \\ & = f ( t , \ldots , t ) \end{aligned}
> $$

## 6.2 Bezier

### 6.2.1 极形式

n 阶 Bezier 曲线 $\pmb{x}(t)=\sum_{i=0}^nB^n_i(t)\pmb{b}_i\ (0\le t\le 1)$，则极形式为
$$
f(t,\dots,t)=\sum_{i=0}^nB^n_i(t)f (\underbrace{0,\dots,0}_{n-i},\underbrace{1,\dots,1}_i)
$$
其中 $f (\underbrace{0,\dots,0}_{n-i},\underbrace{1,\dots,1}_i)=\pmb{b}_i$ 

### 6.2.2 开花算法

初始化：$\pmb{b}^{0}_i(t)=\pmb{b}_i=f (\underbrace{0,\dots,0}_{n-i},\underbrace{1,\dots,1}_i),\ (i=0,\dots,n)$  

迭代：$\pmb{b}^{r}_i(t)=(1-t)\pmb{b}^{r-1}_i(t)+t\pmb{b}^{r-1}_{i+1}(t)=f(\underbrace{0,\dots,0}_{n-i-r},\underbrace{1,\dots,1}_{i},\underbrace{t,\dots,t}_{r})\ (r=1,\dots,n;i=0,\dots,n-r)$ 

> **运算框架** 
>
> ![image-20191217001943908](assets/image-20191217001943908.png)

### 6.2.3 泛化

$t\in [u,v]$，则 $\pmb{b}_i=f(\underbrace{u,\dots,u}_{d-i},\underbrace{v,\dots,v}_i)$ 

### 6.2.4 求 Bezier 点

给定 n 次多项式 $\pmb{p}(t)$，想要 Bezier 曲线的控制点 $\{\pmb{b}_i\}_{i=0}^n$ 

解决方法

- $\pmb{p}(t)\mapsto \pmb{b}(t_1,\dots,t_n)$ 
- 控制点 $\pmb{b}_i=\pmb{b}(\underbrace{0,\dots,0}_{n-i},\underbrace{1,\dots,1}_i)$，$i=0,\dots,n$ 

### 6.2.5 Bezier 样条

控制点：$\{\pmb{k}_i\}_{i=0}^n$ 

结序列：$\{t_i\}_{i=0}^n$ 

求得 Bezier 点为 $\{\pmb{b}_i\}_{i=0}^{3n}$，有 $n$ 条 Bezier 曲线 $\{\pmb{x}_i(t)\}_{i=1}^n$，相应极形式为 $\{f_i(\tau_1,\tau_2,\tau_3)\}_{i=1}^n$，则
$$
\begin{array}{}
f_1(t_0,t_0,t_0)=\pmb{b}_0,&f_1(t_0,t_0,t_1)=\pmb{b}_1,&f_1(t_0,t_1,t_1)=\pmb{b}_2,&f_1(t_1,t_1,t_1)=\pmb{b}_3\\
f_2(t_1,t_1,t_1)=\pmb{b}_3,&f_2(t_1,t_1,t_2)=\pmb{b}_4,&f_2(t_1,t_2,t_2)=\pmb{b}_5,&f_2(t_2,t_2,t_2)=\pmb{b}_6\\
\dots\\
f_n(t_{n-1},t_{n-1},t_{n-1})=\pmb{b}_{3n-3},&f_n(t_{n-1},t_{n-1},t_n)=\pmb{b}_{3n-2},&f_n(t_{n-1},t_n,t_n)=\pmb{b}_{3n-1},&f_n(t_n,t_n,t_n)=\pmb{b}_{3n}\\
\end{array}
$$

> **示例** 
>
> ![image-20191026203411697](assets/image-20191026203411697.jpg)

### 6.2.6 导数

$$
\frac { \mathbb{d} } { \mathbb{d} t } F ( t ) = n f ( t , \ldots , t , \hat { 1 } ) = n ( f ( t , \ldots , t , 1 ) - f ( t , \ldots , t , 0 ) )
$$

![image-20191026203616107](assets/image-20191026203616107.jpg)

### 6.2.7 细分

![image-20191026203655630](assets/image-20191026203655630.jpg)

在 [6.1.6 升阶](#6.1.6 升阶) 介绍了极形式的升阶，则对 Bezier 曲线极形式 $\pmb{b}(t_1,\dots,t_n)$ 升阶得到
$$
\pmb{b} ^ { ( + 1 ) } \left( t _ { 1 } , \ldots , t _ { n + 1 } \right) = \frac { 1 } { n + 1 } \sum _ { i = 1 } ^ { n + 1 } \pmb{b} \left( t _ { 1 } , \ldots , t _ { i - 1 } , t _ { i + 1 } , \ldots , t _ { n + 1 } \right)
$$
升阶后的曲线 $\pmb{b}^{(+1)}$ 的 $n+2$ 个控制点 $\pmb{b}^{(+1)}_0,\dots,\pmb{b}^{(+1)}_{n+1}$ 为

- 当 $i=1,\dots,d$ 时
  $$
  \begin{aligned}
  \pmb{b}_i^{(+1)}&=\pmb{b}^{(+1)}(\underbrace{0,\dots,0}_{n+1-i},\underbrace{1,\dots,1}_i)\\
&=\frac{i}{n+1}\pmb{b}(\underbrace{0,\dots,0}_{n+1-i},\underbrace{1,\dots,1}_{i-1}) + \left(1-\frac{i}{n+1}\right)\pmb{b}(\underbrace{0,\dots,0}_{n-i},\underbrace{1,\dots,1}_i)\\
  &=\frac{i}{n+1}\pmb{b}_{i-1} + \left(1-\frac{i}{n+1}\right)\pmb{b}_i\\\end{aligned}
  $$
  
- 其他
  $$
  \begin{aligned}
  \pmb{b}_0^{(+1)}&=\pmb{b}_0\\
  \pmb{b}_{n+1}^{(+1)}&=\pmb{b}_n\\
  \end{aligned}
  $$

  > 将 $\pmb{b}_{-1}$ 和 $\pmb{b}_{n+1}$ 视为 $\pmb{0}$ 的话可以并入上边的公式

## 6.3 B 样条

### 6.3.1 定义

$\{\pmb{d}_i\}_{i=0}^n$，$\{t_i\}_{i=0}^{n+k}$，极形式 $\underline{\pmb{x}}(\tau_1,\dots,\tau_{k-1})$，范围 $[t_{k-1},t_{n+1}]$，则
$$
\pmb{d}_i=\underline{\pmb{x}}(t_{i+1},\dots,t_{i+k-1})
$$
每 $k$ 个点可决定一个 $\underline{\pmb{x}}$，总共有 $n-k+2$ 条 $k$ 阶 $k-1$ 次多形式函数曲线

### 6.3.2 开花算法

求 $\pmb{x}(t)$，确定出 $t$ 前后 $k-1$ 个结
$$
r_{k-1}\le\dots\le r_1\le t < s_1\le \dots \le s_{k-1}
$$
则中间节点为
$$
\pmb{x} _ { i } ^ { (r) } ( t ) = \underline { \pmb{x} } ( r _ { k-1-r-i } , \dots , r _ { 1 }, \underbrace{t , \ldots , t}_r , s _ { 1 } , \dots , s _ { i } )
$$
其中 $l=0,\dots,k-1$，$j=0,\dots,k-1-l$ 

最终曲线是
$$
\pmb{x}(t)=\pmb{x}_0^{(k-1)}(t)=\underline{\pmb{x}}(\underbrace{t,\dots,t}_{k-1})
$$

> **运算框架** 
>
> ![image-20191217011851453](assets/image-20191217011851453.png)

# 7. 有理样条曲线

## 7.1 二次曲线和圆锥曲线

二次曲线是二次方程（任意维数）的零集
$$
\{\pmb{x}\in \mathbb{R}^d|\pmb{x}^\top M \pmb{x}+\pmb{b}^\top \pmb{x}+\pmb{c}=0\}
$$
圆锥曲线是 $d=2$ 时的二次曲线，一般方程为
$$
\begin{aligned}
ax^2+bxy+cy^2+dx+ey+f&=0\\
\pmb{x}^\top\left[\begin{matrix}
a & \frac{b}{2}\\
\frac{b}{2} & c
\end{matrix}\right]
\pmb{x}
+
\left[\begin{matrix}
d & e
\end{matrix}\right]
\pmb{x}
+f=0
\end{aligned}
$$
记（$a>0$）
$$
M\triangleq \left[\begin{matrix}
a & \frac{b}{2} \\
\frac{b}{2} & c
\end{matrix}\right]
$$
M 的特征值为
$$
\lambda_{1,2}=\frac{a+c \pm \sqrt{(a-c)^2+b^2}}{2}
$$

- 椭圆：$b^2<4ac$ 
  - 圆：$b=0$，$a=c$ 
- 抛物线：$b^2=4ac$ 
- 双曲线：$b^2>4ac$ 

## 7.2 抛物线投影

给定一条空间二次曲线，将 $z$ 坐标设为齐次项 $\omega$，将曲线中心投影到平面 $\omega=1$ 上

![image-20191101212505639](assets/image-20191101212505639.jpg)

空间二次曲线为
$$
\pmb{f} ^ { ( h o m ) } ( t ) = \pmb{p} _ { 0 } + t \pmb{p} _ { 1 } + t ^ { 2 } \pmb{p} _ { 2 } = \left( \begin{array} { c } { \pmb{p} _ { 0 } \cdot x } \\ { \pmb{p} _ { 0 } \cdot y } \\ { \pmb{p} _ { 0 } \cdot \omega } \end{array} \right) + t \left( \begin{array} { c } { \pmb{p} _ { 1 } \cdot x } \\ { \pmb{p} _ { 1 } \cdot y } \\ { \pmb{p} _ { 1 } \cdot \omega } \end{array} \right) + t ^ { 2 } \left( \begin{array} { c } { \pmb{p} _ { 2 } \cdot x } \\ { \pmb{p} _ { 2 } \cdot y } \\ { \pmb{p} _ { 2 } \cdot \omega } \end{array} \right)
$$

投影曲线
$$
\pmb{f} ^ { ( e u c l ) } ( t ) = \frac { \left( \begin{array} { c } { \pmb{p} _ { 0 } \cdot x } \\ { \pmb{p} _ { 0 } \cdot y } \end{array} \right) + t \left( \begin{array} { c } { \pmb{p} _ { 1 } \cdot x } \\ { \pmb{p} _ { 1 } \cdot y } \end{array} \right) + t ^ { 2 } \left( \begin{array} { c } { \pmb{p} _ { 2 } \cdot x } \\ { \pmb{p} _ { 2 } \cdot y } \end{array} \right) } { \pmb{p} _ { 0 } \cdot \omega + t \pmb{p} _ { 1 } \cdot \omega + t ^ { 2 } \pmb{p} _ { 2 } \cdot \omega }
$$

### 7.2.1 抛物线

对于
$$
y=x^2
$$
参数化为
$$
\left\{\begin{array}{l}
x=t\\
y=t^2
\end{array}\right.
$$
则
$$
\pmb{p}_0=\left[\begin{matrix}
0\\
0\\
1
\end{matrix}\right],
\pmb{p}_1=\left[\begin{matrix}
1\\
0\\
0
\end{matrix}\right],
\pmb{p}_2=\left[\begin{matrix}
0\\
1\\
0
\end{matrix}\right]
$$
故
$$
\pmb{f} ^ { ( e u c l ) } ( t ) = \frac { \left( \begin{array} { c } { 0 } \\ { 0 } \end{array} \right) + t \left( \begin{array} { c } { 1 } \\ { 0 } \end{array} \right) + t ^ { 2 } \left( \begin{array} { c } { 0 } \\ { 1 } \end{array} \right) } { 1 + 0 t + 0 t ^ { 2 } }=\left( \begin{array} { c } { t } \\ { t^2 } \\ { 1 } \end{array} \right)
$$

### 7.2.2 圆

对于
$$
x^2+y^2=1
$$
参数化为
$$
\left\{\begin{array}{l}
x=\cos\varphi=\frac{1-\tan^2\frac{\varphi}{2}}{1+\tan^2\frac{\varphi}{2}}=\frac{1-t^2}{1+t^2}\\
y=\sin\varphi=\frac{2\tan\frac{\varphi}{2}}{1+\tan^2\frac{\varphi}{2}}=\frac{2t}{1+t^2}\\
\end{array}\right.
$$
其中 $t=\tan \frac{\varphi}{2}$ （$\varphi\in[0,\frac{\pi}{4}]$，$t\in[0,1]$）

则
$$
\pmb{p}_0=\left[\begin{matrix}
1\\
0\\
1
\end{matrix}\right],
\pmb{p}_1=\left[\begin{matrix}
0\\
2\\
0
\end{matrix}\right],
\pmb{p}_2=\left[\begin{matrix}
-1\\
0\\
1
\end{matrix}\right]
$$
故
$$
\pmb{f} ^ { ( e u c l ) } ( t ) = \frac { \left( \begin{array} { c } { 1 } \\ { 0 } \end{array} \right) + t \left( \begin{array} { c } { 0 } \\ { 2 } \end{array} \right) + t ^ { 2 } \left( \begin{array} { c } { -1 } \\ { 0 } \end{array} \right) } { 1 + 0 t + 1 t ^ { 2 } }=\left( \begin{array} { c } { 1-t^2 } \\ { 2t } \\ { 1+t^2 } \end{array} \right)
$$

### 7.2.3 双曲线

对于
$$
x^2-y^2=1
$$
参数化为
$$
\left\{\begin{array}{l}
x=\frac{1}{\cos\varphi}=\frac{1+t^2}{1-t^2}\\
y=\tan \varphi = \frac{2t}{1-t^2}
\end{array}\right.
$$
其中 $t=\tan \frac{\varphi}{2}$（$\varphi\in[0,\frac{\pi}{4}]$，$t\in[0,1]$）

则
$$
\pmb{p}_0=\left[\begin{matrix}
1\\
0\\
1
\end{matrix}\right],
\pmb{p}_1=\left[\begin{matrix}
0\\
2\\
0
\end{matrix}\right],
\pmb{p}_2=\left[\begin{matrix}
1\\
0\\
-1
\end{matrix}\right]
$$
故
$$
\pmb{f} ^ { ( e u c l ) } ( t ) = \frac { \left( \begin{array} { c } { 1 } \\ { 0 } \end{array} \right) + t \left( \begin{array} { c } { 0 } \\ { 2 } \end{array} \right) + t ^ { 2 } \left( \begin{array} { c } { 1 } \\ { 0 } \end{array} \right) } { 1 + 0 t - 1 t ^ { 2 } }=\left( \begin{array} { c } { 1+t^2 } \\ { 2t } \\ { 1-t^2 } \end{array} \right)
$$

## 7.3 有理 Bezier 曲线

### 7.3.1 定义

**齐次形式** 

$\{\pmb{b}_i\in\mathbb{R}^{d+1}\}_{i=0}^n$，则
$$
\begin{aligned}
\boldsymbol { f } ^ { ( h o m ) } ( t ) &= \sum _ { i = 0 } ^ { n } B _ { i } ^ { n } ( t ) \boldsymbol { b } _ { i }\\
\boldsymbol { f } ^ { ( e u c l ) } ( t ) &= \frac { \sum _ { i = 0 } ^ { n } B _ { i } ^ { n } ( t ) \left( \begin{array} { c } { b _ { i } ^ { ( 1 ) } } \\ { \vdots } \\ { b_ { i } ^ { ( d ) } } \end{array} \right) } { \sum _ { i = 0 } ^ { n } B _ { i } ^ { n } ( t ) b _ { i } ^ { ( d + 1 ) } }
\end{aligned}
$$
**权系数形式** 

$\{\pmb{b}_i\in \mathbb{R}^{d}\}$，$\{w_i\}_{i=0}^n\ (\omega_i > 0)$，则
$$
\boldsymbol { f } ^ { ( e u c l ) } ( t ) = \frac { \sum _ { i = 0 } ^ { n } B _ { i } ^ { n } ( t ) w_i\pmb{b}_i } { \sum _ { i = 0 } ^ { n } B _ { i } ^ { n } ( t ) w_i }=\sum_{i=0}^nq_i(t)\pmb{b}_i
$$
相对于齐次形式，无法表达 $b_i^{(d+1)}=0$ 的点

易得 $\sum_{i=0}^nq_i(t)=1$，则有仿射不变性、凸包性，$q_i(t)$ 可视为加权 Bezier 函数

### 7.3.2 导数

$$
f ( t ) = \frac { \sum _ { i = 0 } ^ { n } B _ { i } ^ { n } ( t ) w_i\pmb{b}_i } { \sum _ { i = 0 } ^ { n } B _ { i } ^ { n } ( t ) w_i }=\frac{p(t)}{w(t)}
$$

则
$$
f^\prime(t)=\frac{p^\prime(t)-f(t)w^\prime(t)}{w(t)}
$$

### 7.3.3 有理 de Casteljau 算法

三种方法

- 在 $d+1$ 维上计算，最后投影：$\boldsymbol { b } _ { i } ^ { ( r ) } ( t ) = ( 1 - t ) \boldsymbol { b } _ { i } ^ { ( r - 1 ) } ( t ) + t \boldsymbol { b } _ { i + 1 } ^ { ( r - 1 ) } ( t )$ 

- 分别计算分子和分母，然后相除：类似于上一种

- 每一个步骤相除
  $$
  \begin{aligned} \boldsymbol { b } _ { i } ^ { ( r ) } ( t ) = ( & 1 - t ) \frac { \omega _ { i } ^ { ( r - 1 ) } ( t ) } { \omega _ { i } ^ { ( r ) } ( t ) } \boldsymbol { b } _ { i } ^ { ( r - 1 ) } ( t ) + t \frac { \omega _ { i + 1 } ^ { ( r - 1 ) } ( t ) } { \omega _ { i } ^ { ( r ) } ( t ) } \boldsymbol { b } _ { i + 1 } ^ { ( r - 1 ) } ( t ) \\ & \text { with } \quad \omega _ { i } ^ { ( r ) } ( t ) = ( 1 - t ) \omega _ { i } ^ { ( r - 1 ) } ( t ) + t \omega _ { i + 1 } ^ { ( r - 1 ) } ( t ) \end{aligned}
  $$

  > 这种方法很傻其实，每次除了权重之后，下一次又乘了回去

> 综合来看第一种最简单

### 7.3.4 二次有理 Bezier 曲线

#### 7.3.4.1 标准形式

权重三个，绝对大小无关且参数化无关可消掉两个，故只剩一个

取权重
$$
w_0=w_2=1,\ w_1=w
$$
则
$$
f ^ { ( e u c l ) } ( t )=\frac { B_0^{(2)}(t)\boldsymbol { p } _ { 0 } + B_1^{(2)}(t) \omega \boldsymbol { p } _ { 1 } + B_2^{(2)}(t) \boldsymbol { p } _ { 2 } } { B_0^{(2)}(t) + B_1^{(2)}(t) \omega + B_2^{(2)}(t) }
$$

- $\omega < 1$：椭圆曲线
- $\omega=1$：抛物线
- $\omega>1$：双曲线

#### 7.3.4.2 对偶

对偶段为 $t\in \mathbb{R}\backslash [0,1]$，则可用参数化
$$
\hat{t}=\frac{t}{2t-1}
$$
$t$ 从 $0$ 到 $\frac{1}{2}$ 时 $\hat t$ 从 $0$ 到 $-\infty$，$t$ 从 $\frac{1}{2}$ 到 $1$ 时 $\hat t$ 从 $+\infty$ 到 $1$ 

代入标准形式可得
$$
\begin{aligned}
\pmb{x}(\hat{t})&= \frac { ( 1 - \hat { t } ) ^ { 2 } \pmb{p} _ { 0 } + 2 \hat { t } ( 1 - \hat { t } ) \omega \pmb{p} _ { 1 } + \hat { t } ^ { 2 } \pmb{p} _ { 2 } } { ( 1 - \hat { t } ) ^ { 2 } + 2 \hat { t } ( 1 - \hat { t } ) \omega + \hat { t } ^ { 2 } }\\
&= \frac { ( 1 - t ) ^ { 2 } \pmb{p} _ { 0 } - 2 t ( 1 - t ) \omega \pmb{p} _ { 1 } + t ^ { 2 } \pmb{p} _ { 2 } } { ( 1 - t ) ^ { 2 } - 2 t ( 1 - t ) \omega + t ^ { 2 } }\\
&= \frac{B^2_0(t)\pmb{p}_0-B^2_1(t)\omega\pmb{p}_1+B^2_2(t)\pmb{p}_2}{B^2_0(t)-B^2_1(t)\omega+B^2_2(t)}
\end{aligned}
$$

仅是 $\omega$ 取负

考虑分母等于 $0$ 的情形 

$$
\omega(t)=(1-t)^2-2t(1-t)\omega+t^2
$$

这是一个抛物线，可推得

- $\omega<1$：没有奇异点（零点），椭圆
- $\omega=1$：一个奇异点，抛物线
- $\omega>1$：两个奇异点，双曲线

![image-20191102184245800](assets/image-20191102184245800.jpg)

#### 7.3.4.3 圆

控制点满足

- $\|\pmb{b}_1-\pmb{b}_0\|=\|\pmb{b}_1-\pmb{b}_2\|$ 
- $\text{dot}(\pmb{b_1}-\pmb{b_0},\pmb{b_2}-\pmb{b_0})=\text{dot}(\pmb{b_1}-\pmb{b_2},\pmb{b_0}-\pmb{b_2})=\cos\alpha$ 

则 $\omega=\cos \alpha$ 

![image-20191102185035624](assets/image-20191102185035624.jpg)

### 7.3.5 Farin 点

$$
\begin{aligned}
\overline{\pmb{f}_i}
&=\frac{1}{2}(\overline{\pmb{b}_i}+\overline{\pmb{b}_{i+1}})\\
\pmb{f}_i&=\frac{\omega_ib_i+\omega_{i+1}b_{i+1}}{\omega_i+\omega_{i+1}}
\end{aligned}
$$

![image-20191102190352559](assets/image-20191102190352559.jpg)

## 7.4 NURBS

**N**on-**U**niform **R**ational **B**-**S**plines
$$
\boldsymbol { f } ( t ) = \frac { \sum _ { i = 0 } ^ { n } N _ { i,k } ( t ) \omega _ { i } \boldsymbol { p } _ { i } } { \sum _ { i = 0 } ^ { n } N _ { i,k } ( t ) \omega _ { i } }
$$

# 8. 样条曲面

## 8.1 张量积曲面

### 8.1.1 定义

$B^{(\text{curv})}=\{b_i(t)\}_{i=0}^n$，$B^{(\text{surf})}=\{b_{ij}(u,v)=b_i(u)b_j(v)\}_{i,j=0}^n$，$\{\pmb{p}_{i,j}\}_{i,j=0}^n$，张量积曲面为
$$
\begin{aligned}
\boldsymbol { f } ( u , v ) & = \sum _ { i = 0 } ^ { n } \sum _ { j = 0 } ^ { n } b _ { i } ( u ) b _ { j } ( v ) \boldsymbol { p } _ { i , j } \\
& = \sum _ { i = 0 } ^ { n } b _ { i } ( u ) \sum _ { j = 0 } ^ { n } b _ { j } ( v ) \boldsymbol { p } _ { i , j } \\
& = \sum _ { j = 0 } ^ { n } b _ { j } ( v ) \sum _ { i = 0 } ^ { n } b _ { i } ( u ) \boldsymbol { p } _ { i , j }
\end{aligned}
$$
$\sum_{i=0}^n b_i(t)=1 \Rightarrow$ 仿射不变性、凸包性
$$
\begin{aligned}
\frac { \partial ^ { r + s } } { \partial u ^ { r } \partial v ^ { s } } \sum _ { i = 0 } ^ { n } \sum _ { j = 0 } ^ { n } b _ { i } ( u ) b _ { j } ( v ) \boldsymbol { p } _ { i , j }
& = \sum _ { i = 0 } ^ { n } \sum _ { j = 0 } ^ { n } b_i^{(r)}(u) b_j^{(s)}(v) \boldsymbol { p } _ { i , j }\\
& = \sum _ { j = 0 } ^ { n } b_i^{(r)}(u) \sum _ { i = 0 } ^ { n } b_j^{(s)}(v) \boldsymbol { p } _ { i , j } \\
& = \sum _ { i = 0 } ^ { n } b_i^{(r)}(u) \sum _ { j = 0 } ^ { n } b_j^{(s)}(v) \boldsymbol { p } _ { i , j }\\
& = \frac { \mathrm{d} ^ { r } } { \mathrm{d} u ^ { r } } \sum_{i=0}^nb_i(u)\frac { \mathrm{d} ^ { s } } { \mathrm{d} v ^ { s } } \sum_{j=0}^nb_j(v) \pmb{p}_{i,j}
\end{aligned}
$$

$$
\pmb{n}(u,v)=\text{normalize}\left(\frac{\part \pmb{f}}{\part u} \times \frac{\part \pmb{f}}{\part v}\right)
$$

### 8.1.2 张量积 Bezier 曲面

控制点阵 $\{\pmb{b}_{i,j}\}_{i,j=0}^{n,m}$，则张量积 Bezier 块为
$$
\boldsymbol { f } ( u , v ) = \sum _ { i = 0 } ^ { n } \sum _ { j = 0 } ^ { m } B _ { i } ^ { n } ( u ) B _ { j } ^ { m } ( v ) \boldsymbol { b } _ { i , j }
$$

$$
\begin{aligned}
\frac { \partial ^ { r + s } } { \partial u ^ { r } \partial v ^ { s } }\pmb{f}(u,v)
&= \frac { \mathrm{d} ^ { r } } { \mathrm{d} u ^ { r } } \sum_{i=0}^n B^n_i(u)\frac { \mathrm{d} ^ { s } } { \mathrm{d} v ^ { s } } \sum_{j=0}^m B^m_j(v) \pmb{b}_{i,j}\\
&= c_{n,r}c_{m,s}\sum_{i=0}^{n-r}B^{n-r}_i(u)\sum_{j=0}^{m-s}B^{m-s}_j(v)\Delta^r_i\Delta^s_j\pmb{b}_{i,j}\\
&= c_{n,r}c_{m,s}\sum_{j=0}^{m-s}B^{m-s}_j(v)\sum_{i=0}^{n-r}B^{n-r}_i(u)\Delta^s_j\Delta^r_i\pmb{b}_{i,j}
\end{aligned}
$$

其中 $\Delta^k_i f_i=\sum_{j=0}^k\mathrm{C}_k^j(-1)^jf_{i+k-j}$，$c_{n,k}=\prod_{i=1}^k(n-i+1)$ 

边界导数
$$
\begin{aligned}
\left.\frac{\part}{\part u}\pmb{f}(u,v)\right|_{u=0}&=n\sum_{j=0}^m B^m_j(v)(\pmb{b}_{1,j}-\pmb{b}_{0,j})\\
\left.\frac{\part}{\part u}\pmb{f}(u,v)\right|_{u=1}&=n\sum_{j=0}^m B^m_j(v)(\pmb{b}_{n,j}-\pmb{b}_{n-1,j})\\
\left.\frac{\part}{\part v}\pmb{f}(u,v)\right|_{v=0}&=m\sum_{j=0}^n B^n_j(v)(\pmb{b}_{i,1}-\pmb{b}_{i,0})\\
\left.\frac{\part}{\part v}\pmb{f}(u,v)\right|_{v=1}&=m\sum_{j=0}^n B^n_j(v)(\pmb{b}_{i,n}-\pmb{b}_{i,n-1})\\
\end{aligned}
$$

- $C^0$ 连续：块边界重合
- $C^1$ 连续：边界差向量相等

极形式 $f(u_1,\dots,u_n;v_1,\dots,v_m)$ 

- 对角：$f(u,\dots,u;v,\dots,v)=\pmb{f}(u,v)$ 
- 对称：$f(u_1,\dots,u_n;v_1,\dots,v_m)=f(u_{\pi(1)},\dots,u_{\pi(n)};v_{\mu(1)},\dots,v_{\mu(m)})$ 
- 仿射：$\sum_k\alpha_k=1$ 

$$
\begin{aligned}
f(u_1,\dots,\sum_k\alpha_ku_i^{(k)},\dots,u_d;v_1,\dots,v_n)&=\sum_k\alpha_k f(u_1,\dots,u_i^{(k)},\dots,u_d;v_1,\dots,v_n)\\
f(u_1,\dots,u_n;v_1,\dots,\sum_k\alpha_kv_i^{(k)},\dots,v_d)&=\sum_k\alpha_k f(u_1,\dots,u_n;v_1,\dots,v_i^{(k)},\dots,v_d)\\
\end{aligned}
$$

![image-20191106172140010](assets/image-20191106172140010.jpg)

![image-20191106172202969](assets/image-20191106172202969.jpg)

### 8.1.3 张量积 B 样条曲面

$k$ 阶，结阵 $\{(u_i,v_j)\}_{i,j=0}^{n+k,m+k}$，控制点阵 $\{\pmb{d}_{i,j}\}_{i,j=0}^{n,m}$，则 B 样条曲面
$$
\pmb{f}(u,v)=\sum_{i=0}^n\sum_{j=0}^m N_{i,k}(u)N_{j,k}(v)\pmb{d}_{i,j}\quad(u_{k-1}\le u\le u_{n+1},v_{k-1}\le v\le v_{m+1})
$$
总共 $(n-k+2)(m-k+2)$ 块

### 8.1.4 张量积有理样条曲面

#### 8.1.4.1 有理 Bezier 样条曲面块

控制点阵 $\{\pmb{b}_{i,j}\}_{i,j=0}^{n}$，权重阵 $\{w_{i,j}\}_{i,j=0}^{n}$，则有理 Bezier 样条曲面块
$$
\pmb{f}(u,v)=\frac{\sum_{i=0}^n\sum_{j=0}^n B^n_i(u)B^n_j(v)w_{i,j}\pmb{b}_{i,j}}{\sum_{i=0}^n\sum_{j=0}^n B^n_i(u)B^n_j(v)w_{i,j}}
$$

#### 8.1.4.2 有理 B 样条曲面

$k$ 阶，结阵 $\{(u_i,v_j)\}_{i,j=0}^{n+k,m+k}$，控制点阵 $\{\pmb{d}_{i,j}\}_{i,j=0}^{n,m}$，权重阵 $\{w_{i,j}\}_{i,j=0}^{n,m}$，则有理 B 样条曲面
$$
\pmb{f}(u,v)=\frac{\sum_{i=0}^n\sum_{j=0}^m N_{i,k}(u)N_{j,k}(v)w_{i,j}\pmb{d}_{i,j}}{\sum_{i=0}^n\sum_{j=0}^m N_{i,k}(u)N_{j,k}(v)w_{i,j}}\quad(u_{k-1}\le u\le u_{n+1},v_{k-1}\le v\le v_{m+1})
$$
总共 $(n-k+2)(m-k+2)$ 块

#### 8.1.4.3 旋转曲面

考虑 $u$ 方向 $xy$ 平面的有理 Bezier 母线的绕 $v$ 轴的轴旋转曲面，控制点 $\{\pmb{b}_i\}_{i=0}^n$，权重 $\{w_i\}_{i=0}^n$，绕 $v$ 轴旋转可得 4 段二次有理曲线（$1/4$ 圆弧）

![image-20191106183810744](assets/image-20191106183810744.jpg)

## 8.2 全度曲面

$$
F ( \pmb{x} ) = \sum _ { i + j + k = d\\i,j,k\ge0 } \frac { d ! } { i ! j ! k ! } \alpha ^ { i } \beta ^ { j } \gamma ^ { k } \pmb{f} (\underbrace{a,\dots,a}_i,\underbrace{b,\dots,b}_j,\underbrace{c,\dots,c}_k)
$$

![image-20191106201607921](assets/image-20191106201607921.jpg)

**连续性** 

考虑 2D 情形

![image-20191106214146127](assets/image-20191106214146127.jpg)

- $C^0$ 
  $$
  \begin{aligned}
  \pmb{f}(b,b) &= \pmb{g}(b,b)\\
  \pmb{f}(b,c) &= \pmb{g}(b,c)\\
  \pmb{f}(c,c) &= \pmb{g}(c,c)\\
  \end{aligned}
  $$

- $C^1$ 
  $$
  \begin{aligned}
  \pmb{f} ( a , b ) & = \pmb{g} ( a , b ) \\
  \pmb{f} ( b , d ) & = \pmb{g} ( b , d ) \\
  \pmb{f} ( a , c ) & = \pmb{g} ( a , c ) \\
  \pmb{f} ( c , d ) & = \pmb{g} ( c , d ) 
  \end{aligned}
  $$

# 9. 细分曲线和曲面

## 9.1 细分曲线

### 9.1.1 Corner Cutting Splines [Chaikin 1974]

- 各边插入中点
- 各边用中点替代

> **示例** 
>
> ![image-20191127144816254](assets/image-20191127144816254.jpg)

相当于：对每条边，插入 $\frac{1}{4}$ 和 $\frac{3}{4}$ 点，删去旧点
$$
\begin{aligned}
Q_{2i}&=\frac{3}{4}P_i+\frac{1}{4}P_{i+1}\\
Q_{2i+1}&=\frac{1}{4}P_i+\frac{3}{4}P_{i+1}
\end{aligned}
$$
![image-20191127151101172](assets/image-20191127151101172.jpg)

每次迭代点数加倍，写成矩阵的形式
$$
\left[\begin{matrix}
\vdots\\
p^{k+1}_{2i-2}\\
p^{k+1}_{2i-2}\\
p^{k+1}_{2i-2}\\
p^{k+1}_{2i-2}\\
p^{k+1}_{2i-2}\\
p^{k+1}_{2i-2}\\
\vdots
\end{matrix}\right]_{2n\times 1}
=\frac{1}{4}
\left[\begin{matrix}
\ddots\\
 & 3 & 1 & 0 & 0\\
 & 1 & 3 & 0 & 0\\
 & 0 & 3 & 1 & 0\\
 & 0 & 1 & 3 & 0\\
 & 0 & 0 & 3 & 1\\
 & 0 & 0 & 1 & 3\\
 &   &   &   &   &\ddots\\
\end{matrix}\right]_{2n\times n}
\left[\begin{matrix}
\vdots\\
p^{k+1}_{i-1}\\
p^{k+1}_{i}\\
p^{k+1}_{i+1}\\
p^{k+1}_{i+2}\\
\vdots\\
\end{matrix}\right]_{n\times 1}
$$
极限是 3 阶 2 次 $C^1$ 连续 B 样条

核为 $h_i=\frac{1}{4}[\underbrace{0,\dots,0}_{2i},1,3,3,1,\underbrace{0,\dots,0}_{2n-2i-4}]$ 

### 9.1.2 d 次 B 样条细分

Lane-Riesenfeld subdivision 算法

- 各边加中点
- 将每条边用中点替代，重复 $d$ 次

> **示例** 
>
> $d=2$ 
>
> ![image-20191127153832697](assets/image-20191127153832697.jpg)

极限是 $d+1$ 阶 $d$ 次 $C^{d-1}$ 连续 B 样条

核
$$
h_i=\frac{1}{2^{d+1}}[\underbrace{0,\dots,0}_{2i},\mathrm{C}_{d+2}^0,\dots,\mathrm{C}_{d+2}^{d+2},\underbrace{0,\dots,0}_{2n-2i-d-3}]
$$

### 9.1.3 谱收敛分析

局部迭代矩阵 $M_L$ 
$$
\left( \begin{array} { c }
{ x _ { -r } ^ { [ l + 1 ] } } \\
\vdots\\
{ x _ { -1 } ^ { [ l + 1 ] } } \\
{ x ^ { [ l + 1 ] } } \\
{ x _ { +1 } ^ { [ l + 1 ] } }\\
\vdots\\
{ x _ { +r } ^ { [ l + 1 ] } }
\end{array} \right)
= M_L
\left( \begin{array} { c }
{ x _ { -r } ^ { [ l ] } } \\
\vdots\\
{ x _ { -1 } ^ { [ l ] } } \\
{ x ^ { [ l + 1 ] } } \\
{ x _ { +1 } ^ { [ l ] } }\\
\vdots\\
{ x _ { +r } ^ { [ l ] } }
\end{array} \right)
$$
收敛必要条件：1 是最大的特征值（绝对值）

仿射不变性要求局部迭代矩阵行和为 1，这意味着 $\pmb{1}$ 向量必须是特征值 $1$ 的特征向量（$M_L$

## 9.2 细分曲面

### 9.2.1 张量积 B 样条细分曲面

规则闭合四边形网格

**划分** （删去旧顶点）

![image-20191217150449722](assets/image-20191217150449722.png)

**平均** 

![image-20191217150504769](assets/image-20191217150504769.png)

### 9.2.2 Catmull-Clark

任意闭合四边形网格

**划分**（删去旧顶点）

![image-20191127213527531](assets/image-20191127213527531.jpg)

