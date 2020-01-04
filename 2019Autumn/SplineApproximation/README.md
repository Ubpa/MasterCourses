# 样条函数与逼近论

## 笔记

- [基础](notes/basic.md) 
- [01. 赋范线性空间中的逼近问题引论](notes/01_Introduction.md) 
- [02. 一致逼近](notes/02_UniformApprox.md) 
- [03. 线性插值](notes/03_LinearInterpolation.md) 
- [04. 多项式的性质和平滑模](notes/04_Polynomial.md) 
- [05. 最佳逼近的定量理论](notes/05_Quantify.md) 
- [06. 最小平方逼近](notes/06_MinSquare.md) 
- [08. 多项式样条的基本空间](notes/08_PolynomialSpline.md) 
- [09. B 样条及其性质](notes/09_BSpline.md) 
- [10. 样条函数的计算](notes/10_CalSpline.md) 
- [11. 对偶基和样条的零点](notes/11_ReciprocalZero.md) 
- [12. 样条的插值与逼近](notes/12_SplineFit.md) 

## 作业

- 0：[0_0.md](homeworks/0_0.md)，[0_1.md](homeworks/0_1.md) 
- [1.md](homeworks/1.md) 
- [2.md](homeworks/2.md) 
- 3：[3_0.md](homeworks/3_0.md)，[3_1.md](homeworks/3_1.md) 
- 4：[4_0.md](homeworks/4_0.md)，[4_1.md](homeworks/4_1.md) 
- 5：[5_0.md](homeworks/5_0.md)，[5_1.md](homeworks/5_1.md) 
- 6：[6_0.md](notes/6_0.md)，[6_1.md](notes/6_1.md) 

## 考点

- 1.逼近
  - 最佳逼近存在性和唯一性的条件（定理 1.5，$L^p$ 是匀凸空间）
  - 表征定理
- 2.一致逼近
  - 最佳一致逼近（正线性算子 Bohman-Korovkin 定理）
  - 最佳逼近表征定理
  - Haar 空间及其逼近（交错定理）
  - Haar 空间的等价表达
- 3.线性插值
  - 线性插值问题的正确性
  - 双正交化，插值解在双正交化后的基下的表达
  - 插值节点对算子范数的影响（等距，Tchebycheff点）
  - $\overset{\circ}{\mathcal{C}}\to\overset{\circ}{\mathcal{P}_n}$ 的投影，$\mathcal{C}\to\mathcal{P}_n$ 的线性投影算子的下界
- 4.多项式
  - Bernstein 不等式
  - Markov 不等式
  - 连续模性质
    - $\omega(f,\lambda h)\le (\lambda+1)\omega(f,h)$ 
    - $f\in \text{Lip}_M\alpha \Leftrightarrow \omega(h)\le Mh^\alpha$ 
  - 平滑模性质
    - $\omega_r(f.h)\le 2^j\omega_{r-j}(f,h)$ 
    - $\omega(f,\lambda h)\le (\lambda+1)^r\omega_r(f,h)$ 
    - $\omega_r(f,h)\le h^j\omega_{r-j}(D^{j}f,h)$ 
- 5.最佳逼近定量理论
  - Jackson-Zygmund 定理、Jackson-Stechkin 定理
  - Bernstein 逆定理及推论
  - 代数多项式的点态逼近逆定理
- 6.最小平方逼近
  - 最佳逼近的表征
  - Gram 定理
  - 正交多项式性质
- 8.样条空间
  - 样条空间的维数和截断幂基函数
- 9.B样条
  - 差商及性质
  - B 样条及性质：支集、求导公式、规范 B 样条的单位剖分性质
  - Marden 恒等式
  - 差商的 Peano（积分）表示
  - 等距节点 B 样条（卷积性质）
- 10.样条函数的计算
  - de Boor 算法
  - 开花：用于样条计算
- 11.对偶基和样条零点
  - 对偶基的构造方法：点泛函、积分形式
  - 零点的 Budan-Fourier 定理：多项式、样条
- 12.样条的插值与逼近
  - T 系统与弱 T 系统
  - Schoenberg-Whitney 定理
  - 求最好逼近阶的局部逼近格式（算 $\mu_{i}g$）

