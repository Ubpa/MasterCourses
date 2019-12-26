# 1. 支撑树算法 

1. 任取 $x_0\in V(G)$，令 $V_0=\{x_0\}$，$T_0=\empty$，$k=0$ 
2. 取 $e_k\in [V_{k-1},\overline{V}_{k-1}]$，则 $\exist u \in V_{k-1}$，$x_k \in \overline{V}_{k-1}$ 使 $e_k=u x_k$，令 $V_k=V_{k-1}\cup \{x_k\}$，$T_k=T_{k-1}\cup\{e_k\}$ 
3. 若 $k<n-1$，则 $k\leftarrow k + 1$，转 2；若 $k=n-1$，停止，$T_{n-1}$ 即为支撑树

---

从一个点出发，然后不断找**截边**来延伸

# 2. Prim 算法（最小树）

1. 任取 $x_0\in V(G)$，令 $l(x_0) = 0$，$l(x)=\infty (x\neq x_0)$，$V_0=\{x_0\}$，$T_0=\empty$，且 $k=0$ 
2. 对 $\forall x \in N_G(x_{k-1})\cap \overline{V}_{k-1}$，$l(x)=\min\{\pmb{w}(x_{k-1}x),l(x)\}$ 
3. 取 $x_k = \mathop{\arg\min}_\limits{x\in \overline{V}_{k-1}} l(x)$，设 $e_k=u x_k$，$u\in V_{k-1}$ 满足 $\pmb{w}(e_k)=l(x_k)$，令 $V_k=V_{k-1}\cup\{x_k\}$，$T_k=T_{k-1}\cup{e_k}$ 
4. 若 $k=n-1$，则停止，$T_{k}$ 即为最小树；否则，$k\leftarrow k+1$，转 2

> 标号为截边权

---

从一个点出发，然后不断找**最小权截边**来延伸

# 3. Moore-Dijkstra 算法（最短路）

> 复杂度 $O(n^2)$ 

1. $l(x_0)=0$，$l(x)=\infty(x\neq x_0)$，$S_0=\{x_0\}$，$T_0=\empty$ 且 $k=0$ 

2. $\forall x\in N_D^+(x_k)\cap \overline{S_k}$，
   $$
   l(x)=\min\{l(x),l(x_k)+\pmb{w}(x_k,x)\}
   $$

3. $x_{k+1}=\mathop{\arg\min}_\limits{x\in \overline{S_k}}\{l(x)\}$ ，取 $x_j\in S_k(j\le k)$ 且 $(x_j,x_{k+1})\in E(D)$，令 $S_{k+1}=S_k\cup\{x_{k+1}\}$，$T_{k+1}=T_k \cup (x_j,x_{k+1})$ 

4. 若 $k=n-1$ 则停止，否则 $k\leftarrow k+1$，转 2

> 标号为距离估计，最小者准确

---

从一个点出发，然后不断找**最小距离估计截边**来延伸

# 4. 标号法（最大流）

1.任取 $N$ 中一个 $(x,y)$ 流 $\pmb{f}$（例如零流），并给 $x$ 以标号 $(-,\infty)$，并令 $L=\{x\}$ 

2.删去 $L$ 中最前面元素 $u$（“**先进先出**”原则，保证第 4 步的 $(x,y)$ 增广路是 $D$ 中**最短路**）

> (1) 若存在未被标号顶点 $z$，使得
>
> > (i) $a=(u,z)\in E(D)$，并且 $\pmb{f}(a)<\pmb{c}(a)$，则给 $z$ 以标号 $(u^+,\sigma(z))$；**或** 
> >
> > (ii) $a=(z,u)\in E(D)$，并且 $\pmb{f}(a)>0$，则给 $z$ 以标号 $(u^-,\sigma(z))$ 
> >
> > 其中 $\sigma(z)=\sigma_P(z)$，$P$ 为 $D$ 中 $\pmb{f}$ 非饱和的 $xz$ 路，将 $z$ 列入 $L$ 的后面
> >
> > > (i) $\sigma(z)=\min\{\sigma(u),\pmb{c}(a)-\pmb{f}(a)\}$ 
> > >
> > > (ii) $\sigma(z)=\min\{\sigma(u),f(a)\}$ 
>
> (2) 若不存在这样的 $z$ 使得 (i)，(ii) 成立且 $L=\empty$，则停止。$\pmb{f}$ 是最大流

3.若 $y$ 被标号，则进入第 $4$ 步；若 $y$ 未被标号，则转入第 2 步

4.已被标号的顶点构成 $D$ 中一条 $\pmb{f}$ 增广路 $P$。构造基于流 $\pmb{f}$ 的增广路 $P$ 的修正流 $\widetilde{\pmb{f}}$。除掉所有标号并以 $\widetilde{\pmb{f}}$ 替代 $\pmb{f}$ 转入第 1 步

---

不断以**队列**模式找**增广路**来修正流

# *5. Klein 算法（最小费用最大流）

从 $N$ 中任何一个 $(x,y)$ 最大流 $\pmb{f}$ 出发，检查每个 $\pmb{f}$ 增广圈。若所有 $\pmb{f}$ 增广圈的费用都是非负的，则 $\pmb{f}$ 就是所求的最小费用最大流。若存在 $\pmb{f}$ 增广圈 $C$ 使得 $\pmb{b}(C,\pmb{f})<0$，则用修正流 $\widetilde{\pmb{f}}$ 替代 $\pmb{f}$ 再重复上述过程。

1. 求 $N$ 中最大 $(x,y)$ 流 $\pmb{f}$ 
2. 构造 $D(\pmb{f})$ 
3. 求 $D(\pmb{f})$ 中的负圈

> - 若无负圈，则停止，此时 $\pmb{f}$ 是最小费用最大流
> - 若 $D(\pmb{f})$ 含负圈 $\overset{\leftarrow}{C}$，则 $C^+\cup C^-$ 是 $\pmb{f}$ 增广圈（其正向与 $\overset{\leftarrow}{C}$ 的方向一致），作修正流 $\widetilde{\pmb{f}}$，并用 $\widetilde{\pmb{f}}$ 代替 $\pmb{f}$ 转入第 1 步

# 6. Edmonds-Johnson 算法（邮路）

## 6.1 Euler 有向回

1.任取 $x_0\in V(D)$，求出根在 $x_0$ 的外向支撑树 $T$，并令 $P_0=x_0$ 

2.设有向迹 $P_i=x_ia_ix_{i-1}\dots a_2x_1a_1x_0$ 已确定。取 $a_{i+1}\in E(D)\backslash\{a_1,\dots,a_i\}$ 使

> (i) $a_{i+1}=(x_{i+1},x_i)$ 
>
> (ii) $a_{i+1}\notin E(T)$ 除非没有别的边可供选择

3.若第 2 步不能再执行时，则停止

> 注意，这里是反着找的

---

从外向树根倒走余树

## *6.2 非 Euler

1. 求 $X=\{x_i|\rho(x_i)>0\},Y=\{x_i|\rho(x_i)<0\}$，其中 $\rho(x)=d^-(x)-d^+(x)$ 
2. 构造 $D^\prime$ 和 $N=(D^\prime_{x_0y_0},\pmb{b},\pmb{c})$ 
3. 求 $N$ 中最小费用最大流
4. 构造 $D^*$ 
5. 求 $D^*$ 中 Euler 有向回，即 $(D,\pmb{w})$ 最优邮路

> **辅助图**求**最小费用最大流**来**补路**得 **Euler 图**再求**有向回**

# 7. 匈牙利算法（完美匹配）

1.任取 $G$ 的匹配 $M$。若 $M$ 饱和 $X$，则停止。若 $M$ 不能饱和 $X$，则取 $X$ 的 $M$ 非饱和点 $x$。令 $S=\{x\}$，$T=\empty$ 

2.若 $N(S)=T$，则停止，此时 $G$ 中无完美匹配；若 $N(S)\neq T$，则取 $y=N(s)\backslash T$ 

3.若 $y$ 是 $M$ 饱和的，则存在 $z\in X\backslash S$ 使 $yz\in M$。用 $S\cup \{z\}$ 替代 $S$，$T\cup\{y\}$ 替代 $T$，并转入第 2 步；若 $y$ 是 $M$ 非饱和的，则 $G$ 中存在以 $x$ 为起点且以 $y$ 为中点的 $M$ 增广路 $P$。用 $\hat{M}=M\Delta E(P)$ 替代 $M$ 并转入第 1 步

---

不断找**非饱到非饱**的增广路来修正匹配

# 8. Christofides 近似算法（货郎链）

1. 求 $(G,\pmb{w})$ 的加权距离矩阵 $\pmb{w}^\prime$，并构造 $(K_n,\pmb{w}^\prime)$ 
2. 求 $(K_n,\pmb{w}^\prime)$ 中最小树 $T$ 
3. 找出 $T$ 中奇度点集 $V^\prime$ 并求出 $G^\prime=K_n[V^\prime]$ 中最小权完美匹配 $M$ 
4. 在 $G^*=T\oplus M$ 中求 Euler 回 $C_0=(x,y,z,\dots,x)$ 
5. 从 $x$ 开始，沿 $C_0$ 一次删去 $C_0$ 中重复出现的顶点（最后一个 $x$ 除外）后，剩余的顶点（不改变他们在 $C_0$ 中的顺序）形成 $K_n$ 中 Hamilton 圈 $C$，$C$ 即为所求的近似最优圈

---

**最小树**和其**奇度点匹配**的并的**欧拉回**诱导出**哈圈** 

# 9. 点染色贪婪算法

1. 取图 $G$ 的有根支撑树，把图 $G$ 的顶点从最底层到根点按层标号 $x_1,\dots,x_n$，显然对任意 $x_i(1\le i<n)$，存在 $j>i$ 使得 $x_ix_j\in E(G)$ 
2. 给顶点按顺序用 $1,2,\dots$ 染色，使得每个顶点 $x_i$ 染尽可能小的颜色
3. 显然至多需要 $\Delta(G)+1$ 种颜色就可以给图 $G$ 一个正常染色，而且上界只有当 $G$ 为 $\Delta(G)$ 正则图时取到

> 最底层是指离树根最远的那层，最顶层是树根
>
> ---
>
> 对于第一类图
>
> $\exist z\in V(G),\exist x,y\in N_G(z),xy\notin E(G),\omega(G-\{x,y\})=1$ 
>
> > 若 $G$ 是 3-连通，则 $\forall z\in V(G),\exist x,y\in N_G(z),xy\notin E(G)$，有 $G-\{x,y\}$ 连通 
> >
> > 否则，存在 $z\in V(G)$，$G-z$ 不为 2 连通，再取非割点 $x,y\in N_G(z),xy\notin E(G)$，则 $G-\{x,y\}$ 连通
>
> 取 $z$ 为根的 $G-\{x,y\}$ 支撑树 $T$，标号 $x_1=x,x_2=y$，然后给 $T$ 顶点逐层标号，由贪婪算法第 2 步可得 $\Delta(G)$ 染色

---

树顶到树根**标号**，**按序**贪婪上色

$\{z,x,y\}$ 取法

