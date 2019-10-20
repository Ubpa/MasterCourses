# 4

## 题目

![1569240476204](assets/1569240476204.png)

## 解答

取 $M=\text{span}(f)$，其中 $\forall t \in I,f(t)=t$ 是 $C(I)$ 的线性子空间。

由于当 $t_1 = 0$ 时，有 $D\left(\begin{matrix}t_1\\f(t_1)\end{matrix}\right)=t_1 = 0$，则 M 不是 Haar 空间，故 M 不是 T 集。

# 5

## 题目

![1569246954128](assets/1569246954128.png)

## 解答

对于 $\|f\|\le 1$，有
$$
|\lambda f|
=\left|\sum_{i=1}^n\alpha_i f(t_i)\right|
\le\sum_{i=1}^n|\alpha_i||f(t_i)|
\le\sum_{i=1}^n|\alpha_i|
$$

上式在 $\text{sgn}f(t_i)=\text{sgn} \alpha_i$ 时取等号

# 6

## 题目

![1569248126205](assets/1569248126205.png)

## 思路

![1569248274116](assets/1569248274116.png)

![1569248162569](assets/1569248162569.png)

## 解答

$Co(A)$ 是凸集

假设存在更小的包含A的凸集 B，则 $\exist f=\sum_{i=1}^m\theta_if_i\in Co(A)$，但 $f\notin B$，显然 $m\ge3$。

即
$$
\begin{align}
f
&=\sum_{i=1}^m \theta_i f_i\\
&=(\theta_1+\theta_2)\left(\frac{\theta_1}{\theta_1+\theta_2}f_1+\frac{\theta_2}{\theta_1+\theta_2}f_2\right)+\sum_{i=3}^m \theta_i f_i\\
&=\theta_{1,2}f_{1,2}+\sum_{i=3}^m \theta_i f_i
\end{align}
$$
其中$\theta_{1,2}=\theta_1+\theta_2$，$f_{1,2}=\left(\frac{\theta_1}{\theta_1+\theta_2}f_1+\frac{\theta_2}{\theta_1+\theta_2}f_2\right)\in B$。重复上述操作，最终可得
$$
f=\theta_{1,m}f_{1,m}=f_{1,m} 
$$
其中 $\theta_{1,m}=1$，$f_{1,m}\in B$，故 $f\in B$。矛盾，即假设不成立。

故 $Co(A)$ 是最小的凸集

# 7

## 题目

![1569249197005](assets/1569249197005.png)

## 思路

有界集都是致密的

致密闭集是紧集

有界闭集是紧集

有界简单

闭集?

## 解答

设 $\{f^{(n)}\}\subseteq Co(A)$ 收敛，其中 $f^{(n)}=\sum_{i=1}^r \alpha_i^{(n)} f_i^{(n)}$，则有子列 $\{\alpha_i^{(n_k)}\}$ 和 $\{f_i^{(n_k)}\}$ 收敛

设 $\lim_\limits{k\to\infty}\alpha_i^{(n_k)}=\alpha_i$，$\lim_\limits{k\to\infty}f_i^{(n_k)}=f_i$。由于 A 是紧集，则 $f_i\in A$。则 $\lim_\limits{n\to\infty}f^{(n)}=\lim_\limits{k\to\infty}f^{(n_k)}=\sum_{i=1}^r \alpha_i f_i \in Co(A)$，则 $Co(A)$ 是闭集。

因为 A 是紧集，所以 A 有界，即存在 $M > 0$，$\forall f\in A$， 有 $\|f\|\le M$。

则 $\forall x \in Co(A),\|x\|=\|\sum_{i=1}^{r}\alpha_i f_i\|\le M\sum_{i=1}^{r+1}|\alpha_i|$，则 $Co(A)$ 有界。

所以 $Co(A)$ 是紧集。

# 8

## 题目

![1570635059840](assets/1570635059840.png)

## 思路

**定义 2.3** 若 $\forall \tau \in I_0^n \triangleq \{\tau\in I^n:t_i\neq t_j,i\neq j\}$，有
$$
D\begin{pmatrix}
t_1 & t_2 & \dots & t_n \\
m_1 & m_2 & \dots & m_n
\end{pmatrix}
\neq 0
$$
则称 $\{m_i(t)\}_{i=1}^n$ 满足 Haar 条件，并称其为 Haar 系统，也称为 Tchebycheff 系统或 T 系统。若 M 有一组基构成 T 系统，则称 M 为 Haar 空间或 T 空间

## 解答



# 9

## 题目

![1570635094471](assets/1570635094471.png)

## 思路

**定理 2.7** 设 $\{\varphi_i\}_{i=1}^n\subset C^{(n-1)}(I),I=[a,b]$，若 $\forall t \in I, r = 1,2,\dots,n$，都有
$$
w(\varphi_1,\varphi_2,\dots,\varphi_r)=\det\left(\varphi_j^{(i-1)}\right)_{i,j=1}^r\neq 0
$$
则 $\text{span}\{\varphi_i\}_{i=1}^r$ 是 Haar 空间

## 解答

# 10

## 题目

![1570635110773](assets/1570635110773.png)

## 思路

$\{t^{i-1}\}_{i=1}^n$ 是 $(-\infty,+\infty)$ 上的 Haar 系统

**定理 2.7** 设 $\{\varphi_i\}_{i=1}^n\subset C^{(n-1)}(I),I=[a,b]$，若 $\forall t \in I, r = 1,2,\dots,n$，都有
$$
w(\varphi_1,\varphi_2,\dots,\varphi_r)=\det\left(\varphi_j^{(i-1)}\right)_{i,j=1}^r\neq 0
$$
则 $\text{span}\{\varphi_i\}_{i=1}^r$ 是 Haar 空间

## 解答



# 11

## 题目

![1570635128938](assets/1570635128938.png)

## 思路

**定义 2.3** 若 $\forall \tau \in I_0^n \triangleq \{\tau\in I^n:t_i\neq t_j,i\neq j\}$，有
$$
D\begin{pmatrix}
t_1 & t_2 & \dots & t_n \\
m_1 & m_2 & \dots & m_n
\end{pmatrix}
\neq 0
$$
则称 $\{m_i(t)\}_{i=1}^n$ 满足 Haar 条件，并称其为 Haar 系统，也称为 Tchebycheff 系统或 T 系统。若 M 有一组基构成 T 系统，则称 M 为 Haar 空间或 T 空间

## 解答

