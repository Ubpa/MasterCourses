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
称为 **Hall 条件** 

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

> **证明** 
>
> - 必要性 $\Rightarrow$ 
>
> > 设 $M$ 是 $G$ 的完美匹配，$S\subset V(G)$，$G_1,\dots,G_t$ 是 $G-S$ 的奇阶连通分支
> >
> > 所以存在 $u_i\in V(G_i)$ 和 $w_i\in S$ 使 $\{u_iw_i:i=1,\dots,t\}\subseteq M$ 
> >
> > 则 $o(G-S)=t=|\{w_1,\dots,w_t\}|\le |S|$ 
>
> - 充分性 $\Leftarrow$ 
>
> > 令 $S=\empty$，则 $o(G-S)=0$，所以 $n=|V(G)|$ 为偶数
> >
> > （归纳法）
> >
> > - 当 $n=2$ 时，结论显然成立
> >
> > - 假设 $<n$ 偶阶成立
> >
> > > 设 $U$ 是 $V(G)$ 中使 Tutte 条件**等号**成立的最大非空子集，令 $|U|=m$，并令 $G_1,\dots,G_m$ 是 $G-U$ 的奇分支，则有下列三个结论成立
> > >
> > > - $G-U$ 无偶分支
> > >
> > > > **证明** 
> > > >
> > > > 设 $H$ 是 $G-U$ 的偶分支，$u\in V(H)$，则 $m+1\le o(G-(U\cup\{u\}))\le |U\cup\{u\}|=m+1$，即 $o(G-(U\cup\{u\}))=|U\cup\{u\}|$ 
> > >
> > > - $\forall x\in G_i$，则 $G_i-x$ 有完美匹配
> > >
> > > > **证明** 
> > > >
> > > > 若不然，由归纳假设，存在 $S\subset V(G_i-x)$ 使得 $o((G_i-x)-S)>|S|$。由于 $o((G_i-x)-S)$ 与 $|S|$ 有相同的奇偶性。所以 $o((G_i-x)-S))\ge |S|+2$，记 $U^+=U\cup S\cup \{x\}$，于是
> > > > $$
> > > > \begin{aligned}|U|+1+|S|&=|U^+|\\&=o(G-(U^+))\\&=o(G-U)-1+o((G_i-x)-S)\\&\ge |U|+1+|S|\end{aligned}
> > > > $$
> > > > 即 $o(G-U^+)=|U^+|>|U|$ 
> > > >
> > > > 矛盾于 $U$ 的选取
> > >
> > > - $G$ 含匹配 $M=\{s_it_i:s_i\in U,t_i\in V(G_i),i=1,\dots,m\}$ 
> > >
> > > > **证明** 
> > > >
> > > > ![image-20191203111417929](assets/image-20191203111417929.jpg)
> > > >
> > > > 考虑 2 部划分为 $\{V_1,V_2\}$ 的 2 部图 $H$ 
> > > >
> > > > - $V_1=\{G_1,\dots,G_m\}$，$V_2=U$ 
> > > > - $G_i$ 与 $U$ 中点 $s$ 在 $H$ 中相邻 $\Leftrightarrow$ $G$ 含从 $s$ 到 $G_i$ 中点的边
> > > >
> > > > 因此只需证 $H$ 有饱和 $V_1$ 的匹配
> > > >
> > > > （Hall 定理）
> > > >
> > > > 任取 $A\subseteq V_1$，并令 $B=N_H(A)\subseteq V_2$，则由于 $A$ 中元素都是 $G-B$ 的奇分支，则
> > > > $$
> > > > |A|\le o(G-B)\le |B|=|N_H(A)|
> > > > $$
> > > > 即 $A$ 满足 [Hall 定理](#5.1.1 二部图有完美匹配条件 - Hall 定理) 中的 Hall 条件，于是 $H$ 有饱和 $V_1$ 的匹配
> > >
> > > 综合三个结论知 $n$ 时成立
> >
> > 由归纳法知定理成立

**定理 5.1.2\***（Berge 公式）用 $\nu(G)$ 表示 $G$ 的最大匹配中边的数目，则
$$
\begin{aligned}
\nu(G)&=\frac{1}{2}\left\{|V(G)|-\max_\limits{S\subset V(G)}\{o(G-S)-|S|\}\right\}\\
&=\min_\limits{S\subset V(G)}\left\{\frac{V(G)+|S|-o(G-S)}{2}\right\}
\end{aligned}
$$
**推论 5.1.2.1** 偶阶 $(k-1)$ 边连通 $k(\ge 1)$ 正则图有完美匹配

> **证明** 
>
> - 当 $k=1$ 时，结论显然成立
>
> - 假定 $k\ge 2$ 
>
> > （Tutte 定理）
> >
> > - 若 $S=\empty$，$n(G)$ 是偶数，则 $o(G-S)=0=|\empty|=|S|$ 
> > - 设 $S\neq \empty$ 
> >
> > > 设 $G_1,\dots,G_t$ 是 $G-S$ 的奇分支，记 $m_i=|E_G(V(G_i),S)|$，$n_i=n(G_i)$ 
> > >
> > > 断言：$m_i\ge k$ 
> > >
> > > > 由 $\lambda(G)\ge k-1$，则 $m_i\ge k-1$ 
> > > >
> > > > 若存在某个 $i$ 使 $m_i=k-1$，则
> > > > $$
> > > > e(G_i)=\frac{1}{2}(kn_i-k+1)=\frac{1}{2}k(n_i-1)+\frac{1}{2}
> > > > $$
> > > > 上式右端不为整数，矛盾
> > > >
> > > > > 第一个等号：$kn_i-m_i=kn_i-k+1$ 是 $G_i$ 的点度数和
> > > > >
> > > > > $n_i$ 是奇数，所以右边的不是整数
> > > >
> > > > 则 $m_i\ge k$ 
> > >
> > > 则
> > > $$
> > > o(G-S)=t\le \frac{1}{k}\sum_{i=1}^t m_i\le \frac{1}{k}\sum_{u\in S}d_G(u)=|S|
> > > $$
> >
> > 故由 Tutte 定理知 $G$ 有完美匹配

**推论 5.1.2.2** $2$ 边连通 $3$ 正则图有完美匹配

> **证明** 
>
> 因为 $G$ 是 $3$ 正则图，所以由推论 1.3.2 知 $G$ 是偶阶
>
> 由推论 5.1.2.1 知该结论成立

**推论 5.1.2.3** 完全图 $K_{2n}$ 有 $(2n-1)$ 个互不相交的完美匹配

> **示例** 
>
> $K_6$ 的 $5$ 个互不相交的完美匹配
>
> ![image-20191203111348518](assets/image-20191203111348518.jpg)

### 5.1.3 Konig 定理

