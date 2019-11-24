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

**推论 5.1.1.1**（婚姻定理）$2$ 部划分为 $\{X,Y\}$ 的 $2$ 部图 $G$ 有完美匹配 $\Leftrightarrow$ $|X|=|Y|$，并且对 $X$（或 $Y$）满足 Hall 条件

**推论 5.1.1.2** 设 $G$ 是 $k(>0)$ 正则 $2$ 部图，则 $G$ 有完美匹配

**推论 5.1.1.3** 设 $G$ 是 $2$ 部划分为 $\{X,Y\}$ 的简单 $2$ 部图，而且 $|X|=|Y|=n$。若 $\delta(G)\ge \frac{n}{2}$，则 $G$ 有完美匹配

### 5.1.2 一般图有完美匹配条件 - Tutte 定理

**定理 5.1.2**（Tutte 定理）$G$ 有完美匹配 $\Leftrightarrow$ $o(G-S)\le |S|\quad \forall S \subset V(G)$，称为 Tutte 条件，其中 $o(G-S)$ 是 $G-S$ 的奇阶连通分支数目

### 5.1.3 Konig 定理

