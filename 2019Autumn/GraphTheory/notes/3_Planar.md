# 3. 平图

## 3.1 平图与 Euler 公式

如果图 $D$ 能画在曲面 $S$ 上使得边仅在端点处相交，则称 $D$ **可嵌入**曲面（embeddable in the surface）$S$，$D$ 在 $S$ 上的这种画法 $\widetilde{D}$ 称为 $D$ 在 $S$ 上的**表示** representation。

**定理 3.1.1** 图 $G$ 可嵌入球面 $S$ $\Leftrightarrow$ $G$ 可嵌入平面 $P$ 

> 球极平面射影
>
> ![image-20191104162554477](assets/image-20191104162554477.jpg)

若 $G$ 可嵌入平面，则称为**平面图** planar graph，否则称为**非平面图** non-planar graph

$G$ 的平面表示用 $\widetilde{G}$ 表示，可看成同构于 $G$ 的图，$\widetilde{G}$ 称为**平图** plane graph

> 示例
>
> ![image-20191104162902511](assets/image-20191104162902511.jpg)

直观上 $\widetilde{G}$ 把平面 $P$ 划分成若干个连通区域，称为 $G$ 的面 face，有且恰有一个面含 $\infty$ 点，称为外部面 exterior face，否则称为内部面 interior face

$\forall x \in G$，$\exist \widetilde{G}$，$x$ 在 $\widetilde{G}$ 外部面的边界上

$F(G)$ 是 $G$ 的面集，$\phi(G)=\#F(G)$ 是 $G$ 的面数

$\phi(G)\ge 1$，且 $\phi(G)$ $\Leftrightarrow$ $G$ 是林，$\phi(G)\ge 2$ $\Leftrightarrow$ $G$ 中含回

包围面 $f$ 的所有边构成的闭链称为面 $f$ 的边界，用 $B_G(f)$ 表示，$B_G(f)$ 中边的数目记为 $d_G(f)$（割边计两次），称为面 $f$ 的度 degree of a face

内部面边界是一条闭链，外部面边界是 $\omega(G)$ 条点不交闭链

**定理 3.1.2** 对平图 $G$，有 
$$
\sum_{f\in F(G)}d_G(f)=2e(G)
$$
**定理 3.1.3**（Euler 公式）$G$ 是连通平图，则
$$
n+\phi-m=2
$$
**推论 3.1.3.1** 设 $G$ 是平图，则 $n+\phi-m=1+\omega$ 

**推论 3.1.3.2** 平面图 $G$ 的所有平面表示 $\widetilde{G}$ 都有相同的面数

**推论 3.1.3.3** 设 $G$ 是 $n(\ge 3)$ 阶简单 2 部连通平面图，则 $e(G)\le 2n-4$ 

> $\forall f \in F(G),d_{\widetilde{G}}(f)\ge 4$，结合 **定理 3.1.2** 和 **Euler 公式 ** 

**推论 3.1.3.4** $K_{3,3}$ 是非平面图

$\forall x,y \in V(G),xy \notin E(G)$，有 $G+xy$ 是非平面图，则称 $G$ 为极大平面图 maximal planar graph

任何 $n(\ge 3)$ 阶极大平面图 $G$ 的任何平面表示 $\widetilde{G}$ 的每个面（包括外部面）都是三角形

极大平面图的平面表示称为三角剖分平图 triangulation of a plane graph，简称三角剖分图 triangulation

**推论 3.1.4.1** 设 $G$ 是 $n(\ge3)$ 阶简单平面图，则 $e(G)\le 3n-6$ 

**推论 3.1.4.2** 设 $G$ 是简单平面图，则 $\delta\le 5$ 

**推论 3.1.4.3** $K_5$ 是非平面图

**定理 3.1.5** 简单平面图 $G$ 有平面表示 $\widetilde{G}$ 使其中每条边都是直线段

## 3.2 Kuratowski 定理

设 $e\in E(G)$ 且 $e=xy$，边 $e$ 的细分 edge subdivision 是指从 $G$ 中删去 $e$ 并用一条与 $G$ 内部点不交的长为 $2$ 的路连接 $x$ 和 $y$ 

图 $G$ 的细分图 subdivision of a graph 是指把 $G$ 的边进行一系列细分而得到的图

> 示例
>
> ![image-20191104170405819](assets/image-20191104170405819.jpg)

**定理 3.2**（Kuratowski 定理） 图 $G$ 是平面图 $\Leftrightarrow$ $G$ 不含 $K_5$ 或 $K_{3,3}$ 的细分图

