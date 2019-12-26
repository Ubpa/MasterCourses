# 2. 树与图空间

## 2.1 树与支撑树

### 定义

不含圈的图称为**林** forest，亦称**无圈图** acyclic graph

连通的无圈图称为**树** tree

>**示例** 
>
>![1571202892355](assets/1571202892355.jpg)
>
>(a) 是林，(b) 是树，(c) 是根在 $x$ 的外向树

**定理 2.1.1** 设 G 是简单图，则下列结论等价

- G 是树
- G 中任何两不同顶点恰有一条路所连接
- G 连通且 $\forall e\in E(G)$，有 $\omega(G-e)=2$ 
- G 不含圈，且 G 中任意不相邻顶点 x 和 y，$G+xy$ 含圈

**定理 2.1.3** G 是 n 阶树 $\Leftrightarrow$ G 连通且 $e(G)=n-1$ 

> 连通 n 个点只需要 $n-1$ 条边
>
> 还有一个等价条件：$e(G)=n-1$，且 G 不含圈

**推论 2.1.3** G 是 n 阶林 $\Leftrightarrow$ $e(G)= n-\omega(G)$ 

> 这个结论比**定理 2.1.3** 更具一般性
>
> 任意 n 阶图 G，有 $e(G)\ge n-\omega(G)$，当 G 是林时取等号

**推论 2.1.3(1)** 无孤立点的林至少有 $2\omega$ 个 1 度点，特别的，非平凡树至少有两个一度点（称为树的叶点，和叶点相邻的点称为支撑点）

**定理 1**（Bondy's Theorem）设 $A_1,A_2,\dots,A_n$ 是 $X=\{1,2,\dots,n\}$ 的 n 个不同子集，则 $\exist x \in X$ 使得 $A_1\backslash \{x\},A_2\backslash\{x\},\dots,A_n\backslash \{x\}$ 互不相同。

> **推论** 设 $A_1,A_2,\dots,A_n$ 是 $X=\{1,2,\dots,n\}$ 的 n 个不同子集构成的子集族，则 $\exist x \in X$ 使得 $A_1\cup \{x\},A_2\cup\{x\},\dots,A_n\cup \{x\}$ 互不相同
>
> 可由上述定理推得

### 支撑林与支撑树

F 是 D 的支撑子图，并且 $\omega(F)=\omega(D)$。若 F 是林，则称 F 为 D 的**支撑林** spanning forest

> **示例** 
>
> ![1571642881216](assets/1571642881216.jpg)

若 F 是树，称 F 为 D 的**支撑树** spanning tree

> **示例** 
>
> ![1571642905021](assets/1571642905021.jpg)

**定理 2.1.4** 每个连通图都含支撑树

**推论 2.1.4** 每个图 G 都含支撑林或者支撑树，且 $e(G)\ge |V(G)|-\omega(G)$。

**定理 2.1.5** 设 F 是 G 的支撑林，若 $\exist e\in E(G)\backslash E(F)$，则 $F+e$ 含有且仅含有一个圈（称为 G 的关于支撑林 F 的**基本圈** fundamental cycle）

**推论 2.1.5** n 阶图 G 中恰含 $e(G)-n+\omega$ 条不同的基本圈。$e(G)-n+\omega$ 称为 G 的**圈秩** cycle rank，亦称为 Betti 数。

> 图边数减去支撑林边数

### 余树与边割集

设 H 是 G 的子图，则 $G-E(H)$ 称为 H 在 G 中的**余图** cograph，记为 $\overline{H}(G)$ 

若 F 是 G 的支撑林（或树），则 $\overline{F}(g)$ 称为 G 的**余林** coforest（或**余树** cotree）

> 在不至于引起混淆的情况下，简记 $\overline{F}(G)$ 为 $\overline{F}$，简记 $\overline{T}(G)$ 为 $\overline{T}$。有时也用 $\overline{F}$ （或 $\overline{T}$）替代 $E(\overline{F})$（或 $E(\overline{T})$）

非空子集 $S\subset V(G)$，则 $B\triangleq[S,\overline{S}]=(S,\overline{S})\cup(\overline{S},S)$ 称为 G 的**边割集**（edge-cut set），若 B 的任何非空真子集都不是边割集，则称 B 为**极小边割集** minimal edge-cut set，亦称为**键** bond。

> 选定一组点 $S$，这样整个图分为两组，他们间有一些边，这就是边割集
>
> ![1571643364927](assets/1571643364927.jpg)
>
> 边割集示例
>
> ![1571643416882](assets/1571643416882.jpg)
>
> 键示例
>
> ![1571643572424](assets/1571643572424.jpg)
>
> 键要求 $S$ 是 $G[S]$ 是**连通**的
>
> 一个集合是或含边割集，则该集合内有键

边数为 1 的边割集即为**割边**，亦称为**桥** bridge，是键。

若 B 是极小边割集，则 $\omega(G-B)=\omega(G)+1$。

**定理 2.1.6** 设 F 是非空图 G 的支撑林，$e\in E(F)$，则

- $\overline{F}$ 不含键

- $\overline{F}+e$ 含有且仅有一个键（称为 G 关于 F 的**基本键** fundamental bond）

  > e 将其所在树分成两份，其一为 S，则键为 $[S,\overline{S}]$ 

**推论 2.1.6** G 中恰含 $|V(G)|-\omega(G)$ 个不同的基本键

> 支撑林的每一条边都属于某个键，键可能不止含此条边

## 2.2 图的向量空间

### 顶点空间与圈空间

设 D 是图，$V(D)=\{u_1,u_2,\dots,u_n\}$，$E(D)=\{a_1,a_2,\dots,a_m\}$。

D 的**顶点空间** vertex space $\mathcal{V}(D)$ 为（定义 $\mathbb{F}=\{\pmb{f}:V(D)\to\mathbb{R}\}$）
$$
\mathcal{V}(D)=(\mathbb{F},+,数乘)
$$

> 定义域是离散集，所以 $\pmb{f}$ 是能通过 $n$ 个关系刻画的
> $$
> \pmb{f}(u_i)=x_i
> $$

定义函数 $\pmb{u}_i \in \mathbb{F}$ 为 $\pmb{u}_i(u_j)=\delta_{i,j}$，则 $\forall \pmb{f}\in\mathcal{V}(D)$，若 $\pmb{f}(u_i)=x_i$，有
$$
\pmb{f}=\sum_{i=1}^nx_i\pmb{u}_i
$$
即 $\{\pmb{u}_i\}_{i=1}^n$ 是 $\mathcal{V}(D)$ 的一组基，则 $\dim \mathcal{V}(D)=n$。$(x_1,x_2,\dots,x_n)$ 是 $\pmb{f}$ 在这组基下的坐标，记 $\pmb{f}=(x_1,x_2,\dots,x_n)$ 

D 的**边空间** edge-space $\mathcal{E}(D)$ 定义为（定义 $\mathbb{G}=\{\pmb{g}:E(D)\to\mathbb{R}\}$）
$$
\mathcal{E}(D)=(\mathbb{G},+,数乘)
$$
同样地定义函数 $\pmb{a}_i(a_j)=\delta_{i,j}$，则 $\forall \pmb{g} \in \mathcal{E}(D)$，若 $\pmb{g}(a_i)=y_i$，则
$$
\pmb{g}=\sum_{i=1}^m y_i \pmb{a}_i
$$
即 $\{\pmb{a}_i\}_{i=1}^n$ 是 $\mathcal{E}(D)$ 的一组基，则 $\dim \mathcal{E}(D)=m$。$(y_1,y_2,\dots,y_n)$ 是 $\pmb{g}$ 在这组基下的坐标，记 $\pmb{g}=(y_1,y_2,\dots,y_n)$ 

### 圈空间与割空间

设 $\pmb{w}\in \mathcal{E}(D)$，称 $(D,\pmb{w})$ 为**加权图** weighted graph，$\pmb{w}$ 称为**权函数**，$\pmb{w}(a)$ 称为 $a$ 的**权** weight

> 权通常以矩阵形式给出，称为加权矩阵，邻接矩阵就是 $\pmb{w}(a)=1$ 

$B\subseteq E(D)$，记
$$
\pmb{w}(B)=\sum_{e\in B}\pmb{w}(e)
$$
设 $S\subset V(D)$，记 $E_D^+(S)=(S,\overline{S})$，即起点在 $S$ 终点在 $\overline{S}$ 的边集，记 $E^-_D(S)=(\overline{S},S)$，记
$$
\pmb{w}^+(S)=\pmb{w}(E_D^+(S))\\
\pmb{w}^-(S)=\pmb{w}(E_D^-(S))\\
$$
$\forall u \in V(D)$，则
$$
\begin{aligned}
\pmb{f}^+(u)&=\pmb{f}^+(\{u\})\\
\pmb{f}^-(u)&=\pmb{f}^-(\{u\})
\end{aligned}
$$
设 $\pmb{f}\in \mathcal{E}(D)$，若 $\forall u \in V(D), f^+(u)=f^-(u)$，则称 $\pmb{f}$ 为 $D$ 的**圈向量** cycle vector

> **示例** 
>
> ![1571642718171](assets/1571642718171.jpg)

对一个 D 中的圈 $C$，设一个定向，对 $\pmb{f}_C \in \mathcal{E}(D)$，同向为 $1$，逆向为 $-1$，不在圈上为 $0$，则 $\pmb{f}_C$ 是圈向量，称为**圈 C 的圈向量** 

> **示例** 
>
> ![1571642772126](assets/1571642772126.jpg)

由[推论 2.1.5](#支撑林与支撑树)，D 有 $m-n+\omega$ 个基本圈，他们的圈向量线性无关。

D 的所有圈向量构成 $\mathcal{E}(D)$ 的子空间，称为 D 的**圈空间** cycle space，记为 $\mathcal{C}(D)$，显然 $\dim \mathcal{C}(D) \ge m-n+\omega$ 

设 $\pmb{p}\in \mathcal{V}(D)$，定义 $\pmb{\delta}_{\pmb{p}}\in\mathcal{E}(D)$ 
$$
\pmb{\delta}_{\pmb{p}}(a)=\pmb{p}(x)-\pmb{p}(y),\forall a=(x,y)\in E(D)
$$
称 $\pmb{\delta}_{\pmb{p}}$ 为 D 的**割向量** cut vector

> **示例** 
>
> ![1571642647652](assets/1571642647652.jpg)
>
> 注意正值意味着减小

设 $B=E_D[S,\overline{S}]$ 是 D 中的键，定义 $\pmb{g}_B\in \mathcal{E}(D)$ 为
$$
\pmb{g}_B(a)=\left\{\begin{matrix}
1, &a\in(S,\overline{S})\\
-1 &a\in(\overline{S},S)\\
0, &a\notin B\\
\end{matrix}\right.
$$
若令
$$
\pmb{p}(u)=\left\{\begin{matrix}
1,&u\in S\\
0,&u\notin S\\
\end{matrix}\right.
$$
则 $\pmb{g}_B=\pmb{\delta}_{\pmb{p}}$，则 $\pmb{g}_B$ 是 $D$ 的割向量，$\pmb{g}_B$ 称为**键 B 的割向量** 

> **示例** 
>
> ![1571644200316](assets/1571644200316.jpg)

由[推论 2.1.6](#余树与边割集)，$D$ 有 $n-\omega$ 个基本键，且对应割向量线性无关

> $n-\omega$ 是支撑林的边数
>
> 这 $n-\omega$ 个割向量就是割空间的基

D 的所有割向量构成 $\mathcal{E}(D)$ 的子空间，称为 D 的**割空间** cut space，记为 $\mathcal{B}(D)$，显然 $\dim\mathcal{B}(D)\ge n-\omega$ 

**定理 2.2.1** 设 M 是 D 的关联矩阵，则 $\mathcal{B}(D)$ 是 $M$ 的行向量空间 $\mathcal{M}$，而 $\mathcal{C}(D)$ 是 $\mathcal{B}(D)$ 在 $\mathcal{E}(D)$ 上的正交补

> **证明** 
>
> $\forall \pmb{g}\in \mathcal{E}(D)$，$\exist \pmb{p}\in \mathcal{V}(D)$，使得 $\forall a=(x,y)\in E(D)$，有
> $$
> \pmb{g}(a)=\pmb{p}(x)-\pmb{p}(y)=\sum_{u\in V}m_u(a)\pmb{p}(u)
> $$
> 其中 $m_u(a)$ 是顶点 $u$ 对应 $M$ 的行向量的边 $a$ 上的分量，即
> $$
> m_u(a)=\left\{\begin{array}{ll}
> 1 & a\in E^+(u)\\
> -1 & a\in E^-(u)\\
> 0 & \text{other}
> \end{array}\right.
> $$
> 即 $\pmb{g}$ 可以表示为 $M$ 行向量的线性组合，故 $\mathcal{B}(D)\subseteq \mathcal{M}$ 
>
> 显然 $\mathcal{M}\subseteq \mathcal{B}(D)$，故 $\mathcal{M}=\mathcal{B}(D)$ 
>
> $\forall \pmb{f}\in \mathcal{C}(D),\forall x \in V(D)$，有
> $$
> \begin{aligned}
> \pmb{f}^+(x)-\pmb{f}^-(x)&=0\\
> \sum_{a\in E^+(x)}\pmb{f}(a)-\sum_{a\in E^-(x)}\pmb{f}(a)&=0\\
> \sum_{a\in E^+(x)}m_x(a)\pmb{f}(a)&= 0\\
> \end{aligned}
> $$
> 即 $\pmb{f}\perp \pmb{m}_x$ 

**推论 2.2.1** $\mathcal{E}(D)=\mathcal{B}(D)\oplus \mathcal{C}(D)$ 

**推论 2.2.2** $\dim \mathcal B = n-\omega$，$\dim \mathcal{C}=m-n+\omega$ 

> $\dim \mathcal{E} = m$ 

---

设 $\pmb{f}\in \mathcal{E}(D)$，用 $D_{\pmb{f}}$ 表示使 $\pmb{f}$ 的值不为 0 的边集所导出的子图。$D_{\pmb{f}}$ 称为 **$\pmb{f}$ 的支撑图** 

**引理 2.2.2** 

- 若 $\pmb{f} \in C(D)$ 且非零，则 $D_{\pmb{f}}$ 含圈
- 若 $\pmb{g}\in \mathcal{B}(D)$ 且非零，则 $D_{\pmb{g}}$ 含键

> **证明** 
>
> $D_{\pmb{f}}$ 的每个连通分支是平衡图，故含圈
>
> $\exist \pmb{p}\in \mathcal{V}(D)$ 使 $\pmb{g}=\delta_{\pmb{p}}$，任取 $u\in V(D_{\pmb{g}})$，令
> $$
> S=\{x\in V(D)|\pmb{p}(x)=\pmb{p}(u) \}
> $$
> 则 $E_D[S,\overline{S}]$ 是边割集，又 $\forall a\in E_D[S,\overline{S}],\pmb{g}(a)\neq 0$，则 $E_D[S,\overline{S}]\subseteq E(D_{\pmb{g}})$，即 $D_{\pmb{g}}$ 含键

**定理 2.2.2** 设 $B$ 和 $C$ 分别是 $\mathcal{B}(D)$ 和 $\mathcal{C}(D)$ 的基矩阵，则 $\forall R\subseteq E(D)$，有

- $B|R$ 的各列线性无关 $\Leftrightarrow$ $D[R]$ 不含圈
- $C|R$ 的各列线性无关 $\Leftrightarrow$ $D[R]$ 不含键

> **证明**（第一点）
>
> $a$ 对应的列向量记为 $B_a$ 
>
> $\Leftarrow$，设线性相关，则 $\exist \pmb{f}\in  \mathcal{E}(D),\pmb{f}\neq \pmb{0}$，且
> $$
> \pmb{f}(a)\left\{\begin{array}{ll}
> \not\equiv 0 & a\in R\\
> = 0 & a\notin R
> \end{array}\right.
> $$
> 使得
> $$
> \sum_{a\in R}\pmb{f}(a)B_a=\pmb{0}
> $$
> 则 $D_{\pmb{f}}\subseteq D[R]$ 且 $B\pmb{f}^\top=\pmb{0}$，由 **推论 2.2.1** 得 $\pmb{f}\in \mathcal{C}$，由 **引理 2.2.2** $D_{\pmb{f}}$ 含圈，即 $D[R]$ 含圈，矛盾
>
> $\Rightarrow$，设含圈，取 $D[R]$ 中一圈 $C$，则 $\pmb{f}_{C}\in \mathcal{C}(D)$，且 $\pmb{f}_C\neq \pmb{0}$ 
>
> 由 **推论 2.2.1** 得
> $$
> \pmb{0}=B\pmb{f}_C^\top=\sum_{a\in E(G)}\pmb{f}_C(a) B_a=\sum_{a\in R}\pmb{f}_C(a)B_a=(B|R)(\pmb{f}_C|R)^\top
> $$
> 即 $B|R$ 的各列线性相关，矛盾

---

设 F 是 D 的支撑林，标号
$$
\begin{aligned}
E(\overline{F})&=\{a_1,a_2,\dots,a_{m-n+\omega}\}\\
E(F)&=\{a_{m-n+\omega+1},\dots,a_m\}\\
\end{aligned}
$$
由[定理 2.1.5](#支撑林与支撑树) 知，$\forall a_i \in E(\overline{F})$，$F+a_i$ 含唯一圈 $C_i$，称为 D 中对应于 F 的基本圈

用 $\pmb{f}_i$ 表示对应于圈 $C_i$ 且 $\pmb{f}_{C_i}(a_i)=1$ 的圈向量

> 用 $a_i$ 定向

则 $\pmb{f}_1,\pmb{f}_2,\dots,\pmb{f}_{m-n+\omega}$ 为行而构成的 $(m-n+\omega)\times m$ 阶矩阵 $C_F$ 必有下列分块表示形式
$$
C_F=\left(\begin{matrix}
I_{m-n+\omega} & C_2
\end{matrix}\right)
$$
其中 $I_{m-n+\omega} = C_F|\overline{F}$ 为 $m-n+\omega$ 阶单位方阵，而 $C_2=C_F|F$ 是 $(m-n+\omega)\times(n-\omega)$ 阶矩阵

> 这个 $I_{m-n+\omega}$ 来的很简单
>
> $\pmb{f}_i(a_i)=1$，且基本圈，且 $C_i$ 除了 $a_i$，其余边都在支撑林上，即 $E(C_i)\subseteq T \cup \{a_i\}$ 
>
> 则 $f_i(a_j)=0\quad(j=1,\dots,i-1,i+1,\dots,m-n+\omega)$  
>
> 则 $f_i(a_j)=\delta_{i,j}\quad(i,j=1,\dots,m-n+\omega)$ 

由于 $\text{rank}(C_F)=m-n+\omega$，则 $\pmb{f}_1,\pmb{f}_2,\dots,\pmb{f}_{m-n+\omega}$ 是 $\mathcal{C}(D)$ 中的一组基，$C_F$ 称为 $\mathcal{C}(D)$ 中**对应于 F 的基矩阵** 

---

由[定理 2.1.6](#余树与边割集) 知，$\forall a_j \in E(F)$，$\overline{F} + a_j$ 含唯一键 $B_j$，称为 D 中对应于 F 的基本键

用 $\pmb{g}_i$ 表示对应于键 $B_i$ 且 $\pmb{g}_{B_i}(a_i)=1$ 的割向量

> 用 $a_i$ 定向

则 $\pmb{g}_{m-n+\omega+1},\pmb{g}_{m-n+\omega+2},\dots,\pmb{g}_{m}$ 为行而构成的 $(n-\omega)\times m$ 阶矩阵 $C_F$ 必有下列分块表示形式
$$
B_F=\left(\begin{matrix}B_1 & I_{n-\omega}\end{matrix}\right)
$$
其中 $I_{n-\omega} = B_F|F$ 为 $n-\omega$ 阶单位方阵，而 $B_1=B_F|\overline{F}$ 是 $(n-\omega)\times(m-n+\omega)$ 阶矩阵

> $\pmb{g}_{B_i}(a_i)=1$，且键 $B_i$ 除 $a_i$ 外不含支撑林上的

由于 $\text{rank}(B_F)=n-\omega$，则 $\pmb{g}_{m-n+\omega+1},\pmb{g}_{m-n+\omega+2},\dots,\pmb{g}_{m}$ 是 $\mathcal{B}(D)$ 中的一组基，$B_F$ 称为 $\mathcal{B}(D)$ 中**对应于 F 的基矩阵** 

> **示例** 
>
> ![1571649197450](assets/1571649197450.jpg)
>
> 支撑树 $T$ 用粗线表示，$E(T)=\{a_5,a_6,a_7,a_8,a_9\}$，$E(\overline{T})=\{a_1,a_2,a_3,a_4\}$，则
> $$
> \begin{aligned}
> C_T=
> \left[\begin{matrix}
> \pmb{f}_1\\
> \pmb{f}_2\\
> \pmb{f}_3\\
> \pmb{f}_4\\
> \end{matrix}\right]
> =
> \left[\begin{matrix}
> 1&  0&  0&  0&  0&  0&  1& -1&  0\\
> 0&  1&  0&  0&  0&  0& -1&  1& -1\\
> 0&  0&  1&  0&  1& -1& -1&  0& -1\\
> 0&  0&  0&  1&  1& -1& -1&  0&  0\\
> \end{matrix}\right]
> =
> \left[\begin{matrix}
> I_4 & C_2
> \end{matrix}\right]
> \end{aligned}
> $$
> > 看 $\pmb{f}_1$ 怎么算
> >
> > $a_1$ 对应的基本圈是 $C_1=\{a_1,a_8,a_7\}$，圈的定向由 $a_1$ 决定，所以 $\pmb{f}_1(a_1)=1$，$\pmb{f}_1(a_8)=-1$，$\pmb{f}_1(a_7)=1$，其余为 0
> >
> > 步骤就是
> >
> > - 确定对应的边（$a_1$）
> > - 找到对应的基本圈（$C_1=\{a_1,a_8,a_7\}$）
> > - 根据边来定向（$a_1$ 正，$a_8$ 反，$a_7$ 正）
> > - 根据定向确定向量
>
> 则图中圈向量可以表示为
>
> > $\pmb{f}^+(x_i)=f^-(x_i)$，因此是圈向量
>
> $$
> \begin{aligned} \mathbf { f } & = \left( \mathbf { f } \left( a _ { 1 } \right) , \mathbf { f } \left( a _ { 2 } \right) , \mathbf { f } \left( a _ { 3 } \right) , \cdots , \mathbf { f } \left( a _ { 8 } \right) , \mathbf { f } \left( a _ { 9 } \right) \right) \\ & = \left( 0 , \frac { 1 } { 2 } , - 2,0 , - 2,2 , \frac { 3 } { 2 } , \frac { 1 } { 2 } , \frac { 3 } { 2 } \right) \\ & = 0 \cdot \mathbf { f } _ { 1 } + \frac { 1 } { 2 } \cdot \mathbf { f } _ { 2 } + ( - 2 ) \cdot \mathbf { f } _ { 3 } + 0 \cdot \mathbf { f } _ { 4 } \\ & = \sum _ { i = 1 } ^ { 4 } \mathbf { f } \left( a _ { i } \right) \mathbf { f } _ { i } \end{aligned}
> $$
> 这说明 $\pmb{f}$ 的值是由 $\pmb{f}|\overline{T}$ 上的值所唯一确定的，这对所有圈向量都成立
>
> > 因为 $\pmb{f}|\overline{T}$ 是圈空间的基向量
>
> 另外，$\mathcal{B}(D)$ 对应 $T$ 的基矩阵为
> $$
> \begin{aligned}
> B_T=
> \left[\begin{matrix}
> \pmb{g}_5\\
> \pmb{g}_6\\
> \pmb{g}_7\\
> \pmb{g}_8\\
> \pmb{g}_9\\
> \end{matrix}\right]
> =
> \left[\begin{matrix}
> 0&  0& -1& -1&  1&  0&  0&  0&  0\\
> 0&  0&  1&  1&  0&  1&  0&  0&  0\\
> -1&  1&  1&  1&  0&  0&  1&  0&  0\\
> 1& -1&  0&  0&  0&  0&  0&  1&  0\\
> 0&  1&  1&  0&  0&  0&  0&  0&  1\\
> \end{matrix}\right]
> =
> \left[\begin{matrix}
> B_1 & I_5
> \end{matrix}\right]
> \end{aligned}
> $$
> > 看 $\pmb{g}_5$ 怎么算
> >
> > $a_5=(x_1,x_2)$ 将 T 分成两部分 $\{x_2\}$ 和 $\{x_1,x_3,x_4,x_5,x_6\}$，根据 $a_5$ 的起点和端点位置，令 $S=\{x_1,x_3,x_4,x_5,x_6\}$，$\overline{S}=\{x_2\}$，有 $B=[S,\overline{S}]=\{a_3,a_4,a_5\}$，其中 $a_5\in(S,\overline{S})$，则 $\pmb{g}(a_5)=1$；$a_3,a_4 \in (\overline{S},S)$，则 $\pmb{g}(a_3)=\pmb{g}(a_4)=-1$。其余为 0。
> >
> > 步骤就是
> >
> > - 确定对应的边
> > - 取掉边，支撑树分成两部分，根据边的定向确定 $S$ 和 $\overline{S}$，再确定出割集 $B=[S,\overline{S}]$ 
> > - B 中属于 $(S,\overline{S})$ 的边 $a$ 满足 $\pmb{g}(a)=1$，属于 $(\overline{S},S)$ 的边 $a$ 满足 $\pmb{g}(a)=-1$，不在 B 中的边 $a$ 满足 $\pmb{g}(a)=0$ 
>
> ![1571642647652](assets/1571642647652.jpg)
>
> 上图所示割向量为
> $$
> \begin{aligned} \mathbf { g } & = ( 1,9,14,4,18,15,7,8,10 ) \\ & = 18 \cdot \mathbf { g } _ { 5 } + 15 \cdot \mathbf { g } _ { 6 } + 7 \cdot \mathbf { g } _ { 7 } + 8 \cdot \mathbf { g } _ { 8 } + 10 \cdot \mathbf { g } _ { 9 } \\ & = \sum _ { j = 5 } ^ { 9 } \mathbf { g } \left( a _ { j } \right) \mathbf { g } _ { j } \end{aligned}
> $$
> 说明 $\pmb{g}$ 的值由 $\pmb{g}|T$ 上的值所唯一确定，事实上对任何割向量，此结论都成立

## 2.3 支撑树的数目

用 $\tau(D)$ 表示无环连通图 D 中支撑树的数目

设 B 是割空间 $\mathcal{B}(D)$ 的基矩阵

从定理 2.2.2 知，若 $R\subseteq E(D)$ 且 $|R|=n-1$，则子方阵 $B|R$ 可逆 $\Leftrightarrow$ $D[R]$ 是 D 的支撑树

于是，$\tau(D)$ 等于 B 中 $n-1$ 阶可逆方阵的数目

设 M 是 $n\times m$ 阶矩阵，M 中满阶子方阵行列式为 0，-1 或 1，则称 M 为**幺模矩阵** unimodular matrix

**Proposition 3.1** 设 $B$ 是割空间 $\mathcal{B}(D)$ 的基矩阵，F 是 D 的支撑林，$B_F$ 是 $\mathcal{B}(D)$ 中对应于 F 的基矩阵。这 B 由 $B|F$ 唯一确定，且 $B=(B|F)B_F$ 

> **证明** 
>
> 存在唯一可逆的 P，使得 $B=PB_F$，则 $B|F=(PB_F)|F=P(B_F|F)=P$，故 $B=(B|F)B_F$ 

**proposition 3.2** 设 $C
$ 是圈空间 $\mathcal{C}(D)$ 的基矩阵，F 是 D 的支撑林，$C_F$ 是 $\mathcal{C}(D)$ 中对应于 F 的基矩阵，则 $C$ 由 $C|\overline{F}$ 唯一确定，且 $C=(C|\overline{F})C_F$ 

**proposition 3.3** 设 D 是无环有向图，F 是 D 中支撑林，$B_F$ 和 $C_F$ 分别是 $\mathcal{B}(D)$ 和 $\mathcal{C}(D)$ 中对应于 F 的基矩阵，则 $B_F$ 和 $C_F$ 都是幺模矩阵

> 设 P 是 $B_F$ 的满阶子方阵，阶数为 $n-\omega$ 
>
> 设 R 是 P 对应的边集，令 $F_1\triangleq D[R]$，则 $P=B_F|F_1$ 
>
> 若 $F_1$ 含圈，则 $\det P=0$ 
>
> 下设 $F_1$ 是支撑林，$B_1$ 是 $\mathcal{B}(D)$ 中对应于 $F_1$ 的基矩阵
>
> 由 Proposition 3.1 知
> $$
> (B_F|F_1)B_1=B_F
> $$
> 两边限制在 F 上，有
> $$
> (B_F|F_1)(B_1|F)=B_F|F=I
> $$
> 两边取行列式
> $$
> \det(B_F|F_1)\det(B_1|F)=1
> $$
> 由于是整数矩阵，则
> $$
> \det P = \det (B_F|F_1)=\pm 1
> $$
> 则 $B_F$ 是幺模矩阵

**proposition 3.4** 设 M 是无环有向图 D 的关联矩阵，K 是从 M 中删去任何一行后得到的子矩阵，则 K 是幺模矩阵

> P 是 K 的满阶子方阵，P 是幺模的
>
> > 归纳法
> >
> > P 的一阶子方阵是幺模的
> >
> > 假设 P 的任一 k 阶子方阵是幺模的，设 $Q=(q_{ij})(1\le i,j\le n+1)$ 是 P 中的 $k+1$ 阶子方阵
> >
> > 每列至多两个非零元素，若每列都有两个非零元素，则 Q 中所有行向量之和为 0 向量，则 $\det Q = 0$ 
> >
> > 下设 Q 至少有一列至多有一个非零元素，记为 $q_{i,j}(=0,-1,或1)$，则
> > $$
> > \det Q = (-1)^{i+j}q_{ij}\det Q_{ij}
> > $$
> > 其中 $\det Q_{ij}$ 是 Q 的 k 阶子方阵，由假设知 $\det Q_{ij}=0,\pm 1$，则 $\det Q = 0,$ \pm 1
> >
> > 由 k 的任意性知 $\det P = 0, \pm 1$ 
>
> 由 P 的任意性知 K 是幺模矩阵

**定理 2.3** $B$ 和 $C$ 分别是 $\mathcal{B}(D)$ 和 $\mathcal{C}(D)$ 中幺模基矩阵，则
$$
\tau(D)=\det(BB^\top)=\det(CC^\top)
$$
> **证明** 
> $$
> \det(BB^\top)=\sum_{R\subseteq E(D)\\|R|=n-1}(\det(B|R))^2=\tau(D)
> $$

**推论 2.3.1** $B$ 和 $C$ 分别是 $\mathcal{B}(D)$ 和 $\mathcal{C}(D)$ 中幺模基矩阵，则
$$
\tau(D)=\left|
\det
\left(\begin{matrix}
B\\
C
\end{matrix}\right)
\right|
$$

> **证明** 
> $$
> \begin{aligned}
> \tau^2
> &=\det(BB^\top)\det(CC^\top)\\
> &=\det\left(\begin{matrix}
> BB^\top & 0\\
> 0 & CC^\top\\
> \end{matrix}\right)\\
> &=\det\left(\begin{matrix}
> BB^\top & BC^\top\\
> CB^\top & CC^\top\\
> \end{matrix}\right)\\
> &=\det\left(
> \left(\begin{matrix}B\\C\\\end{matrix}\right)
> \left(\begin{matrix}B^\top & C^\top\\\end{matrix}\right)
> \right)\\
> &=\det\left(\begin{matrix}B\\C\\\end{matrix}\right)
> \det\left(\begin{matrix}B^\top & C^\top\\\end{matrix}\right)\\
> &=\left(\det\left(\begin{matrix}B\\C\\\end{matrix}\right)\right)^2
> \end{aligned}
> $$

**推论 2.3.2** $D$ 是无环连通有向图，$T$ 是支撑树，$B_T$ 和 $C_T$ 分别是 $\mathcal{B}(D)$ 和 $\mathcal{C}(D)$ 中对应 $T$ 的基矩阵，$K$ 是从 $D$ 的关联矩阵 $M$ 中删去任意一行后得到的矩阵，则
$$
\tau(D)=\det (B_TB_T^\top)=\det(C_TC_T^\top)=\det(KK^\top)
$$

> **证明** 
>
> $K$ 是 $\mathcal{B}(D)$ 中的幺模基矩阵
>
> ---
>
> **示例** 
>
> ![1571812556334](assets/1571812556334.jpg)
>
> 关联矩阵为
> $$
> \mathbf { M } = \left( \begin{array} { r r r r r r r r r } { 0 } & { 0 } & { 0 } & { 0 } & { 0 } & { - 1 } & { 1 } & { 1 } & { 0 } \\ { - 1 } & { 1 } & { 0 } & { 0 } & { 0 } & { 0 } & { 0 } & { - 1 } & { 0 } \\ { 1 } & { 0 } & { 0 } & { - 1 } & { 0 } & { 0 } & { - 1 } & { 0 } & { 1 } \\ { 0 } & { 0 } & { 1 } & { 1 } & { - 1 } & { 0 } & { 0 } & { 0 } & { 0 } \\ { 0 } & { 0 } & { 0 } & { 0 } & { 1 } & { 1 } & { 0 } & { 0 } & { 0 } \\ { 0 } & { - 1 } & { - 1 } & { 0 } & { 0 } & { 0 } & { 0 } & { 0 } & { - 1 } \end{array} \right)
> $$
> K 为从 M 中删去最后一行所得到的矩阵，则
> $$
> \operatorname { det } \mathbf { K K } ^ { \top } = \operatorname { det } \left( \begin{array} { r r r r r } { 3 } & { - 1 } & { - 1 } & { 0 } & { - 1 } \\ { - 1 } & { 3 } & { - 1 } & { 0 } & { 0 } \\ { - 1 } & { - 1 } & { 4 } & { - 1 } & { 0 } \\ { 0 } & { 0 } & { - 1 } & { 3 } & { - 1 } \\ { - 1 } & { 0 } & { 0 } & { - 1 } & { 2 } \end{array} \right) = 66
> $$
> 支撑树 T 的边集为 $E(T)=\{a_5,a_6,a_7,a_8,a_9\}$，则
> $$
> \begin{aligned}
> \mathbf { B } _ { T } \mathbf { B } _ { T } ^ { \top } &= \left( \begin{array} { r r r r r } { 3 } & { - 2 } & { - 2 } & { 0 } & { - 1 } \\ { - 2 } & { 3 } & { 2 } & { 0 } & { 1 } \\ { - 2 } & { 2 } & { 5 } & { - 2 } & { 2 } \\ { 0 } & { 0 } & { - 2 } & { 3 } & { - 1 } \\ { - 1 } & { 1 } & { 2 } & { - 1 } & { 3 } \end{array} \right)\\
> \mathbf { C } _ { T } \mathbf { C } _ { T } ^ { \top } &= \left( \begin{array} { r r r r } { 3 } & { - 2 } & { - 1 } & { - 1 } \\ { - 2 } & { 4 } & { 2 } & { 1 } \\ { - 1 } & { 2 } & { 5 } & { 3 } \\ { - 1 } & { 1 } & { 3 } & { 4 } \end{array} \right)
> \end{aligned}
> $$
> 因而有 $\det (B_TB_T^\top)=66=\det (C_T)C_T^\top$ 

**推论 2.3.3** 设 $T_n$ 表示 $n(\ge2)$ 阶竞赛图，则 $\tau(T_n)=n^{n-2}$ 

**推论 2.3.4**（矩阵-树定理，Kirchhoff）G 是无环连通图，$\tau(G)=\det (KK^\top)$，其中 K 是 G 的任何一个定向图 D 的关联矩阵 M 中删去任意一行后得到的矩阵

**推论 2.3.5**（Cayley 公式）$\tau(K_n)=n^{n-1}(n\ge 2)$ 

## 2.4 最小连接问题

假设在某地区内要修建一个连接若干个城镇的公路系统，已知城 $x_i$ 与 城 $x_j$ 之间直通公路的造价为 $c_{ij}$，设计一个造价最低的建造方案，这类问题称为**最小连接问题** minimum connection problem

加权图 $(G,\pmb{w})$，$\pmb{w}(x_iy_j)=c_{i,j}$，找权和最小的支撑树，称为**最小树** minimum tree

显然，最小连接问题有解 $\Leftrightarrow$ G 为连通图

### 支撑树算法

1. 任取 $x_0\in V(G)$，令 $V_0=\{x_0\}$，$T_0=\empty$，$k=0$ 
2. 取 $e_k\in [V_{k-1},\overline{V}_{k-1}]$，则 $\exist u \in V_{k-1}$，$x_k \in \overline{V}_{k-1}$ 使 $e_k=u x_k$，令 $V_k=V_{k-1}\cup \{x_k\}$，$T_k=T_{k-1}\cup\{e_k\}$ 
3. 若 $k<n-1$，则 $k\leftarrow k + 1$，转 2；若 $k=n-1$，停止，$T_{n-1}$ 即为支撑树

> 人话
>
> 从一个点出发，然后不断找边来延伸，最终得到的就是支撑树

### Prim 算法 

1. 任取 $x_0\in V(G)$，令 $l(x_0) = 0$，$l(x)=\infty (x\neq x_0)$，$V_0=\{x_0\}$，$T_0=\empty$，且 $k=0$ 
2. 对 $\forall x \in N_G(x_{k-1})\cap \overline{V}_{k-1}$，$l(x)=\min\{\pmb{w}(x_{k-1}x),l(x)\}$ 
3. 取 $x_k = \mathop{\arg\min}_\limits{x\in \overline{V}_{k-1}} l(x)$，设 $e_k=u x_k$，$u\in V_{k-1}$ 满足 $\pmb{w}(e_k)=l(x_k)$，令 $V_k=V_{k-1}\cup\{x_k\}$，$T_k=T_{k-1}\cup{e_k}$ 
4. 若 $k=n-1$，则停止，$T_{k}$ 即为最小树；否则，$k\leftarrow k+1$，转 2

> 像 dijkstra 算法，差别关键在于 $l(x)$ 的更新[^prim_vs_dijkstra] 

算法复杂度为 $\Theta(n^2)$ 

> **示例** 
>
> ![1571816733251](assets/1571816733251.jpg)

**定理 2.4.1** 按 Prim 算法求出的 $T_{n-1}$ 是加权连通图 $(G,\pmb{w})$ 的最小树

## 2.5 最短路问题

设有一个贴图系统连接着若干个城市，$x_0$ 是该系统中的一个固定城市（比如是首都或者省会城市）。在该系统中试求从 $x_0$ 到其他各城市的最短路线。这个问题称为最短路问题。

用一个具有**正权值**函数 $\pmb{w}$ 的加权简单无限图 $(G,\pmb{w})$ 来表示这个铁路系统，其中 $\pmb{w}\in \mathcal{E}(G)$。边 $e=xy$ 上的值 $\pmb{w}(e)$ 表示城市 $x$ 和城市 $y$ 之间的铁路里程。于是，最短路问题就转化为在 $(G,\pmb{w})$ 中找出 $x_0$ 到 $G$ 中各点最短路。

更一般的最短路问题的提法是：设 $(D,\pmb{w})$ 是有**正值加权**简单有向图，$x_0$ 是 $D$ 中的一个固定顶点。寻找从 $x_0$ 到 $D$ 中各点最短有向路。

最短路问题有解 $\Leftrightarrow$ $D$ 中存在根在 $x_0$ 的支撑外向树。

**Moore-Dijkstra 算法** 

> 复杂度 $O(n^2)$ 

1. $l(x_0)=0$，$l(x)=\infty(x\neq x_0)$，$S_0=\{x_0\}$，$T_0=\empty$ 且 $k=0$ 

2. $\forall x\in N_D^+(x_k)\cap \overline{S_k}$，
   $$
   l(x)=\min\{l(x),l(x_k)+\pmb{w}(x_k,x)\}
   $$

3. $x_{k+1}=\mathop{\arg\min}_\limits{x\in \overline{S_k}}\{l(x)\}$ ，取 $x_j\in S_k(j\le k)$ 且 $(x_j,x_{k+1})\in E(D)$，令 $S_{k+1}=S_k\cup\{x_{k+1}\}$，$T_{k+1}=T_k \cup (x_j,x_{k+1})$ 

4. 若 $k=n-1$ 则停止，否则 $k\leftarrow k+1$，转 2

> **示例** 
>
> ![image-20191103233857210](assets/image-20191103233857210.jpg)

**定理 2.5.1** 设 $T$ 是 $(D,\pmb{w})$ 中由 Moore-Dijkstra 算法求出的根在 $x_0$ 的支撑外向树，则对每个 $x\in V(D)$，$T$ 中 $(x_0,x)$ 路是 $D$ 中最短 $(x_0,x)$ 路

距离矩阵 $\{d_D(x_i,x_j)\}_{i,j=1}^n$ 可由 Moore-Dijkstra算法求得，然后找到最大元素即可求得直径，复杂度为 $O(n^3)$ 

## 参考

[^prim_vs_dijkstra]: 豆沙包lo. [Dijkstra算法与Prim算法的异同](https://blog.csdn.net/qq284565035/article/details/51583314). 

