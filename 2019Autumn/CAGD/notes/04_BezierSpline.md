# 04. Bezier Splines

Bezier 曲线的问题

- 高多项式次数
- 全局，伪局部
- 只在端点插值

因此使用 Bezier 样条

![1570880364107](assets/1570880364107.jpg)

插值问题

- 输入
  - 控制点 control points：$\pmb{k}_0,\dots,\pmb{k}_n\in \mathbb{R}^3$ 
  - 结序列 knot sequence：$t_0,\dots,t_n\in \mathbb{R},t_0<t_1<\dots<t_n$  
- 输出：$\pmb{x}(t)$，满足 $\pmb{x}(t_i)=\pmb{k}_i$ 
- 方法：利用交点条件 intersection conditions 拼接 n 条 Bezier 曲线

关键点

- 连续性 continuity
- 参数化 Parameterization
- 阶数 Degree

## 4.1 连续性

给定两条曲线

- $\pmb{x}_1(t),t\in[t_0,t_1]$ 
- $\pmb{x}_2(t),t\in[t_1,t_2]$ 

### 4.1.1 参数连续 Parametric Continuity

$\pmb{x}_1(t)$ 和 $\pmb{x}_2(t)$ 在 $t_1$ 处 $C^r$ 连续是指它们的从 $0^\text{th}$ 到 $r^\text{th}$ 导数向量 derivative vectors 在 $t_1$ 相等。

> $C^0$：位置连续
>
> $C^1$：接合处 junction 一阶导数（速度）连续
>
> $C^2$：结合处二阶导数（加速度）连续
>
> ![1570881266929](assets/1570881266929.jpg)

依赖于参数化，对动画有用（物体运动，相机轨迹）

### 4.1.2 几何连续 Geometric Continuity

$\pmb{x}_1(t)$ 和 $\pmb{x}_2(t)$ 在 $t_1$ 处 $G^r$ 连续是指它们能重参数化 reparameterized 使得它们在 $t_1$ 处 $C^r$ 连续。

> $G^0=C^0$：位置连续
>
> $G^1$：切向连续
>
> $G^2$：切向和曲率连续

## 4.2 参数化

局部与全局参数化

给定

- $\pmb{y}(u)$：$[0,1]$ 上的 Bezier 曲线
- $\pmb{x}(u)$：$[t_i,t_{i+1}]$ 上的 Bezier 曲线

令 $u(t)=\frac{t-t_i}{t_{i+1}-t_i}$ 

则 $\pmb{x}(t)=\pmb{y}(u(t))$，局部参数 u 从 0 到 1，全局参数 t 从 $t_i$ 到 $t_{i+1}$ 

导数：$\pmb{x}^{(n)}(t)=\frac{y^{(n)}(u(t))}{(t_{i+1}-t_i)^n}$ 

> $$
> \begin{align}
> \dot{\pmb{x}}(t)&=\dot{\pmb{y}}(u(t))\dot{u}(t)=\frac{\dot{\pmb{y}}(u(t))}{t_{i+1}-t_i}\\
> \ddot{\pmb{x}}(t)&=\ddot{\pmb{y}}(u(t))(\dot{u}(t))^2+\dot{\pmb{y}}(u(t))\ddot{u}(t)=\frac{\ddot{\pmb{y}}(u(t))}{(t_{i+1}-t_i)^2}\\
> ...&\\
> \pmb{x}^{(n)}(t)&=\frac{y^{(n)}(u(t))}{(t_{i+1}-t_i)^n}
> \end{align}
> $$

端点导数
$$
\begin{array} { l }
{ \dot { \pmb{x} } \left( t _ { i } \right) = \frac { n \cdot \left( \pmb{b} _ { 1 } - \pmb{b} _ { 0 } \right) } { t _ { i + 1 } - t _ { i } } } \\
{ \dot { \pmb{x} } \left( t _ { i + 1 } \right) = \frac { n \cdot \left( \pmb{b} _ { n } - \pmb{b} _ { n - 1 } \right) } { t _ { i + 1 } - t _ { i } } } \\
{ \ddot { \pmb{x} } \left( t _ { i } \right) = \frac { n \cdot ( n - 1 ) \cdot \left( \pmb{b} _ { 2 } - 2 \pmb{b} _ { 1 } + \pmb{b} _ { 0 } \right) } { \left( t _ { i + 1 } - t _ { i } \right) ^ { 2 } } } \\
{ \ddot { \pmb{x} } \left( t _ { i + 1 } \right) = \frac { n \cdot ( n - 1 ) \cdot \left( \pmb{b} _ { n } - 2 \pmb{b} _ { n - 1 } + \pmb{b} _ { n - 2 } \right) } { \left( t _ { i + 1 } - t _ { i } \right) ^ { 2 } } }
\end{array}
$$

## 4.3 一般情况

两条 n 阶 bezier 曲线
$$
\begin{align}
\pmb{k}_{j-1}=\pmb{b_0}^-,\pmb{b}_1^-,\dots,\pmb{b_n}^-=&\pmb{k}_j\\
&\pmb{k}_{j}=\pmb{b_0}^+,\pmb{b}_1^+,\dots,\pmb{b_n}^+=\pmb{k}_{j+1}\\
\end{align}
$$
![1570887364311](assets/1570887364311.jpg)

$C^1$ 连续
$$
\frac { \boldsymbol { b } _ { n } ^ { - } - \boldsymbol { b } _ { n - 1 } ^ { - } } { \Delta_{j-1} } = \frac { \boldsymbol { b } _ { 1 } ^ { + } - \boldsymbol { b } _ { 0 } ^ { + } } { \Delta_j }
$$
![1570887873827](assets/1570887873827.jpg)

$G^1$ 连续

$\pmb{b}_{n-1}^-$，$\pmb{k_j}$，$\pmb{b}_1^+$ 共线，比 $C^1$ 连续限制少

## 4.4 选择阶数

$d=0$（分段常数）：不光滑

$d=1$（分段线性）：不够光滑

$d=2$（分段二次 quadratic）：常数 2 阶导，不够弯曲

$d=3$（分段三次 cubic）：常用于计算机图形学应用

![1570888498117](assets/1570888498117.jpg)

优点

- 不用修改二阶导就可以有 $C^2$ 连续（？？？）
- 感观重要
  - 运动：位置、速度、加速度
  - 二阶着色不连续是可见的（反射性物体）
- 插值所有点（遵循相同端点条件）的二次曲线中，分段三次曲线是积分加速度最小的

## 4.5 Bezier 样条连续性

### 4.5.1 $C^0$ 连续

相邻样条端点相接

![1570889490230](assets/1570889490230.jpg)

### 4.5.2 $C^1$ 连续

$$
\frac{\pmb{p}^{(i+1)}_1-\pmb{p}^{(i+1)}_0}{\Delta_i} = \frac{\pmb{p}^{(i)}_n-\pmb{p}^{(i)}_{n-1}}{\Delta_{i-1}}
$$

![1570890286714](assets/1570890286714.jpg)

> 速度向量相等，但两段长度应成比例，并不相等，图示有点误导性

### 4.5.3 $C^2$ 连续

$$
\frac{\pmb{p}^{(i+1)}_2-2\pmb{p}^{(i+1)}_1+\pmb{p}^{(i+1)}_0}{\Delta_i^2} = \frac{\pmb{p}^{(i)}_n-2\pmb{p}^{(i)}_{n-1}+\pmb{p}^{(i)}_{n-2}}{\Delta_{i-1}^2}
$$

![1570891382268](assets/1570891382268.jpg)

蕴含 $C^1$，三角形要相似

### 4.5.4 $G^1$ 连续

$\pmb{p}^{(i)}_{n-1}$、$\pmb{p}^{(i)}_{n}=\pmb{p}^{(i+1)}_{0}$ 与 $\pmb{p}^{(i+1)}_1$ 共线即可

![1570894263016](assets/1570894263016.jpg)

## 4.6 实践

- 所有人都在用三次 cubic Bezier 曲线
- 更高阶很少使用
- 传统：“点 points & 柄 handles”接口
- 四种模式
  - 非连续 discontinuous（两条曲线）
  - $C^0$ 连续（端点相接）
  - $G^1$ 连续（切向量连续）：柄同向，但长度不同
  - $C^1$ 连续：柄对称
- $C^2$ 更受限：通过 $\pmb{k}_i$ 控制

记
$$
\begin{aligned} \boldsymbol { d } ^ { - } & = \boldsymbol { b } _ { n - 1 } ^ { - } + \frac { \Delta _ { j } } { \Delta _ { j - 1 } } \left( \boldsymbol { b } _ { n - 1 } ^ { - } - \boldsymbol { b } _ { n - 2 } ^ { - } \right) \\ \boldsymbol { d } ^ { + } & = \boldsymbol { b } _ { 1 } ^ { + }  - \frac { \Delta _ { j - 1 } } { \Delta _ { j } } \left( \boldsymbol { b } _ { 2 } ^ { + } - \boldsymbol { b } _ { 1 } ^ { + } \right) \end{aligned}
$$
则 $C^2\Leftrightarrow C^1,\pmb{d}^-=\pmb{d}^+$ 

![1570932420948](assets/1570932420948.jpg)

$G^2$ 连续要求

- $\ddot{\pmb{x}}_2(t_i)-\ddot{\pmb{x}}_1(t_i)\|\dot{\pmb{x}}(t_i)$ ![1570932618930](assets/1570932618930.jpg)
- $G^1$ 连续
- $\boldsymbol { b } _ { n - 2 } ^ { - } , \boldsymbol { b } _ { n - 1 } ^ { - } , \boldsymbol { k } _ { j } , \boldsymbol { b } _ { 1 } ^ { + } , \boldsymbol { b } _ { 2 } ^ { + }$ 共面
- $\frac { \operatorname { area } \left( \boldsymbol { b } _ { n - 2 } ^ { - } , \boldsymbol { b } _ { n - 1 } ^ { - } , \boldsymbol { k } _ { j } \right) } { \operatorname { area } \left( \boldsymbol { k } _ { j } , \boldsymbol { b } _ { 1 } ^ { + } , \boldsymbol { b } _ { 2 } ^ { + } \right) } = \frac { a ^ { 3 } } { b ^ { 3 } }$ ![1570932788624](assets/1570932788624.jpg)

## 4.7 三次 Bezier 样条

给定

- 控制点：$\pmb{k}_0,\dots,\pmb{k}_1\in\mathbb{R}^3$ 
- 结序列：$t _ { 0 } , \ldots , t _ { n } \in \mathbb { R }, t_0<t_1<\dots<t_n$ 

想要得到 Bezier 点 $\pmb{b}_0,\dots,\pmb{b}_{3n}$ 来插值 $C^2$ 连续分段三次 Bezier 样条曲线

> 示例
>
> ![1570933408265](assets/1570933408265.jpg)

有 $3n+1$ 个点

- 插值条件 $\pmb{b}_{3i}=\pmb{k}_i(i=0,\dots,n)$，共 $n+1$ 个方程
- 在 $\pmb{k}_i(i=1,\dots,n-1)$ 处 $C^1$ 连续， 共 $n-1$ 个方程
- 在 $\pmb{k}_i(i=1,\dots,n-1)$ 处 $C^2$ 连续，共 $n-1$ 个方程

共 $3n -1$ 个方程

需要**两个**额外的条件：端点条件 end conditions

### 4.7.1 端点条件

#### 4.7.1.1 Bessel 端点条件

$\pmb{k}_0$ 处切向量等于插值 $\left\{ \boldsymbol { k } _ { 0 } , \boldsymbol { k } _ { 1 } , \boldsymbol { k } _ { 2 } \right\}$ 的抛物线 prarabola 在 $\pmb{k}_0$ 处的切向量

> 此处不准确，应该是**速度向量** 

![1570934822241](assets/1570934822241.jpg)

其中插值 $\left\{ \boldsymbol { k } _ { 0 } , \boldsymbol { k } _ { 1 } , \boldsymbol { k } _ { 2 } \right\}$ 的抛物线 prarabola 为
$$
\pmb{p} ( t ) = \frac { \left( t _ { 2 } - t \right) \left( t _ { 1 } - t \right) } { \left( t _ { 2 } - t _ { 0 } \right) \left( t _ { 1 } - t _ { 0 } \right) } \pmb{k} _ { 0 } + \frac { \left( t _ { 2 } - t \right) \left( t - t _ { 0 } \right) } { \left( t _ { 2 } - t _ { 1 } \right) \left( t _ { 1 } - t _ { 0 } \right) } \pmb{k} _ { 1 } + \frac { \left( t _ { 0 } - t \right) \left( t _ { 1 } - t \right) } { \left( t _ { 2 } - t _ { 1 } \right) \left( t _ { 2 } - t _ { 0 } \right) } \pmb{k} _ { 2 }
$$
则导数为
$$
\dot { \pmb{p} } \left( t _ { 0 } \right) = - \frac { \left( t _ { 2 } - t _ { 0 } \right) + \left( t _ { 1 } - t _ { 0 } \right) } { \left( t _ { 2 } - t _ { 0 } \right) \left( t _ { 1 } - t _ { 0 } \right) } \pmb{k} _ { 0 } + \frac { \left( t _ { 2 } - t _ { 0 } \right) } { \left( t _ { 2 } - t _ { 1 } \right) \left( t _ { 1 } - t _ { 0 } \right) } \pmb{k} _ { 1 } - \frac { \left( t _ { 1 } - t _ { 0 } \right) } { \left( t _ { 2 } - t _ { 1 } \right) \left( t _ { 2 } - t _ { 0 } \right) } \pmb{k} _ { 2 }
$$
则 $\pmb{b}_1$ 的位置为
$$
\pmb { b } _ { 1 } = \pmb { b } _ { 0 } + \frac { t _ { 1 } - t _ { 0 } } { 3 } \dot { \pmb { p } } \left( t _ { 0 } \right)
$$

> $$
> { \dot { \pmb{x} } \left( t _ { i } \right) = \frac { n \cdot \left( \pmb{b} _ { 1 } - \pmb{b} _ { 0 } \right) } { t _ { i + 1 } - t _ { i } } }
> $$

#### 4.7.1.2 自然端点条件

$$
\begin{array} { l } { \ddot { \pmb{x} } \left( t _ { 0 } \right) = 0 \Leftrightarrow \pmb{b} _ { 1 } = \frac { \pmb{b} _ { 2 } + \pmb{b} _ { 0 } } { 2 } } \\ { \ddot { \pmb{x} } \left( t _ { n } \right) = 0 \Leftrightarrow \pmb{b} _ { 3 n - 1 } = \frac { \pmb{b} _ { 3 n - 2 } + \pmb{b} _ { 3 n } } { 2 } } \end{array}
$$

>$$
>{ \ddot { \pmb{x} } \left( t _ { i } \right) = \frac { n \cdot ( n - 1 ) \cdot \left( \pmb{b} _ { 2 } - 2 \pmb{b} _ { 1 } + \pmb{b} _ { 0 } \right) } { \left( t _ { i + 1 } - t _ { i } \right) ^ { 2 } } }
>$$

#### 4.7.1.3 对比

- Bessel

  ![1570935429541](assets/1570935429541.jpg)

- 自然

  ![1570935447251](assets/1570935447251.jpg)

### 4.7.2 参数化

通常结序列没有给定，但它会影响曲线

- 等距 equidistant （均匀 uniform）参数化：$t_{i+1}-t_i=C$ 

- 弦 chordal 参数化：$t_{i+1}-t_i=\|\pmb{k}_{i+1}-\pmb{k}_i\|$ 

- 向心 centripetal 参数化：$t_{i+1}-t_i=\sqrt{\|\pmb{k}_{i+1}-\pmb{k}_i\|}$ 

- Foley 参数化

  $$
  t _ { i + 1 } - t _ { i } = \left\| \boldsymbol { k } _ { i + 1 } - \boldsymbol { k } _ { i } \right\| \cdot \left( 1 + \frac { 3 } { 2 } \frac { \widehat { \alpha } _ { i } \left\| \boldsymbol { k } _ { i } - \boldsymbol { k } _ { i - 1 } \right\| } { \left\| \boldsymbol { k } _ { i } - \boldsymbol { k } _ { i - 1 } \right\| + \left\| \boldsymbol { k } _ { i + 1 } - \boldsymbol { k } _ { i } \right\| } + \frac { 3 } { 2 } \frac { \widehat { \alpha } _ { i + 1 } \left\| \boldsymbol { k } _ { i + 1 } - \boldsymbol { k } _ { i } \right\| } { \left\| \boldsymbol { k } _ { i + 1 } - \boldsymbol { k } _ { i } \right\| + \left\| \boldsymbol { k } _ { i + 2 } - \boldsymbol { k } _ { i + 1 } \right\| } \right)
  $$

  其中 $\hat { \alpha } _ { i } = \min \left( \pi - \alpha _ { i } , \frac { \pi } { 2 } \right)$，$\alpha _ { i } = \operatorname { angle } \left( \boldsymbol { k } _ { i - 1 } , \boldsymbol { k } _ { i } , \boldsymbol { k } _ { i + 1 } \right)$。

> 对比示例
>
> - uniform
>
> ![1570936460763](assets/1570936460763.jpg)
>
> - chordal
>
> ![1570936478180](assets/1570936478180.jpg)
>
> - centripetal
>
> ![1570936515491](assets/1570936515491.jpg)
>
> - foley
>
> ![1570936687235](assets/1570936687235.jpg)
>
> foley 最好

### 4.7.3 闭合曲线

首尾相同 $\pmb{k}_n=\pmb{k}_0$，端点条件为
$$
\begin{array} { l } { \dot { \pmb{x} } \left( t _ { 0 } \right) = \dot { \pmb{x} } \left( t _ { n } \right) } \\ { \ddot { \pmb{x} } \left( t _ { 0 } \right) = \ddot { \pmb{x} } \left( t _ { n } \right) } \end{array}
$$
优点是不需要选择端点条件

> 示例
>
> ![1570937197598](assets/1570937197598.jpg)
>
> ![1570937208677](assets/1570937208677.jpg)
>
> ![1570937218511](assets/1570937218511.jpg)

