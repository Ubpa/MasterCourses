# 6. 染色理论

## 6.1 点染色

简单无向图的一个**点 k 染色** vertex k-coloring $\pi$ 是指用 k 种颜色 $1,\dots,k$ 给 $G$ 的顶点染色使得相邻顶点染不同颜色

$G$ 中点 k 染色 $\pi$ 是映射
$$
\pi:V(G)\to\{1,\dots,k\}
$$
使得对每个 $i(i=1,\dots,k)$，$\pi^{-1}(i)$ 是独立集或者空集

若令
$$
V_i=\pi^{-1}(i)=\{x\in V(G):\pi(x)=i\},\quad i=1,\dots,k
$$
则记
$$
\pi = (V_1,\dots,V_k)
$$
若 $G$ 中点存在 $k$ 染色，则称 $G$ 中**点 k 色可染** vertex k-colorable

> **示例** 
>
> ![image-20191213233510105](assets/image-20191213233510105.png)
>
> $C^5$ 和 Petersen 图点 3 色可染

定义 $G$ 的**点色数**（简称**色数** chromatic number）为
$$
\chi(G)=\min\{k|G中点 k 色可染\}
$$
设 $\chi(G)=k$，则称 $G$ 为 **k 色图** k-chromatic graph

$\chi(G)$ 是 $G$ 中点不交的独立集的最小数目，则
$$
\chi(G)\ge \frac{|V(G)|}{\alpha(G)}
$$
推论

- $\chi(G)=1\Leftrightarrow G\cong K_n^c$，其中 $K_n^c$ 是 n 阶空图
- $\chi(G)=2\Leftrightarrow$ $G$ 是非空 2 部图
- $\chi(G)=n\Leftrightarrow G\supseteq K_n$ 

设 $\chi(G)=k$，若 $\forall H\subset G,\chi(H)<k$，则称 $G$ 为**临界 k 色图** critical k-chromatic graph

推论

- $G$ 是临界 1 色图 $\Leftrightarrow$ $G \cong K_1$ 
- $G$ 是临界 2 色图 $\Leftrightarrow$ $G\cong K_2$ 
- $G$ 是临界 3 色图 $\Leftrightarrow$ $G$ 是奇圈
- 任何 $k$ 色图包含一个临界 $k$ 色子图

**定理 6.1.1** 设 $G$ 是临界 $k(\ge2)$ 色图，则 $\lambda(G)\ge k-1$ 

**推论 6.1.1.1** 设 $G$ 是临界 $k$ 色图，则 $\delta(G)\ge k-1$ 

> **证明** 
>
> 由 **Whitney 不等式**（定理 4.3.1）和 **定理 6.6.1** 可得
> $$
> \delta(G) \ge \lambda(G)\ge k-1
> $$

**推论 6.1.1.2** 对任何简单图 $G$，均有 $\chi(G)\le \Delta(G)+1$ 

> **证明** 
>
> 设 $\chi(G)=k$ 且 $H$ 是 $G$ 的临界 $k$ 色子图，由推论 6.1.1.1 有，$\delta(H)\ge k-1$，因此
> $$
> \Delta(G)\ge \Delta(H)\ge \delta(H)\ge k-1 = \chi(G)-1
> $$
> 即 $\chi(G)\le \Delta(G)+1$ 

**点染色贪婪算法 greedy algorithm** 

- 取图 $G$ 的有根支撑树，把图 $G$ 的顶点从最底层到根点按层标号 $x_1,\dots,x_n$，显然对任意 $x_i(1\le i<n)$，存在 $j>i$ 使得 $x_ix_j\in E(G)$ 
- 给顶点按顺序用 $1,2,\dots$ 染色，使得每个顶点 $x_i$ 染尽可能小的颜色
- 显然至多需要 $\Delta(G)+1$ 种颜色就可以给图 $G$ 一个正常染色，而且上界只有当 $G$ 为 $\Delta(G)$ 正则图时取到

> 最底层是指离树根最远的那层，最顶层是树根

**定理 6.1.2**（Brooks 定理）设 $G$ 是连通简单图，并且 $G$ 既不是奇圈又不是完全图，则 $\chi(G)\le \Delta(G)$ 

> **证明** 
>
> 不妨设 $G$ 是 $\Delta(G)\ge 3$ 的 2-（点）连通图
>
> > - 非$\Delta(G)$ 正则：由点染色贪婪算法知 $G$ 是 $\Delta(G)$ 色可染
> > - $\Delta(G)=1$：$G\cong K_2$ 
> > - $\Delta(G)=2$：偶圈，$\chi(G)=2=\Delta(G)$ 
> > - 含割点：在割点处把 $G$ 分成多个连通分支，各自使用点染色贪婪算法，然后拼起来可得 $G$ 的一个 $\Delta(G)$ 染色
>
> $\forall z\in V(G),\exist x,y\in V(G),xy\notin E(G),xz,yz\in E(G)$ 
>
> 断言：$\exist z\in V(G),\exist x,y\in V(G),xy\notin E(G),xz,yz\in E(G),\omega(G-\{x,y\})=1$ 
>
> > 若 $G$ 是 3-连通，则 $\forall z\in V(G),\exist x,y\in V(G),xy\notin E(G),xz,yz\in E(G),\omega(G-\{x,y\})=1$ 
> >
> > 否则，存在 $z\in V(G)$，$G-z$ 不为 2 连通，再取非割点 $x,y\in V(G),xy\notin E(G),xz,yz\in E(G)$，则 $G-\{x,y\}$ 连通
>
> 取 $z$ 为根的 $G-\{x,y\}$ 支撑树 $T$，标号 $x_1=x,x_2=y$，然后给 $T$ 顶点逐层标号，由贪婪算法可得 $\Delta(G)$ 染色
>
> > 删去 $xz,yz$ 则有 $\Delta(G)$ 染色，其中 $z$ 有两色可选，$x,y$ 同色，故可使 $z$ 选不同于 $x,y$ 的色并连接上 $xz$ 和 $yz$ 即得 $G$ 的 $\Delta(G)$ 染色
>
> ---
>
> **示例** 
>
> ![image-20191221172943557](assets/image-20191221172943557.png)
>
> 选取最上边的点为 $z$，左右两边分别为 $x,y$，进行标号再用贪婪算法即可
>
> ![image-20191221173049514](assets/image-20191221173049514.png)

**定理 6.1.3**（五色定理）对于每个平面图 $G$，均有 $\chi(G)\le 5$ 

> **证明** 
>
> 不妨设 $G$ 是临界 6 色图，由推论 3.1.4.2（平面图 $\delta(G)\le 5$）和推论 6.1.1.1（k-临界图 $\delta(G)\ge k-1$）知，$\delta(G)=5$ 
>
> $\exist u\in V(G),d_G(u)=5,N_G(u)=\{u_1,\dots,u_5\},\pi_6(u_i)\neq\pi_6(u_j)\ (i\neq j)$，设 $\pi=(V_1,\dots,V_5)$ 是 $G-u$ 中点的 5 染色，由于 $\chi(G)=6$，不妨设 $u_i\in V_i(i=1,\dots,5)$ 
>
> 令 $G_{i,j}=G[V_i\cup V_j]$ 
>
> 若存在 $i,j$ 使 $u_i,u_j$ 在 $G_{i,j}$ 中不连通，则将 $G_{i,j}$ 中含 $u_i$ 的分支中颜色 $i$ 与颜色 $j$ 对换得 $G-u$ 中点的另一个 5 染色 $\pi^\prime=(V_1^\prime,\dots,V_5^\prime)$，不妨设 $i=1$，则 $\pi^{\prime\prime}=(V_1^\prime\cup\{u\},V_2^\prime,\dots,V_5^\prime)$ 是 $G$ 中的 5 染色，矛盾
>
> 故 $G_{i,j}$ 存在 $u_i,u_j$ 路 $P_{ij}$，考虑圈 $C=uu_2+P_{24}+u_4u$，则路 $P_{13}$ 必经过 $P_{24}$ 中的点，但不可能，因为 $P_{13}$ 上点是颜色 1 或 3，而 $P_{24}$ 上点是颜色 2 或 4，矛盾
>
> 故 $\chi(G)\le 5$ 

**Theorem 1** 设 $D$ 是有向图，则 $D$ 中存在长 $\ge \chi(D) -1$ 的有向路

**Theorem 2** 设 $D$ 是简单有向图，$\chi(D)>mn$，并设 $\pmb{f}\in \mathcal{V}(D)$，则 $D$ 中存在有向路 $(x_0,\dots,x_m)$ 使得 $\pmb{f}(x_0)\le \dots \le \pmb{f}(x_m)$ 或存在有向路 $(y_0,\dots,y_n)$ 使得 $\pmb{f}(y_0)>\dots>\pmb{f}(y_n)$ 

**Theorem 3** 任意 $mn+1$ 个不同整数构成的数列中，或者包含 $m$ 项的增子序列，或者有 $n$ 项的减子序列

> **证明** 
>
> 设 $a_1,\dots,a_{mn+1}$ 是 $mn+1$ 个不同整数构成的序列
>
> 作简单有向图 $D=(V,E)$，其中
> $$
> V=(a_1,\dots,a_{mn+1}),\ (a_i,a_j)\in E(D)\Leftrightarrow a_i<a_j
> $$
> 则 $D$ 是 $mn+1$ 阶竞赛图，且 $\chi(D)=mn+1$ 
>
> 令 $\pmb{f}\in\mathcal{V}(D)$ 使得 $\pmb{f}(a_i)=a_i\ (i=1,\dots,mn+1)$，由 **Theorem 2** 知该命题成立

