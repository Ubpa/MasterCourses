# HW03 双边法向滤波

> 庄涛
>
> SA19001074

## 1. 问题描述

对法向进行双边滤波，然后根据法向恢复出原网格

## 2. 算法原理

> bilateral normal filtering
>
> ref: Bilateral Normal Filtering for Mesh Denoising

$$
\mathbf{n}(f_i)\leftarrow \frac{1}{K_\mathbf{p}}\sum_{f_j\in f_i}A_jW_s(\|\mathbf{c}_i-\mathbf{c}_j\|)W_r(\|\mathbf{n}(f_i)-\mathbf{n}(f_j)\|)\mathbf{n}(f_j)
$$

- $f_i$：三角形面 $i$ 
- $\mathbf{c}_i$：面 $i$ 的中心
- $\Omega(f_i)$：$f_i$ 的邻面
- $W_s$：空间相似函数
- $W_r$：法向相似函数
- $A_j$：$f_i$ 面积

局部和迭代策略

- 法向更新

  - 公式 $\boldsymbol{n}_{i}^{t+1} \leftarrow \frac{1}{K_{p}} \sum_{f_{j} \in \Omega\left(f_{i}\right)} A_{j} W_{s} W_{r} \cdot \boldsymbol{n}_{j}^{t}$ 
  - 范化
  - 多次迭代，将 1-ring 扩大为 k-ring
  - 迭代次数由用户控制

- 顶点更新
  
  -  $\left\{\begin{array}{l}
    \boldsymbol{n}_{f}^{T} \cdot\left(\boldsymbol{x}_{j}-\boldsymbol{x}_{i}\right)=0 \\
    \boldsymbol{n}_{f}^{T} \cdot\left(\boldsymbol{x}_{k}-\boldsymbol{x}_{j}\right)=0 \\
  \boldsymbol{n}_{f}^{T} \cdot\left(\boldsymbol{x}_{i}-\boldsymbol{x}_{k}\right)=0
    \end{array}\right.$ 
  - 能量 $E=\sum_{f_{k}} \sum_{i, j \in f_{k}}\left(\boldsymbol{n}_{k}^{\top} \cdot\left(\boldsymbol{x}_{j}-\boldsymbol{x}_{i}\right)\right)^{2}$ 
  - 固定其他点，更新一个点（Gauss-Seidel 迭代）
  
    $\boldsymbol{x}_{i}^{n e w}=\boldsymbol{x}_{i}+\frac{1}{N_{i}} \sum_{f_{j} \in \Omega(i)} \boldsymbol{n}_{j} \cdot\left(\boldsymbol{n}_{j}^{T} \cdot\left(\boldsymbol{c}_{j}-\boldsymbol{x}_{i}\right)\right)$ 

## 3. 实现步骤

- [x] 给网格添加噪声

- [x] 法向更新

  - [x] 计算各面法向 $\mathbf{n}_j$，面积，中点
- [x] 计算 $\sigma_c$（邻接面中心距离均值），取 $\sigma_s=0.4$ 
  - [x] 更新法向（迭代 10 次）
  
- [x] 顶点更新（Gauss–Seidel  迭代 10 次）

- [x] 渲染（原网格，噪声网格，去噪网格）

## 4. 测试结果

![image-20200626150019249](assets/README/image-20200626150019249.png)

左边为原网格，中间为加了噪声的网格，右边为去噪后的网格

可以看到，去噪效果良好，但在耳朵处恢复的不大好

