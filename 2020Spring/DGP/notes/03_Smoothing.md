# 03. 平滑

> smoothing

![image-20200623211208657](assets/03_Smoothing/image-20200623211208657.png)

## 03.1 基于过滤器的方法

> filter-based method

### 03.1.1 拉普拉斯平滑

> Laplacian smoothing

**扩散流** diffusion flow：数学上易于理解的模型，用于平滑给定信号 $f(\mathbf{x},t)$ 的时间相关过程

扩散方程
$$
\frac{\partial f(\mathbf{x},t)}{\partial t}=\lambda \Delta f(\mathbf{x},t)
$$

- 二阶线性偏微分方程
- 使用 Laplace-Beltrami 算子在流形表面上平滑任意函数 $f$ 
- 时空离散方程
  - 空间离散化：$\mathbf{f}(t)=(f(v_1,t),\dots,f(v_n,t))^\top$，方程 $\frac{\partial f(v_i,t)}{\partial t}=\lambda\Delta f(\mathbf{x}_i,t)$，矩阵形式为 $\frac{\partial \mathbf{f}(t)}{\partial t}=\lambda L\mathbf{f}(t)$ 
  - 时间离散化：$(t,t+h,t+2h,\dots)$ 
    - 显式 Euler 迭代 $\mathbf{f}(t+h)=\mathbf{f}(t)+h\frac{\partial \mathbf{f}(t)}{\partial t}=\mathbf{f}(t)+h\lambda L\mathbf{f}(t)$ 
    - 隐式 Euler 迭代 $\mathbf{f}(t+h)=\mathbf{f}(t)+h\lambda L\mathbf{f}(t+h)\Leftrightarrow (I-h\lambda L)\mathbf{f}(t+h)=\mathbf{f}(t)$ 

Laplacian smoothing 中

- 函数：$\mathbf{f}\Rightarrow(\mathbf{x}_1,\dots,\mathbf{x}_n)^\top$ 
- 迭代：$\mathbf{x}_i\leftarrow \mathbf{x}_i+h\lambda\Delta\mathbf{x}_i$，其中 $\Delta \mathbf{x}=-2H\mathbf{n}$ 

这就变成了平均曲率流

> **示例** 
>
> 迭代
>
> ![image-20200623213310063](assets/03_Smoothing/image-20200623213310063.png)
>
> 不同算子
>
> ![image-20200623213453939](assets/03_Smoothing/image-20200623213453939.png)
>
> 光顺
>
> $L^k\mathbf{x}=\mathbf{0}$ 
>
> ![image-20200623213616296](assets/03_Smoothing/image-20200623213616296.png)

### 03.1.3 高斯图像去噪

> Gaussian image denoising

高斯过滤器为
$$
I(\mathbf{p})\leftarrow \frac{1}{K_{\mathbf{p}}}\sum_{q\in \Omega(\mathbf{p})}W_s(\|\mathbf{p}-\mathbf{q}\|)I(\mathbf{q})
$$
其中

- $\mathbf{p}=(x,y)$ 是坐标
- $I(\mathbf{p})$ 是像素
- $\Omega(\mathbf{p})$ 是 $\mathbf{p}$ 的邻域
- $W_s$：位置相似函数，高斯函数（均值 0，方差为 $\sigma_s$）
- $K_\mathbf{p}$：泛化项，权值和

> 示例
>
> ![image-20200623214106072](assets/03_Smoothing/image-20200623214106072.png)
>
> !!! 边没有保留 !!!

### 03.1.4 双边图像去噪

> bilateral image denoising

双边过滤器为
$$
I(\mathbf{p})\leftarrow \frac{1}{K_{\mathbf{p}}}\sum_{q\in \Omega(\mathbf{p})}W_s(\|\mathbf{p}-\mathbf{q}\|)W_r(\|I(\mathbf{p})-I(\mathbf{q})\|)I(\mathbf{q})
$$
其中

- $\mathbf{p}=(x,y)$ 是坐标
- $I(\mathbf{p})$ 是像素
- $\Omega(\mathbf{p})$ 是 $\mathbf{p}$ 的邻域
- $W_s$：位置相似函数，高斯函数（均值 0，方差为 $\sigma_s$）
- $W_r$：颜色相似函数，高斯函数（均值 0，方差为 $\sigma_r$）
- $K_\mathbf{p}$：泛化项，权值和

性质

- 非线性
- 保边
- 去噪平滑

### 03.1.5 双边网格去噪

> bilateral mesh denoising
>
> ref: bilateral mesh denoising

$$
\mathbf{v}^* =\mathbf{v}+\mathbf{n}\frac{\sum_{\mathbf{q}_i\in\Omega(\mathbf{v})}W_s(\|\mathbf{v}-\mathbf{q}_i\|)W_r(\langle \mathbf{n}, \mathbf{v}-\mathbf{q}_i\rangle)\langle \mathbf{n}, \mathbf{v}-\mathbf{q}_i\rangle}{\sum_{\mathbf{q}_i\in\Omega(\mathbf{v})}W_s(\|\mathbf{v}-\mathbf{q}_i\|)W_r(\langle \mathbf{n}, \mathbf{v}-\mathbf{q}_i\rangle)}
$$

其中 $W_{s/r}(x)=\exp(-x^2/(2\sigma_{s/r}))$ 

> $\mathbf{v}-\mathbf{q}_i$ ? 感觉应该是 $\mathbf{q}_i-\mathbf{v}$ 

细节

- 法向：加权（三角形面积）平均
  - 1-ring
  - k-ring：噪音严重
- 保体
- 边界
- 参数：$\sigma_s,\sigma_r$，迭代次数

> **示例** 
>
> ![image-20200623223321041](assets/03_Smoothing/image-20200623223321041.png)

### 03.1.6 双边法向滤波

> bilateral normal filtering
>
> ref: Bilateral Normal Filtering for Mesh Denoising

$$
\mathbf{n}(f_i)\leftarrow \frac{1}{K_\mathbf{p}}\sum_{f_j\in f_i}A_jW_s(\|\mathbf{c}_i-\mathbf{c}_j\|)W_r(\|\mathbf{n}(f_i)-\mathbf{n}(f_j)\|)\mathbf{n}(f_j)
$$

- $f_i$：三角形面 $i$ 
- $\mathbf{c}_i$：面 $i$ 的中心
- $\Omega(f_i)$：$f_i$ 的邻面
- $W_s$：空间相似函数
- $W_r$：法向相似函数
- $A_j$：$f_i$ 面积

局部和迭代策略

- 法向更新

  - 公式 $\boldsymbol{n}_{i}^{t+1} \longleftarrow \frac{1}{K_{p}} \sum_{f_{j} \in \Omega\left(f_{i}\right)} A_{j} W_{s} W_{r} \cdot \boldsymbol{n}_{j}^{t}$ 
  - 范化
  - 多次迭代，将 1-ring 扩大为 k-ring
  - 迭代次数由用户控制

- 顶点更新 $\left\{\begin{array}{l}
  \boldsymbol{n}_{f}^{T} \cdot\left(\boldsymbol{x}_{j}-\boldsymbol{x}_{i}\right)=0 \\
  \boldsymbol{n}_{f}^{T} \cdot\left(\boldsymbol{x}_{k}-\boldsymbol{x}_{j}\right)=0 \\
  \boldsymbol{n}_{f}^{T} \cdot\left(\boldsymbol{x}_{i}-\boldsymbol{x}_{k}\right)=0
  \end{array}\right.$ 

- 能量 $E=\sum_{f_{k}} \sum_{i, j \in f_{k}}\left(\boldsymbol{n}_{k}^{\top} \cdot\left(\boldsymbol{x}_{j}-\boldsymbol{x}_{i}\right)\right)^{2}$ 

- 固定其他点，更新一个点（Gauss-Seidel 迭代）

  $\boldsymbol{x}_{i}^{n e w}=\boldsymbol{x}_{i}+\frac{1}{N_{i}} \sum_{f_{j} \in \Omega(i)} \boldsymbol{n}_{j} \cdot\left(\boldsymbol{n}_{j}^{T} \cdot\left(\boldsymbol{c}_{j}-\boldsymbol{x}_{i}\right)\right)$ 

全局和非迭代策略

- 能量极小化
  $$
  \begin{array}{l}
  E(n)=(1-\lambda) E_{S}+\lambda E_{a} \\
  E_{S}=\sum_{i} A_{i}\left\|\left(L \boldsymbol{n}^{n e w}\right)_{i}\right\|_{2}^{2} \\
  E_{a}=\sum_{i}^{n} A_{i}\left\|n_{i}^{n e w}-n_{i}\right\|_{2}^{2}
  \end{array}
  $$
  其中 $L$ 是均匀/cot 权重矩阵

### 03.1.7 流形调和

> manifold harmonic
>
> ref: Spectral Geometry Processing with Manifold Harmonics

1D 傅里叶变换
$$
\begin{array}{l}
F(\omega)=\int_{-\infty}^{+\infty} f(x) e^{-2 \pi i \omega x} d x \\
f(x)=\int_{-\infty}^{+\infty} F(\omega) e^{2 \pi i \omega x} d \omega
\end{array}
$$
对于网格情形，基函数对应 L 的特征函数
$$
\mathbf{f}=\sum_{i=1}^n\langle\mathbf{f},\mathbf{e}_i\rangle\mathbf{e}_i
$$
低通滤波 $\mathbf{f}=\sum_{i=1}^m\langle\mathbf{f},\mathbf{e}_i\rangle\mathbf{e}_i$，其中 $m<n$ 

$\mathbf{f}$ 是顶点坐标

> $n$ 个顶点，他们的 $x$ 分量可构成 $\mathbf{f}_x=(x_1,\dots,x_n)^\top$ 
>
> 然后对 $\mathbf{f}_x$ 的频域进行调整
>
> ---
>
> 示例
> ![image-20200623231044028](assets/03_Smoothing/image-20200623231044028.png)
>
> 其他滤波
>
> ![image-20200623231135480](assets/03_Smoothing/image-20200623231135480.png)

讨论

- 计算：Fast Approximation of Laplace-Beltrami Eigenproblems, SGP 2018
- 非常有用的三角网格的表示

## 03.2 基于优化的方法

> optimization-based method



## 03.3 数据驱动方法

> data-drivenmethod

