# 02. 离散微分几何

> **目标** 
>
> 计算近似的曲面微分性质
>
> - 局部平均区域 local averaging region
> - 法向 normal vector
> - 梯度 gradient
> - Laplace-Beltrami 算子 operator
> - 离散曲率 discrete curvature

## 02.1 局部平均区域

> local average region

![image-20200623160327177](assets/02_Differential_Geometry/image-20200623160327177.png)

一个点 $\mathbf{x}$ 的局部邻域 $\Omega(\mathbf{x})$ 的空间平均

- $\mathbf{x}$：一个网格顶点
- $\Omega(\mathbf{x})$：$\mathbf{x}$ 的 n-ring 邻域 neighborhood 或局部测地线的球 local geodesic ball
  - 大尺度：平滑
  - 小尺度：对干净网格，精确

分类

- barycentric cell：三角形重心 barycenter + 邻边中点

  ![image-20200623160518837](assets/02_Differential_Geometry/image-20200623160518837.png)

- voronoi cell：三角形外心 circumcenter + 邻边中点

  > 离 $\mathbf{x}$ 近的点（比三角形其他两点近）

  ![image-20200623160620151](assets/02_Differential_Geometry/image-20200623160620151.png)

- mixed voronoi cell：锐角三角形外心 + 钝角三角形对边中点 + 邻边中点

  ![image-20200623160747949](assets/02_Differential_Geometry/image-20200623160747949.png)

## 02.2 法向

> normal vector

三角形的法向是良定义 well-defined 的

顶点法向：1-ring 邻域法向的空间平均
$$
\mathbf{n}(v)=\operatorname{normalize}\left(\sum_{T\in\Omega(v)}w_T \mathbf{n}(T)\right)
$$
其中 $w_T$ 有三种常见的取法

- 常量：$w_T=1$ 
- 三角形面积：$w_T=\operatorname{area}(T)$ 
- 角度：$w_T = \theta(T)$ 

## 02.3 梯度

> gradient
>
> !!! 很重要 !!!

![image-20200623164530260](assets/02_Differential_Geometry/image-20200623164530260.png)

给定顶点上的函数值，计算三角形上的梯度
$$
f(\mathbf{x})=\alpha(\mathbf{x})f_i+\beta(\mathbf{x})f_j+\gamma(\mathbf{x})f_k
$$
梯度
$$
\nabla f(\mathbf{x})=f_i\nabla \alpha(\mathbf{x})+f_j\nabla \beta(\mathbf{x})+f_k\nabla \gamma(\mathbf{x})
$$
其中
$$
\begin{aligned}\nabla \alpha(\mathbf{x})&= \nabla\frac{A_i(\mathbf{x})}{A_T}\\&= \nabla \frac{(\mathbf{x}-\mathbf{x}_j)\cdot(\mathbf{x}_k-\mathbf{x}_j)^\perp}{2A_T}\\&= \frac{(\mathbf{x}_k-\mathbf{x}_j)^\perp}{2A_T}\\\nabla \beta(\mathbf{x}) &= \frac{(\mathbf{x}_i-\mathbf{x}_k)^\perp}{2A_T}\\\nabla \gamma(\mathbf{x}) &= \frac{(\mathbf{x}_j-\mathbf{x}_i)^\perp}{2A_T}\\\end{aligned}
$$

> $\mathbf{v}^\perp$ 就是将 $\mathbf{v}$ 绕三角形平面法向逆时针旋转 90°
>
> 将旋转用矩阵表示为 $A$，则
> $$
> \mathbf{v}^\perp=A\mathbf{v}
> $$

因此
$$
\nabla f(\mathbf{x})=f_i\frac{(\mathbf{x}_k-\mathbf{x}_j)^\perp}{2A_T}+f_j\frac{(\mathbf{x}_i-\mathbf{x}_k)^\perp}{2A_T}+f_k\frac{(\mathbf{x}_j-\mathbf{x}_i)^\perp}{2A_T}
$$
由于
$$
(\mathbf{x}_k-\mathbf{x}_j)^\perp+(\mathbf{x}_i-\mathbf{x}_k)^\perp+(\mathbf{x}_j-\mathbf{x}_i)^\perp=\mathbf{0}
$$

> 证明
> $$
> \begin{aligned} &(\mathbf{x}_k-\mathbf{x}_j)^\perp+(\mathbf{x}_i-\mathbf{x}_k)^\perp+(\mathbf{x}_j-\mathbf{x}_i)^\perp\\=& A(\mathbf{x}_k-\mathbf{x}_j)+ A(\mathbf{x}_i-\mathbf{x}_k)+A(\mathbf{x}_j-\mathbf{x}_i)\\=& A(\mathbf{x}_k-\mathbf{x}_j+\mathbf{x}_i-\mathbf{x}_k+\mathbf{x}_j-\mathbf{x}_i)\\=& A\mathbf{0}\\=& \mathbf{0}\end{aligned}
> $$

因此
$$
\nabla f(\mathbf{x})=(f_j-f_i)\frac{(\mathbf{x}_i-\mathbf{x}_k)^\perp}{2A_T}+(f_k-f_i)\frac{(\mathbf{x}_j-\mathbf{x}_i)^\perp}{2A_T}
$$
性质

- 在三角形面上恒定
- $C^0$ 
- 顶点上无定义

## 02.4 Laplace-Beltrami 算子

> Laplace-Beltrami operator
>
> ref: Discrete Laplace operators: No free lunch
>
> !!! 核心 !!!

### 02.4.1 性质

Laplace-Beltrami 算子 $\Delta = - \operatorname{div}\operatorname{grad}$ 

$L^2$ 内积：$(u,v)_{L_2}=\int_S uv\mathbb{d}A$ 

- (NULL)：当 $f$ 是常值函数时，$\Delta f = 0$ 
- (SYM) Symmetry：$(\Delta f,g)_{L^2}=(f,\Delta g)_{L^2}$ 
- (LOC) Local support：$\forall p,q \text{ s.t. } p\neq q$，$\Delta f(p)$ 与 $f(q)$ 无关
- (LIN) Linear precision：当 $S\in \mathbb{R}^2$ 且 $f=ax+by+c$ 是线性时，$\Delta f=0$ 
- (MAX) maximum princiole：调和 harmonic 函数（$\Delta f=0$）在内点处没有局部最大/最小值
- (PSD) Positive semi-definiteness：Dirichlet 能量 $E_D(f)=\int_S\|\operatorname{grad} f\|_2^2\mathbb{d}A=(\Delta f,f)_{L^2}$ 是非负的

### 02.4.2 离散拉普拉斯算子

基于顶点 vertex-based 的函数
$$
(Lf)_i=\sum_{j\in \Omega(i)}\omega_{ij}(f_i-f_j)
$$

> 梯度在三角形面上是常数，因此拉普拉斯值为 0
>
> 故拉普拉斯值存在于顶点上

离散拉普拉斯算子的期望性质

- NULL：自动满足（$f_j-f_i=0$）

- SYM：$\omega_{ij}=\omega_{ji}$ 

- LOC：当 $v_i,v_j$ 不相邻时，$\omega_{ij}=0$ 

- LIN：$f(\mathbf{x})=\mathbf{a}^\top\mathbf{x}+b \Rightarrow (L\mathbf{x})_i=\sum_{j\in \Omega(i)}\omega_{ij}(\mathbf{x}_i-\mathbf{x}_j)=\mathbf{0}$ 

- (POS) Positive weights: $\forall i,j\text{ s.t. } i\neq j\Rightarrow \omega_{ij}>0$，MAX 的充足条件

  > Tutte's embedding theorem：LOC + LIN + POS（参数化双射）

- PSD：$L$ 是对称半正定矩阵，离散 Dirichlet 能量 $E_D(f)=\sum_{i,j}\omega_{i,j}(f_i-f_j)^2$ 

  > SYM + POS $\Rightarrow$ PSD
  >
  > PSD $\nRightarrow$ POS

### 02.4.3 示例

![image-20200623190810836](assets/02_Differential_Geometry/image-20200623190810836.png)

*没有一个可以满足所有性质* 

#### 02.4.3.1 Uniform Laplacian

取 $\omega_{i,j}=1$ 或 $\omega_{i,j}=\frac{1}{N_i}$，则 $(Lf)_i=\sum_{j\in\Omega(i)}(f_j-f_i)$ 或 $(Lf)_i=\frac{1}{N_i}\sum_{j\in\Omega(i)}(f_j-f_i)$ 

不满足 LIN

该定义只基于网格拓扑，不考虑顶点位置

#### 02.4.3.2 Cotangent Formula

![image-20200623184145892](assets/02_Differential_Geometry/image-20200623184145892.png)
$$
\int_{A_i}\Delta f\mathbb{d}A=\int_{A_i}\operatorname{div}\nabla f\mathbb{d}A=\int_{\partial A_i}\nabla f\cdot \mathbf{n}\mathbb{d}s
$$

> 微分几何，2D 的高斯散度公式

其中

- $A_i$ 是 $v_i$ 的局部平均区域
- $\partial A_i$ 是 $A_i$ 的边界
- $\mathbf{n}$ 是边界的外法向
- $f$ 是定义在网格上的信号

将积分分割为每个三角形 $T$ 

![image-20200623184403355](assets/02_Differential_Geometry/image-20200623184403355.png)
$$
\begin{aligned}
 &\int_{\partial A_i \cap T}\nabla f\cdot \mathbf{n}\mathbb{d}s\\
=&\nabla f\cdot \int_{\partial A_i \cap T}\mathbf{n}\mathbb{d}s\\
=&\nabla f\cdot (\mathbf{a}-\mathbf{b})^\perp\\
=&\frac{1}{2}\nabla f \cdot (\mathbf{x}_j-\mathbf{x}_k)^\perp\\
=&\frac{1}{2}\left((f_j-f_i)\frac{(\mathbf{x}_i-\mathbf{x}_k)^\perp}{2A_T}+(f_k-f_i)\frac{(\mathbf{x}_j-\mathbf{x}_i)^\perp}{2A_T}\right) \cdot (\mathbf{x}_j-\mathbf{x}_k)^\perp\\
=&\frac{1}{2}\left((f_j-f_i)\frac{(\mathbf{x}_i-\mathbf{x}_k)\cdot(\mathbf{x}_j-\mathbf{x}_k)}{2A_T}+(f_k-f_i)\frac{(\mathbf{x}_j-\mathbf{x}_i)\cdot(\mathbf{x}_j-\mathbf{x}_k)}{2A_T}\right)\\
=&\frac{1}{2}\left((f_j-f_i)\frac{\cos \gamma_k\|\mathbf{x}_i-\mathbf{x}_k\|\|\mathbf{x}_j-\mathbf{x}_k\|}{\sin \gamma_k \|\mathbf{x}_i-\mathbf{x}_k\|\|\mathbf{x}_j-\mathbf{x}_k\|}+(f_k-f_i)\frac{\cos\gamma_j\|\mathbf{x}_j-\mathbf{x}_i\|\|\mathbf{x}_j-\mathbf{x}_k\|}{\sin\gamma_j \|\mathbf{x}_j-\mathbf{x}_i\|\|\mathbf{x}_j-\mathbf{x}_k\|}\right)\\
=&\frac{1}{2}\left((f_j-f_i)\cot\gamma_k+(f_k-f_i)\cot\gamma_j\right)
\end{aligned}
$$

> $\nabla f$ 在一个三角形内部是常数

故
$$
\int_{A_i}\Delta f\mathbb{d}A=\frac{1}{2}\sum_{j\in\Omega(i)}(\cot \alpha_{ij}+\cot\beta_{ij})(f_j-f_i)
$$
Laplace-Beltrami 算子的离散均值为
$$
\Delta f(v_i)=\frac{1}{2A_i}\sum_{j\in\Omega(i)}(\cot \alpha_{ij}+\cot\beta_{ij})(f_j-f_i)
$$
当 $\cot \alpha_{ij}+\cot\beta_{ij}<0 \Leftrightarrow \alpha_{ij}+\beta_{ij}>\pi$ 时不满足 POS

## 02.5 离散曲率

> discrete curvature

平均曲率
$$
\Delta \mathbf{x}=-2H\mathbf{n}
$$
绝对值
$$
H_i=\frac{1}{2}\|\Delta \mathbf{x}\|
$$
高斯曲率
$$
K_i=\frac{1}{A_i}\left(2\pi -\sum_{j\in\Omega(i)}\theta_j\right)
$$
