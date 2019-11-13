# 4. 网络流与连通度

网络 network 是指具有两个不同的特定顶点 $x$ 和 $y$ 的加权连通图 $(D,\pmb{w})$，记为 $N=(D_{xy},\pmb{w})$，其中 $x$ 和 $y$ 分别称为发点 source 和发点 sink

若 $\pmb{w}$ 为非负的容量函数 capacity function $\pmb{c}$，则称网络 $N=(D_{xy},\pmb{c})$ 为容量网络 capacity network，其中 $\pmb{c}$ 在边 $a$ 上的值 $\pmb{c}(a)$ 称为边 $a$ 的容量 capacity

若对任何 $a\in E(D)$，$\pmb{c}(a)$ 都是非负整数，则称 $N$ 为整容量网络 (integer capacity network)

若 $\pmb{f}\in\mathcal{E}(D)$ 使得

- $0\le \pmb{f}(a)\le \pmb{c}(a),\forall a\in E(D)$ 
- $\pmb{f}^+(u)=\pmb{f}^-(u),\forall u \in V(D)\backslash\{x,y\}$ 

则称 $\pmb{f}$ 是 $N$ 中从 $x$ 到 $y$ 的流 flow，简记 $(x,y)$ 流

> 示例
>
> ![image-20191112122951936](assets/image-20191112122951936.jpg)
>
> - $\text{val}\pmb{f}=8$ 
> - $\pmb{c}(B) = 8$，其中 $B$ 是粗边

每个网络至少存在一个流，如零流 $\pmb{f}(a)=0$ 

易得
$$
\text{val}\pmb{f}\triangleq\pmb{f}^+(x)-\pmb{f}^-(x)=\pmb{f}^-(y)-\pmb{f}^+(y)
$$
其中 $\text{val}\pmb{f}$ 称为流量

$N$ 中具有最大流量的 $(x,y)$ 流称为 $N$ 中的最大流 maximum flow

$D$ 中形如 $(S,\overline{S})$ 的有向边集 $B$ 称为 $(x,y)$ 的截边集 cut edge set，其中 $x\in S$，$y\in\overline{S}$，则
$$
\text{cap} B \triangleq \pmb{c}(B)\triangleq \sum_{a\in B}\pmb{c}(a)
$$
称为 $B$ 的容量。

具有最小容量的 $(x,y)$ 截边集称为最小截 minimum cut set

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
> > 示例
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
> S^\prime=\{u\in V(D^*) : D^*存在 (x,u) 路\}
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

设 $x$ 和 $y$ 是图 $D$ 中两不同顶点，$P_i$ 和 $P_j$ 是 $D$ 中两条 $(x,y)$ 路，若 $V(P_i)\cap V(P_j)=\{x,y\}$，则称 $P_i$ 和 $P_j$ 是 $D$ 中**内部点不交**的(internally vertex-disjoint) $(x,y)$ 路；若 $E(P_i)\cap E(P_j)=\empty$，则称 $P_i$ 和 $P_j$ 是 $D$ 中**边不交**的 (edge disjoint) $(x,y)$ 路

用 $\zeta_D(x,y)$ 和 $\eta_D(x,y)$ 分别表示 $D$ 中内部点不交和边不交的 $(x,y)$ 路的最大条数

### 4.2.1 边形式

具有最小边数的 $(x,y)$ 截边集称为最小 $(x,y)$ 截边集 minimum cut-edge set。用 $\lambda_D(x,y)$ 表示最小 $(x,y)$ 截边集中的边数，称为 $D$ 的**局部边连通度** local edge-connectivity

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


