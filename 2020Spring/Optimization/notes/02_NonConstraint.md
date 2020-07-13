# 2. 无约束优化

> **TODO** 
>
> [^TODO]: TODO

[TOC]

$$
\min_{\mathbf{x}\in \mathbb{R}^n}f(\mathbf{x})
$$

## 2.1 梯度类求解算法

梯度方向 $\nabla f(\mathbf{x})$ 是函数 $f$ 在点 $\mathbf{x}$ 处增加最快的方向

梯度类方法

- 初始化：选取适当的初始点 $\mathbf{x}^{(0)}\in \mathbb{R}^n$，令 $k=0$ 
- 计算搜索方向：利用设当的**正定对称矩阵** $H_k$ 计算搜索方向向量 $\mathbf{d}^{(k)}=-H_k\nabla f(\mathbf{x}^{(k)})$（如果 $\nabla f(\mathbf{x}^{(k)})=\mathbf{0}$ 或 $\|\nabla f(\mathbf{x}^{(k)})\|\le \epsilon\quad (0\le \epsilon \ll 1)$，则结束计算）
- 确定步长因子：解一维最优化问题 $\min_\limits{\alpha\ge 0}f(\mathbf{x}^{(k)}+\alpha \mathbf{d}^{(k)})$，求出步长 $\alpha=\alpha_k$，令 $\mathbf{x}^{(k+1)}=\mathbf{x}^{(k)}+\alpha_k\mathbf{d}^{(k)}$，$k=k+1$ 

> 令 $\varphi(\alpha) = f(\mathbf{x}^{(k)}+\alpha \mathbf{d}^{(k)})$，则
> $$
> \varphi(0)=f(\mathbf{x}^{(k)}),\quad \varphi(\alpha)\le f(x_k)
> $$
> 求 $\varphi(\alpha)$ 的总体极小点比较困难，一般求第一个平衡点
> $$
> \alpha_k=\min\{\alpha|\nabla f(\mathbf{x}^{(k)}+\alpha\mathbf{d}^{(k)})^\top\mathbf{d}^{(k)}=0,\alpha>0\}
> $$

### 2.1.1 构造搜索方向

**负梯度方向** 

泰勒公式
$$
f(\mathbf{x})=f(\mathbf{x}^{(k)})+\nabla f(\mathbf{x}^{(k)})^\top(\mathbf{x}-\mathbf{x}^{(k)})+O(\|\mathbf{x}-\mathbf{x}^{(k)}\|^2)
$$
取负梯度方向
$$
\mathbf{d}^{(k)}=-\nabla f(\mathbf{x}^{(k)})
$$
则当 $\alpha_k$ 足够小时，总能使
$$
f(\mathbf{x}^{(k)}+\alpha \mathbf{d}^{(k)})<f(\mathbf{x}^{(k)})
$$
**牛顿方向** 
$$
f(\mathbf{x})=f(\mathbf{x}^{(k)})+\nabla f(\mathbf{x}^{(k)})^\top(\mathbf{x}-\mathbf{x}^{(k)})+\frac{1}{2}(\mathbf{x}-\mathbf{x}^{(k)})^\top\nabla^2f(\mathbf{x}^{(k)})(\mathbf{x}-\mathbf{x}^{(k)})+O(\|\mathbf{x}-\mathbf{x}^{(k)}\|^3)
$$
取搜索方向
$$
\mathbf{d}^{(k)}=-G^{-1}_k\nabla f(\mathbf{x}^{(k)})
$$
其中 $G_k=\nabla^2f(\mathbf{x}^{(k)})$ 为 Hesse 矩阵

> 将函数视为二次函数，最小值位于 $-\frac{b}{2a}$ 

### 2.1.2 确定步长因子

在迭代格式中，通过解一维最优化问题
$$
\min_\limits{\alpha\ge 0}\varphi(\alpha)=f(\mathbf{x}^{(k)}+\alpha\mathbf{d}^{(k)})
$$
确定步长因子的方法称为**一维搜索** line search

以最优解 $\mathop{\arg\min}_\limits{\alpha\ge 0}f(\mathbf{x}^{(k)}+\alpha \mathbf{d}^{(k)})$ 为步长称为**精确一维搜索** exact line search

常用方法：黄金分割法、插值迭代法

实际往往不是用精确解，而是满足适当调节的近似解作为步长，称为**非精确一维搜索** inexact line search

设 $\overline{\alpha}_k$ 是使得
$$
f(\mathbf{x}^{(k)}+\alpha\mathbf{d}^{(k)})=f(\mathbf{x}^{(k)})
$$
的最小正数 $\alpha$。于是我们将在区间 $[0,\overline{\alpha}_k]$ 内求得满足适当条件的可接受的步长因子 $\alpha\in [0,\overline{\alpha}_k]$ 

![image-20200309114706012](assets/02_NonConstraint/image-20200309114706012.png)

**Goldstein 条件** 
$$
\varphi(\alpha)\le \varphi(0)+\rho\alpha\varphi^\prime(0)\\
\varphi(\alpha)\ge \varphi(0)+(1-\rho)\alpha\varphi^\prime(0)
$$
其中 $\rho\in(0,\frac{1}{2})$ 是一个固定参数

![image-20200309131258864](assets/02_NonConstraint/image-20200309131258864.png)

**Wolfe-Powell 条件** 
$$
\varphi(\alpha)\le \varphi(0)+\rho\alpha\varphi^\prime(0)\\
\varphi^\prime(\alpha)\ge \sigma\varphi^\prime(0)
$$
其中 $\sigma\in (\rho,1)$ 是另一个固定参数

> $\varphi^\prime(0)$ 是负数，所以 $\varphi^\prime(\alpha)$ 的范围是接近 0 的负数到正数，不能太陡峭，比上界更陡峭
>
> 常被强化的**双边条件**取代
> $$
> |\varphi^\prime(\alpha)|\le -\sigma\varphi^\prime(0)
> $$

![image-20200309132857916](assets/02_NonConstraint/image-20200309132857916.png)

基于 Wolfe-Powell 准则的非精确一维搜索算法

1. 给定搜索区间 $[0,\overline{\alpha}]$，以及 $\rho\in(0,\frac{1}{2})$，$\sigma\in(\rho,1)$，计算 $\varphi_0=\varphi(0)=f(\mathbf{x}^{(k)})$，$\varphi^\prime_0=\varphi^\prime(0)=\nabla f(\mathbf{x}^{(k)})^\top\mathbf{d}^{(k)}$。并令 $a_1=0$，$a_2=\overline{\alpha}$，$\varphi_1=\varphi_0$，$\varphi^\prime_1=\varphi^\prime_0$。选取适当的 $\alpha\in(a_1,a_2)$ 

2. 计算 $\varphi=\varphi(\alpha)=f(\mathbf{x}^{(k)}+\alpha\mathbf{d}^{(k)})$。若$\varphi(\alpha)\le \varphi(0)+\rho\alpha\varphi^\prime(0)$，则转第 3 步。否则，由 $\varphi_1,\varphi_1^\prime,\varphi$ 构造两点二次插值多项式 $p^{(1)}(t)$，并得其极小点
   $$
   \hat{\alpha}=a_1+\frac{1}{2}\frac{(a_1-\alpha)^2\varphi_1^\prime}{(\varphi_1-\varphi)-(a_1-\alpha)\varphi_1^\prime}
   $$
   于是置 $a_2=\alpha,\alpha=\hat{\alpha}$，重复第 2 步。

3. 计算 $\varphi^\prime=\varphi^\prime(\alpha)=\nabla f(\mathbf{x}^{(k)}+\alpha\mathbf{d}^{(k)})^\top\mathbf{d}^{(k)}$。若 $\varphi^\prime(\alpha)\ge \sigma\varphi^\prime(0)$，则输出 $\alpha_k=\alpha$，并停止搜索。否则，由 $\varphi,\varphi^\prime,\varphi_1$ 构造两点二次插值多项式 $p^{(2)}(t)$，并得其极小点
   $$
   \hat{\alpha}=\alpha-\frac{(a_1-\alpha)\varphi^\prime}{\varphi_1^\prime-\varphi^\prime}
   $$
   于是置 $a_1=\alpha,\alpha=\hat\alpha,\varphi_1=\varphi,\varphi_1^\prime=\varphi^\prime$，返回第 2 步。

> $\varphi(\alpha) = f(\mathbf{x}^{(k)}+\alpha \mathbf{d}^{(k)})$，则
> $$
> \varphi^\prime(\alpha)=\nabla f(\mathbf{x}^{(k)}+\alpha \mathbf{d}^{(k)})^\top\mathbf{d}^{(k)}
> $$
>
> ----
>
> 搜索区间始终位于 $(a_1,a_2)$，算法的第 2、3 步会调整这个区间，使其越变越小
>
> 算 $\varphi(\alpha)$ 
>
> - 如果超出上限，取左导+**左值+右值**做二次估计，更新区间上限
> - 如果低于下限，取左导+**中值+中导**做二次估计，更新区间下限
> - 结束

### *2.1.3 全局收敛

从任意初始点出发，如果某迭代算法产生的点列的极限（聚点），在适当假定下可保证恒为问题的最优解（或者稳定点），则称该迭代法具有**全局收敛性** global convergence

与此相对，如果仅在解的附近选取初始点时，才可以保证所生成的点列收敛于该解，则称这样的迭代法有**局部收敛性** local convergence

假设 $\mathbf{d}^{(k)}$ 与 $-\mathbf{g}^{(k)}$ 的夹角 $\theta_k$ 满足
$$
\theta_k\le \frac{\pi}{2}-\mu \quad \forall k
$$
其中 $\mu>0$，显然
$$
\cos\theta_k=-\frac{{\mathbf{g}^{(k)}}^\top \cdot \mathbf{d}^{(k)}}{\|\mathbf{g}^{(k)}\|\|\mathbf{d}^{(k)}\|}=-\frac{{\mathbf{g}^{(k)}}^\top \mathbf{s}^{(k)}}{\|\mathbf{g}^{(k)}\|\|\mathbf{s}^{(k)}\|}
$$

> 其中 $\mathbf{g}^{(k)}=\nabla f(\mathbf{x}^{(k)})$ 

**全局收敛性定理** 

若满足

- $\theta_k\le \frac{\pi}{2}-\mu \quad \forall k$ 
- 步长 $\alpha_k$ 由下列方法之一确定
  - 精确一维搜索
  - Goldstein 准则
  - Wolfe-Powell 准则

则 $\exist  k, \nabla f(\mathbf{x}^{(k)})=\mathbf{0}$，或者 $f(\mathbf{x}^{(k)})\to-\infty$，或者 $\nabla f(\mathbf{x}^{(k)})\to \mathbf{0}$ 

> 其他条件
>
> - $\nabla f(\mathbf{x})$ 存在且一致连续（在水平集 $L(\mathbf{x}^{(0)})=\{\mathbf{x}\ |\ f(\mathbf{x})\le f(\mathbf{x}^{0})\}$ 上）
>
> ---
>
> 证明（Wolfe-Powell）
>
> 假设 $\mathbf{g}^{(k)}\neq \mathbf{0}$，$f(\mathbf{x}^{(k)})$ 有下界
>
> > 从而需证 $\nabla f(\mathbf{x}^{(k)})\to \mathbf{0}$ 
>
> 故 $f(\mathbf{x}^{(k)})-f(\mathbf{x}^{(k+1)})\to 0$，由 $\varphi(\alpha)\le\varphi(0)+\rho\alpha\varphi^\prime(0)$ 得 $-\mathbf{g}^{(k)}\mathbf{s}^{(k)}\to 0$ 
>
> > $\varphi(\alpha) = f(\mathbf{x}^{(k+1)})$，$\varphi(0) = f(\mathbf{x}^{(k)})$，$\varphi^\prime(0)=\mathbf{g}^{(k)}\mathbf{d}^{(k)}$，$\mathbf{s}^{(k)}=\alpha \mathbf{d}^{(k)}$（上文有推导）
>
> ![image-20200510025105009](assets/02_NonConstraint/image-20200510025105009.png)
>
> 则 $\|\mathbf{s}^{(k)}\|\to 0$ 
>
> ![image-20200510025135414](assets/02_NonConstraint/image-20200510025135414.png)
>
> > $\mathbf{g}^{(k+1)}=\mathbf{g}^{(k)}+o(\mathbf{1})$ 
>
> 而这与 $\varphi^\prime(\alpha)\ge \sigma\varphi^\prime(0)$ 矛盾，即与下式茅盾
>
> ![image-20200510031130622](assets/02_NonConstraint/image-20200510031130622.png)
>
> > $\mathbf{g}^{(k)}\mathbf{d}^{(k)}<0$ 
>
> 故  $\mathbf{g}^{(k)}\to \mathbf{0}$ 

### 2.1.4 最速下降法

$\mathbf{d}^{(k)}=-\nabla f(\mathbf{x}^{(k)})$ 

![image-20200310205436012](assets/02_NonConstraint/image-20200310205436012.png)

![image-20200310205458371](assets/02_NonConstraint/image-20200310205458371.png)

![image-20200310205530157](assets/02_NonConstraint/image-20200310205530157.png)

垂直 ${\mathbf{g}^{(k+1)}}^\top\mathbf{g}^{(k)}=0$ 

> $\varphi^\prime(\alpha^{(k)})=\nabla f(\mathbf{x}^{(k+1)})^\top\mathbf{d}^{(k)}$ 

### 2.1.5 牛顿法

$$
f(\mathbf{x}^{(k)}+\mathbf{s})\approx q^{(k)}(\mathbf{s}) = f(\mathbf{x}^{(k)})+{\mathbf{g}^{(k)}}^\top \mathbf{s}+\frac{1}{2}\mathbf{s}^\top G_k \mathbf{s}
$$

其中 $\mathbf{g}^{(k)}=\nabla f(\mathbf{x}^{(k)})$，$G_k=\nabla^2 f(\mathbf{x}^{(k)})$ 

将 $q^{(k)}(\mathbf{s})$ 极小化（当二次函数求导即可）便得
$$
\mathbf{s}=-G_k^{-1}\mathbf{g}^{(k)}
$$
称搜索方向 $-G_k^{-1}\mathbf{g}^{(k)}$ 为**牛顿方向**（Newtin Direction）

>  $f(\mathbf{x})$ 二次可微实函数
>
> ---
>
> ![image-20200310213634373](assets/02_NonConstraint/image-20200310213634373.png)

经典牛顿迭代法
$$
\mathbf{x}^{(k+1)}=\mathbf{x}^{(k)}-G^{-1}_k\mathbf{g}^{(k)}
$$
> $\alpha_k=1$ 

**牛顿法收敛定理** 

![image-20200310214012003](assets/02_NonConstraint/image-20200310214012003.png)

> 证明：[^TODO] 
>
> ---
>
> 如果初始点不在解附近，则未必收敛

**阻尼牛顿法** 

> 用一维搜索确定步长

![image-20200310215109275](assets/02_NonConstraint/image-20200310215109275.png)

牛顿法面临的主要困难是 Hesse 矩阵 $G_k$ 不正定

修正措施

**Goldstein &Price** 
$$
\mathbf{d}^{(k)}=\left\{\begin{aligned}
&-G^{-1}_k\mathbf{g}^{(k)},&\text{if}\ \cos\theta_k>\eta\\
&-\mathbf{g}^{(k)}, &\text{otherwise}
\end{aligned}\right.
$$
> 如果正定且夹角不太大就用牛顿法，否则用最速下降法

**Levenberg,Marquardt,Goldfeld** 
$$
(G_k+\mu_k I)\mathbf{d}^{(k)}=-\mathbf{g}^{(k)}
$$
> 相当于在 $-G^{-1}_k\mathbf{g}^{(k)}$（$\mu_k\to 0$）和 $-\mathbf{g}^{(k)}$（$\mu_k\to\infty$）间插值

**负曲率方向** 

设 $\mathbf{x}$ 是不定点，若
$$
\mathbf{d}^\top\nabla^2 f(\mathbf{x})\mathbf{d}<0
$$
则称 $\mathbf{d}$ 为**负曲率方向** 

> 一阶导是梯度，二阶导是曲率
>
> 对应**负梯度**，**负曲率** 

### 2.1.6 拟牛顿法

> 用一个矩阵 $H_k$ 近似 $G_k^{-1}$ 

目标函数二阶泰勒展开
$$
f(\mathbf{x})\approx f(\mathbf{x}^{(k+1)})+{\mathbf{g}^{(k+1)}}^\top (\mathbf{x}-\mathbf{x}^{(k+1)})+\frac{1}{2}(\mathbf{x}-\mathbf{x}^{(k+1)})^\top G_k (\mathbf{x}-\mathbf{x}^{(k+1)})
$$
梯度一阶展开
$$
\nabla f(\mathbf{x})=\nabla f(\mathbf{x}^{(k+1)})+\nabla^2 f(\mathbf{x}^{(k+1)})(\mathbf{x}-\mathbf{x}^{(k+1)})
$$
令 $\mathbf{x}=\mathbf{x}^{(k)}$ 得
$$
\nabla f(\mathbf{x}^{(k)})\approx\nabla f(\mathbf{x}^{(k+1)})+G_{k+1} (\mathbf{x}^{(k)}-\mathbf{x}^{(k+1)})
$$
记 $\mathbf{s}^{(k)}=\mathbf{x}^{(k+1)}-\mathbf{x}^{(k)}$，$\mathbf{y}^{(k)}=\nabla f(\mathbf{x}^{(k+1)})-\nabla f(\mathbf{x}^{(k)})$，则
$$
G_{k+1}^{-1}\mathbf{y}^{(k)}\approx \mathbf{s}^{(k)}
$$
因此我们迭代中找 $H_{k+1}$ 满足
$$
H_{k+1}\mathbf{y}^{(k)}=\mathbf{s}^{(k)}
$$
称作正割条件，也称为**拟牛顿条件** 

![image-20200310223300662](assets/02_NonConstraint/image-20200310223300662.png)

> ![image-20200510120405931](assets/02_NonConstraint/image-20200510120405931.png)

以 $H_k$ 生成 $H_{k+1}$ 
$$
H_{k+1}=H_k+E_k
$$
其中 $E_k$ 是一个低秩的矩阵

**对称秩1（SR1）校正** 

> - 秩 1：$\mathbf{u}\mathbf{v}^\top$ 
> - 对称：$\mathbf{u}=\mathbf{v}$ 

$$
H_{k+1}=H_k+a\mathbf{u}\mathbf{u}^\top
$$
![image-20200310230338020](assets/02_NonConstraint/image-20200310230338020.png)

**二次终止性**：如果一种迭代法能在有限步内找到二次函数的极小点，则称这种方法具有二次终止性

SR 1 校正性质

- 针对二次函数具有遗传性：$H_k \mathbf{y}^{(l)}=\mathbf{s}^{(l)},l=0,1,\dots,k-1$ 
- 具有二次终止性：不需要一维搜索，且 $H_n=[\nabla^2 f(\mathbf{x}^*)]^{-1}$ 

缺点

- 不保证 $H_k$ 的正定性
- 当 $(\mathbf{s}^{(k)}-H_k\mathbf{y}^{(k)})^\top\mathbf{y}^{(k)}>0$ 时 $H_k$ 正定

**对称秩2（SR2）校正** 

> - 秩 2：$\mathbf{u}_1\mathbf{u}_2^\top+\mathbf{v}_1\mathbf{v}_2^\top$ 
> - 对称：$\mathbf{u}_1=\mathbf{u}_2,\mathbf{v}_1=\mathbf{v}_2$  

$$
H_{k+1}=H_k+a\mathbf{u}\mathbf{u}^\top+b\mathbf{v}\mathbf{v}^\top
$$

![image-20200510134540891](assets/02_NonConstraint/image-20200510134540891.png)

![image-20200510134704899](assets/02_NonConstraint/image-20200510134704899.png)

称为 **DFP(Davidon-Fletcher-Powell) 校正公式**（典型）

性质有

![image-20200510134821259](assets/02_NonConstraint/image-20200510134821259.png)

**（对偶的）拟牛顿（正割）条件** 
$$
B_{k+1}\mathbf{s}^{(k)}=\mathbf{y}^{(k)}
$$
类似 DFP 得到 **BFGS（Broyden-Fletcher-Goldfarb-Shanno）校正** 

![image-20200510135632742](assets/02_NonConstraint/image-20200510135632742.png)

> 将 DFP 的 H 换成 B，s 和 y 互换即可

求逆可得 $H_k$ 的 BFGS 校正
$$
\begin{aligned}
H_{k+1}^{(B F G S)}=& H_{k}+\left(1+\frac{{\mathbf{y}^{(k)}}^\top H_{k} \mathbf{y}^{(k)}}{{\mathbf{s}^{(k)}}^\top \mathbf{y}^{(k)}}\right) \frac{\mathbf{s}^{(k)} {\mathbf{s}^{(k)}}^\top}{\mathbf{s}^{(k) T} \mathbf{y}^{(k)}} \\
&-\frac{H_{k} \mathbf{y}^{(k)} {\mathbf{s}^{(k)}}^\top+\mathbf{s}^{(k)} {\mathbf{y}^{(k)}}^\top {H_{k}}}{{\mathbf{s}^{(k)}}^\top \mathbf{y}^{(k)}}
\end{aligned}
$$

类似地可得到

![image-20200510142330287](assets/02_NonConstraint/image-20200510142330287.png)

> ![image-20200510142755806](assets/02_NonConstraint/image-20200510142755806.png)

**秩一校正的求逆公式**   

![image-20200510142950627](assets/02_NonConstraint/image-20200510142950627.png)

> 奇异矩阵是不可逆矩阵（非满秩）

### 2.1.7 共轭方向

![image-20200510150059246](assets/02_NonConstraint/image-20200510150059246.png)

> 共轭是正交的推广，当 $G=I$ 时共轭即为正交

![image-20200510150539307](assets/02_NonConstraint/image-20200510150539307.png)

性质：精确一维搜索就有二次终止性

![image-20200510150727241](assets/02_NonConstraint/image-20200510150727241.png)

> 证明

![image-20200510152120497](assets/02_NonConstraint/image-20200510152120497.png)

> 推导
>
> ---
>
> 示例
>
> ![image-20200510152142453](assets/02_NonConstraint/image-20200510152142453.png)

![image-20200510152201405](assets/02_NonConstraint/image-20200510152201405.png)

推广

![image-20200510152516433](assets/02_NonConstraint/image-20200510152516433.png)

![image-20200510152550594](assets/02_NonConstraint/image-20200510152550594.png)

**重启动** 

![image-20200510152626583](assets/02_NonConstraint/image-20200510152626583.png)

评价

![image-20200510152707787](assets/02_NonConstraint/image-20200510152707787.png)

![image-20200510152717221](assets/02_NonConstraint/image-20200510152717221.png)

## 2.2 信赖域方法

> Trust Region Method

![image-20200510174715080](assets/02_NonConstraint/image-20200510174715080.png)

![image-20200510174740168](assets/02_NonConstraint/image-20200510174740168.png)

信赖域方法利用二次模型在信赖域内求得方向步 $\mathbf{s}^{(k)}$，使得目标函数的下降比一维搜索更有效。

性质

- 全局收敛性
- 不要求 Hesse 矩阵正定

![image-20200510174837302](assets/02_NonConstraint/image-20200510174837302.png)

![image-20200510174958570](assets/02_NonConstraint/image-20200510174958570.png)

![image-20200510175111714](assets/02_NonConstraint/image-20200510175111714.png)

![image-20200510175141835](assets/02_NonConstraint/image-20200510175141835.png)

![image-20200510175326448](assets/02_NonConstraint/image-20200510175326448.png)

![image-20200510175527554](assets/02_NonConstraint/image-20200510175527554.png)

关键一步是解决信頼域子问题

**折线法** 

![image-20200510175639892](assets/02_NonConstraint/image-20200510175639892.png)

![image-20200510175721787](assets/02_NonConstraint/image-20200510175721787.png)

![image-20200510175837467](assets/02_NonConstraint/image-20200510175837467.png)

![image-20200510175850717](assets/02_NonConstraint/image-20200510175850717.png)

![image-20200510175859719](assets/02_NonConstraint/image-20200510175859719.png)

![image-20200510175935999](assets/02_NonConstraint/image-20200510175935999.png)

