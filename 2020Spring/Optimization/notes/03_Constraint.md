# 3. 约束优化

> [TOC]

## 3.1 二次规划

> quadratic programming

在变量的线性等式或不等式限制下求二次函数的极小点问题
$$
\begin{array}{ll}
\min & Q(\mathbf{x})=\frac{1}{2} \mathbf{x}^{\top} G \mathbf{x}+\mathbf{c}^{\top} \mathbf{x} \\
\text { s.t. } & \mathbf{a}_{i}^{\top} \mathbf{x}=b_{i}, i \in \mathcal{E}=\left\{1, \cdots, m_{e}\right\} \\
& \mathbf{a}_{i}^{\top} \mathbf{x} \geq b_{i}, i \in \mathcal{I}=\left\{m_{e}+1, \cdots, m\right\}
\end{array}
$$
假设 $G$ 是对称阵，$\mathbf{a}_i(i\in\mathcal{E})$ 是线性无关的

> $G$ 是对称的不失一般性，$\mathbf{a}_i$ 如果线性相关，要么是多余，要么是不相容导致无解

解

- 约束可能不相容，也可能没有有限最小值，无解
- $G$ 半正定，凸二次规划问题，任意局部解释是整体解
- $G$ 正定，正定二次规划问题，只要存在解即是唯一的
- $G$ 不定，一般二次规划问题，有可能出现非整体解的局部解

### 3.1.1 等式约束

$$
\begin{array}{ll}
\min & Q(\mathbf{x})=\frac{1}{2} \mathbf{x}^{\top} G \mathbf{x}+\mathbf{c}^{\top} \mathbf{x} \\
\text { s.t. } & A \mathbf{x}=\mathbf{b}
\end{array}
$$

这里 $A$ 是 $m\times n$ 矩阵，且不失一般性可设 $\mathop{rank} (A)=m$ 

> 等式约束可以去掉，然后给 $\mathbf{x}$ 进行变量代换，从而变成无约束优化问题

#### 3.1.1.1 分块消去法

$$
\mathbf{x}=\left(\begin{array}{l}
\mathbf{x}_{B} \\
\mathbf{x}_{N}
\end{array}\right)
$$

其中 $\mathbf{x}_B\in \mathbb{R}^m,\mathbf{x}_N\in \mathbb{R}^{n-m}$，并把约束矩阵分块
$$
A=(A_B,A_N)
$$
其中 $A_B$ 可逆，等式约束条件可写成
$$
\mathbf{x}_B=A_B^{-1}(\mathbf{b}-A_N\mathbf{x}_N)
$$

> $$
> (A_B,A_N)
> \left(\begin{array}{l}
> \mathbf{x}_{B} \\
> \mathbf{x}_{N}
> \end{array}\right)
> =A_B\mathbf{x}_B+A_N\mathbf{x}_N=\mathbf{b}
> $$

代入目标函数得到无约束问题
$$
\min _{\mathbf{x}_{N} \in \mathbb{R}^{n-m}} \frac{1}{2} \mathbf{x}_{N}^{\top} \hat{G}_{N} \mathbf{x}_{N}+\hat{\mathbf{c}}_{N}^{\top} \mathbf{x}_{N}
$$
其中
$$
\begin{array}{c}
\hat{G}_{N}=G_{N N}-G_{N B} A_{B}^{-1} A_{N}-A_{N}^{\top} A_{B}^{-\top} G_{B N}+A_{N}^{\top} A_{B}^{-\top} G_{B B} A_{B}^{-1} A_{N} \\
\hat{\mathbf{c}}_{N}=\mathbf{c}_{N}-A_{N}^{\top} A_{B}^{-\top} \mathbf{c}_{B}+G_{N B} A_{B}^{-1} \mathbf{b}-A_{N}^{\top} A_{B}^{-\top} G_{B B} A_{B}^{-1} \mathbf{b}
\end{array}
$$
以及对应的分块形式为
$$
G=\left(\begin{array}{cc}
G_{B B} & G_{B N} \\
G_{N B} & G_{N N}
\end{array}\right), \quad \mathbf{c}=\left(\begin{array}{c}
\mathbf{c}_{B} \\
\mathbf{c}_{N}
\end{array}\right)
$$
如果 $\hat{G}_N$ 正定，则解为
$$
\mathbf{x}^*_N=-\hat{G}_N^{-1}\hat{\mathbf{c}}_N
$$
原问题解为
$$
\mathbf{x}^{*}=\left(\begin{array}{c}
\mathbf{x}_{B}^{*} \\
\mathbf{x}_{N}^{*}
\end{array}\right)=\left(\begin{array}{c}
A_{B}^{-1} \mathbf{b} \\
\mathbf{0}
\end{array}\right)+\left(\begin{array}{c}
A_{B}^{-1} A_{N} \\
-I
\end{array}\right) \hat{G}_{N}^{-1} \hat{\mathbf{c}}_{N}
$$
Lagrange 乘子为
$$
G \mathbf{x}^{*}+\mathbf{c}=A^{\top} \lambda^{*} \Longrightarrow \lambda^{*}=A_{B}^{-\top}\left(G_{B B} \mathbf{x}_{B}^{*}+G_{B N} \mathbf{x}_{N}^{*}+\mathbf{c}_{B}\right)
$$

> 在后边的二次规划算法中，需要用到 $\lambda$ 
>
> KT 条件为
> $$
> \nabla_{\mathbf{x}}L(\mathbf{x},\lambda)=\nabla f(\mathbf{x})-\sum_i \lambda_i \nabla_{\mathbf{x}}c_i(\mathbf{x})=G\mathbf{x}+\mathbf{c}-A^{\top} \lambda
> $$

如果 $\hat{G}_N$ 半正定，当 $(I-\hat{G}_N \hat{G}_N^+)\hat{\mathbf{c}}_N=\mathbf{0}$ 时，解为
$$
\mathbf{x}_{N}^{*}=-\hat{G}_{N}^{+} \hat{\mathbf{c}}_{N}+\left(I-\hat{G}_{N}^{+} \hat{G}_{N}\right) \tilde{\mathbf{y}}
$$
其中 $\tilde{\mathbf{y}}$ 表示 $\mathbb{R}^{n-m}$ 为任意向量，$\hat{G}_N^+$ 表示 $\hat{G}_N$ 的广义逆矩阵

> 广义逆
> $$
> \begin{align}
> AA^+A&=A\\
> A^+AA^+&=A^+
> \end{align}
> $$
>
> ---
>
> 当 $\hat{G}_N$ 半正定时，$\hat{G}_N$ 有 $0$ 特征值，将 $0$ 特征值对应的特征向量 $\mathbf{x}_N$ 代入，$\frac{1}{2} \mathbf{x}_{N}^{\top} \hat{G}_{N} \mathbf{x}_{N}=0$，若 $\hat{\mathbf{c}}_{N}^{\top} \mathbf{x}_{N}$ 不为 $0$，则问题可负无穷，无解。
>
> 而 $0$ 特征值对应的特征向量有形式 $\mathbf{z}=\left(I-\hat{G}_{N}^{+} \hat{G}_{N}\right) \tilde{\mathbf{y}}$，故要求 $(I-\hat{G}_N \hat{G}_N^+)\hat{\mathbf{c}}_N=\mathbf{0}$ 

如果 $\hat{G}_N$ 不定（存在负的特征根），显然问题无下界，故原问题不存在有限最优解

缺点：当 $A_B$ 接近奇异时，数值不稳定

#### 3.1.1.2 广义消去法

设 $Z=\{\mathbf{z}_{m+1},\dots,\mathbf{z}_n\}$ 为解空间 $\mathop{Ker}(A)$ 的一组基，$Y=\{\mathbf{y}_1,\dots,\mathbf{y}_m\}$ 是商空间 $\mathbb{R}^n/\mathop{Ker}(A)$ 的一组基，则 $\forall \mathbf{x}\in\mathbb{R}^n$ 可作如下分解表达
$$
\mathbf{x}=Y\mathbf{x}_Y+Z\mathbf{x}_Z
$$

> 维度
>
> - $Y$: $n\times m$ 
> - $Z$: $n\times (n-m)$ 
> - $\mathbf{x}_Y$: $m\times 1$ 
> - $\mathbf{x}_Z$: $(n-m)\times 1$ 
>
> $\mathop{Ker}(A)=\{\mathbf{x}|A\mathbf{x}=0\}$ 为 $A$ 的齐次方程的解集
>
> $AY$ 可逆
>
> $Y \oplus Z=\mathbb{R}^n$ 
>
> $Y$ 和 $Z$ 相当于子空间的坐标系（每一列是坐标轴），而 $\mathbf{x}_Y$ 和 $\mathbf{x}_Z$ 相当于 $Y$ 和 $Z$ 的坐标

从而有
$$
A \mathbf{x}=\mathbf{b} \Longrightarrow A Y \mathbf{x}_{Y}+A Z \mathbf{x}_{Z}=\mathbf{b} \Longrightarrow \mathbf{x}_{Y}=(A Y)^{-1} \mathbf{b}
$$
则
$$
\mathbf{x}=Y(A Y)^{-1} \mathbf{b}+Z \mathbf{x}_{Z}
$$
其中 $\mathbf{z}_Z\in \mathbb{R}^{n-m}$ 是**自由变量** 

> 解是解空间的一个元素 $Z\mathbf{x}_Z$ 与特解 $Y(A Y)^{-1} \mathbf{b}$ 的和

代入目标函数，有
$$
\min _{\mathbf{x}_{\mathbf{Z}} \in \mathbb{R}^{n-m}} \frac{1}{2} \mathbf{x}_{Z}^{\top}\left(Z^{\top} G Z\right) \mathbf{x}_{Z}+\left[ G Y(A Y)^{-1} \mathbf{b}+ \mathbf{c}\right]^{\top}Z \mathbf{x}_{Z}
$$
假设 $Z^{\top}GZ$ 正定，有
$$
\mathbf{x}_{Z}^{*}=-\left(Z^{\top} G Z\right)^{-1} Z^{\top}\left[G Y(A Y)^{-1} \mathbf{b}+\mathbf{c}\right]
$$
从而
$$
\mathbf{x}^{*}=Y(A Y)^{-1}\mathbf{b}-Z\left(Z^{\top} G Z\right)^{-1} Z^{\top}\left[G Y(A Y)^{-1} \mathbf{b}+\mathbf{c}\right]
$$
相应 Lagrange 乘子为
$$
\lambda^{*}=(A Y)^{-\top} Y^{\top}\left(G \mathbf{x}^{*}+\mathbf{c}\right)
$$

> $$
> \begin{aligned}
> \nabla L(\mathbf{x}^*,\lambda^*)=G\mathbf{x}^*+\mathbf{c}-A^\top\lambda^*&=0\\
> G\mathbf{x}^*+c&=A^\top\lambda^*\\
> Y^\top(G\mathbf{x}^*+c)&=(AY)^\top\lambda^*\\
> (AY)^{-\top}Y^\top(G\mathbf{x}^*+c)&=\lambda^*\\
> \end{aligned}
> $$
>
> $Y$ 有一定的任意性，如果取得 $AY = I$，则问题将变得简单许多
> $$
> \begin{align}
> \mathbf{x}^{*}&=Y\mathbf{b}-Z\left(Z^{\top} G Z\right)^{-1} Z^{\top}\left[G Y \mathbf{b}+\mathbf{c}\right]\\
> \lambda^{*}&=Y^{\top}\left(G \mathbf{x}^{*}+\mathbf{c}\right)
> \end{align}
> $$
> 在 [3.1.1.3 Lagrange 法](#3.1.1.3 Lagrange 法) 有提到，使用 QR 分解即可

#### 3.1.1.3 Lagrange 法

(K-T) 点为如下方程组的解
$$
\left\{\begin{array}{l}
G \mathbf{x}+\mathbf{c}=A^{\top} \lambda \\
A \mathbf{x}=\mathbf{b}
\end{array}\right.
$$
写成矩阵形式
$$
\left(\begin{array}{cc}
G & -A^{\top} \\
-A & 0
\end{array}\right)\left(\begin{array}{l}
\mathbf{x} \\
\lambda
\end{array}\right)=-\left(\begin{array}{l}
\mathbf{c} \\
\mathbf{b}
\end{array}\right)
$$
假设 $\left(\begin{array}{cc}
G & -A^{\top} \\
-A & 0
\end{array}\right)$ 可逆，则存在 $U \in \mathbb{R}^{n \times n}, V \in \mathbb{R}^{m \times m}, W \in \mathbb{R}^{m \times n}$ 使得
$$
\left(\begin{array}{cc}
G & -A^{\top} \\
-A & 0
\end{array}\right)^{-1}=\left(\begin{array}{cc}
U & W^{\top} \\
W & V
\end{array}\right)
$$
则，唯一解为
$$
\left\{\begin{array}{l}
\mathbf{x}^{*}=-U \mathbf{c}-W^{\top} \mathbf{b} \\
\lambda^{*}=-W \mathbf{c}-V \mathbf{b}
\end{array}\right.
$$
若 $G$ 可逆，$A$ 行满秩，则 $AG^{-1}A$ 可逆，有
$$
\left\{\begin{array}{l}
U=G^{-1}-G^{-1} A^{\top}\left(A G^{-1} A^{\top}\right)^{-1} A G^{-1}, \\
V=-\left(A G^{-1} A^{\top}\right)^{-1} \\
W=-\left(A G^{-1} A^{\top}\right)^{-1} A G^{-1}
\end{array}\right.
$$
> [分块矩阵求逆公式](https://wenku.baidu.com/view/8bf505100b4e767f5acfcebb.html) 

求解公式
$$
\left\{\begin{array}{l}
\mathbf{x}^{*}=-G^{-1} \mathbf{c}+G^{-1} A^{\top}\left(A G^{-1} A^{\top}\right)^{-1}\left(A G^{-1} \mathbf{c}+\mathbf{b}\right) \\
\lambda^{*}=\left(A G^{-1} A^{\top}\right)^{-1}\left(A G^{-1} \mathbf{c}+\mathbf{b}\right)
\end{array}\right.
$$
若取 $Y,Z$ 满足 $A Y=I_{m \times m}, A Z=0$，另若 $Z^{\top}GZ$ 可逆，则 $\left(\begin{array}{cc}
G & -A^{\top} \\
-A & 0
\end{array}\right)$ 可逆，有
$$
\left\{\begin{array}{l}
U=Z\left(Z^{\top} G Z\right)^{-1} Z^{\top} \\
V=-Y^{\top} G P^{\top} Y \\
W=-Y^{\top} P
\end{array}\right.
$$
其中 $P=I-GU=I-GZ\left(Z^{\top} G Z\right)^{-1} Z^{\top}$ 

如何取 $Y,Z$ 满足 $A Y=I_{m \times m}, A Z=0$？

对 $A^{\top}$ 进行 QR 分解
$$
A^{\top}=Q\left(\begin{array}{l}
R \\
0
\end{array}\right)=\left(Q_{1}, Q_{2}\right)\left(\begin{array}{l}
R \\
0
\end{array}\right)
$$
其中 $Q$ 为 $n\times n$ 正交阵，$R$ 为 $m\times m$ 上三角阵

> QR 分解本质上是施密特正交化（Schmidt orthogonalization）

即
$$
A=\left(R^{\top}, 0\right)\left(\begin{array}{c}
Q_{1}^{\top} \\
Q_{2}^{\top}
\end{array}\right)
$$
于是令 $Y=Q_1R^{-\top}$，$Z=Q_2$，有
$$
A Y=R^{\top} Q_{1}^{\top} Q_{1} R^{-\top}=I_{m \times m}, \quad A Z=R^{\top} Q_{1}^{\top} Q_{2}=0_{m \times(n-m)}
$$

### 3.1.2 一般

问题
$$
\begin{array}{ll}
\min & Q(\mathbf{x})=\frac{1}{2} \mathbf{x}^{\top} G \mathbf{x}+\mathbf{c}^{\top} \mathbf{x} \\
\text { s.t. } & \mathbf{a}_{i}^{\top} \mathbf{x}=b_{i}, i \in \mathcal{E}=\left\{1, \cdots, m_{e}\right\} \\
& \mathbf{a}_{i}^{\top} \mathbf{x} \geq b_{i}, i \in \mathcal{I}=\left\{m_{e}+1, \cdots, m\right\}
\end{array}
$$

#### 3.1.2.1 积极集基本定理

设 $\mathbf{x}^*$ 是原问题的局部极小点，则 $\mathbf{x}^*$ 也必是等式约束问题
$$
(\mathrm{EQ})\left\{\begin{array}{ll}
\min & Q(\mathbf{x})=\frac{1}{2} \mathbf{x}^{\top} G \mathbf{x}+\mathbf{c}^{\top} \mathbf{x} \\
\text { s.t. } & \mathbf{a}_{i}^{\top} \mathbf{x}=b_{i}, i \in \mathcal{E} \cup \mathcal{I}_e\left(\mathbf{x}^{*}\right)
\end{array}\right.
$$
的局部极小点。

反之，如果 $\mathbf{x}^*$ 是 (EQ) 的 K-T 点（同时是原问题的可行点），且相应 Lagrange 乘子 $\lambda^*$ 满足 $\lambda_i^*\ge 0,i\in \mathcal{I}_e(\mathbf{x}^*)$，则 $\mathbf{x}^*$ 是原问题的 K-T 点

> 前者，主要是原问题局部极小点 $\mathbf{x}^*$ 附近，不等式严格成立部分可以略去，从而变为 (EQ) 局部问题的解，即为 (EQ) 的局部极小点
>
> 后者，Lagrange 乘子 $\lambda^*$ 由原问题的等式和部分不等式组成（$\lambda^*$ 对应原文的部分 $\lambda$ 和全部 $\mu$），通过补 0 可转成原问题 KKT 条件

#### 3.1.2.2 迭代

设 $\mathbf{x}^{(k)}$ 为当前迭代点（且是原问题的可行点）

当前等式约束 $\mathcal{E}_k$，问题
$$
(\mathrm{EQ1})\left\{\begin{array}{ll}
\min & \frac{1}{2} \mathbf{s}^{\top} G \mathbf{s}+(G\mathbf{x}^{(k)}+\mathbf{c})^{\top} \mathbf{s} \\
\text { s.t. } & \mathbf{a}_{i}^{\top} \mathbf{s}=0, i \in \mathcal{E}_k
\end{array}\right.
$$

> 其中 $\mathbf{s}=\mathbf{x}^{(k+1)}-\mathbf{x}^{(k)}$，则 $Q(\mathbf{x}^{(k+1)})-Q(\mathbf{x}^{(k)})=Q(\mathbf{x}^{(k)}+\mathbf{s})-Q(\mathbf{x}^{(k)})$ 即为 (EQ1) 的目标函数

求得 (EQ1) 的解 $\mathbf{s}^{(k)}$，及其相应的 Lagrange 乘子 $\lambda_i^{(k)},i\in \mathcal{E}_k$ 

> 当 $\mathbf{s}^{(k)}=\mathbf{0}$ 时，(EQ1) 目标函数值为 $0$，故 $Q(\mathbf{x}^{(k)}+\mathbf{s}^{(k)})-Q(\mathbf{x}^{(k)})\le 0$，下降
>
> ---
>
> 用分块法，广义消去法，Lagrange 法求解

(a) 若 $\mathbf{s}^{(k)}\neq \mathbf{0}$，$\mathbf{x}^{(k)}$ 不可能是原问题的 K-T 点

> $\mathbf{s}^{(k)}\neq \mathbf{0}$ 表示目标函数可下降，且一定程度的下降满足约束

(b) 若 $\mathbf{s}^{(k)}=\mathbf{0}$，则 $\mathbf{x}^{(k)}$ 是问题
$$
(\mathrm{EQ} 2)\left\{\begin{array}{ll}
\min & \frac{1}{2} \mathbf{x}^{\top} G \mathbf{x}+\mathbf{c}^{\top} \mathbf{x} \\
\text { s.t. } & \mathbf{a}_{i}^{\top} \mathbf{x}=b_{i}, i \in \mathcal{E}_{k}
\end{array}\right.
$$
的 K-T 点，如果 $\lambda_i^{(k)}\ge 0,i\in I_e(\mathbf{x}^{(k)})$，则 $\mathbf{x}^{(k)}$ 也是原问题的 K-T 点

(c) 否则，由 $\lambda_{i_q}^{(k)}=\min_{i\in I(\mathbf{x}^{(k)})}\lambda_i^{(k)}<0$ 确定 $i_q$，那么
$$
\text { (EQ3) }\left\{\begin{array}{ll}
\min & \frac{1}{2} \mathbf{s}^{\top} G \mathbf{s}+\left(G \mathbf{x}^{(k)}+\mathbf{c}\right)^{\top} \mathbf{s} \\
\text { s.t. } & \mathbf{a}_{i}^{\top} \mathbf{s}=0, i \in \hat{\mathcal{E}}=\mathcal{E}_{k} \backslash\left\{i_{q}\right\}
\end{array}\right.
$$
的解 $\hat{\mathbf{s}}$ 是原问题在 $\mathbf{x}^{(k)}$ 的可行方向，即 $\mathbf{a}_{i_q}^{\top}\hat{\mathbf{s}}\ge 0$ 

#### 3.1.2.3 积极集方法

![image-20200517173908246](assets/03_Constraint/image-20200517173908246.png)

## 3.2 非线性约束最优化

### 3.2.1 等式约束

$$
\begin{array}{ll}
\min & f(\mathbf{x}) \\
\text { s.t. } & \mathbf{c}(\mathbf{x})=\mathbf{0}
\end{array}
$$

其中 $\mathbf{x}\in \mathbb{R}^n$， $\mathbf{c}(\mathbf{x})=\left(c_{1}(\mathbf{x}), \cdots, c_{m}(\mathbf{x})\right)^{\top}$ 

记 $A(\mathbf{x})=[\nabla \mathbf{c}(\mathbf{x})]^{\top}=\left(\nabla c_{1}(\mathbf{x}), \cdots, \nabla c_{m}(\mathbf{x})\right)^{\top}$ 

> $A(\mathbf{x})$ 是 $m\times n $ 的函数矩阵

$\mathbf{x}$ 是 K-T 点当且仅当存在 $\lambda\in \mathbb{R}^m$ 使得
$$
\nabla f(\mathbf{x})-A(\mathbf{x})^\top\lambda = \mathbf{0}
$$
且 $\mathbf{x}$ 是可行点，即 $\mathbf{c}(\mathbf{x})=\mathbf{0}$ 

联立方程组
$$
\left\{\begin{array}{l}
\nabla f(\mathbf{x})-A(\mathbf{x})^{\top} \lambda=\mathbf{0} \\
-\mathbf{c}(\mathbf{x})=\mathbf{0}
\end{array}\right.
$$
可用 Newton-Raphson 迭代法求解

记 $\mathbf{x}$ 和 $\lambda$ 的计算增量分别为 $\delta_{\mathbf{x}}$ 和 $\delta_\lambda$，则 Newton-Raphson 迭代满足
$$
\left(\begin{array}{cc}
W(\mathbf{x}, \lambda) & -A(\mathbf{x})^{\top} \\
-A(\mathbf{x}) & 0
\end{array}\right)\left(\begin{array}{c}
\delta_{\mathbf{x}} \\
\delta_{\lambda}
\end{array}\right)=-\left(\begin{array}{c}
\nabla f(\mathbf{x})-A(\mathbf{x})^{\top} \lambda \\
-\mathbf{c}(\mathbf{x})
\end{array}\right)
$$

其中 $W(\mathbf{x}, \lambda)=\nabla^{2} f(\mathbf{x})-\sum_{i=1}^{m} \lambda_{i} \nabla^{2} c_{i}(\mathbf{x})$ 

上述方法称为 ==Lagrange-Newton 迭代法==，实质上是用 Newton-Raphson 迭代求 Lagrange 函数 $L(\mathbf{x},\lambda)$ 的稳定点

> Newton-Raphson 迭代就是牛顿法（$x^{(k+1)}=x^{(k)}-\frac{f(x^{(k)})}{f^\prime(x^{(k)})}$）

定义价值函数
$$
\psi(\mathbf{x},\lambda)=\|\nabla f(\mathbf{x})-A(\mathbf{x})^\top \lambda\|^2 + \|c(\mathbf{x})\|^2
$$
$\psi(\mathbf{x},\lambda)$ 是关于 Lagrange-Newton 法的下降函数，即满足
$$
\nabla \psi(\mathbf{x},\lambda)^\top \left(\begin{array}{c} \delta _{\mathbf{x}}\\ \delta_\lambda \end{array}\right) = -2\psi(\mathbf{x},\lambda)\le 0
$$
![image-20200620184622215](assets/03_Constraint/image-20200620184622215.png)

![image-20200620184647957](assets/03_Constraint/image-20200620184647957.png)

Lagrange-Newton 法的一大重要贡献是，在其基础上发展出了==逐步二次规划方法== Sequential Quadratic Programming Methods

Newton-Raphson 迭代可写成
$$
\left\{\begin{array}{l}
W(\mathbf{x}, \lambda) \delta_{\mathbf{x}}+\nabla f(\mathbf{x})=A(\mathbf{x})^{\top}\left(\lambda+\delta_{\lambda}\right) \\
\mathbf{c}(\mathbf{x})+A(\mathbf{x}) \delta_{\mathbf{x}}=\mathbf{0}
\end{array}\right.
$$
$\delta_{\mathbf{x}^{(k)}}$ 即为下列二次规划问题
$$
\begin{array}{ll}
\min & \frac{1}{2} \mathbf{d}^{\top} W\left(\mathbf{x}^{(k)}, \lambda^{(k)}\right) \mathbf{d}+\nabla f\left(\mathbf{x}^{(k)}\right)^{\top} \mathbf{d} \\
\text { s.t. } & \mathbf{c}\left(\mathbf{x}^{(k)}\right)+A\left(\mathbf{x}^{(k)}\right) \mathbf{d}=0
\end{array}
$$
的 K-T 点

> 类似于原问题 Lagrange 函数的二阶逼近
>
> 但不完全相等，当无不等式约束或 $\lambda^{(k)}$ 中不等式约束的 Lagrange 乘子为 0 时，两者相等
>
> 参考：https://www.math.uh.edu/~rohop/fall_06/Chapter4.pdf

Lagrange-Newton 法可理解为逐步求解上述等式约束二次规划的方法

设 $\mathbf{d}^{(k)}$ 是二次规划问题的最优解，那么可迭代更新
$$
\mathbf{x}^{(k+1)}=\mathbf{x}^{(k)}+\alpha_k\mathbf{d}^{(k)}
$$
设 $\bar{\lambda}^{(k)}$ 是二次规划问题的 Lagrange 乘子向量，那么
$$
\lambda^{(k+1)}=\lambda^{(k)} + \alpha_k (\bar{\lambda}^{(k)}-\lambda^{({k})})
$$

### 3.2.2 一般

$$
\begin{array}{ll}
\min & f(\mathbf{x}) \\
\text { s.t. } & c_{i}(\mathbf{x})=0, i \in \mathcal{E}=\left\{1, \cdots, m_{e}\right\} \\
& c_{i}(\mathbf{x}) \geq 0, i \in \mathcal{I}=\left\{m_{e}+1, \cdots, m\right\}
\end{array}
$$

#### 3.2.2.1 逐步二次规划法

类似地，在第 $k$ 次迭代里求解子问题
$$
\begin{array}{ll}
\min & \frac{1}{2} \mathbf{d}^{\top} W_{k} \mathbf{d}+(\mathbf{g}^{(k)})^\top \mathbf{d} \\
\text { s.t. } & c_{i}\left(\mathbf{x}^{(k)}\right)+\mathbf{a}_{i}\left(\mathbf{x}^{(k)}\right)^{\top} \mathbf{d}=0, i \in \mathcal{E} \\
& c_{i}\left(\mathbf{x}^{(k)}\right)+\mathbf{a}_{i}\left(\mathbf{x}^{(k)}\right)^{\top} \mathbf{d} \geq 0, i \in \mathcal{I}
\end{array}
$$
记解为 $\mathbf{d}^{(k)}$，相应 Lagrange 乘子向量为 $\bar{\lambda}^{(k)}$，故有
$$
\left\{\begin{array}{l}
W_{k} \mathbf{d}^{(k)}+\mathbf{g}^{(k)}=A\left(\mathbf{x}^{(k)}\right)^{\top} \bar{\lambda}^{(k)} \\
\bar{\lambda}_{i}^{(k)} \geq 0, i \in \mathcal{I} \\
\mathbf{c}\left(\mathbf{x}^{(k)}\right)+A\left(\mathbf{x}^{(k)}\right) \mathbf{d}^{(k)}=0
\end{array}\right.
$$
其中 $W_k$ 是原问题 Lagrange 函数的 Hesse 阵或其近似

Hann 逐步二次规划方法

![image-20200620195730598](assets/03_Constraint/image-20200620195730598.png)

![image-20200620195745839](assets/03_Constraint/image-20200620195745839.png)

#### 3.2.2.2 罚函数法

==罚函数==是指利用目标函数 $f(\mathbf{x})$ 和约束方程 $\mathbf{c}(\mathbf{x})$ 所构造的具有罚性质的函数
$$
P(\mathbf{x})=P(f(\mathbf{x}),\mathbf{c}(\mathbf{x}))
$$
所谓“==罚性质==”，即要求对问题的可行点 $\mathbf{x}\in\mathcal{S}$ 均有 $P(\mathbf{x})=f(\mathbf{x})$，而当约束条件破坏时有 $P(\mathbf{x})>f(\mathbf{x})$ 

为了描述约束条件被破坏的程度，定义 $\mathbf{c}(\mathbf{x})_-$ 如下
$$
\left\{\begin{array}{ll}
c_{i}(\mathbf{x})_{-}=c_{i}(\mathbf{x}), & i \in \mathcal{E} \\
c_{i}(\mathbf{x})_{-}=\min \left\{0, c_{i}(\mathbf{x})\right\}, & i \in \mathcal{I}
\end{array}\right.
$$
罚函数一般可取为目标函数与“==罚项==”之和，即
$$
P(\mathbf{x})=f(\mathbf{x})+\phi(\mathbf{c}(\mathbf{x})_-)
$$
罚项 $\phi(\mathbf{c}(\mathbf{x})_-)$ 满足
$$
\phi(\mathbf{0})=0, \lim_\limits{\|\mathbf{c}\|\to\infty}=\phi(\mathbf{c})=+\infty
$$

> 如 Courant 罚函数
> $$
> P_\sigma(\mathbf{x}) = f(\mathbf{x})+\sigma\|\mathbf{c}(\mathbf{x})_-\|_2^2
> $$
> 其中 $\sigma >0$ 是罚因子

考虑简单罚函数
$$
P_\sigma(\mathbf{x}) = f(\mathbf{x})+\sigma\|\mathbf{c}(\mathbf{x})_-\|_2^2
$$
设 $\mathbf{x}(\sigma)$ 是无约束问题 $\min_\limits{\mathbf{x}} P_\sigma(\mathbf{x})$ 的最优解，则有如下引理

引理：若 $\mathbf{x}(\sigma)$ 同时是原问题的可行点，则 $\mathbf{x}(\sigma)$ 也是原问题的最优解

![image-20200620201013849](assets/03_Constraint/image-20200620201013849.png)

易得如下三个引理

- 设 $\sigma_{k+1}>\sigma_k>0$，则有 $P_{\sigma_k}(\mathbf{x}(\sigma_k))\le P_{\sigma_{k+1}}(\mathbf{x}(\sigma_{k+1}))$，$\|\mathbf{c}(\mathbf{x}(\sigma_k))_-\|\ge \|\mathbf{c}(\mathbf{x}(\sigma_{k+1}))_-\|$，$f(\mathbf{x}(\sigma_k))\le f(\mathbf{x}(\sigma_{k+1}))$ 
- 设 $\bar{\mathbf{x}}$ 是原问题的最优解，则 $\forall \sigma_k>0$，有 $f(\bar{\mathbf{x}})\ge P_{\sigma_k}(\mathbf{x}(\sigma_k))\ge f(\mathbf{x}(\sigma_k))$ 
- 令 $\delta =\|\mathbf{c}(\mathbf{x}(\sigma))_-\|$，则 $\mathbf{x}(\sigma)$ 也是约束问题 $\begin{array}{l}\min & f(\mathbf{x})\\\text{s.t.}&\|\mathbf{c}(\mathbf{x})_-\|\le \delta \end{array}$ 的最优解

**罚函数法收敛定理 1** 

设罚函数法中的 $\epsilon$ 满足
$$
\epsilon > \min_{\mathbf{x}}\|\mathbf{c}(\mathbf{x})_-\|
$$
则算法必有限终止

> 当问题有可行解时，$\min_{\mathbf{x}}\|\mathbf{c}(\mathbf{x})_-\|=0$ 

定理表明，如果原问题存在可行点，则 $\forall \epsilon > 0$，算法将有限终止于问题
$$
\begin{array}{l}
\min & f(\mathbf{x})\\
\text{s.t.}&\|\mathbf{c}(\mathbf{x})_-\|\le \delta
\end{array}
$$
的解，且 $\delta \le \epsilon$ 

**罚函数法收敛定理 2** 

如果算法不有限终止，则必有 $\min_\limits{\mathbf{x}}\|\mathbf{c}(\mathbf{x})_-\|\ge \epsilon$，且 $\lim_\limits{k\to\infty}\|\mathbf{c}(\mathbf{x}(\sigma_k))_-\|=\min_\limits{\mathbf{x}}\|\mathbf{c}(\mathbf{x})_-\|$，此时 $\{\mathbf{x}(\sigma_k)\}$ 的任何聚点都是问题
$$
\begin{array}{ll}
\min & f(\mathbf{x}) \\
\text { s.t. } & \left\|\mathbf{c}(\mathbf{x})_{-}\right\|=\min _\limits{\mathbf{y} \in \mathbb{R}^{n}}\left\|\mathbf{c}(\mathbf{y})_{-}\right\|
\end{array}
$$
的解

#### 3.2.2.3 乘子罚函数法

> 为了叙述简单，仅考虑等式约束问题

$$
\begin{array}{ll}
\min & f(\mathbf{x}) \\
\text { s.t. } & \mathbf{c}(\mathbf{x})=\mathbf{0}
\end{array}
$$

其中 $\mathbf{c}(\mathbf{x})=(c_1(\mathbf{x}),\dots,c_{m_e}(\mathbf{x}))^\top$ 

设 $\mathbf{x}^*$ 是最优解，且 $\lambda^*$ 是相应的 Lagrange 乘子，由 Kuhn-Tucher 定理知，$\mathbf{x}^*$ 必是 Lagrange 函数
$$
L(\mathbf{x},\lambda^*)=f(\mathbf{x})-(\lambda^*)^\top \mathbf{c}(\mathbf{x})
$$
的稳定点

考虑==乘子罚函数==（也称==增广 Lagrange 函数==）
$$
P(\mathbf{x}, \lambda, \sigma)=L(\mathbf{x}, \lambda)+\frac{\sigma}{2}\|\mathbf{c}(\mathbf{x})\|_{2}^{2}
$$
由于增广 Lagrange 函数的性态，只要取足够大的罚因子 $\sigma$ 而不必趋向无穷大，就可通过极小化 $P(\mathbf{x},\lambda,\sigma)$ 求得原问题的最优解

设 $A(\mathbf{x})=(\nabla \mathbf{c}(\mathbf{x}))^\top$，由于 $\mathbf{c}(\mathbf{x}^*)=\mathbf{0}$，有
$$
\begin{array}{c}
\nabla_{\mathbf{x}} P\left(\mathbf{x}^{*}, \lambda^{*}, \sigma\right)=\nabla_{\mathbf{x}} L\left(\mathbf{x}^{*}, \lambda^{*}\right)=\mathbf{0} \\
\nabla_{\mathbf{x} \mathbf{x}}^{2} P\left(\mathbf{x}^{*}, \lambda^{*}, \sigma\right)=\nabla_{\mathbf{x} \mathbf{x}}^{2} L\left(\mathbf{x}^{*}, \lambda^{*}\right)+\sigma A\left(\mathbf{x}^{*}\right) A\left(\mathbf{x}^{*}\right)^{\top}
\end{array}
$$
设在 $\mathbf{x}^*$ 处满足**二阶充分条件**，即 $\forall \mathbf{d} \text{ s.t. } A(\mathbf{x}^*)^\top \mathbf{d}=\mathbf{0},\mathbf{d}\neq \mathbf{0}$，有
$$
\mathbf{d}^\top\nabla_{\mathbf{x} \mathbf{x}}^{2} L(\mathbf{x}^*,\lambda^*)\mathbf{d}>0
$$
则对于充分大的 $\sigma$，可证 $\nabla_{\mathbf{x} \mathbf{x}}^{2} P\left(\mathbf{x}^{*}, \lambda^{*}, \sigma\right)$ 是正定阵

![image-20200620204402750](assets/03_Constraint/image-20200620204402750.png)

![image-20200620204410734](assets/03_Constraint/image-20200620204410734.png)

我们事先不知道最优乘子向量 $\lambda^*$，因此用乘子 $\lambda$ 替代，得到==增广 Lagrange 罚函数== 
$$
P(\mathbf{x}, \lambda, \sigma)=f(\mathbf{x})-\lambda^{\top} \mathbf{c}(\mathbf{x})+\frac{\sigma}{2}\|\mathbf{c}(\mathbf{x})\|_{2}^{2}
$$
一般策略是，先给定充分大的 $\sigma$ 和乘子向量的初始估计 $\lambda$，然后再迭代过程中修正 $\lambda$ 力图使之趋向最优乘子  $\lambda^*$ 

![image-20200620204622797](assets/03_Constraint/image-20200620204622797.png)

#### 3.2.2.4 障碍函数

在迭代中总是从内点出发，并通过引入障碍函数使之保持在可行域内部进行搜索，适用于**不等式约束**的非线性最优化问题
$$
\begin{array}{ll}
\min & f(\mathbf{x}) \\
\text { s.t. } & g_{i}(\mathbf{x}) \geq 0, i=1, \cdots, m
\end{array}
$$
将==可行域内部==记作 $\operatorname{int} \mathcal{S}$，其中 $\mathcal{S}=\{\mathbf{x}|g_i(\mathbf{x})\ge 0,i=1,\dots,m\}$ 

保持迭代点含于可行域内部的方法是定义如下障碍函数
$$
B(\mathbf{x},\theta)=f(\mathbf{x})+\theta\psi(\mathbf{x})
$$
其中==障碍因子== $\theta$ 是很小的正数，$\psi(\mathbf{x})$ 是连续函数，当 $\mathbf{x}$ 趋于可行域边界时，$\psi(\mathbf{x})\to +\infty$ 

两种重要的障碍形式
$$
\psi(\mathbf{x})=\sum_{i=1}^m\frac{1}{g_i(\mathbf{x})},\psi(\mathbf{x})=-\sum_{i=1}^m\log g_i(\mathbf{x})
$$
这样当 $\mathbf{x}$ 趋向可行域边界时，函数 $B(\mathbf{x},\theta)\to +\infty$，否则，由于 $\theta$ 很小，函数 $B(\mathbf{x},\theta)$ 的取值近似于 $f(\mathbf{x})$ 

![image-20200620205359982](assets/03_Constraint/image-20200620205359982.png)

![image-20200620205417864](assets/03_Constraint/image-20200620205417864.png)

#### 3.2.2.5 内点法

$$
\begin{array}{cl}
\min & f(\mathbf{x}) \\
\text { s.t. } & \mathbf{c}_{E}(\mathbf{x})=0 \\
& \mathbf{c}_{I}(\mathbf{x}) \geq 0 \\
\min & f(\mathbf{x}) \\
\text { s.t. } & \mathbf{c}_{E}(\mathbf{x})=0 \\
& \mathbf{c}_{I}(\mathbf{x})-\mathbf{s}=0 \\
& \mathbf{s} \geq 0
\end{array}
$$

KKT 条件为
$$
\begin{aligned}
\nabla f(\mathbf{x})-A_{E}(\mathbf{x})^{\top} \mathbf{y}-A_{l}(\mathbf{x})^{\top} \mathbf{z} &=0 \\
S \mathbf{z}-\mu \mathbf{1} &=0 \\
\mathbf{c}_{E}(\mathbf{x}) &=0 \\
\mathbf{c}_{l}(\mathbf{x})-\mathbf{s} &=0
\end{aligned}
$$
其中 $\mu = 0$，且 $\mathbf{s}\ge 0$，$\mathbf{z}\ge 0$，$A_E(\mathbf{x})$ 和 $A_I(\mathbf{x})$ 是 $\mathbf{c}_E(\mathbf{x})$ 和 $\mathbf{c}_I(\mathbf{x})$ 的 Jacobian 矩阵，$\mathbf{y}$ 和 $\mathbf{z}$ 是它们的 Lagrange 乘子，$S$ 和 $Z$ 是 $\mathbf{s}$ 和 $\mathbf{z}$ 的对角阵，$\mathbf{1} =(1,\dots,1)^\top$ 

使用牛顿法，可得
$$
\left(\begin{array}{cccc} 
\nabla_{\mathbf{x} \mathbf{x}}^{2} L & -A_{E}(\mathbf{x})^{\top} & -A_{I}(\mathbf{x})^{\top} & 0 \\
0 & Z & 0 & S \\
A_{E}(\mathbf{x}) & 0 & 0 & 0 \\
A_{I}(\mathbf{x}) & -I & 0 & 0 \\
\end{array}\right)

\left(\begin{array}{c}
\mathbf{p}_{\mathbf{x}} \\
\mathbf{p}_{\mathbf{s}} \\
\mathbf{p}_{\mathbf{y}} \\
\mathbf{p}_{\mathbf{z}}
\end{array}\right)

=

- \left(\begin{array}{c}
\nabla f(\mathbf{x})-A_{E}(\mathbf{x})^{\top} \mathbf{y}-A_{I}(\mathbf{x})^{\top} \mathbf{z} \\
S \mathbf{z}-\mu \mathbf{1} \\
\mathbf{c}_{E}(\mathbf{x}) \\
\mathbf{c}_{I}(\mathbf{x})-\mathbf{s}
\end{array}\right)
$$
其中 $L(\mathbf{x},\mathbf{s},\mathbf{y},\mathbf{z})=f(\mathbf{x})-\mathbf{y}^\top \mathbf{c}_E(\mathbf{x})-\mathbf{z}^\top(\mathbf{c}_I(\mathbf{x})-\mathbf{s})$ 

该系统成为==原-对偶系统== primal-dual system

当 $\mathbf{p}=(\mathbf{p}_\mathbf{x},\mathbf{p}_\mathbf{s},\mathbf{p}_\mathbf{y},\mathbf{p}_\mathbf{z})$ 确定好后，可以计算新的迭代 $(\mathbf{x}^+,\mathbf{s}^+,\mathbf{y}^+,\mathbf{z}^+)$ 为
$$
\begin{aligned}
\mathbf{x}^+=\mathbf{x}+\alpha_{\mathbf{s}}^{\text{max}}\mathbf{p}_{\mathbf{x}}\\
\mathbf{s}^+=\mathbf{s}+\alpha_{\mathbf{s}}^{\text{max}}\mathbf{p}_{\mathbf{s}}\\
\mathbf{y}^+=\mathbf{y}+\alpha_{\mathbf{z}}^{\text{max}}\mathbf{p}_{\mathbf{y}}\\
\mathbf{z}^+=\mathbf{z}+\alpha_{\mathbf{z}}^{\text{max}}\mathbf{p}_{\mathbf{z}}\\
\end{aligned}
$$
其中
$$
\begin{array}{l}
\alpha_{s}^{\max }=\max \left\{\alpha \in(0,1]: \mathbf{s}+\alpha \mathbf{p}_{s} \geq(1-\tau) \mathbf{s}\right\} \\
\alpha_{z}^{\max }=\max \left\{\alpha \in(0,1]: \mathbf{z}+\alpha \mathbf{p}_{z} \geq(1-\tau) \mathbf{z}\right\}
\end{array}
$$
其中 $\tau\in (0,1)$（经典值为 ），上述条件称为 the fraction to the boundary rule，用于防止 $\mathbf{s}$ 和 $\mathbf{z}$ 太快达到它们的下界 $\mathbf{0}$ 