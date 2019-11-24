# 5. 匹配与独立集

## 5.1 匹配

设 $G$ 是无环非空图，$M$ 是 $E(G)$ 的**非空**子集。若 $M$ 中任何两条**边**在 $G$ 中均**不相邻**，则称 $M$ 为 $D$ 的**匹配** matching

$G$ 中与 $M$ 中边关联的顶点称为 $M$ **饱和点** saturated vertex。反之，称为 $M$ **非饱和点** unsaturated vertex

设 $X\subseteq V(D)$，若 $X$ 中每点都是 $M$ 饱和点，则称 $M$ **饱和** $X$ 

若 $M$ 饱和 $V(D)$，则称 $M$ 为 $D$ 的**完美匹配** perfect matching

从子图观点看，匹配是图 $G$ 的 1-正则子图 1-regular subgraph，完美匹配是图 $G$ 的支撑 1-正则子图 spanning 1-regular subgraph

若对 $D$ 的任何匹配 $M^\prime$ 均有 $|M^\prime|\le |M|$，则称 $M$ 为 $D$ 的**最大匹配** maximum matching

完美匹配 $\Rightarrow$ 最大匹配

> **示例** 
>
> 最大匹配
>
> ![image-20191124171343898](assets/image-20191124171343898.jpg)
>
> 完美匹配
>
> ![image-20191124171350284](assets/image-20191124171350284.jpg)

### 5.1.1 二部图有完美匹配条件 - Hall 定理

**定理 5.1.1**（Hall 定理）设 $G$ 是 $2$ 部划分为 $\{X,Y\}$ 的 $2$ 部分图，则：$G$ 有饱和 $X$ 的匹配 $\Leftrightarrow$ 
$$
|S|\le |N_G(S)|\quad \forall S\subseteq X
$$
称为 Hall 条件

> **证明** 
>
> - 必要性
>
> > 设 $M$ 是 $G$ 中饱和 $X$ 的匹配，则该匹配自然给出一个从 $X$ 到 $Y$ 的单射，记为 $M(x)$，$x\in X$ 
> >
> > 设 $S\subseteq X$，则 $M(S)\subseteq N_G(S)$，所以 $|S|=|M(S)|\le |N_G(S)|$ 
>
> - 充分性
>
> > 令 $M$ 是 $G$ 中最大匹配，只需证明 $|M|\ge |X|$ 
> >
> > 令 $H$ 是由 $G$ 每条边给定从 $X$ 到 $Y$ 的方向后所得到的定向图
> >
> > 构作有向图 $D$ 
> > $$
> > \begin{aligned}
> > V(D)&=V(H)\cup \{x,y\}\\
> > E(D)&=E(H)\cup\{(x,x^\prime):x^\prime\in X\}\cup\{(y^\prime,y):y^\prime\in Y\}
> > \end{aligned}
> > $$
> > ![image-20191124175029129](assets/image-20191124175029129.jpg)
> >
> > 断言：$D$ 中内部点不交的 $(x,y)$ 路的最大条数为 $|M|$ 
> >
> > > 设 $\{P_1,\dots,P_l\}$ 为 $D$ 中连接 $x,y$ 的点不交的最大路集，则 $|E_D(P_i)\cap E_D(X,Y)|=1$。设 $\{e_i\}=E_D(P_i)\cap E_D(X,Y)$，则 $\{e_1,\dots,e_l\}$ 是 $D$ 的匹配，故 $l\le |M|$ 
> > >
> > > 设 $M=\{e_1,\dots,e_m\}$，则过每条边 $e_i$ 都可以构造一条 $(x,y)$ 路且两两内点不交，即 $|M|\le l$ 
> > >
> > > 综上 $l=|M|$ 
> >
> > 令 $T$ 是 $D$ 中最小 $(x,y)$ 分离集，由 Menger 定理，有
> > $$
> > |M|=\zeta_D(x,y)=\kappa_D(x,y)=|T|
> > $$
> > 令 $T_1=T\cap X$，$T_2=T\cap Y$，则 $N_D^+(X\backslash T_1)\subseteq T_2$，则
> > $$
> > \begin{aligned}
> > |M|&=|T|\\
> > &=|T_1|+|T_2|\\
> > &\ge |T_1|+|N_D^+(X\backslash T_1)|\\
> > &= |T_1|+|N_G(X\backslash T_1)|\\
> > &\ge |T_1|+|X\backslash T_1|\\
> > &= |X|
> > \end{aligned}
> > $$

**推论 5.1.1.1**（婚姻定理）$2$ 部划分为 $\{X,Y\}$ 的 $2$ 部图 $G$ 有完美匹配 $\Leftrightarrow$ $|X|=|Y|$，并且对 $X$（或 $Y$）满足 Hall 条件

**推论 5.1.1.2** 设 $G$ 是 $k(>0)$ 正则 $2$ 部图，则 $G$ 有完美匹配

> **证明** 
>
> 设 $G$ 是 $2$ 部划分为 $\{X,Y\}$ 的 $k$ 正则 $2$ 部图，则
> $$
> k|X|=|E(G)|=k|Y|
> $$
> 由于 $k\neq 0$，则 $|X|=|Y|$ 
>
> 任取 $S\subseteq X$，并用 $E_1$ 表示与 $S$ 关联的边集，$E_2$ 表示与 $N_G(S)$ 关联的边集，则 $E_1\subseteq E_2$ 
>
> 则
> $$
> k|N_G(S)|=|E_2|\ge |E_1|=k|S|
> $$
> 即 $|N_G(S)|\ge |S|$ 
>
> 由 Hall 定理知 $G$ 有饱和 $X$ 的匹配 $M$，由于 $|X|=|Y|$，所以 $M$ 是完美匹配

**推论 5.1.1.3** 设 $G$ 是 $2$ 部划分为 $\{X,Y\}$ 的简单 $2$ 部图，而且 $|X|=|Y|=n$。若 $\delta(G)\ge \frac{n}{2}$，则 $G$ 有完美匹配

> **证明** 
>
> 任取 $S\subseteq X$，有 $|N(S)|\ge\delta(G)\ge \frac{n}{2}$ 
>
> 若 $|S|>|N(S)|$，则 $|S|> \frac{n}{2}$ 且 $Y\backslash N(S)\neq \empty$ 
>
> 令 $u\in Y\backslash N(S)$，则 $N(u)\subseteq X\backslash S$，即
> $$
> \delta(G)\le d_G(u)=|N(u)|\le|X|-|S|< \frac{n}{2}
> $$
> 矛盾，故 $|S|\le |N(S)|$ 
>
> 由 Hall 定理知 $G$ 有饱和 $X$ 的匹配 $M$，由于 $|X|=|Y|$，所以 $M$ 是完美匹配

### 5.1.2 一般图有完美匹配条件 - Tutte 定理

**定理 5.1.2**（Tutte 定理）$G$ 有完美匹配 $\Leftrightarrow$ $o(G-S)\le |S|\quad \forall S \subset V(G)$，称为 Tutte 条件，其中 $o(G-S)$ 是 $G-S$ 的奇阶连通分支数目

### 5.1.3 Konig 定理

