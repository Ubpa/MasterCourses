# 4. 网络流与连通度

## 4.1 网络流

**网络** network 是指具有两个不同的特定顶点 $x$ 和 $y$ 的加权连通图 $(D,\pmb{w})$，记为 $N=(D_{xy},\pmb{w})$，其中 $x$ 和 $y$ 分别称为**发点** source 和**发点** sink

若 $\pmb{w}$ 为非负的**容量函数** capacity function $\pmb{c}$，则称网络 $N=(D_{xy},\pmb{c})$ 为**容量网络** capacity network，其中 $\pmb{c}$ 在边 $a$ 上的值 $\pmb{c}(a)$ 称为边 $a$ 的**容量** capacity

若对任何 $a\in E(D)$，$\pmb{c}(a)$ 都是非负整数，则称 $N$ 为**整容量网络** (integer capacity network)

若 $\pmb{f}\in\mathcal{E}(D)$ 使得

- $0\le \pmb{f}(a)\le \pmb{c}(a),\forall a\in E(D)$ 
- $\pmb{f}^+(u)=\pmb{f}^-(u),\forall u \in V(D)\backslash\{x,y\}$ 

则称 $\pmb{f}$ 是 $N$ 中从 $x$ 到 $y$ 的**流** flow，简记 $(x,y)$ 流

每个网络至少存在一个流，如零流 $\pmb{f}(a)=0$ 

易得
$$
\text{val}\pmb{f}\triangleq\pmb{f}^+(x)-\pmb{f}^-(x)=\pmb{f}^-(y)-\pmb{f}^+(y)
$$
其中 $\text{val}\pmb{f}$ 称为**流量** value of a flow

> **示例** 
>
> ![image-20191112122951936](assets/image-20191112122951936.jpg)
>
> - $\text{val}\pmb{f}=8$ 
> - $\pmb{c}(B) = 8$，其中 $B$ 是粗边

$N$ 中具有最大流量的 $(x,y)$ 流称为 $N$ 中的**最大流** maximum flow

$D$ 中形如 $(S,\overline{S})$ 的有向边集 $B$ 称为 $(x,y)$ **截边集** cut edge set，其中 $x\in S$，$y\in\overline{S}$，则
$$
\text{cap} B \triangleq \pmb{c}(B)\triangleq \sum_{a\in B}\pmb{c}(a)
$$
称为 $B$ 的**容量** 

具有最小容量的 $(x,y)$ 截边集称为**最小截** minimum cut set

**定理 4.1**（最大流最小截定理）在任何容量网络 $N$ 中，最大流量等于最小截容量

> **证明** 
>
> 设 $\pmb{f}$ 是最大流，$B=(S,\overline{S})$ 是最小截
>
> 由流和流量的定义，有
>
> $$
> \pmb{f}^+(u)-\pmb{f}^-(u)=\left\{\begin{array}{ll}
> \text{val}\pmb{f}, &u=x,\\
> 0, & u\in S\backslash\{x\}
> \end{array}\right.
> $$
> 则
> $$
> \begin{aligned}
> \text{val}\pmb{f} &= \pmb{f}^+(x)- \pmb{f}^-(x)\\
> &= \sum_{u \in S}(\pmb{f}^+(u)-\pmb{f}^-(u))\\
> &= \pmb{f}^+(S)-\pmb{f}^-(S)\\
> &\le \pmb{f}^+(S) \le \pmb{c}^+(S)= \text{cap}B
> \end{aligned}
> $$
> 下面证明 $\text{val}\pmb{f}\ge \text{cap}B$ 
>
> 用 $D^\prime$ 表示在 D 中每条边 $a$ 的两端点之间添加一条与 $a$ 方向相反的新边 $\overset{\leftarrow}{a}$ 后得到的图，定义 $\widetilde{\pmb{f}}\in \mathcal{E}(D^\prime)$ 如下
> $$
> \widetilde{\pmb{f}}=\left\{\begin{array}{ll}
> \pmb{c}(a)-\pmb{f}(a), &a 是老边\\
> \pmb{f}(a), & a 是新边
> \end{array}\right.
> $$
>
> > $\pmb{c}(a)=\widetilde{\pmb{f}}(a)+\widetilde{\pmb{f}}(\overset{\leftarrow}{a})$ 
> >
> > ---
> >
> > **示例** 
> >
> > ![image-20191112131154583](assets/image-20191112131154583.jpg)
> >
> > 这是图一对应的 $\widetilde{\pmb{f}}$ 
>
> 令 $D^* = D^\prime_{\widetilde{\pmb{f}}}$，即 $D^*$ 是 $\widetilde{\pmb{f}}$ 在 $D^\prime$ 的支撑图
>
> > 支撑图的定义见 2.3 节，就是删去边权为 0 的边所得到的图
> >
> > ---
> >
> > 示例
> >
> > ![image-20191112131415296](assets/image-20191112131415296.jpg)
> >
> > 这是上个示例对应的支撑图
>
> 断言 $D^*$ 中不存在 $(x,y)$ 路
>
> > 假设存在 $(x,y)$ 路，记为 $P$，令
> > $$
> > \sigma=\min\{\widetilde{\pmb{f}}(a):a\in E(P)\}
> > $$
> > 则 $\sigma>0$ 
> >
> > 定义 $\pmb{f}^\prime\in \mathcal{E}(D)$ 为
> > $$
> > \pmb{f}^\prime(a)=\left\{\begin{array}{ll}
> > \pmb{f}(a)+\sigma, & a\in E(P)\\
> > \pmb{f}(a)-\sigma, & \overset{\leftarrow}{a}\in E(P)\\
> > \pmb{f}(a), & \text{other}
> > \end{array}\right.
> > $$
> > 则 $\pmb{f}^\prime$ 是 $N$ 中的 $(x,y)$ 流，且
> > $$
> > \text{val} \pmb{f}^\prime=\text{val}\pmb{f}+\sigma>\text{val}\pmb{f}
> > $$
>
> 故令
> $$
> S^\prime=\{u\in V(D^*) | D^*存在 (x,u) 路\}
> $$
> 则 $x\in S^\prime$，$y\notin S^\prime$，故 $B=(S^\prime,\overline{S^\prime})$ 是 $D$ 中 $(x,y)$ 的截边集，且在 $D^\prime$ 中有
> $$
> \widetilde{\pmb{f}}(a)=\left\{\begin{array}{ll}
> 0,&a\in(S^\prime,\overline{S^\prime})\\
> \pmb{c}(a),&a\in(\overline{S^\prime},S^\prime)
> \end{array}\right.
> $$
> 于是在 $D$ 中有
> $$
> \pmb{f}(a)=\left\{\begin{array}{ll}
> \pmb{c}(a),&a\in(S^\prime,\overline{S^\prime})\\
> 0,&a\in(\overline{S^\prime},S^\prime)
> \end{array}\right.
> $$
> 因此
> $$
> \text{val}\pmb{f}=\pmb{f}^+(S^\prime)-\pmb{f}^-(S^\prime)=\pmb{f}^+(S^\prime)=\text{cap}B^\prime\ge\text{cap}B
> $$
> 定理得证

**推论 4.1**（整数最大流最小截定理）任何整容量网络中都存在整数最大流而且其流量等于最小截容量

## 4.2 Menger 定理

设 $x$ 和 $y$ 是图 $D$ 中两不同顶点，$P_i$ 和 $P_j$ 是 $D$ 中两条 $(x,y)$ 路，若 $V(P_i)\cap V(P_j)=\{x,y\}$，则称 $P_i$ 和 $P_j$ 是 $D$ 中**内部点不交的**(internally vertex-disjoint) $(x,y)$ 路；若 $E(P_i)\cap E(P_j)=\empty$，则称 $P_i$ 和 $P_j$ 是 $D$ 中**边不交的** (edge disjoint) $(x,y)$ 路

用 $\zeta_D(x,y)$ 和 $\eta_D(x,y)$ 分别表示 $D$ 中内部点不交和边不交的 $(x,y)$ 路的最大条数

### 4.2.1 边形式

具有最小边数的 $(x,y)$ 截边集称为 **最小 (x,y) 截边集** minimum cut-edge set。用 $\lambda_D(x,y)$ 表示最小 $(x,y)$ 截边集中的边数，称为 $D$ 的**局部边连通度** local edge-connectivity

由定义，有
$$
\eta_D(x,y)\le\lambda_D(x,y)
$$
事实上，上式等号成立

**定理 4.2.1**（Menger 定理（边形式））设 $x$ 和 $y$ 是 $D$ 中不同两顶点，则
$$
\eta_D(x,y)=\lambda_D(x,y)
$$

> **证明** 
>
> 定义 $\pmb{c}\in \mathcal{E}(D)$ 
> $$
> \pmb{c}(a)=1,\forall a \in E(D)
> $$
> 考虑整容量网络 $N=(D_{xy},\pmb{c})$ 
>
> 由 **推论 4.1** 知，$N$ 中存在整数最大 $(x,y)$ 流 $\pmb{f}$ 和最小 $(x,y)$ 截边集 $B=(S,\overline{S})$，使得
> $$
> \text{val}\pmb{f}=\text{cap}B
> $$
> 只需证明
> $$
> \eta_D(x,y)\ge \text{val}\pmb{f}=\text{cap}B\ge\lambda_D(x,y)
> $$
> 显然 $\text{cap}B\ge \lambda_D(x,y)$ 成立
>
> 令 $H$ 是 $\pmb{f}$ 的支撑图 $D_{\pmb{f}}$ 
>
> 断言 $H$ 包含 $\text{val}\pmb{f}$ 条边不交的 $(x,y)$ 路，即 $\eta_D(x,y)\ge \text{val}\pmb{f}$ 
>
> 定理得证

**推论 4.2.1.1** 设 $x$ 和 $y$ 是无向图 $G$ 中任意两顶点，则 $\eta_G(x,y)=\lambda_G(x,y)$ 

**推论 4.2.1.2**（L. Lovasz）$D$ 是 Euler 图 $\Leftrightarrow$ $D$ 连通，并且
$$
\eta_D(x,y)=\eta_D(y,x),\quad \forall x,y\in V(D)
$$

### 4.2.2 点形式

设 $D$ 是有向图，$x$ 和 $y$ 是 $D$ 中不同两顶点，若存在 $S\subseteq V(D)\backslash \{x,y\}$ 使 $D-S$ 中不存在 $(x,y)$ 路，则称为 $D$ 中 $(x,y)$ **分离集** separating set

具有最小顶点数目的 $(x,y)$ 分离集称为最小 $(x,y)$ 分离集。用 $\kappa_D(x,y)$ 表示 $D$ 中最小 $(x,y)$ 分离集中的顶点数目，称为 $D$ 的**局部点连通度** (local vertex-connectivity)

对于有向图，$(x,y)$ 分离集不一定是 $(y,x)$ 分离集；对于无向图，$(x,y)$ 分离集一定是 $(y,x)$ 分离集，故写成 $xy$ 分离集。

由定义，有
$$
\zeta_D(x,y)\le \kappa_D(x,y)
$$
事实上，上式等号成立

**顶点分裂运算** spilt of a vertex：设 $u\in V(D)$，分裂 $u$ 为 $u^\prime$ 和 $u^{\prime\prime}$，添加新边 $(u^\prime,u^{\prime\prime})$，并把 $D$ 中以 $u$ 为起点的边用以 $u^{\prime\prime}$ 为起点的新边来代替；把 $D$ 中以 $u$ 为终点的边用以 $u^\prime$ 为终点的新边来代替，$d^+(u^\prime)=1$，$d^-(u^{\prime\prime})=1$ 

> 示例
>
> ![image-20191113140605576](assets/image-20191113140605576.jpg)
>
> 顶点 $u$ 的分裂运算

**定理 4.2.2**（Menger 定理）设 $x$ 和 $y$ 是 $D$ 中不同两顶点，且 $E_D(x,y)=\empty$，则
$$
\zeta_D(x,y)=\kappa_D(x,y)
$$
**推论 4.2.2** 设 $x$ 和 $y$ 是 $G$ 中不相邻两顶点，则
$$
\zeta_G(x,y) = \kappa_G(x,y)
$$

## 4.3 连通度

设 $D$ 是强连通图，非空集 $S\subset V(D)$，若 $D-S$ 是非强连通的，则称 $S$ 为 $D$ 的**分离集** separating set

若 $D$ 中不含支撑子图 $K_n^*$，则 $D$ 必有分离集

> 这样 $d(D)\ge 2$，取 $x,y\in V(D)$ 使得 $d_D(x,y)=d(D)$，则 $V(D)\backslash \{x,y\}$，就是 $D$ 的一个分离集（分离了 $x$ 和 $y$）
>

定义 $D$ 的**强连通度**（strong connectivity）
$$
\kappa(D)=\left\{\begin{array}{ll}
0, & D 不是强连通\\
n-1, & D 含支撑子图 K_n^*\\
\text{min}\{|S| : S 是 D 的分离集\}, &\text{other}
\end{array}\right.
$$

> 强连通度就是最小分离集的大小

若 $\kappa(D)\ge k$，则称 $D$ 为**强 k​ 连通图** 

> 这里竟然只是 $\ge$ 
>
> $K_n^*$ 是强 $n-1$ 连通图
>
> 有向圈是强 $1$ 连通图

点数为 $\kappa=\kappa(D)$ 的分离集称为 $\kappa$ **分离集** 

$\kappa(D)$ 还可写为
$$
\kappa(D)=\left\{\begin{array}{ll}
n-1,&D含 K_n^*\\
\min\{\kappa(x,y)|\forall x,y\in V(D),E_D(x,y)=\empty\},&\text{other}
\end{array}\right.
$$
---

设 $D$ 是强连通图，非空集 $B\subseteq E(D)$。若 $D-B$ 是非强连通的，则称 $B$ 为**截边集** cut-edge set

非平凡强连通图必含截边集

> 与 2.1 节定义的边割集 edge-cut set 不同

定义 $D$ 的**强边连通度** strong edge-connectivity
$$
\lambda(D)=\left\{\begin{array}{ll}
0,&n=1\ \text{or}\ D非强连通\\
\min\{|B|:B是D的截边集\},&\text{other}
\end{array}\right.
$$
若 $\lambda(D)\ge k$，则称 $D$ 为 **k 强边连通图** 

> $K_n^*$ 是 $(n-1)$ 强边连通图
>
> 有向圈是 $1$ 强边连通图

边数为 $\lambda=\lambda(D)$ 的截边集称为 $\lambda$ **截边集** 

$\lambda(D)$ 可表示为
$$
\lambda(D)=\min\{\lambda_D(x,y):\forall x,y\in V(D)\}
$$
设 $G$ 是无向图，$D$ 是 $G$ 的对称有向图，有

- $S$ 是 $G$ 的分离集 $\Leftrightarrow$ $S$ 是 $D$ 的分离集
- $B=[S,\overline{S}]$ 是 $G$ 的截边集 $\Leftrightarrow$ $(S,\overline{S})$ 是 $D$ 的截边集

因此 $\kappa(G)=\kappa(D),\lambda(G)=\lambda(D)$ 

任何三个正整数 $\kappa,\lambda,\delta\ (\kappa\le\lambda\le\delta)$，均存在无向图 $G$ 使 $\kappa(G)=\kappa,\lambda(G)=\lambda,\delta(G)=\delta$ 

令 $\delta(D)=\min\{\delta^+(D),\delta^-(D)\}$ 

**定理 4.3.1**（Whitney 不等式）
$$
\kappa(D)\le \lambda(D)\le \delta(D)
$$
**推论 4.3.1.1** 对无向图 $G$ 有，$\kappa(G)\le\lambda(G)\le \delta(G)$ 

**推论 4.3.1.2** 对任何简单平面图 $G$ 均有 $\kappa(G)\le \lambda(G)\le 5$ 

**Proposition 3.1** 设 $D$ 是强连通简单图，$D$ 的直径 $d(D)\le 2$，则 $\lambda(D)=\delta(D)$ 

**Proposition 3.2** 设 $G$ 是简单无向图，$V(G)=\{x_1,\dots,x_n\}$，$d_i=d_G(x_i)$ 且 $d_1\le \dots \le d_n$，$n\ge 2$，$1\le k\le n-1$，若存在 $i\le \lfloor\frac{1}{2}(n-k+1)\rfloor$，有
$$
d_i\le k+i-2, d_{n-k+1}\ge n-i
$$
则 $\kappa(G)\ge k$ 

**定理 4.3.2** 设 $k\ge 1$，并且设 $D$ 是 $n(\ge k+1)$ 阶有向图，则

(i) $\kappa(D)\ge k \Leftrightarrow \zeta_D(x,y)\ge k,\forall x,y\in V(D)$ 

(ii) $\lambda(D)\ge k \Leftrightarrow \eta_D(x,y)\ge k,\forall x,y \in V(D)$ 

> 这个定理说明了局部（边）连通度与全局（边）连通度之间的关系

**推论 4.3.2** 设 $D$ 是强连通有向图，则

(i) $\kappa ( D ) \geqslant k \Rightarrow \left\{ \begin{array} { l l } { \kappa ( D - x ) \geqslant k - 1 , } & { \forall x \in V ( D ) } \\ { \kappa ( D - a ) \geqslant k - 1 , } & { \forall a \in E ( D ) } \end{array} \right.$ 

(ii) $\lambda ( D ) \geqslant k \Rightarrow \lambda ( D - a ) \geqslant k - 1 , \quad \forall a \in E ( D )$ 

> 这个推论说明了删点/边对强（边）连通度的影响

## 4.4 运输方案的设计-容量网络最大流算法

设 $\pmb{f}\in \mathcal{E}(D)$ 是 $N=(D_{xy},\pmb{c})$ 中的 $(x,y)$ 流，$u$ 是 $D$ 中顶点，$u\neq x$。并设 $P$ 是 $D$ 中连接 $x$ 和 $u$ 的路（不一定是有向路）

给定 $P$ 从 $x$ 到 $u$ 的方向为正向，用 $P^+$ 和 $P^-$ 分别表示 $E(P)$ 中与 $P$ 的正向和反向一致的边集。令
$$
\sigma(a)=\left\{\begin{array}{ll}
\pmb{c}(a)-\pmb{f}(a),&a\in P^+\\
\pmb{f}(a),&a\in P^-
\end{array}\right.
$$

并令
$$
\sigma_P(u)=\min\{\sigma(a):a\in E(P)\}
$$
若 $\sigma_P(u)=0$，则称 $P$ 是 $\pmb{f}$ **饱和路** saturated path

若 $\sigma_P(u)>0$，则称 $P$ 是 $\pmb{f}$ **非饱和路** unsaturated path

$\pmb{f}$ 非饱和的 $(x,y)$ 路 $P$ 称为 $\pmb{f}$ **增广路** incrementing path，之所以称为增广路，是因为流 $\pmb{f}$ 的流量沿此路是可以增加的。事实上，由
$$
\tilde{\pmb{f}}(a)=\left\{\begin{array}{ll}
\pmb{f}(a)+\sigma_P(y),&a\in P^+\\
\pmb{f}(a)-\sigma_P(y),&a\in P^-\\
\pmb{f}(a),&\text{other}
\end{array}\right.
$$
所定义的 $\widetilde{\pmb{f}}\in \mathcal{E}(D)$ 是 $N$ 中的 $(x,y)$ 流并且 $\text{val}\widetilde{\pmb{f}}=\text{val}\pmb{f}+\sigma_P(y)$，流 $\widetilde{\pmb{f}}$ 称为基于 $\pmb{f}$ 增广路 $P$ 的**修正流** revised flow

> 示例
>
> ![image-20191123153959718](assets/image-20191123153959718.jpg)

**定理 4.4.1** $N=(D_{xy},\pmb{c})$ 中的 $(x,y)$ 流 $\pmb{f}$ 是最大的 $\Leftrightarrow$ $N$ 中不含 $\pmb{f}$ 增广路

定理 4.4.1 提供了求整容量网络中最大流最小截的有效算法，称为**标号法** labelling method

标号法的基本思想是从 $N$ 中任何一个已知 $(x,y)$ 流 $\pmb{f}$（例如零流）开始，递归地构作出一个其流量不断增加的流序列，并且终止于最大流。在每个新的流 $\pmb{f}$ 作出之后，如果存在 $\pmb{f}$ 的增广路 $P$，则作出基于 $P$ 的修正流 $\widetilde{\pmb{f}}$，然后将 $\widetilde{\pmb{f}}$ 作为初始流重新执行算法。如果不存在 $\pmb{f}$ 增广路，则算法停止。由定理 4.4.1 知 $\pmb{f}$ 是最大流。

**标号法** 

1.任取 $N$ 中一个 $(x,y)$ 流 $\pmb{f}$（例如零流），并给 $x$ 以标号 $(-,\infty)$，并令 $L=\{x\}$ 

2.删去 $L$ 中最前面元素 $u$（“**先进先出**”原则，保证第 4 步的 $(x,y)$ 增广路是 $D$ 中**最短路**）

> (1) 若存在未被标号顶点 $z$，使得
>
> > (i) $a=(u,z)\in E(D)$，并且 $\pmb{f}(a)<\pmb{c}(a)$，则给 $z$ 以标号 $(u^+,\sigma(z))$；**或** 
> >
> > (ii) $a=(z,u)\in E(D)$，并且 $\pmb{f}(a)>0$，则给 $z$ 以标号 $(u^-,\sigma(z))$ 
> >
> > 其中 $\sigma(z)=\sigma_P(z)$，$P$ 为 $D$ 中 $\pmb{f}$ 非饱和的 $xz$ 路，将 $z$ 列入 $L$ 的后面
>
> (2) 若不存在这样的 $z$ 使得 (i)，(ii) 成立且 $L=\empty$，则停止。$\pmb{f}$ 是最大流

3.若 $y$ 被标号，则进入第 $4$ 步；若 $y$ 未被标号，则转入第 2 步

4.已被标号的顶点构成 $D$ 中一条 $\pmb{f}$ 增广路 $P$。构造基于流 $\pmb{f}$ 的增广路 $P$ 的修正流 $\widetilde{\pmb{f}}$。除掉所有标号并以 $\widetilde{\pmb{f}}$ 替代 $\pmb{f}$ 转入第 1 步

**定理 4.4.2** 设 $N$ 是整容量网络，并设 $\pmb{f}$ 和 $S$ 分别是标号法终止时得到的 $(x,y)$ 流和已标号的顶点集，则 $\pmb{f}$ 是最大 $(x,y)$ 流，$(S,\overline{S})$ 是最小容量的 $(x,y)$ 截边集

当 $\pmb{c}\equiv 1$ 时，标号法求出的最大流 $\pmb{f}$ 满足 $\lambda_D(x,y)=\text{val}\pmb{f}$。换言之，标号法为求图的强边连通度提供了一个有效算法

## *4.5 最优运输方案的设计-最小费用最大流算法

4.4 节只考虑了流量，没有考虑费用，我们要设计一个**输送量最大**且总的**运输费用最小**的运输方案。这样的运输方案称为**最优运输方案**。

用一个被称为**费用容量网络** $N=(D_{xy},\pmb{b},\pmb{c})$ 表示该交通系统，其中 $\pmb{b}\in \mathcal{E}(D)$ 表示**单位流量费用函数**，$\pmb{c}\in \mathcal{E}(D)$ 是容量函数

设 $\pmb{f}$ 是 $N$ 中 $(x,y)$ 流，则
$$
\pmb{b}(\pmb{f})=\sum_{a\in E(D)}\pmb{f}(a)\pmb{b}(a)
$$
定义为 $\pmb{f}$ 的**费用** cost

若对 $N$ 中其流量等于 $\text{val}\pmb{f}$ 的任何一个 $(x,y)$ 流 $\pmb{f}^\prime$ 均有
$$
\pmb{b}(\pmb{f})\le \pmb{b}(\pmb{f}^\prime)
$$
则称 $\pmb{f}$ 为**最小费用流** 

最优运输方案的设计就是在费用容量网络 $N=(D_{xy},\pmb{b},\pmb{c})$ 中求最大 $(x,y)$ 流 $\pmb{f}$ 且使费用 $\pmb{b}(\pmb{f})$ 最小。这样的流称为**最小费用最大流** minimum cost maximum flow

设 $N=(D_{xy},\pmb{b},\pmb{c})$ 为费用容量网络，$\pmb{f}$ 是 $N$ 中 $(x,y)$ 流。$C$ 是 $D$ 中有指定正向的圈。令
$$
\begin{aligned}
\sigma_{\pmb{f}}(a)&=\left\{\begin{array}{ll}
\pmb{c}(a)-\pmb{f}(a),&a\in C^+\\
\pmb{f}(a),&a\in C^-
\end{array}\right.\\
\sigma_{\pmb{f}}(C)&=\min\{\sigma_{\pmb{f}}(a):a\in E(C)\}
\end{aligned}
$$
若 $D$ 中的圈 $C$ 存在定向使 $\sigma_{\pmb{f}}(C)>0$，则称 $C$ 为 $\pmb{f}$ **增广圈** increment cycle

对于 $\pmb{f}$ 增广圈 $C$ 和任意 $\sigma(0<\sigma\le \sigma_{\pmb{f}})$，我们可以定义
$$
\widetilde{\pmb{f}}_\sigma(a)=\left\{\begin{array}{ll}
\pmb{f}(a)+\sigma,&a\in C^+\\
\pmb{f}(a)-\sigma,&a\in C^-\\
\pmb{f}(a),&\text{other}
\end{array}\right.
$$
容易验证，$\widetilde{\pmb{f}}_\sigma$ 是 $N$ 中 $(x,y)$ 流，而且 $\text{val}\widetilde{\pmb{f}}=\text{val}\pmb{f}$ 

$\widetilde{\pmb{f}}_\sigma$ 称为基于 $\pmb{f}$ 增广圈 $C$ 关于 $\sigma$ 的**修正流** revised flow

设 $C$ 是 $\pmb{f}$ 的增广圈，则定义增广圈 $C$ 的费用为
$$
\pmb{b}(C,\pmb{f})=\sum_{a\in C^+}\pmb{b}(a)-\sum_{a\in C^-}\pmb{b}(a)
$$
为寻找其费用为负的 $\pmb{f}$ 增广圈，可以通过辅助图 $D(\pmb{f})$ 来实现

设 $a\in E(D)$，用 $\overset{\leftarrow}{a}$ 表示改变 $a$ 的方向后而得到的新边

定义加权图 $(D(\pmb{f}),\pmb{w})$ 如下：$V(D(\pmb{f}))=V(D)$，设 $a\in E(D)$ 

- 若 $\pmb{f}(a)< \pmb{c}(a)$，则 $a\in E(D(\pmb{f}))$ 且 $\pmb{w}(a)=\pmb{b}(a)$ 
- 若 $\pmb{f}(a)>0$，则 $\overset{\leftarrow}{a}\in E(D(\pmb{f}))$，且 $\pmb{w}(\overset{\leftarrow}{a})=-\pmb{b}(a)$ 

设 $C$ 是 $D$ 中 $\pmb{f}$ 增广圈，则对任何 $a\in E(C^+)$，均有 $\pmb{f}(a)<\pmb{c}(a)$，则 $a\in E(D(\pmb{f}))$；对任何 $a\in E(C^-)$，均有 $\pmb{f}(a)>0$，因而 $\overset{\leftarrow}{a}\in E(D(\pmb{f}))$，故用 $\overset{\leftarrow}{a}$ 代替 $a$，从而的得到 $D(\pmb{f})$ 中和 $C$ 对应的有向圈，记为 $\overset{\leftarrow}{C}$ 

$C$ 是 $\pmb{f}$ 增广圈当且仅当 $\overset{\leftarrow}{C}$ 是 $D(\pmb{f})$ 中有向圈，且
$$
\pmb{b}(C,\pmb{f})=\pmb{w}(\overset{\leftarrow}{C})
$$
于是，寻找 $D$ 中费用小于 $0$ 的 $\pmb{f}$ 增广圈就等价于在 $D(\pmb{f})$ 中寻找负权和的有向圈，称为**负圈** 

**定理 4.5.1**（最小费用流判定定理）$N=(D_{xy},\pmb{b},\pmb{c})$ 中 $(x,y)$ 流 $\pmb{f}$ 是最小费用流 $\Leftrightarrow$ 每条 $\pmb{f}$ 增广圈 $C$ 都有 $\pmb{b}(C,\pmb{f})\ge0$ $\Leftrightarrow$ $D(\pmb{f})$ 中不含负圈

**Klein 算法** 

从 $N$ 中任何一个 $(x,y)$ 最大流 $\pmb{f}$ 出发，检查每个 $\pmb{f}$ 增广圈。若所有 $\pmb{f}$ 增广圈的费用都是非负的，则 $\pmb{f}$ 就是所求的最小费用最大流。若存在 $\pmb{f}$ 增广圈 $C$ 使得 $\pmb{b}(C,\pmb{f})<0$，则用修正流 $\widetilde{\pmb{f}}$ 替代 $\pmb{f}$ 再重复上述过程。

1. 求 $N$ 中最大 $(x,y)$ 流 $\pmb{f}$ 
2. 构造 $D(\pmb{f})$ 
3. 求 $D(\pmb{f})$ 中的负圈

> - 若无负圈，则停止，此时 $\pmb{f}$ 是最小费用最大流
> - 若 $D(\pmb{f})$ 含负圈 $\overset{\leftarrow}{C}$，则 $C^+\cup C^-$ 是 $\pmb{f}$ 增广圈（其正向与 $\overset{\leftarrow}{C}$ 的方向一致），作修正流 $\widetilde{\pmb{f}}$，并用 $\widetilde{\pmb{f}}$ 代替 $\pmb{f}$ 转入第 1 步

---

> **示例** 
>
> ![image-20191123225615746](assets/image-20191123225615746.jpg)
>
> (a) $N=(D_{xy},\pmb{b},\pmb{c})$ 
>
> (b) 粗边的 $C$ 是 $\pmb{f}$ 增广圈，满足 $\pmb{b}(C,\pmb{f})<0$ 
>
> (c) 修正流 $\widetilde{\pmb{f}}$ 
>
> (d) 辅助图 $D(\pmb{f})$，含负圈
>
> (e) 辅助图 $D(\widetilde{\pmb{f}})$，不含负圈

## 4.6 中国投递员问题

一个投递员每次投递右键都要走遍他所负责投递区域内的每条街道。完成投递任务后回到邮局。选择路线使得总路程最短。此问题称为**中国投递员问题** Chinese Postman Problem

把投递员所负责的投递区域看做一个连通的加权有限图 $(D,\pmb{w})$，其中 $D$ 的顶点视为街道的交叉口，街道（单向）视为边，权视为街道的长（当然是正数）。经过 $(D,\pmb{w})$ 中每条边至少一次的有向闭链称为**邮路** post tour。具有最小权的邮路称为**最优邮路** optimal post tour

解中国投递员问题就是在**连通的正加权图** $(D,\pmb{w})$ 中找出一条最优邮路

### 4.6.1 欧拉图情形

若 $D$ 是 Euler 图，则由于任何 Euler 有向回都是一条通过 $D$ 的**每条边正好一次**的邮路，因而就是最优邮路

**Edmonds-Johnson 算法**（求 Euler 有向回的算法）

1.任取 $x_0\in V(D)$，求出根在 $x_0$ 的外向支撑树 $T$，并令 $P_0=x_0$ 

2.设有向迹 $P_i=x_ia_ix_{i-1}\dots a_2x_1a_1x_0$ 已确定。取 $a_{i+1}\in E(D)\backslash\{a_1,\dots,a_i\}$ 使

> (i) $a_{i+1}=(x_{i+1},x_i)$ 
>
> (ii) $a_{i+1}\notin E(T)$ 除非没有别的边可供选择

3.若第 2 步不能再执行时，则停止

> 注意，这里是反着找的

**定理 4.6.1** Edmonds-Johnson 算法终止时构造出的有向迹是 $D$ 中的一条 Euler 有向回

### 4.6.2 非欧拉图情形

**定理 4.6.2** 图 $D$ 有邮路 $\Leftrightarrow$ $D$ **强连通** 

设 $(D,\pmb{w})$ 是**非平衡**的强连通加权图，并设 $P$ 是 $D$ 的邮路，因此某些边在 $P$ 中重复出现，用 $p(a)$ 表示 $a\in E(D)$ 在 $P$ 中出现的次数。对 $\forall a\in E(D)$，用 $D^*$ 表示将 $p(a)$ 条与 $a$ 有相同方向的边替代 $D$ 中的边 $a$ 而得到的图。则 $D^*$ 是 $D$ 的母图而且是**平衡**的。$D$ 中邮路将对应着母图 $D^*$ 中的 Euler 有向图。

给定强连通加权图 $(D,\pmb{w})$，$\pmb{w}>0$ 

(i) 构造 $D$ 的**平衡**母图 $D^*$ 使添加的边集 $E^*$ 有**最小权** 

(ii) 求 $D^*$ 中 Euler 有向回

> **Edmonds-Johnson 算法** 提供了求解 (ii) 的有效算法

**(i) 算法** 

对每一 $x\in V(D)$，令 $\rho(x)=d^-_D(x)-d^+_D(x)$，并令
$$
X=\{x\in V(D):\rho(x)>0\},\quad Y=\{y\in V(D):\rho(y)<0\}
$$


由于 $D$ 是非平衡图，所以由 **定理 1.6** 知，$X\neq \empty$，$Y\neq\empty$，且
$$
\sum_{x\in X}\rho(x)=-\sum_{y\in Y}\rho(y)
$$
记上式两边的值为 $\rho(D)$ 

任何 $\rho(D)$ 条起点在 $X$ 中终点在 $Y$ 中且权最小的有向路的边集 $E^*$（其中若边 $a$ 是 $m$ 条有向路的公共边，则计算 $m$ 次）都是 (i) 的解（因为此时 $D^*$ 是平衡图）

于是 (i) 的解归结为在 $D$ 中选取 $\rho=\rho(D)$ 条起点在 $X$ 而终点在 $Y$ 的有向路 $P_1,\dots,P_\rho$ 使权和 $\sum_{i=1}^\rho \pmb{w}(P_i)$ 最小

构建费用容量网络 $N=(D^\prime_{x_0y_0},\pmb{b},\pmb{c})$，其中 $D^\prime$ 为在 $D$ 上添加两个新顶点 $x_0$ 和 $y_0$ 

- 用容量为 $\rho(x)$，费用为 $0$ 的起点在 $x_0$ 的边连接 $x_0$ 到 $X$ 中每个顶点 $x$ 
- 用容量为 $-\rho(y)$，费用为 $0$ 的终点在 $y_0$ 的边连接 $Y$ 中每个顶点 $y$ 到 $y_0$ 
- $\forall a\in E(D)$，$\pmb{c}(a)=\infty$，$\pmb{b}(a)=\pmb{w}(a)$ 

于是 $N$ 中每个单位 $(x_0,y_0)$ 流 $\pmb{f}_0$ 都可以视为 $D$ 的一条 $(x,y)$ 路 $P_0$，其中 $x\in X$，$y\in Y$。$\pmb{f}_0$ 的费用 $\pmb{b}(\pmb{f}_0)=\pmb{w}(P_0)$ 

$E^+_{D^\prime}(x_0)$ 和 $E^-_{D^\prime}(y_0)$ 都是 $N$ 中具有最小容量的 $(x_0,y_0)$ 截边集

由最大流最小截定理知，$N$ 中最大 $(x_0,y_0)$ 流 $\pmb{f}$ 的流量 $\text{val}\pmb{f}=\rho(D)$ 

因此求解 (i) 的问题归结为求 $N$ 中最小费用最大流问题

总结

1. 构造 $D^\prime$ 和 $N=(D^\prime_{x_0y_0},\pmb{b},\pmb{c})$ 
2. 求 $N$ 中最小费用最大流
3. 构造 $D^*$ 
4. 求 $D^*$ 中 Euler 有向回，即 $(D,\pmb{w})$ 最优邮路

> **示例** 
>
> ![image-20191124142440433](assets/image-20191124142440433.jpg)
> $$
> \rho(x_1)=-1,\ \rho(x_2)=0,\ \rho(x_3)=2,\ \rho(x_4)=1,\ \rho(x_5)=-2
> $$
> 则
> $$
> X=\{x_3,x_4\},\ Y=\{x_1,x_5\},\ \rho(D)=3
> $$
> 构建 $N=(D^\prime_{x_0y_0},\pmb{b},\pmb{c})$ 
>
> ![image-20191124142614703](assets/image-20191124142614703.jpg)
>
> 求最小费用最大流（**Klein 算法**）
>
> ![image-20191124142635665](assets/image-20191124142635665.jpg)
>
> 对应的 $E^*$ 为
>
> ![image-20191124142718659](assets/image-20191124142718659.jpg)
>
> 则 $D^*$ 为
>
> ![image-20191124142737414](assets/image-20191124142737414.jpg)
>
> 然后用 **Edmonds-Johnson 算法** 求出 Euler 有向回，即为最优邮路
> 
> $$
> P=(x_1,x_2,x_3,x_4,x_5,x_2,x_4,x_5,x_3,x_4,x_5,x_1,x_3,x_4,x_5,x_1)
> $$
> 


