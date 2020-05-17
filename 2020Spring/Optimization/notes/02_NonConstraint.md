# 2. 无约束优化

> **TODO** 
>
> [^TODO]: TODO

[TOC]

$$
\min_{\pmb{x}\in \mathbb{R}^n}f(\pmb{x})
$$

## 2.1 梯度类求解算法

梯度方向 $\nabla f(\pmb{x})$ 是函数 $f$ 在点 $\pmb{x}$ 处增加最快的方向

梯度类方法

- 初始化：选取适当的初始点 $\pmb{x}^{(0)}\in \mathbb{R}^n$，令 $k=0$ 
- 计算搜索方向：利用设当的**正定对称矩阵** $H_k$ 计算搜索方向向量 $\pmb{d}^{(k)}=-H_k\nabla f(\pmb{x}^{(k)})$（如果 $\nabla f(\pmb{x}^{(k)})=\pmb{0}$ 或 $\|\nabla f(\pmb{x}^{(k)})\|\le \epsilon\quad (0\le \epsilon \ll 1)$，则结束计算）
- 确定步长因子：解一维最优化问题 $\min_\limits{\alpha\ge 0}f(\pmb{x}^{(k)}+\alpha \pmb{d}^{(k)})$，求出步长 $\alpha=\alpha_k$，令 $\pmb{x}^{(k+1)}=\pmb{x}^{(k)}+\alpha_k\pmb{d}^{(k)}$，$k=k+1$ 

> 令 $\varphi(\alpha) = f(\pmb{x}^{(k)}+\alpha \pmb{d}^{(k)})$，则
> $$
> \varphi(0)=f(\pmb{x}^{(k)}),\quad \varphi(\alpha)\le f(x_k)
> $$
> 求 $\varphi(\alpha)$ 的总体极小点比较困难，一般求第一个平衡点
> $$
> \alpha_k=\min\{\alpha|\nabla f(\pmb{x}^{(k)}+\alpha\pmb{d}^{(k)})^\top\pmb{d}^{(k)}=0,\alpha>0\}
> $$

### 2.1.1 构造搜索方向

**负梯度方向** 

泰勒公式
$$
f(\pmb{x})=f(\pmb{x}^{(k)})+\nabla f(\pmb{x}^{(k)})^\top(\pmb{x}-\pmb{x}^{(k)})+O(\|\pmb{x}-\pmb{x}^{(k)}\|^2)
$$
取负梯度方向
$$
\pmb{d}^{(k)}=-\nabla f(\pmb{x}^{(k)})
$$
则当 $\alpha_k$ 足够小时，总能使
$$
f(\pmb{x}^{(k)}+\alpha \pmb{d}^{(k)})<f(\pmb{x}^{(k)})
$$
**牛顿方向** 
$$
f(\pmb{x})=f(\pmb{x}^{(k)})+\nabla f(\pmb{x}^{(k)})^\top(\pmb{x}-\pmb{x}^{(k)})+\frac{1}{2}(\pmb{x}-\pmb{x}^{(k)})^\top\nabla^2f(\pmb{x}^{(k)})(\pmb{x}-\pmb{x}^{(k)})+O(\|\pmb{x}-\pmb{x}^{(k)}\|^3)
$$
取搜索方向
$$
\pmb{d}^{(k)}=-G^{-1}_k\nabla f(\pmb{x}^{(k)})
$$
其中 $G_k=\nabla^2f(\pmb{x}^{(k)})$ 为 Hesse 矩阵

> 将函数视为二次函数，最小值位于 $-\frac{b}{2a}$ 

### 2.1.2 确定步长因子

在迭代格式中，通过解一维最优化问题
$$
\min_\limits{\alpha\ge 0}\varphi(\alpha)=f(\pmb{x}^{(k)}+\alpha\pmb{d}^{(k)})
$$
确定步长因子的方法称为**一维搜索** line search

以最优解 $\mathop{\arg\min}_\limits{\alpha\ge 0}f(\pmb{x}^{(k)}+\alpha \pmb{d}^{(k)})$ 为步长称为**精确一维搜索** exact line search

常用方法：黄金分割法、插值迭代法

实际往往不是用精确解，而是满足适当调节的近似解作为步长，称为**非精确一维搜索** inexact line search

设 $\overline{\alpha}_k$ 是使得
$$
f(\pmb{x}^{(k)}+\alpha\pmb{d}^{(k)})=f(\pmb{x}^{(k)})
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

1. 给定搜索区间 $[0,\overline{\alpha}]$，以及 $\rho\in(0,\frac{1}{2})$，$\sigma\in(\rho,1)$，计算 $\varphi_0=\varphi(0)=f(\pmb{x}^{(k)})$，$\varphi^\prime_0=\varphi^\prime(0)=\nabla f(\pmb{x}^{(k)})^\top\pmb{d}^{(k)}$。并令 $a_1=0$，$a_2=\overline{\alpha}$，$\varphi_1=\varphi_0$，$\varphi^\prime_1=\varphi^\prime_0$。选取适当的 $\alpha\in(a_1,a_2)$ 

2. 计算 $\varphi=\varphi(\alpha)=f(\pmb{x}^{(k)}+\alpha\pmb{d}^{(k)})$。若$\varphi(\alpha)\le \varphi(0)+\rho\alpha\varphi^\prime(0)$，则转第 3 步。否则，由 $\varphi_1,\varphi_1^\prime,\varphi$ 构造两点二次插值多项式 $p^{(1)}(t)$，并得其极小点
   $$
   \hat{\alpha}=a_1+\frac{1}{2}\frac{(a_1-\alpha)^2\varphi_1^\prime}{(\varphi_1-\varphi)-(a_1-\alpha)\varphi_1^\prime}
   $$
   于是置 $a_2=\alpha,\alpha=\hat{\alpha}$，重复第 2 步。

3. 计算 $\varphi^\prime=\varphi^\prime(\alpha)=\nabla f(\pmb{x}^{(k)}+\alpha\pmb{d}^{(k)})^\top\pmb{d}^{(k)}$。若 $\varphi^\prime(\alpha)\ge \sigma\varphi^\prime(0)$，则输出 $\alpha_k=\alpha$，并停止搜索。否则，由 $\varphi,\varphi^\prime,\varphi_1$ 构造两点二次插值多项式 $p^{(2)}(t)$，并得其极小点
   $$
   \hat{\alpha}=\alpha-\frac{(a_1-\alpha)\varphi^\prime}{\varphi_1^\prime-\varphi^\prime}
   $$
   于是置 $a_1=\alpha,\alpha=\hat\alpha,\varphi_1=\varphi,\varphi_1^\prime=\varphi^\prime$，返回第 2 步。

> $\varphi(\alpha) = f(\pmb{x}^{(k)}+\alpha \pmb{d}^{(k)})$，则
> $$
> \varphi^\prime(\alpha)=\nabla f(\pmb{x}^{(k)}+\alpha \pmb{d}^{(k)})^\top\pmb{d}^{(k)}
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

假设 $\pmb{d}^{(k)}$ 与 $-\pmb{g}^{(k)}$ 的夹角 $\theta_k$ 满足
$$
\theta_k\le \frac{\pi}{2}-\mu \quad \forall k
$$
其中 $\mu>0$，显然
$$
\cos\theta_k=-\frac{{\pmb{g}^{(k)}}^\top \cdot \pmb{d}^{(k)}}{\|\pmb{g}^{(k)}\|\|\pmb{d}^{(k)}\|}=-\frac{{\pmb{g}^{(k)}}^\top \pmb{s}^{(k)}}{\|\pmb{g}^{(k)}\|\|\pmb{s}^{(k)}\|}
$$

> 其中 $\pmb{g}^{(k)}=\nabla f(\pmb{x}^{(k)})$ 

**全局收敛性定理** 

若满足

- $\theta_k\le \frac{\pi}{2}-\mu \quad \forall k$ 
- 步长 $\alpha_k$ 由下列方法之一确定
  - 精确一维搜索
  - Goldstein 准则
  - Wolfe-Powell 准则

则 $\exist  k, \nabla f(\pmb{x}^{(k)})=\pmb{0}$，或者 $f(\pmb{x}^{(k)})\to-\infty$，或者 $\nabla f(\pmb{x}^{(k)})\to \pmb{0}$ 

> 其他条件
>
> - $\nabla f(\pmb{x})$ 存在且一致连续（在水平集 $L(\pmb{x}^{(0)})=\{\pmb{x}\ |\ f(\pmb{x})\le f(\pmb{x}^{0})\}$ 上）
>
> ---
>
> 证明（Wolfe-Powell）
>
> 假设 $\pmb{g}^{(k)}\neq \pmb{0}$，$f(\pmb{x}^{(k)})$ 有下界
>
> > 从而需证 $\nabla f(\pmb{x}^{(k)})\to \pmb{0}$ 
>
> 故 $f(\pmb{x}^{(k)})-f(\pmb{x}^{(k+1)})\to 0$，由 $\varphi(\alpha)\le\varphi(0)+\rho\alpha\varphi^\prime(0)$ 得 $-\pmb{g}^{(k)}\pmb{s}^{(k)}\to 0$ 
>
> > $\varphi(\alpha) = f(\pmb{x}^{(k+1)})$，$\varphi(0) = f(\pmb{x}^{(k)})$，$\varphi^\prime(0)=\pmb{g}^{(k)}\pmb{d}^{(k)}$，$\pmb{s}^{(k)}=\alpha \pmb{d}^{(k)}$（上文有推导）
>
> ![image-20200510025105009](assets/02_NonConstraint/image-20200510025105009.png)
>
> 则 $\|\pmb{s}^{(k)}\|\to 0$ 
>
> ![image-20200510025135414](assets/02_NonConstraint/image-20200510025135414.png)
>
> > $\pmb{g}^{(k+1)}=\pmb{g}^{(k)}+o(\pmb{1})$ 
>
> 而这与 $\varphi^\prime(\alpha)\ge \sigma\varphi^\prime(0)$ 矛盾，即与下式茅盾
>
> ![image-20200510031130622](assets/02_NonConstraint/image-20200510031130622.png)
>
> > $\pmb{g}^{(k)}\pmb{d}^{(k)}<0$ 
>
> 故  $\pmb{g}^{(k)}\to \pmb{0}$ 

### 2.1.4 最速下降法

$\pmb{d}^{(k)}=-\nabla f(\pmb{x}^{(k)})$ 

![image-20200310205436012](assets/02_NonConstraint/image-20200310205436012.png)

![image-20200310205458371](assets/02_NonConstraint/image-20200310205458371.png)

![image-20200310205530157](assets/02_NonConstraint/image-20200310205530157.png)

垂直 ${\pmb{g}^{(k+1)}}^\top\pmb{g}^{(k)}=0$ 

> $\varphi^\prime(\alpha^{(k)})=\nabla f(\pmb{x}^{(k+1)})^\top\pmb{d}^{(k)}$ 

### 2.1.5 牛顿法

$$
f(\pmb{x}^{(k)}+\pmb{s})\approx q^{(k)}(\pmb{s}) = f(\pmb{x}^{(k)})+{\pmb{g}^{(k)}}^\top \pmb{s}+\frac{1}{2}\pmb{s}^\top G_k \pmb{s}
$$

其中 $\pmb{g}^{(k)}=\nabla f(\pmb{x}^{(k)})$，$G_k=\nabla^2 f(\pmb{x}^{(k)})$ 

将 $q^{(k)}(\pmb{s})$ 极小化（当二次函数求导即可）便得
$$
\pmb{s}=-G_k^{-1}\pmb{g}^{(k)}
$$
称搜索方向 $-G_k^{-1}\pmb{g}^{(k)}$ 为**牛顿方向**（Newtin Direction）

>  $f(\pmb{x})$ 二次可微实函数
>
> ---
>
> ![image-20200310213634373](assets/02_NonConstraint/image-20200310213634373.png)

经典牛顿迭代法
$$
\pmb{x}^{(k+1)}=\pmb{x}^{(k)}-G^{-1}_k\pmb{g}^{(k)}
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
\pmb{d}^{(k)}=\left\{\begin{aligned}
&-G^{-1}_k\pmb{g}^{(k)},&\text{if}\ \cos\theta_k>\eta\\
&-\pmb{g}^{(k)}, &\text{otherwise}
\end{aligned}\right.
$$
> 如果正定且夹角不太大就用牛顿法，否则用

**Levenberg,Marquardt,Goldfeld** 
$$
(G_k+\mu_k I)\pmb{d}^{(k)}=-\pmb{g}^{(k)}
$$
**负曲率方向** 

设 $\pmb{x}$ 是不定点，若
$$
\pmb{d}^\top\nabla^2 f(\pmb{x})\pmb{d}<0
$$
则称 $\pmb{d}$ 为**负曲率方向** 

> 一阶导是梯度，二阶导是曲率
>
> 对应**负梯度**，**负曲率** 

2.1.6 拟牛顿法

> 用一个矩阵 $H_k$ 近似 $G_k^{-1}$ 

目标函数二阶泰勒展开
$$
f(\pmb{x})\approx f(\pmb{x}^{(k+1)})+{\pmb{g}^{(k+1)}}^\top (\pmb{x}-\pmb{x}^{(k+1)})+\frac{1}{2}(\pmb{x}-\pmb{x}^{(k+1)})^\top G_k (\pmb{x}-\pmb{x}^{(k+1)})
$$
梯度一阶展开
$$
\nabla f(\pmb{x})=\nabla f(\pmb{x}^{(k+1)})+\nabla^2 f(\pmb{x}^{(k+1)})(\pmb{x}-\pmb{x}^{(k+1)})
$$
令 $\pmb{x}=\pmb{x}^{(k)}$ 得
$$
\nabla f(\pmb{x}^{(k)})\approx\nabla f(\pmb{x}^{(k+1)})+G_{k+1} (\pmb{x}^{(k)}-\pmb{x}^{(k+1)})
$$
记 $\pmb{s}^{(k)}=\pmb{x}^{(k+1)}-\pmb{x}^{(k)}$，$\pmb{y}^{(k)}=\nabla f(\pmb{x}^{(k+1)})-\nabla f(\pmb{x}^{(k)})$，则
$$
G_{k+1}^{-1}\pmb{y}^{(k)}\approx \pmb{s}^{(k)}
$$
> 梯度变化近似于曲率与变化量的乘积
> $$
> \Delta f^\prime=f^{\prime\prime}\Delta x
> $$

因此我们迭代中找 $H_{k+1}$ 满足
$$
H_{k+1}\pmb{y}^{(k)}=\pmb{s}^{(k)}
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

> - 秩 1：$\pmb{u}\pmb{v}^\top$ 
> - 对称：$\pmb{u}=\pmb{v}$ 

$$
H_{k+1}=H_k+a\pmb{u}\pmb{u}^\top
$$
![image-20200310230338020](assets/02_NonConstraint/image-20200310230338020.png)

**二次终止性**：如果一种迭代法能在有限步内找到二次函数的极小点，则称这种方法具有二次终止性

SR 1 校正性质

- 针对二次函数具有遗传性：$H_k \pmb{y}^{(l)}=\pmb{s}^{(l)},l=0,1,\dots,k-1$ 
- 具有二次终止性：不需要一维搜索，且 $H_n=[\nabla^2 f(\pmb{x}^*)]^{-1}$ 

缺点

- 不保证 $H_k$ 的正定性
- 当 $(\pmb{s}^{(k)}-H_k\pmb{y}^{(k)})^\top\pmb{y}^{(k)}>0$ 时 $H_k$ 正定

**对称秩2（SR2）校正** 

> - 秩 2：$\pmb{u}_1\pmb{u}_2^\top+\pmb{v}_1\pmb{v}_2^\top$ 
> - 对称：$\pmb{u}_1=\pmb{u}_2,\pmb{v}_1=\pmb{v}_2$  

$$
H_{k+1}=H_k+a\pmb{u}\pmb{u}^\top+b\pmb{v}\pmb{v}^\top
$$

![image-20200510134540891](assets/02_NonConstraint/image-20200510134540891.png)

![image-20200510134704899](assets/02_NonConstraint/image-20200510134704899.png)

称为 **DFP(Davidon-Fletcher-Powell) 校正公式**（典型）

性质有

![image-20200510134821259](assets/02_NonConstraint/image-20200510134821259.png)

**（对偶的）拟牛顿（正割）条件** 
$$
B_{k+1}\pmb{s}^{(k)}=\pmb{y}^{(k)}
$$
类似 DFP 得到 **BFGS（Broyden-Fletcher-Goldfarb-Shanno）校正** 

![image-20200510135632742](assets/02_NonConstraint/image-20200510135632742.png)

> 将 DFP 的 H 换成 B，s 和 y 互换即可

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

