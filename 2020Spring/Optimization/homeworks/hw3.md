# 最优化理论 作业 3

> 庄涛
>
> SA19001074

## Exercise 4

证明 (67) 中定义的 $\psi(\mathbf{x},\lambda)$ 是关于 Lagrange-Newton 法的下降函数

> $$
> \psi(\mathbf{x},\lambda)=\|\nabla f(\mathbf{x})-A(\mathbf{x})^T\lambda\|^2+\|c(\mathbf{x})\|^2
> $$

证：
$$
\nabla\psi(\mathbf{x},\lambda)=
\left[\begin{array}{c}
2W(\mathbf{x},\lambda)(\nabla f(\mathbf{x})-A(\mathbf{x})^T\lambda)+2A(\mathbf{x})^T\mathbf{c}(\mathbf{x})\\
-2A(\mathbf{x})(\nabla f(\mathbf{x})-A(\mathbf{x})^T\lambda)
\end{array}\right]
$$
由分块矩阵求逆公式知
$$
\left[\begin{array}{cc}
W(\mathbf{x},\lambda) & -A(\mathbf{x})^T\\
-A(\mathbf{x}) & 0
\end{array}\right]^{-1}
=
\left[\begin{array}{cc}
X^{-1}-X^{-1}Y^T(YX^{-1}Y^T)^{-1}YX^{-1} &  X^{-1}Y^T(YX^{-1}Y^T)^{-1}\\
(YX^{-1}Y^T)^{-1}YX^{-1}&-(YX^{-1}Y^T)^{-1}
\end{array}\right]
$$
其中 $X=W(\mathbf{x},\lambda)$ 为对称矩阵，$Y=-A(\mathbf{x})$ 

再记 $Z=\nabla f(\mathbf{x})-A(\mathbf{x})^T\lambda$，则
$$
\begin{align}
&\nabla\psi(\mathbf{x},\lambda)^T
\left[\begin{array}{cc}
\delta_{\mathbf{x}}\\
\delta_{\lambda}
\end{array}\right]\\
=&
-
2\left[\begin{array}{c}
Z^TX-\mathbf{c}(\mathbf{x})^TY & Z^TY
\end{array}\right]
\left[\begin{array}{cc}
X^{-1}-X^{-1}Y^T(YX^{-1}Y^T)^{-1}YX^{-1} &  X^{-1}Y^T(YX^{-1}Y^T)^{-1}\\
(YX^{-1}Y^T)^{-1}YX^{-1}&-(YX^{-1}Y^T)^{-1}
\end{array}\right]
\left[\begin{array}{cc}
Z\\
-\mathbf{c}(\mathbf{x})
\end{array}\right]\\
=&-2\left[\begin{array}{cc}
Z^T & -c(\mathbf{x})^T
\end{array}\right]
\left[\begin{array}{cc}
Z\\
-\mathbf{c}(\mathbf{x})
\end{array}\right]\\
=&-2\psi(\mathbf{x},\lambda)\\
\le& 0
\end{align}
$$

## Exercise 5

证明罚函数法求解带误差界近似问题的算法有限终止性

证：（反证法）

假设算法不有限终止，则 $\sigma_k\to+\infty$，且
$$
\|{\mathbf{c}(\mathbf{x}(\sigma_k))}_-\|>\epsilon \tag{a}
$$
由
$$
\epsilon > \min_{\mathbf{x}\in\mathbb{R}^n}\|{\mathbf{c}(\mathbf{x})}_-\|
$$
可知 $\exist \hat{x}\in \mathbb{R}^n$ 满足
$$
\|{\mathbf{c}(\hat{\mathbf{x}})}_-\|<\epsilon \tag{b}
$$
再由 $\mathbf{x}(\sigma)$ 的定义和引理 2，有
$$
\begin{align}
f(\hat{\mathbf{x}})+\sigma_k\|{\mathbf{c}(\hat{\mathbf{x}})}_-\|^2
&\ge f(\mathbf{x}(\sigma_k))+\sigma_k\|{\mathbf{c}(\mathbf{x}(\sigma_k))}_-\|^2\\
&\ge f(\mathbf{x}(\sigma_1))+\sigma_k\|{\mathbf{c}(\mathbf{x}(\sigma_k))}_-\|^2\\
\end{align}
$$
则
$$
\|{\mathbf{c}(\hat{\mathbf{x}})}_-\|^2-\|{\mathbf{c}(\mathbf{x}(\sigma_k))}_-\|^2\ge \frac{1}{\sigma_k}(f(\mathbf{x}(\sigma_1))-f(\hat{\mathbf{x}}))\to 0
$$
与 (a) 和 (b) 矛盾

## Exercise 6

给出约束最优化问题的二阶充分最优性条件，并用于说明增广 Lagrange 函数的极小点与原问题最优解的等价性

