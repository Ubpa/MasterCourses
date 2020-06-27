# HW08 网格插值

> 庄涛
>
> SA19001074

## 1. 问题描述

用 ASAP 网格插值算法生成网格的变换序列

## 2. 算法原理

> **类似于 local/global ARAP 参数化算法** 
>
> - local：$L_t$ 通过 SVD 求得，而插值问题中，线性变换由插值而得
> - global：希望目标网格（参数化结果）对于原网格（分散的参数化网格）的各三角形 jacobian 矩阵接近一个线性变换，而插值问题中，原网格是相接的

起始网格 $P$ 和终止网格 $Q$ 拓扑相同，假设有 $N$ 个顶点，$M$ 个三角形

- 起始网格 $P$ 中，顶点集为 $\mathbf{p}=\{\mathbf{p}_i\}_{t=1}^T$，第 $m$ 个三角形为 $\mathbf{p}_m=(\mathbf{p}_m^0,\mathbf{p}_m^1,\mathbf{p}_m^2)\in\mathbb{R}^{2\times 3}$，面积为 $A_m$ 
- 终止网格 $Q$ 中，顶点集为 $\mathbf{q}=\{\mathbf{q}_i\}_{t=1}^T$ ，第 $m$ 个三角形为 $\mathbf{q}_m=(\mathbf{q}_m^0,\mathbf{q}_m^1,\mathbf{q}_m^2)\in\mathbb{R}^{2\times 3}$ 

可以求得变换关系 $L=\{L_m\}_{m=1}^M$ 
$$
\mathbf{q}_m=L_m\mathbf{p}_m+l_m
$$
其中 $L_m\in \mathbb{R}_{2,2}$ 是保形变换，$l_m\in\mathbb{R}^{2,3}$ 是变换的平移部分

$L_m$ 进行极分解（polar decomposition）可得 $L_m=U_m\Sigma_mV_m^\top=U_mV_m^\top V_m\Sigma_mV_m^\top=R_mS_m$ 

插值变换 $L(t)=\{L_m(t)\}_{m=1}^M$ 为
$$
L_m(t)=R_m(t)((1-t)I+tS)
$$

> $R_m(t)$ 为四元数插值

记 $t$ 时刻插值网格 $U$ 的顶点集为 $\mathbf{u}(t)=\{\mathbf{u}_i(t)\}_{t=1}^T$，第 $m$ 个三角形为 $\mathbf{u}_m$，满足
$$
\mathbf{u}(0)=\mathbf{p}\\
\mathbf{u}(1)=\mathbf{q}\\
\mathbf{u}_m(t)=J_m(t)\mathbf{p}_m+l_m(t)
$$
定义能量
$$
E_t=\sum_{m=1}^M\|J_m(t)-L_m(t)\|_F^2
$$

为了复用 HW5 的代码，这里简单将能量修改为
$$
E_t=\sum_{m=1}^MA_m\|J_m(t)-L_m(t)\|_F^2
$$
优化步骤类似于 local/global ARAP

## 3. 实现步骤

- [x] 求 $L$ 
- [x] 插值 $L(t)$ 
- [x] 求 $\mathbf{u}_t$ 
- [x] 渲染 $\mathbf{u}_t$ 

## 4. 测试结果

查看视频
