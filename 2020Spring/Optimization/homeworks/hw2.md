# Exercise 1

请证明积极集基本定理

![image-20200517201211999](assets/hw2/image-20200517201211999.png)

![image-20200517201225908](assets/hw2/image-20200517201225908.png)

## 前半部分

（反证）

假设存在 $\mathbf{x}^*+\mathbf{s}$ 是 (EQ) 的 $\mathbf{x}^*$ 适当领域 $U(\mathbf{x}^*)$ 内一点，满足 $Q(\mathbf{x}^*+\mathbf{s})<Q(\mathbf{x}^*)$，则有
$$
\mathbf{a}_i^T(\mathbf{x}^*+\mathbf{s})=b_i,i\in\mathcal{E}\cup I(\mathbf{x}^*+\mathbf{s})
$$
由 $I(\mathbf{x}^*+\mathbf{s})$ 定义可知，
$$
\mathbf{a}_i^T(\mathbf{x}^*+\mathbf{s})> b_i
$$
则 $\mathbf{x}^*+\mathbf{s}$ 也**满足 (64) 的约束**，故为 (64) 的可行解，则与 $\mathbf{x}^*$ 为 (64) 的局部极小点矛盾

## 后半部分

由题设，有
$$
G\mathbf{x}^*+\mathbf{c}=\sum_{i\in I(\mathbf{x}^*)\cup E}a_i\lambda_i^*\\
\mathbf{a}_i^T\mathbf{x}^*=b_i,i\in\mathcal{E}\cup I(\mathbf{x}^*)\\
\lambda_i^*\ge 0,i\in I(\mathbf{x}^*)
$$
则
$$
\lambda_i^*(\mathbf{a}_i^T\mathbf{x}^*-b_i)=0,i\in I(\mathbf{x}^*)
$$
定义
$$
\lambda_i^*=0,i\in I\backslash I(\mathbf{x}^*)
$$
则
$$
\begin{array}{l}
G \mathbf{x}^{*}+\mathbf{c}=\sum_{i=1}^{m} \lambda_{i}^{*} a_{i} \\
a_{i}^{T} \mathbf{x}^{*}=b_{i}, i \in \mathcal{E} \\
a_{i}^{T} \mathbf{x}^{*} \geq b_{i}, i \in I \\
\lambda_{i}^{*} \geq 0, i \in I \\
\lambda_{i}^{*}\left(a_{i}^{T} \mathbf{x}^{*}-b_{i}\right)=0, \forall i\in I
\end{array}
$$
则 $\mathbf{x}^*$ 是 (64) 的 K-T 点

# Exercise 2

请证明前述 (c) 的结论

![image-20200517205118215](assets/hw2/image-20200517205118215.png)

有
$$
\mathbf{a}_j^T\hat{\mathbf{s}}=0,j\in\hat{\mathcal{E}}\\
\mathbf{a}_{i_q}^T\hat{\mathbf{s}}>0
$$
则
$$
(\mathbf{g}^{(k)})^T\hat{\mathbf{s}} = (G\mathbf{x}^{(k)}+\mathbf{c})^T\mathbf{s}=\lambda^T A\hat{\mathbf{s}}=\mathbf{a}_{i_q}^T\hat{\mathbf{s}}\lambda^T\mathbf{e}_{i_q}=\mathbf{a}_{i_q}^T\hat{\mathbf{s}}\lambda_{i_q}<0
$$
故 $\hat{\mathbf{s}}$ 是原问题的可行方向

