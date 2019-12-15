# 1. 拟合

## 1.1 插值

### 1.1.1 问题一般形式

$B=\{b_i\}_{i=1}^n$，$f(x)=\sum_{i=1}^nc_ib_i(x)\in B$，有
$$
y_i=f(x_i)=\sum_{j=1}^nc_jb_j(x_i) \quad (j=1,\dots,n)
$$
设 $M=(b_j(x_i))_{i,j=1}^n$，$\pmb{y}=(y_i)_{i=1}^n$，$\pmb{c}=(c_i)_{i=1}^n$，则上式变为
$$
M\pmb{c}=\pmb{y}
$$
则 $c=M^{-1}y$ 

### 1.1.2 多项式插值

$B=\{x^{j-1}\}_{j=1}^n$，则
$$
M=\left[\begin{matrix}
1 & x_1 &\dots &x_1^{n-1}\\
1 & x_2 &\dots &x_2^{n-1}\\
\vdots & \vdots &\vdots &\vdots\\
1 & x_n &\dots &x_n^{n-1}\\
\end{matrix}\right]
$$

### 1.1.3 拉格朗日插值

$$
f(x)=\sum_{i=1}^ny_il_i(x)
$$

其中
$$
l_i(x)=\frac{\prod_{j\neq i}(x-x_j)}{\prod_{j\neq i}(x_i-x_j)}
$$

## 1.2 逼近

### 1.2.1 Bernstein 多项式

$$
B_n(f,x)=\sum_{i=0}^nf(x_i)B^n_i(x)
$$

其中 $B^n_i(x)=\mathrm{C}_n^ix^i(1-x)^{n-i}$，$x_i=\frac{i}{n}\ (i=0,\dots,n)$ 

误差估计
$$
|f(x)-B_n(f,x)|<\frac{9}{4}m_{f,n}
$$
其中 $m_{f,n}=\min_\limits{|x_i-x_j|<1/\sqrt{n},\ i\neq j} |f(x_i)-f(x_j)|$ 

### 1.2.2 最小二乘逼近

函数空间 $B=\{b_i\}_{i=1}^n$，样本点 $\{(x_i,y_i)\}_{i=1}^m$，目标函数 $f(x)=\sum_{i=1}^nc_ib_i(x)$，设 $M=(b_j(x_i))_{i,j=1}^{m,n}$，$\pmb{y}=(y_i)_{i=1}^m$，$\pmb{c}=(c_i)_{i=1}^n$，则
$$
\pmb{c}=(M^\top M)^{-1}M^\top \pmb{y}
$$
