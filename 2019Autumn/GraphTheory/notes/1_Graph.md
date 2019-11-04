# 1. 图论极其应用

## 1.1 图论介绍

图论 graph theory 中的图是由若干给定的点及连接两点的线所构成的图形

图论起源于哥尼斯堡七桥问题

## 1.2 图的基本概念

### 定义

**无向简单图** simple graph $G$ 为 $G=(V(G),E(G))$，其中 $V(G) \ne \empty$，称为**顶点集** vertex set，$|V(G)|$ 为 $G$ 的**阶数**。$E(G)$ 是**边集** edge set，$E(G) \subseteq \{v_iv_j|v_i,v_j\in V(G),i \ne j\}$。

**有向简单图** direct graph / digraph $D$ 为 $(V(D),A(D))$，其中 $V(D) \ne \empty$，$A(D) \subseteq V(D) \times V(D)$ 称为**弧集** arc set。

> 简单图无环无重边，集合要求没有重复元素

**命题 2.1** 

- 设 $G$ 是 $n$ 阶简单无向图，则 $|E(G)|\le\frac{n(n-1)}{2}$ 
- 若 $D$ 是 $n$ 阶简单有向图，则 $|A(D)| \le n(n-1)$ 

> $|E(G)| \le C_2^n$ 
>
> $|A(D)| \le A_n^2 - n$，减去的 $n$ 就是 $(v_i,v_i),i=1,\dots,n$ 

### 常用说法

弧分**起点终点**，统称**端点**。

**两端点相同**的边称为**环**，**同起终**的边称为**平行边**或重边。**起终互反**的边称为**对称边**。

**无环无平行边**的图称为**简单图**。

有向图 D **去除方向**得无向图 G，称 D 的**基础图**。反过程得**定向图**。

阶 1 为**平凡图**，无边为**空图**，有限点边为**有限图**。

完全图 complete graph **任何不同两顶点间有边**的简单无向图。

$K_n$ 是 $n$ 阶**完全**图。$K_3$ 称为**三角形**。

> 完全图 $|E(G)| = \frac{n(n-1)}{2}$ 

n 阶**完全有向**图记为 $K_n^*$。

**2 部图** bipartite graph 简单图顶点划分两个非空子集 X 和 Y，X 和 Y 内无边，$\{X,Y\}$ 称为 2 部划分 bipatition，2部划分为 $\{X,Y\}$ 的 2 部图记为 $(X\cup Y,E)$。

类似可定义 k 部图，完全 k 部图。

## 3. 图的同构

$D=(V(D),E(D))$ 和 $H=(V(H),E(H))$ 称为**同构**的，记为 $D\cong H$，如果存在**双射**
$$
\theta:V(D)\to V(H)
$$
使得对任何
$$
(x,y)\in E(D)\Leftrightarrow(\theta(x),\theta(y))\in E(H)
$$
映射 $\theta$ 称为 $D$ 和 $G$ 之间的**同构映射**。

> 要证两个图是同构的，就必须指出他们之间的一个同构映射

图的同构关系是一种**等价关系**。

图的置换组合的**自同构**是一个 $V(G)$ 上的**置换群**，这是 $G$ 的**自同构群**，记为 $\text{Aut}(G)$。

> 对于一个集合 $A$，$A$ 中定义一个闭合运算 $\circ$，存在一个 $A$ 与 $A$ 之间的映射 $\phi$（就是**置换**），若 $\phi$ 为一双射，且对于 $A$ 内任意元素 $a$，$b$ 都有 $\phi(a\circ b)=\phi(a)\circ \phi(b)$ 则这个映射 $\phi$ 叫做一个对于 $\circ$ 来说的 $A$ 的**自同构** automorphism。
>
> > 就是同构的基础上，要求映射的定义域与值域相同
> >
> > 自同构是同构映射
>
> 对称群是集合 $X$ 上**所有置换**构成的**群**，当 $X$ 是 $n$ 个元素的集合时，称为 $n$ 次对称群。
>
> 置换群是对称群的子群。

$\text{Aut}(K_n)=\text{Aut}(K_n^c)=S_n$，其中 $S_n$ 是 $n$ 次**对称群** symmetric group。

$\text{Aut}(C_n)=D_n$，其中 $D_n$ 是**二面体群** dihedral group。

> 保持**平面**上正多边形（边数为 $n$，$n>2$）不变的**线性变换**所成的群。它由 $n$ 个旋转和 $n$ 个反射所组成。通常记为 $D_n$ 或 $D_{2n}$。由**两个特殊元**生成
> $$
> D_{2n}=\left\langle r,f|r^n=f^2=1,f^{-1}rf=r^{-1}\right\rangle
> $$
>
> > $r$ 代表旋转，$f$ 代表镜像翻转

## 4. 图的顶点度和运算

x 的顶点度是与 x 关联边的数目（环计算两次），记为 $d_G(x)$。

> $$
> d_G(x)=|\{(x,y)|(x,y)\in E(G),y\in V(G)\}|
> $$

$d_G(x)=d$，则称 x 为 d 度点，零度点为孤立点。
$$
\Delta(G)=\max\{d_G(x):x\in V(G)\}\\
\delta(G)=\min\{d_G(x):x\in V(G)\}\\
$$
$\forall x \in V(G)$，$d_G(x)=k$，则 $G$ 为 k 正则 k-regular 的。

对于有向图，出度为 $d_D^+(x)$，入度为 $d_D^-(x)$，度数为 $d_D(x)=d_D^+(x)+d_D^-(x)$。

若 $d_D^+(x)=d_D^-(x)$，则称 x 是平衡点，全点平衡为平衡有向图。

$$
\Delta^+(D)=\max\{d_D^+(x)|x\in V(D)\}\\
\Delta^-(D)=\max\{d_D^-(x)|x\in V(D)\}\\
\delta^+(D)=\min\{d_D^+(x)|x\in V(D)\}\\
\delta^-(D)=\min\{d_D^-(x)|x\in V(D)\}\\
$$
四个都为 k 的为 k 正则有向图

### 握手定理

**定理 4.1** 无向图 G 满足
$$
\sum_{x\in V(G)}d_G(x)=2|E(G)|
$$

> 证明
>
> 计算 $\{(x,e)|e\in e\}$ 的数目

**推论 4.1** 无向图奇度点的个数必为偶数

> 证明
> $$
> \sum_{x\in V_\text{odd}}d_G(x)+\sum_{x\in V_\text{even}}d_G(x)=2|E(G)|
> $$

**推论 4.2** 有向图 D 均有
$$
\sum_{x\in V(D)}d_D^+(x)=\sum_{x\in V(D)}d_D^-(x)=|A(D)|
$$

> 证明
>
> 计算 $\{(x,y)|(x,y)\in A(D)\}$ 的个数

### 图的运算

$G=(V(G),E(G))$ 和 $H=(V(H),E(H))$ 是两个图。若 $V(H)\subseteq V(G)$ 且 $E(H)\subseteq E(G)$，则称 H 为 G 的**子图** subgraph，记为 $H\subseteq G$。称 G 是 H 的**母图** supergraph。

若 $H\subseteq G$ 且 $V(H) = V(G)$，则称 H 为 G 的**支撑子图** spanning subgraph。若 $H\subseteq G$ 且 $H=G$，则称 H 为 G 的**真子图** proper subgraph，记为 $H\subset G$。

$V'\subset V(G)$，$E'=\{(x,y)|x,y\in V',(x,y)\in E(G)\}$，则 $(V',E')$ 是 G 的导出子图，记为 $G[V']$。导出子图 $G[V\V']$ 记为 $G-V'$。若 $V'=\{x\}$，则简记为 $G-\{x\}$ 为 $G-x$。

$E'\subset E(G)$，$V'=\{x|(x,y)\in E'\}$，记为 $G[E']$。$G-E'$ 表示删除 $E'$ 但不删点后得到的子图。

$V(G_1)\cap V(G_2)=\empty$ 则称 $G_1$ 和 $G_2$ 点不交，相应可定义边不交。

$G_1\cup G_2=\{V(G_1)\cup V(G_2),E(G_1)\cup E(G_2)\}$，点不交时记为 $G_1+G_2$，边不交时记为 $G_1\oplus G_2$。

### 一些定义和记号

$N_G(S)$ 为与 S 中点相邻的点集合，称为 S 的邻集，$d_G(x)=|N_G(x)|$。

$E_G(S)=\{(x,y)|x,y\in S,(x,y)\in E(G)\}$，$E_G(S,T)=\{(x,y)|x\in S, y\in T,(x,y)\in E(G)\}$。

对于定向图，相应的有 $N_D^+(S)$ 为 S 的外邻集，$N_D^-(S)$ 为 S 的内邻集。

**定理 4.2** G 不含三角形，则 $e(G)\le \lfloor\frac{n^2}{4}\rfloor$，等号成立时 $G=K_{\lceil n/2 \rceil,\lfloor n/2 \rfloor}$。

> $e(G)=|E(G)|$，$K_{\lceil n/2 \rceil,\lfloor n/2 \rfloor}$ 是平衡完全二部图

$\text{ex}(n,H)=\max\{e(G)|H\not\subset G,|V(G)|=n\}$，称为 Turan 数，边数为 $\text{ex}(n,H)$ 的不含 H 的 n 阶图称为 H 的极图。

**定理 4.3** $\text{ex}(n,K_{r+1})=e(T_r(n))$ 

> $T_r(n)$ 是 r 部平衡完全图

## 5. 路与连通

连接 x 和 y 的链 chain / walk W 称为 xy 链，指 $x_i$ $e_j$ 交错出现的序列
$$
W=(x=)x_{i_0}e_{i_1}x_{i_1}e_{i_2}...e_{i_k}x_{i_k}(=y)
$$
x 和 y 称为端点，其余为内部点，边数为 W 的长度。

> 对于简单图，长 k 的链 W 由顶点序列 $x_{i_0}x_{i_1}\dots x_{i_k}$ 唯一确定，简记为 $W=(x_{i_0},x_{i_1},\dots,x_{i_k})$ 或 $W=x_{i_0}x_{i_1}\dots x_{i_k}$。

边不同的链为迹 trail

点不同的迹为路 path

端点相同的链（迹）为闭链 closed chain（闭迹） 

闭迹称为回 circuit

点不交的闭迹为圈 cycle

包含所有顶点的路（圈）称为 Hamilton 路（圈）

**定理 5.1** $\delta = \delta(G)$，则 G 含至少长为 $\delta$ 的路和长至少为 $\delta + 1$ 的圈（若 $\delta \ge 2$）

**定理 5.2** n 阶（$n\ge 3$）连通图 G任意两非邻接点 x 和 y 有 $d(x)+d(y)\ge k$，若 $k=n$，则 G 是哈密顿 Hamiltonian，若 $k<n$ 则 G 有长至少为 k 的路和长至少为 $\frac{k+2}{2}$ 的圈

**定理1.4.1** 每个竞赛图都含 Hamilton 有向路

### 特殊情况的 Turan 数

**定理 5.3** $\text{ex}(n,K_{1,k+1})\le\frac{kn}{2}$ 

**定理 5.4** $\text{ex}(n,P_{k+1})\le\frac{(k-1)n}{2}$ 

**定理 5.5** $\text{ex}(n,P_{k+1})=\frac{(k-1)n}{2}-\frac{r(k-r)}{2}$ 

**猜想 5.6** $\text{ex}(n,T_{k+1})\le\frac{(k-1)n}{2}$ 

**定理 5.7** $\text{ex}(n,C_{\ge k+1})\le\frac{(n-1)k}{2}$ 

### 连通和强连通

x y 间有路（不必是有向路）则称 x 和 y 连通。

连通关系是等价关系。

$G[V_i]$（$1\le i \le \omega$）是 G 的连通分支，$\omega$ 称为 G 的连通分支数，记为 $\omega=\omega(G)$。

若 $\omega(G)=1$，则 G 为连通图，否则为非连通图。

有向图 x y 存在 $(x,y)$ 路和 $(y,x)$ 路，则 x 和 y 强连通。

强连通是等价关系，$D[V_i]$（$1\le i\le \omega$）是强连通分支。强连通分支数记为 $\vec{\omega}(D)$。

若 $\vec{\omega}(D)=1$ 为强连通图，否则为非强连通图。

若 $\omega(G-x)>\omega(G)$，则 x 为割点 cut vertex，反之称为连通点。

若 $\omega(G-e)>\omega(G)$，则 e 为割边 cut edge 或桥 bridge，反之称为连通边。

不含割点的连通图称为块，G 中不含割点的极大连通图称为 G 的块

**定理 1.4.2**

- 图连通 $\Leftrightarrow$ $\forall S\subset V$，且 $S\neq \empty$，有 $[S,\bar{S}]\neq \empty$。
- D 强连通 $\Leftrightarrow$ $\forall S\subset V$，且 $S\neq \empty$，有 $(S,\bar{S})\neq \empty$ 且 $(\bar{S},S)\neq \empty$。

**命题 5.8** $V(G)=\{x_1,x_2,\dots,x_n\}$ 且 $d_G(x_1)\le d_G(x_2)\le \dots\le d_G(x_n)$，若 $d_G(x_k)\ge k, 1\le k\le n-d_G(x_n)-1$，则 G 连通。

> 证明 ...

**命题 5.9** 若 n 阶有向图 D 满足 $|A(D)|>(n-1)^2$，则 D 强连通

> 证明 ...

## 6. 回与圈

长为奇数（偶数）的回（圈）称为奇 odd（偶 even）回（圈）。用 $C_n$ 表示长为 n 的圈。

最短圈的长称为 G 的围长 girth，记为 $g(G)$。

最长圈的长称为 G 的周长 circumference，记为 $c(G)$。

如 G 存在长为 3 到 $|V(G)|$ 的圈，则称其为泛圈的 pancyclic。

若 $\forall v \in V(G)$，存在长 3 到 $|V|$ 且含 $v$ 的圈。

**命题 6.1** $\delta=\delta(G)\ge 2$，则 G 含圈，若 G 简单图，则 G 含长至少为 $\delta+1$ 的圈。

> 证明 ...

**定理 1.5.1** $n\ge3$ 的强连通竞赛图是点泛圈的

> 证明 ...

## 7. 距离与直径定义

x 和 y 的最短路为 x 和 y 的距离 distance，记为 $d_G(x,y)$。

> 长度等于距离的路称为最短路 shortest path

若不存在 x-y 路，则 $d_G(x,y)=\infty$ 

直径 diameter 为
$$
d(G)=\max\{d_G(x,y):\forall x,y\in V(G)\}
$$
半径 radius 为
$$
\text{rad}(G)=\min_{x\in V}\max_{y\in V} d_G(x,y)
$$
若 $\max_{y\in V}d_G(x,y)=\text{rad}(G)$，则 x 称为中点

有向图直径为
$$
d(D)=\max\{d_D(x,y):\forall x,y \in  V(D)\}
$$
一般 $d_D(x,y) \neq d_D(y,x)$ 

**命题 7.1** $\text{rad}(G)\le d(G)\le 2\text{rad}(G)$ 

**命题 7.2** $\Delta(G)\le\Delta$ 和 $\text{rad}(G)=k$，则
$$
|V(G)|<\frac{\Delta}{\Delta - 2}(\Delta-1)^k
$$

> 证明 ...

**命题 7.3** $g(G)\le 2d(G)+1$ 

> 证明 ...

### 二部图判定定理

**定理 1.5.2** G 是 2 部图 $\Leftrightarrow$ G 不含奇圈

> 证明 ...

**推论 1.5.2.2** D 是 2 部图 $\Leftrightarrow$ 基础图是 2 部图

**命题 7.4** G 不含奇度点，则 G 存在平衡定向图

> 证明 ...

**命题 7.5** G 有近乎平衡的定向图，$\forall x \in V(G)$，$|d^+(x)-d^-(x)|\le 1$ 

> 证明 ...

**命题 7.6** G 是 n 阶非 2 部简单无向图，且 $e(G)>\frac{1}{4}(n-1)^2+1$，则 G 含三角形。等价地
$$
\text{ex}_{nb}(n,K_3)\le \frac{1}{4}(n-1)^2+1
$$
且等号成立 $G=C_5(\lceil\frac{n}{2}\rceil-2,\lfloor\frac{n}{2}\rfloor-1,1,1,1)$ 

> 证明

## 9. 欧拉图

包含每条边的迹称为欧拉迹 Euler trail

x 到 y 的欧拉迹记为欧拉 $xy$ 迹（或欧拉 $(x,y)$ 迹

闭的欧拉迹称为欧拉回 Euler circuit

含欧拉回的图称为欧拉图 Eulerian graph

**定理 9.1** G 是欧拉图 $\Leftrightarrow$ G 是连通图

**推论 9.2** 非平凡图 G 有欧拉迹 $\Leftrightarrow$ G 连通且最多有 2 个奇度点

**定理 1.6** 有向图 D 是 Euler 图 $\Leftrightarrow$ D 是连通平衡图

**推论 1.6.1** 设 D 是非平凡连通有向图，则 D 有 Euler $(x,y)$ 迹 $\Leftrightarrow$ $d_D^+(x)-d_D^-(x)=1=d_D^--d_D^+(x)$，且 $\forall u \in V(D)\backslash \{x,y\}$ 均有 $d_D^+(u)=d_D^-(u)$。

## 10. Hamilton 图

包含 G 中每个顶点的圈称为 Hamilton 圈

含 Hamilton 圈的图称为 Hamilton 图（Hamiltonian graph）

> $K_n$ 和强连通竞赛图都是 Hamilton 图

判断一个给定的图是否为 Hamilton 图的问题称为 Hamilton 问题，是 NPC 的，即从算法角度讲没有多项式时间算法判断一个图是否为 Hamilton 图及找出一个图的 Hamilton 圈，同时也没有像 Euler 问题的充分必要条件

**定理 1.7.1** G 是 Hamilton 图，则
$$
\omega(G-S)\le|S|，\forall S \subset V(G)
$$

> 证明

**推论 1.7.1.1** 每个 Hamilton 图无割点

**推论 1.7.1.2** 奇阶 2 部图是非 Hamilton 图

### 判定 Hamilton 图的充分条件

**定理 1.7.2** （Ore 条件）$n (n\ge 3)$ 阶图 G，若任何不相邻的 x 和 y 有 $d_G(x)+d_G(y)\ge n$，则 G 是 Hamilton 图

**推论 1.7.2** （Dirac 条件）n 阶简单图 G，若 $\delta(G)\ge\frac{n}{2}$，$n\ge 3$，则 G 是 Hamilon 图

**定理 10.1** n 阶强连通有向图 D，若 $\delta^0(D) = \min\{\delta^+(D),\delta^-(D)\}\ge\frac{n}{2}$，则 D 是 Hamilton 图

**定理 10.2** n 解强连通有向图 D，任何不相邻顶点 x 和 y 均有 $d_D(x)+d_D(y)\ge 2n -1$，则 D 是 Hamilton 图

**推论 1.7.3.4** 每个强连通竞赛图都是 Hamilton 图

**推论 1.7.3.6** 任何竞赛图含 Hamilton 路

**猜想 10.3** $\delta(G)\ge\frac{k}{k+1}n$，则哈密顿圈 $H^k\subseteq G$，其中 $V(H^k)=V(G)$，$E(H^k)=\{(x,y)|d_G(x,y)\le k\}$。

> 对于 $k=1$，上述猜想就是 Dirac 条件

## 11. P 和 NP

>  [P、NP与NPC 的通俗理解](https://blog.csdn.net/lonnee/article/details/80361624) 

能在多项式时间内解决的问题集记为 $P$。

能做多项式时间内验证输入的正确性的问题集记为 $NP$。

显然 $P \subseteq NP$。

约化 Reducibility：如果能找到这样一个变化法则，对任意一个程序 A 的输入，都能按这个法则变换成程序 B 的输入，使两程序的输出相同，那么我们说，问题 A 可约化为问题 B，即可以用问题B的解法解决问题 A，或者说，问题 A 可以“变成”问题 B。  

约化具有传递性。 

“问题 A 可约化为问题 B”有一个重要的直观意义：B 的时间复杂度高于或者等于 A 的时间复杂度。也就是说，问题 A 不比问题 B 难。 

我们所说的“可约化”指的是可“多项式时间地”约化 Polynomial-time Reducible，即变换输入的方法是能在多项式的时间里完成的。约化的过程只有用多项式的时间完成才有意义。 

NPC 问题是指满足下面两个条件的问题：
- 它是一个NP问题；
- 所有的NP问题都可以用多项式时间约化到它。 

所以显然 NP 完全问题具有如下性质：它可以在多项式时间内求解，当且仅当所有的其他的 NP 完全问题也可以在多项式时间内求解。这样一来,只要我们找到一个 NPC 问题的多项式解，所有的NP问题都可以多项式时间内约化成这个 NPC 问题，再用多项式时间解决，这样 NP 就等于 P 了。 

目前，NPC 问题还没有找到一个多项式时间算法，因此我们就此可直观地理解，NPC 问题目前没有多项式时间复杂度的有效算法，只能用指数级甚至阶乘级复杂度的搜索。 

### 第一个 NPC 问题

逻辑电路问题是第一个 NPC 问题。逻辑电路问题指的是这样一个问题：给定一个逻辑电路，问是否存在一种输入使输出为 True。

逻辑电路问题属于 NPC 问题。这是有严格证明的。它显然属于 NP 问题，并且可以直接证明所有的 NP 问题都可以约化到它（不要以为 NP 问题有无穷多个将给证明造成不可逾越的困难）。证明过程相当复杂，其大概意思是说任意一个 NP 问题的输入和输出都可以转换成逻辑电路的输入和输出（想想计算机内部也不过是一些 0 和 1 的运算），因此对于一个 NP 问题来说，问题转化成了求出满足结果为 True 的一个输入（即一个可行解）。

有了第一个 NPC 问题后，一大堆 NPC 问题就出现了，因为再证明一个新的 NPC 问题只需要将一个已知的 NPC 问题约化到它就行了。后来，Hamilton 回路成了 NPC 问题，TSP 问题（旅行商问题）也成了 NPC 问题。现在被证明是 NPC 问题的还有很多，任何一个NPC问题找到了多项式算法的话所有的 NP 问题都可以完美解决了。因此说，正是因为 NPC 问题的存在，$P=NP$ 变得难以置信。

### NP hard

NPH问题（NP难问题，英文NP-hard问题），其满足NPC问题定义的第二条但不一定要满足第一条（就是说，NP-Hard问题要比 NPC问题的范围广，但不一定是NP问题）。

“给定一个程序和输入，他会永久执行吗？”

![1571144507274](assets/1571144507274.jpg)

## 12. 距离与直径

基础概念看 [7. 距离与直径定义](#7. 距离与直径定义)。

对于 n 个顶点的有向路 $P_n$，$d(P_n)=\infty$。$d(D)=1\Leftrightarrow K_n^*\subseteq D$。

对于 n 个顶点的无向路 $P_n$，$d(P_n)=n-1$。$d(G)=1\Leftrightarrow K_n\subseteq G$。

**命题 12.1** 设 D 是强连通有向图，如果 $n\ge 2$，最大度 $\Delta=\max\{\Delta^+,\Delta^-\}\ge 1$，那么
$$
d ( D ) \geqslant \left\{ \begin{array} { l l } { n - 1 , } & { \Delta = 1 } \\ { \left\lceil \log _ { \Delta } ( n ( \Delta - 1 ) + 1 ) \right\rceil - 1 , } & { \Delta \geqslant 2 } \end{array} \right.
$$
**命题 12.2** 设 G 是连通的无向图，如果它的阶 $n\ge 3$，最大度 $\Delta \ge 2$，那么
$$
d ( G ) \geqslant \left\{ \begin{array} { l l } { \left\lfloor \frac { 1 } { 2 } n \right\rfloor , } & { \Delta = 2 } \\ {\left\lceil \log _ { ( \Delta - 1 ) } \frac { n ( \Delta - 2 ) + 2 } { \Delta } \right\rceil , } & { \Delta \geqslant 3 } \end{array} \right.
$$
给定最大度和直径的（有向）图阶数的上界称为 $(\Delta,d)-\text{Moore}$ 界，记为
$$
M ( \Delta , d ) = \max \{ | V ( G ) | | \Delta ( G ) = \Delta , d ( G ) = d \}
$$
达到 $(\Delta,d)-\text{Moore}$ 界的无向/有向图称为 $(\Delta,d)-\text{Moore}$ 无向/有向图

> 有向圈 $C_{d+1}$ 是 $(1,d)-\text{Moore}$ 有向图，完全有向图 $K_{\Delta+1}^*$ 是 $(\Delta,1)-\text{Moore}$ 有向图
>
> 无向圈 $C_{2d+1}$ 是 $(2,d)-\text{Moore}$ 无向图，$K_{\Delta+1}$ 是 $(\Delta,1)-\text{Moore}$ 无向图
>
> Petersen 图是 $(3,2-\text{Moore})$ 无向图



**命题 12.3** n 阶连通无向图 G，最小度 $\delta$，则
$$
d(G)\le\frac{3n}{\delta+1}
$$
**命题 12.4** n 阶连通无向图 G，直径为 d，则
$$
e(G)\le d+\frac{1}{2}(n-d+4)(n-d-1)
$$
连通图 G 的平均距离 $m(G)$ 为
$$
m(G)=\frac{1}{n(n-1)}\sum_{x,y\in V}d_G(x,y)
$$

$m(G)\ge 1,m(G)=1\Leftrightarrow G=K_n$。

距离和定义为
$$
\sigma(G)=\sum_{x,y\in V}d_G(x,y)
$$

> $\sigma(C_n)=n^2(n-1)/2$，$m(C_n)=n/2$ 

非空有向图 D 的线图 line digraph $L(D)$ 是以 $E(D)$ 为顶点集的图，并且对 $a_i,a_j \in E(D)$，则 $(a_i,a_j)\in E(L(D)) \Leftrightarrow$ 在 D 中，$a_i$ 的终点是 $a_j$ 的起点。

n 重线图
$$
L^n(D)=L(L^{n-1}(D))
$$
其中 $L^0(D)=D,L^1(D)=L(D)$。

**命题 12.5** $L(G)$ claw-free

**定理 1.8.1** 设 D 是非平凡的强连通有向图，则
$$
d(D)\le d(L(D))\le d(D)+1
$$
$d(D)=d(L(D))\Leftrightarrow$ D 是有向圈

## 13. 图的矩阵表示

邻近矩阵 adjacency matrix 是指 $n\times n$ 阶矩阵 $A=(a_{ij})_{n\times n}$，其中 $a_{ij}=\mu(x_i,x_j)$，这里 $\mu(x_i,x_j)$ 指 $x_i$ 与 $x_j$ 的边数

D 有向图 $A(D)$，G 有向图 $A(G)$，$A(G)$ 对称

关联矩阵 incidence matrix 是指 $n\times m$ 阶矩阵 $M=(m_{ij})_{n\times m}$，其中 $v_i\in V,e_j\in E$，且无环有向图 D 有
$$
m_{ij}=\left\{\begin{matrix}
1, &v_i=\text{begin}(e_j)\\
-1, &v_j=\text{end}(e_j)\\
0, &\text{other}
\end{matrix}\right.
$$
而对无向图 G 有
$$
m_{ij}=\left\{\begin{matrix}
1,&v_i \in \text{end}(e_j)\\
0,&\text{other}
\end{matrix}\right.
$$
D 关联矩阵 $M(D)$，G 关联矩阵 $M(G)$。

> 关联矩阵所有行相加等于 0

同构图的邻接矩阵是置换相似的，而关联矩阵是置换相抵的。

> 设 A 是 $m\times n$ 矩阵,P 和 Q 分别是 m 阶和 n 阶的置换方阵,我们称 A 和 $PAQ$ 置换相抵。
>
> 当 $m=n$，$Q=P^{-1}=P^\top$ 时(这里 $M^\top$ 表示矩阵 M 的转置矩阵)，A 和 $PAP^\top$ 称为置换相似 
>
>  实际上，$PAQ$ 是分别对 A 的行作置换（通过左乘 P）和对列作置换（通过右乘 Q）后所得；而 $PAP^\top$ 则是对 A 的行和列分别作同样的置换后所得。注意到在作这些置换时，A 的每个元素本身并没有改变，只是其所在的位置变动了。

B 是对角元素 $b_{ii}=d_G(x_i)$ 的 $n$ 阶对角方阵，矩阵 $B-A$ 称为 G 的 Laplace 矩阵，容易验证
$$
B-A=MM^\top
$$
其中 M 是 G 的任一定向图的关联矩阵

**定理 1.9**（邻接矩阵定理）设 A 是 有向图 D 的邻接矩阵，则 $A^k$ 中的 $(i,j)$ 元素是 D 中长为 k 的 $(x_i,x_j)$ 链的数目

n 阶非负方阵 A 称为本原的 primitive，如果存在正整数 k 使 $A^k$ 的每个元素都为正数（记为 $A^k>0$）

使 $A^k>0$ 成立的最小 k 称为 A 的本原指数 primitive exponrnt，记为 $\gamma(A)$。

有向图 D 称为本原的，如果 D 的邻接矩阵 A 是本原的，$\gamma(A)$ 称为 D 的本原指数，记为 $\gamma(D)$。

**定理 1.10.1** 有向图 D 是本原的 $\Leftrightarrow$ D 为强连通的，而且 D 中所有不同有向圈长 $l_1,l_2,\dots,l_c$ 的最大公约数为 1，即 $\gcd(l_1,l_2,\dots,l_c)=1$。

> $C_3$ 是本原的，$C_4$ 不是

**推论 1.9** $n(\ge 5)$ 阶强连通竞赛图 $T_n$ 的邻接矩阵 A 满足 $A^{d+3}>0$，其中 $d=d(T_n)$。

