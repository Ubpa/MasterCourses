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

定义 $G$ 的点色数（简称色数 chromatic number）为

