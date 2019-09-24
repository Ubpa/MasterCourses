# 4

## 题目

![1569240476204](assets/1569240476204.png)

## 解答

取 $M=\text{span}(t)$。因为当 $m(t)=t$ 时，$m(0) = 0$ 且 $m\neq0$，则 M 不是 Harr 空间，故 $\exist f\in C(I),\#B_M(f)\neq 1$，即 M 不是 T 集。

# 5

## 题目

![1569246954128](assets/1569246954128.png)

## 解答

$$
\frac{\|\lambda f\|}{\|f\|}
=\frac{\left\|\sum_{i=1}^n\alpha_i m(t_i)\right\|}{\|f\|}
\le\frac{\left\|\sum_{i=1}^n\alpha_i m(t_i)\right\|}{\|m\|}
\le\sum_{i=1}^n|\alpha_i|
$$

则 $\|\lambda\|_{C(I)}=\sum_{i=1}^n|\alpha_i|$

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

故 $C_o(A)$ 是最小的凸集

# 7

## 题目

![1569249197005](assets/1569249197005.png)

## 思路

有界集都是致密的

致密闭集是紧集

有界闭集是紧集

有界简单

闭集?显然

## 解答

因为 A 是紧集，所以 A 有界，即存在 $M > 0$，$\forall a\in A$， 有 $\|a\|\le M$。

$\forall x \in C_o(A)$，$\exist \{a_i\}_{i=1}^{r+1}$ 使得 $x\in C_o(a_1,a_2,\cdots,a_{r+1})$。显然 $C_o$ 是闭集。

则 $\|x\|=\|\sum_{i=1}^{r+1}\alpha_i a_i\|\le M\sum_{i=1}^{r+1}|\alpha_i|$，则 $C_o(A)$ 有界。

所以 $C_o(A)$ 是紧集。