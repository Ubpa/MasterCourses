# 2. 树与图空间

## 2.1 树与支撑树

### 定义

不含圈的图称为林 forest，亦称无圈图 acyclic graph

连通的无圈图称为树 tree

>示例
>
>![1571202892355](assets/1571202892355.png)
>
>(a) 是林，(b) 是树，(c) 是根在 $x$ 的外向树

**定理 2.1.1** 设 G 是简单图，则下列结论等价

- G 是树
- G 中任何两不同顶点恰有一条路所连接
- G 连通且 $\forall e\in E(G)$，有 $\omega(G-e)=2$ 
- G 不含圈，且 G 中任意不相邻顶点 x 和 y，$G+xy$ 含圈

**定理 2.1.3** G 是 n 阶树 $\Leftrightarrow$ G 连通且 $e(G)=n-1$ 

**推论 2.1.3** G 是 n 阶林 $\Leftrightarrow$ $e(G)= n-\omega(G)$ 

**推论 2.1.3(1)** 无孤立点的林至少有 $2\omega$ 个 1 度点，特别的，非平凡树至少有两个一度点（称为树的叶点，和叶点相邻的点称为支撑点）

**定理 1**（Bondy's Theorem）设 $\mathcal{A}=\{A_1,A_2,\dots,A_n\}$ 是 $X=\{1,2,\dots,n\}$ 的 n 个不同子集构成的子集族，则 $\exist x \in X$ 使得 $A_1\backslash \{x\},A_2\backslash\{x\},\dots,A_n\backslash \{x\}$ 互不相同。

### 支撑林与支撑树

F 是 D 的支撑子图，并且 $\omega(F)=\omega(D)$。若 F 是林，则称 F 为 D 的支撑林 spanning forest。

若 F 是树，称 F 为 D 的支撑树 spanning tree。

**定理 2.1.4** 每个连通图都含支撑树

**推论 2.1.4** 每个图 G 都含支撑林或者支撑树，且 $e(G)\ge |V(G)|-\omega(G)$。

**定理 2.1.5** 设 F 是 G 的支撑林，若 $\exist e\in E(G)\backslash E(F)$，则 $F+e$ 含有且仅含有一个圈（称为 G 的关于支撑林 F 的基本圈 fundamental cycle）。

**推论 2.1.5** n 阶图 G 中恰含 $e(G)-n+\omega$ 条不同的基本圈。$e(G)-n+\omega$ 称为 G 的圈秩 cycle rank，亦称为 Betti 数。

### 余树与边割集

设 H 是 G 的子图，则 $G-E(H)$ 称为 H 在 G 中的余图 cograph，记为 $\bar{H}(G)$。

若 F 是 G 的支撑林（或树），则 $\bar{H}(K)$。

若 F 是 G 的支撑林（或树），则 $\bar{F}(g)$ 称为 G 的余林（或余树）（coforest 或 cotree）

> 在不至于引起混淆的情况下，简记 $\bar{F}(G)$ 为 $\bar{F}$，简记 $\bar{T}(G)$ 为 $\bar{T}$。有时也用 $\bar{F}$ （或 $\bar{T}$）替代 $E(\bar{F})$（或 $E(\bar{T})$）

非空子集 $S\subset V(G)$，则 $B\triangleq[S,\bar{S}]$ 称为 G 的边割集（edge-cut set），若 B 的任何非空真子集都不是边割集，则称 B 为极小边割集 minimal edge-cut set，亦称为键 bond。

边数为 1 的边割集即为割边，亦称为桥 bridge，是键。

若 B 是极小边割集，则 $\omega(G-B)=\omega(G)+1$。

**定理 2.1.6** 设 F 是非空图 G 的支撑林，$e\in E(F)$，则

- $\bar{F}$ 不含键
- $\bar{F}+e$ 含有且仅有一个键（称为 G 关于 F 的基本键）

**推论 2.1.6** G 中恰含 $|V(G)|-\omega(G)$ 个不同的基本键

