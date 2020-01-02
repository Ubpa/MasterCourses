# 3. 平图

## 3.1 平图与 Euler 公式

如果图 $G$ 能画在曲面 $S$ 上使得边仅在端点处相交，则称 $G$ **可嵌入曲面**（embeddable in the surface）$S$，$G$ 在 $S$ 上的这种画法 $\widetilde{G}$ 称为 $G$ 在 $S$ 上的**表示** representation

**定理 3.1.1** 图 $G$ 可嵌入球面 $S$ $\Leftrightarrow$ $G$ 可嵌入平面 $P$ 

> **证明** 
>
> 球极平面射影
>
> ![image-20191104162554477](assets/image-20191104162554477.jpg)

若 $G$ 可嵌入平面，则称为**平面图** planar graph，否则称为**非平面图** non-planar graph

$G$ 的平面表示用 $\widetilde{G}$ 表示，可看成同构于 $G$ 的图，$\widetilde{G}$ 称为**平图** plane graph

> **示例** 
>
> ![image-20191104162902511](assets/image-20191104162902511.jpg)

直观上 $\widetilde{G}$ 把平面 $P$ 划分成若干个连通区域，称为 $G$ 的**面** face，有且恰有一个面含 $\infty$ 点，称为**外部面** exterior face，否则称为**内部面** interior face

$\forall x \in G$，$\exist \widetilde{G}$，$x$ 在 $\widetilde{G}$ 外部面的边界上

> 将 $x$ 所在面旋转到包含球的上顶点，然后球极映射

$F(G)$ 是 $G$ 的面集，$\phi(G)=|F(G)|$ 是 $G$ 的面数

$\phi(G)\ge 1$，且 $\phi(G)$ $\Leftrightarrow$ $G$ 是林，$\phi(G)\ge 2$ $\Leftrightarrow$ $G$ 中含回

包围面 $f$ 的所有边构成的闭链称为面 $f$ 的**边界** boundary，用 $B_G(f)$ 表示，$B_G(f)$ 中边的数目记为 $d_G(f)$（割边计两次），称为**面 f 的度** degree of a face

内部面边界是一条闭链，外部面边界是 $\omega(G)$ 条点不交闭链

**定理 3.1.2** 对平图 $G$，有 
$$
\sum_{f\in F(G)}d_G(f)=2e(G)
$$
**Lemma 1** 设 $G$ 是连通平图，$e\in E(G)$ 

(i) 若 $e$ 包含在 $G$ 的某圈 $C$ 中，则 $e$ 恰落在图 $G$ 的两个面的边界上

(ii) 若 $e$ 是 $G$ 的割边，则 $e$ 恰落在图 $G$ 的一个面的边界上

**定理 3.1.3**（Euler 公式）$G$ 是连通平图，则
$$
n+\phi-m=2
$$
> **证明** 
>
> 由引理 1 可得 $\phi=\phi(T)+e(\overline{T})=m-n+2$ 

**推论 3.1.3.1** 设 $G$ 是平图，则 $n+\phi-m=1+\omega$ 

> **证明** 
>
> 由引理 1 可得 $\phi=\phi(T)+e(\overline{T})=m-n+1+\omega$ 

**推论 3.1.3.2** 平面图 $G$ 的所有平面表示 $\widetilde{G}$ 都有相同的面数

**推论 3.1.3.3** 设 $G$ 是 $n(\ge 3)$ 阶简单 2 部连通平面图，则 $m\le 2n-4$ 

> **证明** 
>
> 2 部图不含奇圈，则 $\forall f \in F(G),d_{\widetilde{G}}(f)\ge 4$，则
> $$
> 4\phi \le \sum_{f\in F(G)}d_{\widetilde{G}}(f)=2m
> $$
> 即 $m\ge 2\phi$ 
>
> 由 **Euler 公式** 可得 $m\le 2n-4$ 

**推论 3.1.3.4** $K_{3,3}$ 是非平面图

$\forall x,y \in V(G),xy \notin E(G)$，有 $G+xy$ 是非平面图，则称 $G$ 为**极大平面图** maximal planar graph

任何 $n(\ge 3)$ 阶极大平面图 $G$ 的任何平面表示 $\widetilde{G}$ 的每个面（包括外部面）都是三角形

极大平面图的平面表示称为**三角剖分平图** triangulation of a plane graph，简称**三角剖分图** triangulation

**推论 3.1.4.1** 简单平面图有 $m\le 3n-6$ 

**推论 3.1.4.2** 设 $G$ 是简单平面图，则 $\delta\le 5$ 

> **证明** 
> $$
> \delta n \le \sum_{x\in V(G)}d_G(x)=2m\le2(3n-6)
> $$

**推论 3.1.4.3** $K_5$ 是非平面图

**定理 3.1.5** 简单平面图 $G$ 有平面表示 $\widetilde{G}$ 使其中每条边都是直线段

## 3.2 Kuratowski 定理

设 $e\in E(G)$ 且 $e=xy$，**边 e 的细分** edge subdivision 是指从 $G$ 中删去 $e$ 并用一条与 $G$ 内部点不交的长为 $2$ 的路连接 $x$ 和 $y$ 

图 $G$ 的**细分图** subdivision of a graph 是指把 $G$ 的边进行一系列细分而得到的图

> **示例** 
>
> ![image-20191104170405819](assets/image-20191104170405819.jpg)

设 $H$ 是 $G$ 的子图，在 $E(G)\backslash E(H)$ 上定义关系 $\sim$ 如下：$e_1\sim e_2 \Leftrightarrow$ 在 $G-E(H)$ 中存在一条链 $W$ 使得

- $W$ 的首位分别是 $e_1$ 和 $e_2$ 
- $W$ 和 $H$ 是内点不交的

这是 $E(G)\backslash E(H)$ 上的等价关系，一个等价类导出的 $G-E(H)$ 中的子图称为一个 **G 的 H 分支**。可知分支 $B$ 连通，$V(B)$ 没有 $H$ 的内部点，$E(B)\cap E(H)=\empty$。记 $V_G(B,H)=V(B)\cap V(H)$，并称 $V_G(B,H)$ 为 $B$ 和 $H$ 在 $G$ 中的**接触点集** 

> **示例** 
>
> ![image-20191226124457490](assets/image-20191226124457490.png)

**定理 3.2**（Kuratowski 定理） 图 $G$ 是平面图 $\Leftrightarrow$ $G$ 不含 $K_5$ 或 $K_{3,3}$ 的细分图

## 3.3 对偶图

设 $G$ 是平图，$F(G)=\{f_1,\dots,f_{\phi}\}$。定义 $G^*$ 为：$G$ 中每个面 $f_i$ 都和 $G_*$ 中一个顶点 $f_i^*$ 对应，即 $V(G^*)=\{f_1^*,\dots,f_\phi^*\}$，$G$ 中每条边 $e$ 都和 $G^*$ 中一条边 $e^*$ 对应，即 $E(G^*)=\{e^*|e\in E(G)\}$ 

 $f_i^*$ 和 $f_j^*$ 有边 $e^*$ 相连 $\Leftrightarrow$ $G$ 中面 $f_i$ 和 $f_j$ 有公共边界 $e$ 

$G^*$ 称为 $G$ 的**几何对偶图** geometric dual graph

> **示例** 
>
> ![image-20191105170646921](assets/image-20191105170646921.jpg)

平图 $G$ 的几何对偶图 $G^*$ 仍是平图

同构的平图可以有不同构的几何对偶图，因此几何对偶图的概念仅对平图有意义，不能推广到平面图上去

> **示例** 
>
> ![image-20191105170755951](assets/image-20191105170755951.jpg)

由定义可知 $n(G^*)=\phi(G)$，$d_{G^*}(f^*)=d_G(f)$，$e(G)=e(G^*)$ 

**定理 3.3.1** 设 $G^*$ 是平图 $G$ 的几何对偶图，$B\subseteq E(G)$，$B^*=\{e^*\in E(G^*)|e\in B\}$，则

- $C$ 是 $G$ 的圈 $\Leftrightarrow$ $C^*$ 是 $G^*$ 的键
- $B$ 是 $G$ 的键 $\Leftrightarrow$ $G^*[B^*]$ 是 $G^*$ 的圈

**推论 3.3.3.1** 设 $T$ 是连通平图 $G$ 的支撑树，$E^*=\{e^*\in E(G^*)|e\in E(\overline{T})\}$，则 $T^*=G^*[E^*]$ 是 $G^*$ 的支撑树

> **证明** 
>
> - 当 $\phi(G)=1$ 时
>
> > $G^*$ 和 $T^*$ 是平凡图，成立
>
> - 当 $\phi(G)\ge 2$ 时
>
> > $G$ 中每个面都含 $E(\overline{T})$ 中的边，则 $G^*$ 每个顶点都与 $E^*$ 中边关联，即 $T^*$ 是 $G^*$ 的支撑子图
>
> 若 $T^*$ 含 $G^*$ 的圈，则 $E(\overline{T})$ 含 $G$ 的键，矛盾于 **定理 2.1.6**，则 $T^*$ 不含 $G^*$ 的圈
>
> 故 $e(T^*)=e(\overline{T})=e(G)-n(G)+1=\phi(G)-1=n(G^*)-1$，由 **定理 2.2.3** 知 $T^*$ 是 $G^*$ 的支撑树

**推论 3.3.3.2** 设 $G$ 是连通平图，则
$$
\dim \mathcal{C}(G^*) = \dim \mathcal{B}(G)\\
\dim \mathcal{B}(G^*) = \dim \mathcal{C}(G)
$$

## 3.4 正多面体

每个凸多面体对应一个平图

设 $P$ 是凸多面体，以 $P$ 的顶点为顶点，以 $P$ 的棱为边而得到的平图 $G(P)$ 称为对应于 $P$ 的平图

> **示例** 
>
> 五个正多面体（四、六、八、十二、而是）
>
> ![image-20191105175950781](assets/image-20191105175950781.jpg)

$G(P)$ 是连通的，且 $\delta(G)\ge 3$，$P$ 的面就是 $G(P)$ 的面，每条边在两个面边界上

Euler 凸多面体公式
$$
V-E+F=2
$$
用 $V_n$ 表示 $n$ 度点数目，$F_n$ 表示 $n$ 度面数目，于是有
$$
2E=\sum_{n\ge 3} n V_n= \sum_{n\ge 3}nF_n
$$
**定理 3.4.1** 每个凸多面体中至少有一个 $n$ 度面，其中 $3\le n \le 5$ 

**定理 3.4.2** 仅有五个正多面体

