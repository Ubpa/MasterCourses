# 02. Bezier Curves

## 2.1 曲线表示

隐式表达 $f(x,y)=0$ 的弊端

- 多个值对应同一个 x
- 未定义的导数 $\frac{\mathbf{d}y}{\mathbf{d}x}$ 
- 轴变换没有不变性

> 示例
>
> ![1570714620048](assets/1570714620048.png)

参数表示 $c(t)=(x(t),y(t))$ 

- 容易计算
- 参数 $t$ 能解释成时间
- 曲线能解释成移动例子的轨迹

## 2.2 De Casteljau 算法

### 2.2.1 算法描述

- 输入：$\pmb{b}_0,\pmb{b}_1,\dots,\pmb{b}_n \in \mathbb{R}^3$ 

- 输出：$\pmb{x}(t),t\in [0,1]$ 

- 几何构建 $\pmb{x}(t)$ 
  $$
  \begin{align}
  \pmb{b}_i^0(t)&=\pmb{b}_i,i=0,\dots,n\\
  \pmb{b}_i^r(t)&=(1-t)\pmb{b}_i^{r-1}(t)+t\pmb{b}_{i+1}^{r-1}(t), r=1,\dots,n,i=0,\dots,n-r\\
  \end{align}
  $$
- $\pmb{x}(t)=\pmb{b}_0^n(t)$

> 示例
>
> ![1570716274452](assets/1570716274452.png)

伪代码为

![1570716331031](assets/1570716331031.png)

### 2.2.2 性质

- 由 $\pmb{b}_0,\dots,\pmb{b}_n$ 构成的多边形称为 Bezier 多边形（控制多边形 control polygon）
- $\pmb{b}_i$ 是 Bezier 点（控制点 control point）
- 由 $\pmb{b}_0,\dots,\pmb{b}_n$ 和 De Casteljau 算法得到的曲线称为 Bezier 曲线
- De Casteljau 算法数值稳定（简单的凸组合 / 线性插值）
- 时间 $O(n^2)$，空间 $O(n)$ 
- $\pmb{x}(0)=\pmb{b}_0,\pmb{x}(1)=\pmb{b}_n$，其他点只逼近
- 凸包性：Bezier 曲线在 Bezier 多边形内部
- Variation diminishing：直线与 Bezier 曲线的交点数少于 Bezier 多边形
- Bezier 点的影响力：全局，伪局部
- 仿射不变性：仿射变化后 Bezier 曲线和 Bezier 多边形不变
- 对称性：$x(t)=[\pmb{b}_0,\dots,\pmb{b}_n]$ 与 $\pmb{x}'(t)=[\pmb{b}_n,\dots,\pmb{b}_0]$ 
- 线性精度：Bezier 曲线是线段 $\Leftrightarrow$ $\pmb{b_0},\dots,\pmb{b_n}$ 共线



