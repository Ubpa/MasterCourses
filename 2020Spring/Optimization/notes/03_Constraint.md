# 3. 约束优化

> [TOC]

## 3.1 二次规划

### 问题

在变量的线性等式或不等式限制下求二次函数的极小点问题
$$
\begin{array}{ll}
\min & Q(\mathbf{x})=\frac{1}{2} \mathbf{x}^{T} G \mathbf{x}+\mathbf{c}^{T} \mathbf{x} \\
\text { s.t. } & \mathbf{a}_{i}^{T} \mathbf{x}=b_{i}, i \in \mathcal{E}=\left\{1, \cdots, m_{e}\right\} \\
& \mathbf{a}_{i}^{T} \mathbf{x} \geq b_{i}, i \in \mathcal{I}=\left\{m_{e}+1, \cdots, m\right\}
\end{array}
$$
假设 $G$ 是对称阵，$\mathbf{a}_i(i\in\mathcal{E})$ 是线性无关的

> $G$ 是对称的不失一般性，$\mathbf{a}_i$ 如果线性相关，要么是多余，要么是不相容导致无解

### 解

- 约束可能不相容，也可能没有有限最小值，无解
- $G$ 半正定，凸二次规划问题，任意局部解释整体解
- $G$ 正定，正定二次规划问题，只要存在解即是唯一的
- $G$ 不定，一般二次规划问题，有可能出现非整体解的局部解

### 等式约束

$$
\begin{array}{ll}
\min & Q(\mathbf{x})=\frac{1}{2} \mathbf{x}^{T} G \mathbf{x}+\mathbf{c}^{T} \mathbf{x} \\
\text { s.t. } & A \mathbf{x}=\mathbf{b}
\end{array}
$$

这里 $A$ 是 $m\times n$ 矩阵，且不失一般性可设 $\mathop{rank} (A)=m$ 

> 等式约束可以去掉，然后给 $\mathbf{x}$ 进行变量代换，从而变成无约束优化问题

#### 分块消去法

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
\min _{\mathbf{x}_{N} \in \mathbb{R}^{n-m}} \frac{1}{2} \mathbf{x}_{N}^{T} \hat{G}_{N} \mathbf{x}_{N}+\hat{\mathbf{c}}_{N}^{T} \mathbf{x}_{N}
$$
其中
$$
\begin{array}{c}
\hat{G}_{N}=G_{N N}-G_{N B} A_{B}^{-1} A_{N}-A_{N}^{T} A_{B}^{-T} G_{B N}+A_{N}^{T} A_{B}^{-T} G_{B B} A_{B}^{-1} A_{N} \\
\hat{\mathbf{c}}_{N}=\mathbf{c}_{N}-A_{N}^{T} A_{B}^{-T} \mathbf{c}_{B}+G_{N B} A_{B}^{-1} \mathbf{b}-A_{N}^{T} A_{B}^{-T} G_{B B} A_{B}^{-1} \mathbf{b}
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
G \mathbf{x}^{*}+\mathbf{c}=A^{T} \lambda^{*} \Longrightarrow \lambda^{*}=A_{B}^{-T}\left(G_{B B} \mathbf{x}_{B}^{*}+G_{B N} \mathbf{x}_{N}^{*}+\mathbf{c}_{B}\right)
$$

> 在后边的二次规划算法中，需要用到 $\lambda$ 
>
> KT 条件为
> $$
> \nabla_{\mathbf{x}}L(\mathbf{x},\lambda)=\nabla f(\mathbf{x})-\sum_i \lambda_i \nabla_{\mathbf{x}}c_i(\mathbf{x})=G\mathbf{x}+\mathbf{c}-A^T \lambda
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
> 当 $\hat{G}_N$ 半正定时，$\hat{G}_N$ 有 $0$ 特征值，将 $0$ 特征值对应的特征向量代入，若 $\hat{\mathbf{c}}_{N}^{T} \mathbf{x}_{N}$ 不为 $0$，则问题可负无穷，无解。
>
> 而 $0$ 特征值对应的特征向量有形式 $\left(I-\hat{G}_{N}^{+} \hat{G}_{N}\right) \tilde{\mathbf{y}}$，故要求 $(I-\hat{G}_N \hat{G}_N^+)\hat{\mathbf{c}}_N=\mathbf{0}$ 

如果 $\hat{G}_N$ 不定（存在负的特征根），显然问题无下界，故原问题不存在有限最优解

缺点：当 $A_B$ 接近奇异时，数值不稳定

#### 广义消去法

设 $Z=\{\mathbf{z}_{m+1},\dots,\mathbf{z}_n\}$ 为解空间 $\mathop{Ker}(A)$ 的一组基，$Y=\{\mathbf{y}_1,\dots,\mathbf{y}_m\}$ 是商空间 $\mathbb{R}^n/\mathop{Ker}(A)$ 的一组基，则 $\forall \mathbf{x}\in\mathbb{R}^n$ 可作如下分解表达
$$
\mathbf{x}=Y\mathbf{x}_Y+Z\mathbf{x}_Z
$$

> 维度
>
> - $Y$: $m\times m$ 
> - $Z$: $m\times (n-m)$ 
> - $\mathbf{x}_Y$: $m\times 1$ 
> - $\mathbf{x}_Z$: $(n-m)\times 1$ 
>
> $\mathop{Ker}(A)=\{\mathbf{x}|A\mathbf{x}=0\}$ 为 $A$ 的齐次方程的解集
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
其中 $\mathbf{z}_Z\in \mathbb{R}^{n-m}$ 是自由变量

代入目标函数，有
$$
\min _{\mathbf{x}_{\mathbf{Z}} \in \mathbb{R}^{n-m}} \frac{1}{2} \mathbf{x}_{Z}^{T}\left(Z^{T} G Z\right) \mathbf{x}_{Z}+\left[Z^{T} G Y(A Y)^{-1} \mathbf{b}+Z^{T} \mathbf{c}\right]^{T} \mathbf{x}_{Z}
$$
假设 $Z^TGZ$ 正定，有
$$
\mathbf{x}_{Z}^{*}=-\left(Z^{T} G Z\right)^{-1} Z^{T}\left[G Y(A Y)^{-1} \mathbf{b}+\mathbf{c}\right]
$$
从而
$$
\mathbf{x}^{*}=Y(A Y)^{-1}-Z\left(Z^{T} G Z\right)^{-1} Z^{T}\left[G Y(A Y)^{-1} \mathbf{b}+\mathbf{c}\right]
$$
相应 Lagrange 乘子为
$$
\lambda^{*}=(A Y)^{-T} Y^{T}\left(G \mathbf{x}^{*}+\mathbf{c}\right)
$$

> $Y$ 是任意取的，如果取得 $AY = I$，则问题将变得简单许多
> $$
> \begin{align}
> \mathbf{x}^{*}&=Y-Z\left(Z^{T} G Z\right)^{-1} Z^{T}\left[G Y \mathbf{b}+\mathbf{c}\right]\\
> \lambda^{*}&=Y^{T}\left(G \mathbf{x}^{*}+\mathbf{c}\right)
> \end{align}
> $$

#### Lagrange 法

(K-T) 点为如下方程组的解
$$
\left\{\begin{array}{l}
G \mathbf{x}+\mathbf{c}=A^{T} \lambda \\
A \mathbf{x}=\mathbf{b}
\end{array}\right.
$$
写成矩阵形式
$$
\left(\begin{array}{cc}
G & -A^{T} \\
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
G & -A^{T} \\
-A & 0
\end{array}\right)$ 可逆，则存在 $U \in \mathbb{R}^{n \times n}, V \in \mathbb{R}^{m \times m}, W \in \mathbb{R}^{m \times n}$ 使得
$$
\left(\begin{array}{cc}
G & -A^{T} \\
-A & 0
\end{array}\right)^{-1}=\left(\begin{array}{cc}
U & W^{T} \\
W & V
\end{array}\right)
$$
则，唯一解为
$$
\left\{\begin{array}{l}
\mathbf{x}^{*}=-U \mathbf{c}-W^{T} \mathbf{b} \\
\lambda^{*}=-W \mathbf{c}-V \mathbf{b}
\end{array}\right.
$$
若 $G$ 可逆，$A$ 行满秩，则 $AG^{-1}A$ 可逆，有
$$
\left\{\begin{array}{l}
U=G^{-1}-G^{-1} A^{T}\left(A G^{-1} A^{T}\right)^{-1} A G^{-1}, \\
V=-\left(A G^{-1} A^{T}\right)^{-1} \\
W=-\left(A G^{-1} A^{T}\right)^{-1} A G^{-1}
\end{array}\right.
$$
求解公式
$$
\left\{\begin{array}{l}
\mathbf{x}^{*}=-G^{-1} \mathbf{c}+G^{-1} A^{T}\left(A G^{-1} A^{T}\right)^{-1}\left(A G^{-1} \mathbf{c}+\mathbf{b}\right) \\
\lambda^{*}=\left(A G^{-1} A^{T}\right)^{-1}\left(A G^{-1} \mathbf{c}+\mathbf{b}\right)
\end{array}\right.
$$
若取 $Y,Z$ 满足 $A Y=I_{m \times m}, A Z=0$，另若 $Z^TGZ$ 可逆，则 $\left(\begin{array}{cc}
G & -A^{T} \\
-A & 0
\end{array}\right)$ 可逆，有
$$
\left\{\begin{array}{l}
U=Z\left(Z^{T} G Z\right)^{-1} Z^{T} \\
V=-Y^{T} G P^{T} Y \\
W=-Y^{T} P
\end{array}\right.
$$
其中 $P=I-GU=I-GZ\left(Z^{T} G Z\right)^{-1} Z^{T}$ 

如何取 $Y,Z$ 满足 $A Y=I_{m \times m}, A Z=0$？

对 $A^T$ 进行 QR 分解
$$
A^{T}=Q\left(\begin{array}{l}
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
A=\left(R^{T}, 0\right)\left(\begin{array}{c}
Q_{1}^{T} \\
Q_{2}^{T}
\end{array}\right)
$$
于是令 $Y=Q_1R^{-T}$，$Z=Q_2$，有
$$
A Y=R^{T} Q_{1}^{T} Q_{1} R^{-T}=I_{m \times m}, \quad A Z=R^{T} Q_{1}^{T} Q_{2}=0_{m \times(n-m)}
$$

### 积极集基本定理

设 $\mathbf{x}^*$ 是原问题的局部极小点，则 $\mathbf{x}^*$ 也必是等式约束问题
$$
(\mathrm{EQ})\left\{\begin{array}{ll}
\min & Q(\mathbf{x})=\frac{1}{2} \mathbf{x}^{T} G \mathbf{x}+\mathbf{c}^{T} \mathbf{x} \\
\text { s.t. } & \mathbf{a}_{i}^{T} \mathbf{x}=b_{i}, i \in \mathcal{E} \cup \mathcal{I}_e\left(\mathbf{x}^{*}\right)
\end{array}\right.
$$
的局部极小点。

反之，如果 $\mathbf{x}^*$ 是 (EQ) 的 K-T 点（同时是原问题的可行点），且相应 Lagrange 乘子 $\lambda^*$ 满足 $\lambda_i^*\ge 0,i\in \mathcal{I}_e(\mathbf{x}^*)$，则 $\mathbf{x}^*$ 是原问题的 K-T 点

### 迭代

设 $\mathbf{x}^{(k)}$ 为当前迭代点（且是原问题的可行点）

当前等式约束 $\mathcal{E}_k$，问题
$$
(\mathrm{EQ1})\left\{\begin{array}{ll}
\min & \frac{1}{2} \mathbf{s}^{T} G \mathbf{s}+(G\mathbf{x}^{(k)}+\mathbf{c})^{T} \mathbf{s} \\
\text { s.t. } & \mathbf{a}_{i}^{T} \mathbf{s}=b_{i}, i \in \mathcal{E}_k
\end{array}\right.
$$

> 其中 $\mathbf{s}=\mathbf{x}^{(k+1)}-\mathbf{x}^{(k)}$，则 $Q(\mathbf{x}^{(k+1)})-Q(\mathbf{x}^{(k)})=Q(\mathbf{x}^{(k)}+\mathbf{s})-Q(\mathbf{x}^{(k)})$ 即为 (EQ1) 的目标函数

求得 (EQ1) 的解 $\mathbf{s}^{(k)}$，及其相应的 Lagrange 乘子 $\lambda_i^{(k)},i\in \mathcal{E}_k$ 

> 当 $\mathbf{s}^{(k)}=\mathbf{0}$ 时，(EQ1) 目标函数值为 $0$，故 $Q(\mathbf{x}^{(k)}+\mathbf{s}^{(k)})-Q(\mathbf{x}^{(k)})\le 0$，下降
>
> Lagrange 乘子满足
> $$
> G\mathbf{s}^{(k)}+G\mathbf{x}^{(k)}+\mathbf{c}={A^T}^{(k)}\lambda
> $$

（a) 若 $\mathbf{s}^{(k)}\neq \mathbf{0}$，$\mathbf{x}^{(k)}$ 不可能是原问题的 K-T 点

> $\mathbf{s}^{(k)}\neq \mathbf{0}$ 表示目标函数可下降，且一定程度的下降满足约束

(b) 若 $\mathbf{s}^{(k)}=\mathbf{0}$，则 $\mathbf{x}^{(k)}$ 是问题
$$
(\mathrm{EQ} 2)\left\{\begin{array}{ll}
\min & \frac{1}{2} \mathbf{x}^{T} G \mathbf{x}+\mathbf{c}^{T} \mathbf{x} \\
\text { s.t. } & \mathbf{a}_{i}^{T} \mathbf{x}=b_{i}, i \in \mathcal{E}_{k}
\end{array}\right.
$$
的 K-T 点，如果 $\lambda_i^{(k)}\ge 0,i\in I(\mathbf{x}^{(k)})$，则 $\mathbf{x}^{(k)}$ 也是原问题的 K-T 点

(c) 否则，由 $\lambda_{i_q}^{(k)}=\min_{i\in I(\mathbf{x}^{(k)})}\lambda_i^{(k)}<0$ 确定 $i_q$，那么
$$
\text { (EQ3) }\left\{\begin{array}{ll}
\min & \frac{1}{2} \mathbf{s}^{T} G \mathbf{s}+\left(G \mathbf{x}^{(k)}+\mathbf{c}\right)^{T} \mathbf{s} \\
\text { s.t. } & \mathbf{a}_{i}^{T} \mathbf{s}=0, i \in \hat{\mathcal{E}}=\mathcal{E}_{k} \backslash\left\{i_{q}\right\}
\end{array}\right.
$$
的解 $\hat{\mathbf{s}}$ 是原问题在 $\mathbf{x}^{(k)}$ 的可行方向，即 $\mathbf{a}_{i_q}^T\hat{\mathbf{s}}\ge 0$ 

### 积极集方法

![image-20200517173908246](assets/03_Constraint/image-20200517173908246.png)

## 3.2 非线性约束最优化

$$
\begin{array}{ll}
\min & f(\mathbf{x}) \\
\text { s.t. } & \mathbf{c}(\mathbf{x})=\mathbf{0}
\end{array}
$$

其中 $\mathbf{c}(\mathbf{x})=\left(c_{1}(\mathbf{x}), \cdots, c_{m}(\mathbf{x})\right)^{T}$ 

记 $A(\mathbf{x})=[\nabla \mathbf{c}(\mathbf{x})]^{T}=\left(\nabla c_{1}(\mathbf{x}), \cdots, \nabla c_{m}(\mathbf{x})\right)^{T}$ 

$\mathbf{x}$ 是 K-T 点当且仅当存在 $\lambda\in \mathbb{R}^m$ 使得
$$
\nabla f(\mathbf{x})-A(\mathbf{x})^T\lambda = \mathbf{0}
$$
且 $\mathbf{x}$ 是可行点，即 $\mathbf{c}(\mathbf{x})=\mathbf{0}$ 

联立方程组
$$
\left\{\begin{array}{l}
\nabla f(\mathbf{x})-A(\mathbf{x})^{T} \lambda=\mathbf{0} \\
-\mathbf{c}(\mathbf{x})=\mathbf{0}
\end{array}\right.
$$
可用 