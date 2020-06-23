[TOC]

# 01. Mesh

## 01.1 表示

### 01.1.1 点云

点云
$$
\mathcal{P}=\{\mathbf{p}_i,\dots,\mathbf{p}_{N_v}\}\\\mathbf{p}_i=\left(\begin{array}{c}x_i\\y_i\\z_i\end{array}\right)\in \mathbb{R}^3
$$
![image-20200623150455001](assets/01_Mesh/image-20200623150455001.png)

### 01.1.2 符号距离场

> signed distance field (SDF)

点 $\mathbf{x}$ 到区域 $\Omega$ 边界的距离
$$
f(\mathbf{x})=\left\{\begin{array}{l}
-d(\mathbf{x},\partial \Omega)&, \operatorname{if}\quad \mathbf{x}\in \Omega\\
d(\mathbf{x},\partial \Omega)&,\operatorname{if}\quad \mathbf{x}\in\Omega^c
\end{array}\right.
$$
![image-20200623150341344](assets/01_Mesh/image-20200623150341344.png)

### 01.1.3 截断符号距离场

> truncated signed distance field (TSDF)

范围 $[-1,1]$ 

![image-20200623145946860](assets/01_Mesh/image-20200623145946860.png)

### 01.1.4 隐式函数

> Implicit function

![image-20200623150053535](assets/01_Mesh/image-20200623150053535.png)

> **示例** 
>
> 球 $F(x,y,z) = x^2+y^2+z^2-r^2$ 

### 01.1.5 格

> grid

- 图像 image ![image-20200623150802961](assets/01_Mesh/image-20200623150802961.png)
- 体素 voxel ![image-20200623150814590](assets/01_Mesh/image-20200623150814590.png)
- 四边形网格 quad mesh ![image-20200623150823618](assets/01_Mesh/image-20200623150823618.png)
- 全六角网格 all-hex mesh ![image-20200623150833624](assets/01_Mesh/image-20200623150833624.png)

- 自适应网格——层次四/八叉树 adative grid - hierarchical quad-tree/octree![image-20200623151016213](assets/01_Mesh/image-20200623151016213.png)

> **扩展** 
>
> patch-based octree
>
> ![image-20200623151610385](../../Optimization/homeworks/final/sparse/image-20200623151610385.png)
>
> ref: Adaptive O-CNN: A Patch-based Deep Representation of 3D Shapes

### 01.1.6 网格

> mesh

#### 01.1.6.1 三角形网格

几何部分
$$
V=\{v_1,\dots,v_{N_v}\}
$$
拓扑部分
$$
F=\{f_1,\dots,f_{N_f}\}\\
E=\{e_1,\dots,e_{N_e}\}
$$
2-流形 2-manifold

- 非流形点 non-manifold vertex 是通过将两个曲面片夹在一起，从而使其与多个三角形的扇形连接

  ![image-20200623153515929](assets/01_Mesh/image-20200623153515929.png)

- 非流形边 non-manifold edge 连接超过 2 个面

  ![image-20200623153602644](assets/01_Mesh/image-20200623153602644.png)

**欧拉公式** 
$$
N_V-N_E+N_F=2(1-g)
$$
其中 $g$ 是亏格

> **示例** 
>
> ![image-20200623153807549](assets/01_Mesh/image-20200623153807549.png)

$N_F\approx 2N_V$，$N_E\approx 3N_V$ 

**重心坐标** 

TODO

#### 01.1.6.2 四面体网格

> tetrahedral Mesh

![image-20200623153955823](assets/01_Mesh/image-20200623153955823.png)

## 01.2 数据结构

半边

## 01.3 文件格式

obj

off

