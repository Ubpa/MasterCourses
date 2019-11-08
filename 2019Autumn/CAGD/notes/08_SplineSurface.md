# 09. Spline Surfaces

![image-20191106161555916](assets/image-20191106161555916.jpg)

之前我们学习的 1D、2D、3D 曲线，输入都是 1 维的

将输入变为 2 维，那就会有曲面的输出

**参数样条曲面** 

- 两个参数 $(u,v)$ 
- 分段双变量多项式
- 将多片合成完整一片
- 每片称为样条碎片 spline patch

![image-20191106162052349](assets/image-20191106162052349.jpg)

**两种方法** 

- 张量积曲面 tensor product surface

  - 简单

  - 类似于曲线

  - 四边形碎片 quad patch

  - 度数各向异性 degree anisotropy

    ![image-20191106162405935](assets/image-20191106162405935.jpg)

- 全度曲面 total degree surface

  - 不直接（可借助于 blossoming 理解）

  - 度数各向同性 isotropic degree

  - 三角形碎片 triangle patch

  - 曲线的“自然”泛化

    ![image-20191106162415522](assets/image-20191106162415522.jpg)

## 8.1 张量积曲面

### 8.1.1 基础

给定 $n$ 维基函数空间
$$
\pmb{B}^{(curv)}=\{b_1(t),\dots,b_n(t)\}
$$
其中 $b_i(t):[t_0,t_1]\to \mathbb{R}^d$ 

构建一个双参数基函数空间
$$
\pmb{B}^{(surf)}=\{b_i(u)b_j(v)\}_{i,j=1}^n
$$

> 示例
>
> ![image-20191106164005823](assets/image-20191106164005823.jpg)
>
> 取 $b_i(t)=t^{i-1}$ 
>
> ![image-20191106164037976](assets/image-20191106164037976.jpg)

**张量积曲面** 
$$
\begin{aligned} \boldsymbol { f } ( u , v ) & = \sum _ { i = 1 } ^ { n } \sum _ { j = 1 } ^ { n } b _ { i } ( u ) b _ { j } ( v ) \boldsymbol { p } _ { i , j } \\ & = \sum _ { i = 1 } ^ { n } b _ { i } ( u ) \sum _ { j = 1 } ^ { n } b _ { j } ( v ) \boldsymbol { p } _ { i , j } \\ & = \sum _ { j = 1 } ^ { n } b _ { j } ( v ) \sum _ { i = 1 } ^ { n } b _ { i } ( u ) \boldsymbol { p } _ { i , j } \end{aligned}
$$
![image-20191106164244424](assets/image-20191106164244424.jpg)

“曲线的曲线”，顺序无关

**性质** 

- 线性不变性
- 仿射不变性要求 $\sum_{i=1}^n b_i(t)=1$ 
- 凸包 $b_i(t)\ge 0$ 

**偏导** 
$$
\begin{aligned} \frac { \partial ^ { r + s } } { \partial u ^ { r } \partial v ^ { s } } \sum _ { i = 1 } ^ { n } \sum _ { j = 1 } ^ { n } b _ { i } ( u ) b _ { j } ( v ) \boldsymbol { p } _ { i , j } & = \sum _ { j = 1 } ^ { n } \left( \frac { d ^ { s } } { d v ^ { s } } b _ { i } \right) ( v ) \sum _ { i = 1 } ^ { n } \left( \frac { d ^ { r } } { d u ^ { r } } b _ { i } \right) ( u ) \boldsymbol { p } _ { i , j } \\ & = \sum _ { i = 1 } ^ { n } \left( \frac { d ^ { r } } { d u ^ { r } } b _ { i } \right) ( u ) \sum _ { j = 1 } ^ { n } \left( \frac { d ^ { s } } { d v ^ { s } } b _ { j } \right) ( v ) \boldsymbol { p } _ { i , j } \end{aligned}
$$

> $$
> \begin{array} { l } { \frac { \partial } { \partial u } \sum _ { i = 1 } ^ { n } \sum _ { j = 1 } ^ { n } b _ { i } ( u ) b _ { j } ( v ) \boldsymbol { p } _ { i , j } = \sum _ { j = 1 } ^ { n } b _ { j } ( v ) \sum _ { i = 1 } ^ { n } \left( \frac { d } { d u } b _ { i } \right) ( u ) \boldsymbol { p } _ { i , j } } \\ { \frac { \partial } { \partial v } \sum _ { i = 1 } ^ { n } \sum _ { j = 1 } ^ { n } b _ { i } ( u ) b _ { j } ( v ) \boldsymbol { p } _ { i , j } = \sum _ { i = 1 } ^ { n } b _ { i } ( u ) \sum _ { j = 1 } ^ { n } \left( \frac { d } { d v } b _ { j } \right) ( v ) \boldsymbol { p } _ { i , j } } \end{array}
> $$

**法向** 
$$
\pmb{n}(u,v)=\text{normalize}\left(\frac{\part \pmb{f}}{\part u} \times \frac{\part \pmb{f}}{\part v}\right)
$$

### 8.1.2 张量积 Beizer 曲面

#### 8.1.2.1 引入

**双线性插值** 

![image-20191106165404612](assets/image-20191106165404612.jpg)
$$
\begin{aligned}
\pmb{h}_0 &= (1-u)\pmb{b}_{00}+u\pmb{b}_{10}\\
\pmb{h}_1 &= (1-u)\pmb{b}_{01}+u\pmb{b}_{11}\\
\pmb{x}(u,v) &= (1-v)\pmb{h}_0 + v\pmb{h}_1\\
&= (1-v)((1-u)\pmb{b}_{00}+u\pmb{b}_{10}) + v((1-u)\pmb{b}_{01}+u\pmb{b}_{11})\\
&= ( 1 - u ) ( 1 - v ) \boldsymbol { b } _ { 00 } + u ( 1 - v ) \boldsymbol { b } _ { 10 } + ( 1 - u ) v \boldsymbol { b } _ { 01 } + u v \boldsymbol { b } _ { 11 }
\end{aligned}
$$
**导数** 
$$
\begin{array} { l } { x _ { u } ( u , v ) = ( 1 - v ) \left( \boldsymbol { b } _ { 10 } - \boldsymbol { b } _ { 00 } \right) + v \left( \boldsymbol { b } _ { 11 } - \boldsymbol { b } _ { 01 } \right) } \\ { x _ { v } ( u , v ) = ( 1 - u ) \left( \boldsymbol { b } _ { 01 } - \boldsymbol { b } _ { 00 } \right) + u \left( \boldsymbol { b } _ { 11 } - \boldsymbol { b } _ { 10 } \right) } \\ { x _ { u u } ( u , v ) = x _ { v v } ( u , v ) = 0 } \\ { x _ { u v } ( u , v ) = \boldsymbol { b } _ { 00 } - \boldsymbol { b } _ { 10 } - \boldsymbol { b } _ { 01 } + \boldsymbol { b } _ { 11 } } \end{array}
$$
**双二次曲面** 

![image-20191106170300142](assets/image-20191106170300142.jpg)
$$
\begin{array} { l } { \boldsymbol { b } _ { 00 } ^ { 1 } = ( 1 - u ) ( 1 - v ) \boldsymbol { b } _ { 00 } + u ( 1 - v ) \boldsymbol { b } _ { 10 } + ( 1 - u ) v \boldsymbol { b } _ { 01 } + u v \boldsymbol { b } _ { 11 } } \\ { \boldsymbol { b } _ { 10 } ^ { 1 } = ( 1 - u ) ( 1 - v ) \boldsymbol { b } _ { 10 } + u ( 1 - v ) \boldsymbol { b } _ { 20 } + ( 1 - u ) v \boldsymbol { b } _ { 11 } + u v \boldsymbol { b } _ { 21 } } \\ { \boldsymbol { b } _ { 01 } ^ { 1 } = ( 1 - u ) ( 1 - v ) \boldsymbol { b } _ { 01 } + u ( 1 - v ) \boldsymbol { b } _ { 11 } + ( 1 - u ) v \boldsymbol { b } _ { 02 } + u v \boldsymbol { b } _ { 12 } } \\ { \boldsymbol { b } _ { 11 } ^ { 1 } = ( 1 - u ) ( 1 - v ) \boldsymbol { b } _ { 11 } + u ( 1 - v ) \boldsymbol { b } _ { 21 } + ( 1 - u ) v \boldsymbol { b } _ { 12 } + u v \boldsymbol { b } _ { 22 } } \end{array}
$$

$$
\begin{array} { l } { \pmb{x} ( u , v ) } \\ { = ( 1 - u ) ( 1 - v ) \boldsymbol { b } _ { 00 } ^ { 1 } + u ( 1 - v ) \boldsymbol { b } _ { 10 } ^ { 1 } + ( 1 - u ) v \boldsymbol { b } _ { 01 } ^ { 1 } + u v \boldsymbol { b } _ { 11 } ^ { 1 } } \\ { = \sum _ { i = 0 } ^ { 2 } \sum _ { j = 0 } ^ { 2 } B _ { i } ^ { 2 } ( u ) B _ { j } ^ { 2 } ( v ) \boldsymbol { b } _ { i , j } } \end{array}
$$

#### 8.1.2.2 Bezier 碎片

$$
\boldsymbol { f } ( u , v ) = \sum _ { i = 0 } ^ { d } \sum _ { j = 0 } ^ { d } B _ { i } ^ { ( d ) } ( u ) B _ { j } ^ { ( d ) } ( v ) \boldsymbol { p } _ { i , j }
$$

**性质** 

- 仿射不变性 affine invariance

- 凸包性 convex hull

- 端点插值 endpoint interpolation

  > 示例
  >
  > ![image-20191106170610473](assets/image-20191106170610473.jpg)
  >
  > ![image-20191106170618777](assets/image-20191106170618777.jpg)

- 边界切向量
  $$
  \begin{aligned} \left. \frac { \partial } { \partial u } f ( u , v ) \right| _ { u = 0 } & = \sum _ { i = 0 } ^ { d } \sum _ { j = 0 } ^ { d } B _ { i } ^ { ( d ) } ( v ) B _ { j } ^ { \prime } ( a ) ( 0 ) \boldsymbol { p } _ { i , j } \\ & = d \sum _ { j = 0 } ^ { d } B _ { j } ^ { ( d ) } ( v ) \left( \boldsymbol { p } _ { 1 , j } - \boldsymbol { p } _ { 0 , j } \right) \\ \left. \frac { \partial } { \partial u } \boldsymbol { f } ( u , v ) \right| _ { u = 1 } & = d \sum _ { j = 0 } ^ { d } B _ { j } ^ { ( d ) } ( v ) \left( \boldsymbol { p } _ { d , j } - \boldsymbol { p } _ { d - 1 , j } \right) \end{aligned}
  $$

#### 8.1.2.3 连续性

- $C^0$：边界控制点匹配
- $C^1$：边界差值向量匹配

![image-20191106171102140](assets/image-20191106171102140.jpg)

#### 8.1.2.4 极形式

曲面函数 $F$ 和极形式 $\pmb{f}$ 分别为
$$
\begin{array}{ll}
F:\mathbb{R}\times \mathbb{R} \to \mathbb{R}^n & F(u,v)\\
\pmb{f}:\mathbb{R}^d\times \mathbb{R}^d \to \mathbb{R}^n
\end{array}
$$
**性质** 

- 对角性 diagonality： $\pmb{f}(u,\dots,u;v,\dots,v)=F(u,v)$ 

- 对称性 symetry：$\pmb{f}(u_1,\dots,u_n;v_1,\dots,v_m)=\pmb{f}(u_{\pi(1)},\dots,u_{\pi(n)};v_1,\dots,v_{\pi(m)})$，其中 $\pi$ 和 $\mu$ 是任意置换 permutation

- 多重仿射 multi-affine
  $$
  \begin{aligned}
  \pmb{f}(u_1,\dots,\sum\alpha_k u_i^{(k)},\dots,u_n;v_1,\dots,v_m)&=\sum \alpha_k\pmb{f}(u_1,\dots,u_i^{(k)},\dots,u_n;v_1,\dots,v_m)\\
  \pmb{f}(u_1,\dots,u_n;v_1,\dots,\sum\alpha_k v_i^{(k)},\dots,v_m)&=\sum \alpha_k\pmb{f}(u_1,\dots,u_n;v_1,\dots,v_i^{(k)},\dots,v_m)\\
  \end{aligned}
  $$
  其中 $\sum \alpha_k=1$ 

极形式分离 $u$ 和 $v$，能用于推导一些性质和算法，类似于曲线情形

**Bezier 控制顶点的极形式** 

![image-20191106172140010](assets/image-20191106172140010.jpg)

**De Casteljau 算法的极形式** 

![image-20191106172202969](assets/image-20191106172202969.jpg)

### 8.1.3 张量积 B 样条曲面

**B 样条碎片** 

给定

- 阶数 $d$ 

- 结序列 $(u_1,\dots,u_n)$、$(v_1,\dots,v_m)$ 

- 控制点阵
  $$
  \begin{array} { c c c } { d _ { 0,0 } } & { \dots } & { d _ { n - d + 1,0 } } \\ { \dots } & { } & { \dots } \\ { d _ { 0 , m - d + 1 } } & { \dots } & { d _ { n - d + 1 , m - d + 1 } } \end{array}
  $$

则 B 样条碎片为
$$
\boldsymbol { f } ( u , v ) = \sum _ { i = 0 } ^ { d } \sum _ { j = 0 } ^ { d } N _ { i } ^ { ( d ) } ( u ) N _ { j } ^ { ( d ) } ( v ) \boldsymbol { p } _ { i , j }
$$
可以用 de Boor 算法计算该碎片（“曲线的曲线”思想），也可用 2D de Boor 算法，类似 2D de Casteljau 算法但权重不同

### 8.1.4 有理碎片

使用有理 Bezier/B 样条来创建碎片（rational Bezier patch / NURBS-patch）

想法

- 在 4D 的齐次空间创建参数曲面
- 投影到 $\omega=1$ 的欧式 3D 空间

欧式空间中 3D 曲面不是一个张量积曲面，齐次空间中 4D 曲面是张量积曲面

**有理 Bezier 碎片** 
$$
\begin{aligned} \boldsymbol { f } ^ { ( h o m ) } ( u , v ) = & \sum _ { i = 0 } ^ { d } \sum _ { j = 0 } ^ { d } B _ { i } ^ { ( d ) } ( u ) B _ { j } ^ { ( d ) } ( v ) \left( \begin{array} { c } { \omega _ { i , j } \boldsymbol { p } _ { i , j } } \\ { \omega _ { i , j } } \end{array} \right) \\ \boldsymbol { f } ^ { ( \text {Eucl} ) } ( u , v ) & = \frac { \sum _ { i = 0 } ^ { d } \sum _ { j = 0 } ^ { d } B _ { i } ^ { ( d ) } ( u ) B _ { j } ^ { ( d ) } ( v ) \omega _ { i , j } \boldsymbol { p } _ { i , j } } { \sum _ { i = 0 } ^ { d } \sum _ { j = 0 } ^ { d } B _ { i } ^ { ( d ) } ( u ) B _ { j } ^ { ( d ) } ( v ) \omega _ { i , j } } \end{aligned}
$$
**有理 B 样条碎片** 
$$
\begin{aligned} \boldsymbol { f } ^ { ( \text {hom } ) } ( u , v ) = & \sum _ { i = 0 } ^ { d } \sum _ { j = 0 } ^ { d } N _ { i } ^ { ( d ) } ( u ) N _ { j } ^ { ( d ) } ( v ) \left( \begin{array} { c } { \omega _ { i , j } \boldsymbol { p } _ { i , j } } \\ { \omega _ { i , j } } \end{array} \right) \\ \boldsymbol { f } ^ { ( \text {Eucl} ) } ( u , v ) = & \frac { \sum _ { i = 0 } ^ { d } \sum _ { j = 0 } ^ { d } N _ { i } ^ { ( d ) } ( u ) N _ { j } ^ { ( d ) } ( v ) \omega _ { i , j } \boldsymbol { p } _ { i , j } } { \sum _ { i = 0 } ^ { d } \sum _ { j = 0 } ^ { d } N _ { i } ^ { ( d ) } ( u ) N _ { j } ^ { ( d ) } ( v ) \omega _ { i , j } } \end{aligned}
$$
**旋转曲面** 

![image-20191106174743112](assets/image-20191106174743112.jpg)

给定曲线（母线 generatrix）的控制点 $\pmb{p}_1,\dots,\pmb{p}_n$，想计算有理曲面的 $\pmb{p}_{i,j}$，描述了母线在 $y$ 轴上的旋转曲面

![image-20191106174932822](assets/image-20191106174932822.jpg)

考虑简单情形，只看一个有理 Bezier 曲线，在 $u$ 方向给定控制顶点 $\pmb{p}_1,\dots,\pmb{p}_{d+1}$，然后引入新参数 $v$，在 $v$ 方向使用二次 Bezier 曲线

![image-20191106185101575](assets/image-20191106185101575.jpg)

使一个点按 $y$ 轴旋转，这样得到四段

![image-20191106183810744](assets/image-20191106183810744.jpg)

## 8.2 全度曲面

> total degree surface

### 8.2.1 Bezier 三角形

![image-20191106191805832](assets/image-20191106191805832.jpg)

能用三角形 de Casteljau 算法

- 极形式能很好地定义 Bezier 三角形
- 对开花值进行重心插值

点做参数的原函数 $F$ 与极形式 $\pmb{f}$ 分别为
$$
\begin{aligned}
F:\mathbb{R}^n \to \mathbb{R}^m\\
\pmb{f}:\mathbb{R}^{d\times n} \to \mathbb{R}^m
\end{aligned}
$$
性质

- 对角性：$\pmb{f}(\pmb{t},\dots,\pmb{t})=\pmb{F}(\pmb{t})$ 

- 对称性：$\pmb{f}(\pmb{t}_1,\dots,\pmb{t}_d)=\pmb{f}(\pmb{t}_{\pi(1)},\dots,\pmb{p}_{\pi(d)})$ 

- 多重仿射：
  $$
  \pmb{f}(\pmb{t}_1,\dots,\sum\alpha_k\pmb{t}_i^{(k)},\dots,\pmb{t}_d)=\sum \alpha_k \pmb{f}(\pmb{t}_{\pi(1)},\dots,\pmb{t}_i^{(k)},\dots,\pmb{p}_{\pi(d)})
  $$

> 示例
>
> 双变量单项式基
> $$
> B=\{1,u,v,u^2,uv,v^2\}
> $$
> 对应的极形式为
> $$
> \begin{aligned}
> B=\{&\\
> &1,\\
> &\frac{1}{2}(u_1+u_2),\frac{1}{2}(v_1+v_2)\\
> &u_1u_2,\frac{1}{4}(u_1v_1+u_1v_2+u_2v_1+u_2v_2),v_1v_2\\
> \}
> \end{aligned}
> $$

**重心坐标** 

![image-20191106193817462](assets/image-20191106193817462.jpg)
$$
\pmb{p}=\alpha \pmb{p}_1+\beta\pmb{p}_2 +\gamma\pmb{p}_3
$$
其中 $\alpha + \beta + \gamma = 1$ 
$$
\alpha = \frac { \operatorname { area } \left( \Delta \left( \boldsymbol { p } _ { 2 } , \boldsymbol { p } _ { 3 } , \boldsymbol { p } \right) \right) } { \operatorname { area } \left( \Delta \left( \boldsymbol { p } _ { 1 } , \boldsymbol { p } _ { 2 } , \boldsymbol { p } _ { 3 } \right) \right) } , \beta = \frac { \operatorname { area } \left( \Delta \left( \boldsymbol { p } _ { 1 } , \boldsymbol { p } _ { 3 } , \boldsymbol { p } \right) \right) } { \operatorname { area } \left( \Delta \left( \boldsymbol { p } _ { 1 } , \boldsymbol { p } _ { 2 } , \boldsymbol { p } _ { 3 } \right) \right) } , \gamma = \frac { \operatorname { area } \left( \Delta \left( \boldsymbol { p } _ { 1 } , \boldsymbol { p } _ { 2 } , \boldsymbol { p } \right) \right) } { \operatorname { area } \left( \Delta \left( \boldsymbol { p } _ { 1 } , \boldsymbol { p } _ { 2 } , \boldsymbol { p } _ { 3 } \right) \right) }
$$
可以将公式变一下
$$
\begin{aligned}
\pmb{p} &= \alpha \boldsymbol { p } _ { 1 } + \beta \boldsymbol { p } _ { 2 } + \gamma \boldsymbol { p } _ { 3 }\\
&= \alpha \boldsymbol { p } _ { 1 } + \beta \boldsymbol { p } _ { 2 } + ( 1 - \alpha - \beta ) \boldsymbol { p } _ { 3 }\\
&= \alpha \boldsymbol { p } _ { 1 } + \beta \boldsymbol { p } _ { 2 } + \boldsymbol { p } _ { 3 } - \alpha \boldsymbol { p } _ { 3 } - \beta \boldsymbol { p } _ { 3 }\\
&= \boldsymbol { p } _ { 3 } + \alpha \left( \boldsymbol { p } _ { 1 } - \boldsymbol { p } _ { 3 } \right) + \beta \left( \boldsymbol { p } _ { 2 } - \boldsymbol { p } _ { 3 } \right)
\end{aligned}
$$
![image-20191106195126023](assets/image-20191106195126023.jpg)

![image-20191106195626464](assets/image-20191106195626464.jpg)

**Bezier 三角形** 

- 使用三角形上 3D 坐标作为输入，对应于 有一个重心坐标 $(\alpha,\beta,\gamma)$，其中 $\alpha + \beta + \gamma=1$ 
- 输出是 3D 点
- 控制点为 $\pmb{p}(\underbrace{a,\dots,a}_i,\underbrace{b,\dots,b}_j,\underbrace{c,\dots,c}_k)$，其中 $i+j+k=d$ 

de Casteljau 算法

![image-20191106201607921](assets/image-20191106201607921.jpg)

解析式为
$$
F ( \pmb{x} ) = \sum _ { i + j + k = d\\i,j,k\ge0 } \frac { d ! } { i ! j ! k ! } \alpha ^ { i } \beta ^ { j } \gamma ^ { k } \pmb{f} (\underbrace{a,\dots,a}_i,\underbrace{b,\dots,b}_j,\underbrace{c,\dots,c}_k)
$$
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

