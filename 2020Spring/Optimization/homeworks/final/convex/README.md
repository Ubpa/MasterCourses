# 2 Convex

## QP

问题
$$
\begin{array}{ll}
\min & \frac{1}{2}\mathbf{x}^\top P \mathbf{x}+ q^\top \mathbf{x} + r \\
\text { s.t. } & G\mathbf{x}\le h\\
&A\mathbf{x}=b
\end{array}
$$
其中 $\mathbf{x}\in \mathbb{R}^n$，$G\in \mathbb{R}^{m\times n}$ 

记 $f_0(\mathbf{x}) = \frac{1}{2}\mathbf{x}^\top P \mathbf{x}+ q^\top \mathbf{x} + r$，$\mathbf{f}(\mathbf{x})=G\mathbf{x}-h$ 

则
$$
\nabla f_0(\mathbf{x})=P\mathbf{x}+q\\
\nabla^2 f_0(\mathbf{x})=P\\
J[\mathbf{f}(\mathbf{x})]=G\\
\nabla^2 f_i(\mathbf{x})=\mathbf{0}
$$
