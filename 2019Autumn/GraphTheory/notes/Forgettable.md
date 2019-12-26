**Ramsey Number** 

$R(r,b)$ 个人必有 $r$ 个相识或 $b$ 个人不相识
$$
R(3,3) = 6\\
R(n,2) = n\\
R(n,m) \le R(n-1,m) + R(n,m-1)\\
R(n,m) = R(m,n)
$$
对于第三条，如果 $R(n-1,m),R(n,m-1)$ 是偶数，则
$$
R(n,m) \le R(n-1,m) + R(n,m-1)-1
$$

---

- $\text{ex}(n,K_{r+1})=e(T_r(n))$ 
- $\text{ex}(n,K_{1,k+1})\le\frac{kn}{2}$ 
- $\text{ex}(n,P_{k+1})=\text{ex}(n,T_{k+1})=\frac{(k-1)n}{2}-\frac{r(k-r)}{2}\le\frac{(k-1)n}{2}$ 
- $\text{ex}(n,C_{\ge k+1})\le\frac{k(n-1)}{2}$ 

---

**定理 5.2** $n$ 阶（$n\ge 3$）连通图 $G$ 任意两非邻接点 $x$ 和 $y$ 有 $d(x)+d(y)\ge k$，若 $k=n$，则 G 是**哈密顿图**，若 $k<n$ 则 G 有长至少为 k 的路和长至少为 $\frac{k}{2}+1$ 的圈

**命题 5.8** $V(G)=\{x_1,x_2,\dots,x_n\}$ 且 $d_G(x_1)\le d_G(x_2)\le \dots\le d_G(x_n)$，若 $d_G(x_k)\ge k\ (k=1,\dots,n-d_G(x_n)-1)$，则 G 连通

**命题 5.9** 若 $n$ 阶有向图 $D$ 满足 $|A(D)|>(n-1)^2$，则 $D$ 强连通

---

**定理 1.5.1** $n\ge3$ 的强连通竞赛图是点泛圈的

---

**命题 7.2** $\Delta(G)\le\Delta$ 和 $\text{rad}(G)=k$，则
$$
|V(G)|<\frac{\Delta}{\Delta - 2}(\Delta-1)^k
$$

---

**定理 1.7.2** （Ore 条件）$n (n\ge 3)$ 阶图 $G$，若任何不相邻的 $x$ 和 $y$ 有 $d_G(x)+d_G(y)\ge n$，则 $G$ 是 Hamilton 图

**推论 1.7.2** （Dirac 条件）n 阶简单图 G，若 $\delta(G)\ge\frac{n}{2}$，$n\ge 3$，则 G 是 Hamilton 图

**定理 10.1** n 阶强连通有向图 D，若 $\delta^0(D) = \min\{\delta^+(D),\delta^-(D)\}\ge\frac{n}{2}$，则 D 是 Hamilton 图

**定理 10.2** n 阶强连通有向图 D，任何不相邻顶点 x 和 y 均有 $d_D(x)+d_D(y)\ge 2n -1$，则 D 是 Hamilton 图

**推论 1.7.3.4** 每个强连通竞赛图都是 Hamilton 图

**推论 1.7.3.6** 任何竞赛图含 Hamilton 路

---

**命题 12.1** 设 D 是强连通有向图，如果 $n\ge 2$，最大度 $\Delta=\max\{\Delta^+,\Delta^-\}\ge 1$，那么
$$
d ( D ) \geqslant \left\{ \begin{array} { l l } { n - 1 , } & { \Delta = 1 } \\ { \left\lceil \log _ { \Delta } ( n ( \Delta - 1 ) + 1 ) \right\rceil - 1 , } & { \Delta \geqslant 2 } \end{array} \right.
$$
**命题 12.2** 设 G 是连通的无向图，如果它的阶 $n\ge 3$，最大度 $\Delta \ge 2$，那么
$$
d ( G ) \geqslant \left\{ \begin{array} { l l } { \left\lfloor \frac { 1 } { 2 } n \right\rfloor , } & { \Delta = 2 } \\ {\left\lceil \log _ { ( \Delta - 1 ) } \frac { n ( \Delta - 2 ) + 2 } { \Delta } \right\rceil , } & { \Delta \geqslant 3 } \end{array} \right.
$$
**命题 12.3** n 阶连通无向图 G，最小度 $\delta$，则
$$
d(G)\le\frac{3n}{\delta+1}
$$
**命题 12.4** n 阶连通无向图 G，直径为 d，则
$$
e(G)\le d+\frac{1}{2}(n-d+4)(n-d-1)
$$

---

![image-20191227031223870](assets/image-20191227031223870.png)

---

**定理 5.1.1**（Hall 定理）设 $G$ 是 $2$ 部划分为 $\{X,Y\}$ 的 $2$ 部分图，则：$G$ 有饱和 $X$ 的匹配 $\Leftrightarrow$ 
$$
|S|\le |N_G(S)|\quad \forall S\subseteq X
$$
称为 **Hall 条件** 

**推论 5.1.1.2** 设 $G$ 是 $k(>0)$ 正则 $2$ 部图，则 $G$ 有完美匹配

**推论 5.1.1.3** 设 $G$ 是 $2$ 部划分为 $\{X,Y\}$ 的简单 $2$ 部图，而且 $|X|=|Y|=n$。若 $\delta(G)\ge \frac{n}{2}$，则 $G$ 有完美匹配

**定理 5.1.2**（Tutte 定理）$G$ 有完美匹配 $\Leftrightarrow$ $o(G-S)\le |S|\quad \forall S \subset V(G)$，称为 **Tutte 条件**，其中 $o(G-S)$ 是 $G-S$ 的奇阶连通分支数目

**推论 5.1.2.1** 偶阶 $(k-1)$ 边连通 $k(\ge 1)$ 正则图有完美匹配

---

**定理 6.1.2**（Brooks 定理）设 $G$ 是连通简单图，并且 $G$ 既不是奇圈又不是完全图，则 $\chi(G)\le \Delta(G)$ 

**定理 6.2**（Vizing 定理）若 $G$ 是非空简单图，则 $\Delta(G)\le \chi^\prime(G)\le \Delta(G)+1$ 

