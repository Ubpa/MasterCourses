# 编程作业（二）文档

> 庄涛
>
> SA19001074

## 1. 优化问题描述

二次规划问题
$$
\begin{array}{ll}
\min & \frac{1}{2}\mathbf{x}^\top P \mathbf{x}+ q^\top \mathbf{x} + r \\
\text { s.t. } & G\mathbf{x}\le h\\
&A\mathbf{x}=b
\end{array}
$$
其中 $P\in S^n_+$，$G\in \mathbb{R}^{m\times n}$ 且 $A\in \mathbb{R}^{p\times n}$ 

## 2. 算法原理

我们采用**原-对偶内点法**求解二次规划问题

记 $f_0(\mathbf{x}) = \frac{1}{2}\mathbf{x}^\top P \mathbf{x}+ q^\top \mathbf{x} + r$，$\mathbf{f}(\mathbf{x})=G\mathbf{x}-h$ 

则
$$
\nabla f_0(\mathbf{x})=P\mathbf{x}+q\\\nabla^2 f_0(\mathbf{x})=P\\J[\mathbf{f}(\mathbf{x})]=G\\\nabla^2 f_i(\mathbf{x})=\mathbf{0}
$$

修改的 KKT 条件可表示为 $r_t(\mathbf{x},\lambda,\nu)=0$，其中
$$
r_{t}(\mathbf{x}, \lambda, \nu)
=
\left[\begin{array}{c}
\nabla f_{0}(\mathbf{x})+J[\mathbf{f}(\mathbf{x})]^{\top} \lambda+A^{\top} \nu \\
-\operatorname{diag}(\lambda) \mathbf{f}(\mathbf{x})-(1 / t) \boldsymbol{1} \\
A \mathbf{x}-b
\end{array}\right]
=
\left[\begin{array}{c}
P\mathbf{x}+q+G^\top \lambda + A^\top \nu\\
-\operatorname{diag}(\lambda)(G\mathbf{x}-h)-(1 / t) \boldsymbol{1} \\
A\mathbf{x}-b
\end{array}\right]
$$
并且 $t>0$ 

第一块 $P\mathbf{x}+q+G^\top \lambda + A^\top \nu$ 称为==对偶残差== dual residual

第三块 $r_{\text{pri}}=A\mathbf{x}-b$ 称为==原残差== primal residual

第二块 $r_{\text{cent}}=-\operatorname{diag}(\lambda)(G\mathbf{x}-h)-(1 / t) \boldsymbol{1}$ 称为==中心残差== centrality residual

> - $r_{\text{dual}}$ : $n \times 1$ 
> - $r_{\text{cent}}$ : $m\times 1$ 
> - $r_{\text{pri}}$ : $p\times 1$ 

记当前点为 $y=(\mathbf{x},\lambda,\nu)$，牛顿步为 $\delta_y=(\delta_{\mathbf{x}},\delta_\lambda,\delta_\nu)$，牛顿步用于解方程 $r_t(x,\lambda,\nu)=0$，表示为
$$
r_t(y+\delta_y)\approx r_t(y)+J[r_t(y)]\delta_y=0
$$
写成矩阵形式为
$$
\left[\begin{array}{ccc}
\nabla^{2} f_{0}(\mathbf{x})+\sum_{i=1}^{m} \lambda_{i} \nabla^{2} f_{i}(\mathbf{x}) & J[\mathbf{f}(\mathbf{x})]^{\top} & A^{\top} \\
-\operatorname{diag}(\lambda) J[\mathbf{f}(\mathbf{x})] & -\operatorname{diag}(\mathbf{f}(\mathbf{x})) & 0 \\
A & 0 & 0
\end{array}\right]
\left[\begin{array}{c}
\delta_{\mathbf{x}} \\
\delta_{\lambda} \\
\delta_{\nu}
\end{array}\right]
=
-
\left[\begin{array}{c}
r_{\text {dual }} \\
r_{\text {cent }} \\
r_{\text {pri }}
\end{array}\right]
$$
代入可得
$$
\left[\begin{array}{ccc}
P & G^{\top} & A^{\top} \\
-\operatorname{diag}(\lambda) G & -\operatorname{diag}(G\mathbf{x}-h) & 0 \\
A & 0 & 0
\end{array}\right]
\left[\begin{array}{c}
\delta_{\mathbf{x}} \\
\delta_{\lambda} \\
\delta_{\nu}
\end{array}\right]
=
-
\left[\begin{array}{c}
r_{\text {dual }} \\
r_{\text {cent }} \\
r_{\text {pri }}
\end{array}\right]
$$


==原-对偶搜索方向== primal-dual search direction $\delta_{y_{\text{pd}}}=(\delta_{x_{\text{pd}}},\delta_{\lambda_{\text{pd}}},\delta_{\nu_{\text{pd}}})$ 是上边的解

原-对偶内点法迭代的 $\mathbf{x}^{(k)},\lambda^{(k)},\nu^{(k)}$ 不要求是可行的，我们没法计算对偶间隙，但我们可以定义==代理对偶间隙== surrogate duality gap
$$
\hat{\eta}(\mathbf{x},\lambda)=-\mathbf{f}(\mathbf{x})^\top\lambda
$$
其中 $\mathbf{f}(\mathbf{x})<\mathbf{0}$，$\lambda\ge 0$ 

当 $\mathbf{x},\lambda,\nu$ 可行时，代理对偶间隙就是对偶间隙，另外
$$
t=\frac{m}{\hat{\eta}}
$$
**原-对偶内点法——算法** 

给定 $\mathbf{x}$ 满足 $f_1(\mathbf{x}),\dots,f_m(\mathbf{x})<0$，$\lambda>0$，$\gamma>1$，$\epsilon_{\text{feas}}>0$，$\epsilon>0$ 

重复

1. $t:=\gamma m/\hat{\eta}$ 
2. 计算原-对偶搜索方向 $\delta_{y_{\text{pd}}}$ 
3. 线搜索确定步长 $\alpha$ 并更新 $y:=y+\alpha\delta_{y_{\text{pd}}}$ 

直到 $\|r_{\text{pri}}\|_2 \le \epsilon_{\text{feas}}$，$\|r_{\text{dual}}\|_2 \le \epsilon_{\text{feas}}$，$\hat{\eta}\le \epsilon$ 

第三步的线搜索是标准的回溯线搜索

对于一个步长 $\alpha$，令
$$
y^+=
\left[\begin{array}{c}
G\mathbf{x}-h^+\\
\lambda^+\\
\nu^+
\end{array}\right]
=
\left[\begin{array}{c}
G\mathbf{x}-h\\
\lambda\\
\nu
\end{array}\right]
+
\alpha
\left[\begin{array}{c}
\delta_{\mathbf{x}_{\text{pd}}} \\
\delta_{\lambda_{\text{pd}}} \\
\delta_{\nu_{\text{pd}}}
\end{array}\right]
$$
令
$$
\alpha^{\max}=\sup\{\alpha \in [0,1]|\lambda+\alpha\delta_\lambda\ge 0\}=\min\{1,\min\{-\lambda_i/\delta_{\lambda_i}|\delta_{\lambda_i}<0\}\}
$$
为最大的正步长

回溯线搜索起始时令 $\alpha = 0.99\alpha^{\max}$，并且对 $\alpha$ 乘上 $\beta\in (0,1)$ 直到 $\mathbf{f}(\mathbf{x}^+)<0$，然后继续对 $\alpha$ 乘以 $\beta$ 直到
$$
\|r_{t}(\mathbf{x}^{+}, \lambda^{+}, \nu^{+})\|_{2} \leqslant(1-\tau \alpha)\|r_{t}(\mathbf{x}, \lambda, \nu)\|_{2}
$$
这里 $\tau$ 一般取 $0.01$ 到 $0.1$ 

> 算法步骤中要求起始点满足 $f_1(\mathbf{x}),\dots,f_m(\mathbf{x})<0$，即要求
> $$
> G\mathbf{x} < \mathbf{h}
> $$
> 我们可以直接求解
> $$
> G\mathbf{x}-\mathbf{h}=-\mathbf{1}
> $$
> 由于 $G$ 不是方阵，我们可以用其伪逆 $G^+$，解得的 $\mathbf{x}$ 为解空间中模最小的那个
> $$
> \mathbf{x}=G^+(\mathbf{h}+\mathbf{1})
> $$
> 伪逆可通过 SVD 分解求得

## 3. 程序使用指南

- 使用 CMake 搭建项目（勾选 `Ubpa_BuildConvexTest`）

- 在 VS2019 中

  - 执行项目 Sparse_test_01_QP 可求解给定问题

  - 执行项目 Sparse_test_02_QP _CMD 可从控制台输入数据并求解

    > **输入数据说明** 
    >
    > 示例
    > 
    > ```
    > 2
    > 1
    > 1
    > 
    > epsilon_feas 0.00001
    > epsilon 0.00001
    > KEY_END
    > 
    > 1 0
    > 0 1
    > 
    > 0 0
    > 
    > 0
    > 
    > 1 -1
    > 
    > -1
    > 
    > 0 1
    > 
    >-1
    > ```
    >
    > 具体而言
    >
    > 第一个数字是 $n$，第二个数字是 $m$，第三个数字是 $p$ 
    >
    > 然后设定一些参数，如 $\gamma,\epsilon_{\text{feas}},\epsilon,\beta,\tau$ 等
    >
    > 然后依次给出矩阵/向量/数值：$P,q,r,G,h,A,b$ 

## 4. 程序测试

项目 Sparse_test_01_QP 提供了一个给定的问题
$$
\begin{array}{l}
\min        & \frac{1}{2}(x^2+y^2)\\
\text{s.t.} & x-y\le -1\\
            & y = -1
\end{array}
$$
显然最优解为 $(x,y)=(-2,-1)$，最优值为 $\frac{5}{2}$ 

程序运行结果如下

![image-20200621224838837](assets/README/image-20200621224838837.png)

## 5. 结论

这个作业相比上一个作业稍微难上一点点，debug 花了点时间，但也很快就搞定了

这种从理论到代码的感觉还是很爽的

经验就是，只要理论搞明白，那么即使过程貌似比较繁杂，但其实也没有多大难度，可以做出来

