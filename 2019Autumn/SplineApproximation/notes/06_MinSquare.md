# 6. 最小平方逼近

本章考虑内积空间中的逼近问题，范数为
$$
\|f\|^2=\int_T |f(t)|^2\rho(t)\mathrm{d}t
$$
其中 $\rho(t)>0$ 是权函数

> 典型内积空间有
> $$
> \begin{aligned}
> L _ { 2 , \rho } ( T ) &\triangleq \left\{ x : \| x \| ^ { 2 } = \int _ { T } | x ( t ) | ^ { 2 } \rho ( t ) \mathrm { d } t < + \infty \right\}\\
> l _ { 2 , \rho } ( n ) &\triangleq \left\{ x \in \mathbb { R } ^ { n } : \langle x , y \rangle = \sum _ { i = 1 } ^ { n } x \left( t _ { i } \right) y \left( t _ { i } \right) \rho \left( t _ { i } \right) \right\}
> \end{aligned}
> $$
> 
> > $l_{2,\rho}(n)$ 的定义很奇怪，$y$ 不知道是啥

向量 $x$ 与空间 $M$ 垂直 $x\perp M$ 指 $\forall m \in M$，$\langle x,m\rangle = 0$ 

对向量 $x$ 进行标准化 $\hat{x} \triangleq x/\|x\|=x/\sqrt{\langle x,x\rangle}$ 

向量 $x$ 在向量 $y$ 上的投影 $\text{proj}(x,y)$ 为

$$
\begin{aligned}
\text{proj}(x,y)
&= \langle x, \hat{y}\rangle\hat{y} \\
&= \left\langle x, \frac{y}{\|y\|}\right\rangle\frac{y}{\|y\|} \\
&= \frac{\langle x,y\rangle}{\langle y,y\rangle} y \\
\end{aligned}
$$

## 6.1 最佳逼近

**定理 6.1** 设 $X$ 是 Hilbert 空间，$M\subset X$ 是闭线性子空间（闭凸集），则 $\forall x \in X$，$\#B_M(x)=1$ 

> $\|x\|^2=\langle x,x \rangle$ 是匀凸的[^定义 1.4 的推论]，因此最佳逼近是**存在且唯一**的

**定理 6.2** 设 $X$ 是 Hilbert 空间，$M$ 是 $X$ 的子空间，$x\in X$，$m^*\in M$，则 $m^*\in \mathcal{B}_M(x)$ $\Leftrightarrow$ $(x-m^*)\perp M$ 

> **证明** 
>
> - 必要性（$\Rightarrow$）
>
>   ![image-20191109151227790](assets/image-20191109151227790.jpg)
>
>   > $d(x,M)=\|x-m\|$，而直角边更短，矛盾
>
>   假设 $(x-m^*)\not\perp M$，则 $\exist z \in M$，满足 $\left\langle x-m^*,z \right\rangle \neq 0$ 
>   $$
>   \begin{aligned}d(x,M)&= \|x-m^*\| \\&= \inf_{m\in M} \|x-m\| \\&\le \left\|x-m^* - \text{proj}(x-m^*,z)\right\|\\&= \left\|x-m^* - \frac{\langle x-m^*, z\rangle}{\langle z,z \rangle}\right\|\\&= \left\langle x-m^* - \frac{\langle x-m^*, z\rangle}{\langle z,z \rangle},x-m^* - \frac{\langle x-m^*, z\rangle}{\langle z,z \rangle} \right\rangle ^{\frac{1}{2}}\\&= \sqrt{\|x-m^*\|^2-\frac{\left\langle x-m^*,z \right\rangle^2}{\left\langle z,z \right\rangle}}\\&< \|x-m^*\|\end{aligned}
>   $$
>
> - 充分性（$\Leftarrow$）
>
>   $(x-m^*)\perp M \Rightarrow \forall m \in M,(x-m^*)\perp (m-m^*)$，则
>   $$
>   \begin{aligned}
>   \|x-m\|^2&=\|x-m^*+m^*-m\|^2\\
>   &=\|x-m^*\|^2+\|m^*-m\|^2\\
>   &\ge \|x-m^*\|^2
>   \end{aligned}
>   $$
>   则 $m^* \in \mathcal{B}_M(x)$ 
>

**推论 6.1** $M$ 是闭的线性子空间 $\Rightarrow$ 距离投影算子 $P_M$ 是线性算子，且 $\|P_M\|=1$ 

> **证明** 
>
> - 距离投影算子 $P_M$ 是线性算子
>
>   $P_M$ 是齐次的[^定理 1.10]，则只需证 $P_M(x+y)=P_Mx+P_My$ 
>
>   由 **定理 6.2** 知
>   $$
>   (x-P_Mx)\perp M,\quad (y-P_My)\perp M
>   $$
>   则
>   $$
>   (x+y-(P_Mx+P_My))\perp M
>   $$
>   再由 **定理 6.2** 知
>   $$
>   P_Mx+P_My = \mathcal{B}_M(x+y) = P_M(x,y)
>   $$
>
> - $\|P_M\|=1$ 
>
>   ![image-20191109160641939](assets/image-20191109160641939.jpg)
>
>   又因为
>   $$
>   \begin{aligned}\|P_Mx\|^2&\le \|P_M x\|^2 + \|x- P_Mx\|^2\\&\le \|P_Mx + x - P_Mx\|^2\\&\le \|x\|^2\end{aligned}
>   $$
>   则 $\|P_M\| \le 1$，又 $P_M M = M$，则 $\|P_M\| = 1$ 

**计算** $P_Mx$ 

设 $M\triangleq \text{span}\{m_i\}_{i=1}^n$，$m^*=P_Mx$，则 $\exist \pmb{\alpha}=\left[\begin{matrix}\alpha_1\\\vdots\\\alpha_n\end{matrix}\right] \in \mathbb{R}^n$，使得
$$
m^*=\sum_{j=1}^n\alpha_jm_j
$$
且 $x-P_Mx\perp M$，即
$$
\left\langle m_i,x-m^* \right\rangle=0 \quad(i=1,2,\dots,n)
$$
即
$$
\sum_{j=1}^n\left\langle m_i,m_j \right\rangle \alpha_j = \left\langle   m_i,x \right\rangle\quad(i=1,2,\dots,n)
$$
令 $G\triangleq \{\left\langle m_i,m_j \right\rangle\}_{i,j=1}^n$ 为 Gram 矩阵，$\pmb{b}=\{\left\langle m_i,x \right\rangle\}_{i=1}^n$，则上述方程组可写为 $G\pmb{\alpha}=\pmb{b}$。其中 $G$ 是对称正定阵，可分解为 $G=LDL^\top$，其中 $L$ 为下三角阵，$D$ 为对角阵。则 $G\pmb{\alpha}=\pmb{b}$ 等价于
$$
\left\{\begin{array}{l}
L\beta=\pmb{b},\\
L^\top\alpha = D^{-1}\beta
\end{array}\right.
$$
由于 $L$ 为三角阵，很容易解出 $\beta$ 和 $\alpha$ 

## 参考

[^定义 1.4 的推论]: [**01_Introduction.md**](01_Introduction.md). 定义 1.4 的推论.
[^定理 1.10]: [**01_Introduction.md**](01_Introduction.md). 定理 1.10.



