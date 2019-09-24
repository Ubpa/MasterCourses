# 6

## 题目

![1568726865743](assets/1568726865743.png)

## 解答

当 $\alpha = 0$ 时
$$
d(\alpha x, M) = d(0, M) = 0 = |\alpha|d(x,M)
$$
当 $\alpha \neq 0$ 时
$$
d(\alpha x,M)=\inf_{m\in M}\|\alpha x-m\|=\alpha \inf_{m\in M}\left\|x-\frac{m}{\alpha}\right\|=|\alpha| \inf_{m\in M}\|x-m\|=|\alpha| d(x,M)
$$

# 7

## 题目

![1568726889712](assets/1568726889712.png)

## 思考

![1568269420535](assets/1568269420535.png)

![1568774740095](assets/1568774740095.png)

![1568774756964](assets/1568774756964.png)

![1568774777389](assets/1568774777389.png)

![1568774824901](assets/1568774824901.png)

![1568776597365](assets/1568776597365.png)

当且仅当 $a=kb, k\ge 0$ 时取等号

## 解答

$$
\|x\|_p=\|y\|_p=1\\
\|x+y\|_p=(\sum(x_i+y_i)^p)^{\frac{1}{p}}\le(\sum x_i^p)^{\frac{1}{p}}+(\sum y_i^p)^{\frac{1}{p}}=\|x\|_p+\|y\|_p=2\\
$$

当且仅当 $x=ky, k \ge 0$ 时取等号。此时 $\|x\|=|k|\|y\|$，则 $k=1$，即 $x=y$，矛盾。所以
$$
\left\|\frac{x+y}{2}\right\|_p<1
$$
故 X 严格凸，又 X 是有限维赋范线性空间，故其匀凸

又 $l_p$ 是 banach 空间，M 是 闭凸集，所以 M 是 T 集

# 8

## 题目

![1568726895002](assets/1568726895002.png)

## 思考

$P_M$ 应该是线性算子

## 解答

$$
P_M(x+y) = P_M(x)+P_M(y)\\
\|x+y-k_{x+y}(1,1)\|_p^{p}=|x_1+y_1-k_{x+y}|^{p}+|x_2+y_2-k_{x+y}|^{p}\ge\left|\frac{(x_1+y_1)-(x_2+y_2)}{2}\right|^p
$$

上式取等号当且仅当
$$
k_{x+y}=\frac{x_1+y_1+x_2+y_2}{2}
$$
同理
$$
k_x=\frac{x_1+x_2}{2}\\
k_y=\frac{y_1+y_2}{2}\\
$$
所以
$$
P_M(x+y)=k_{x+y}e=k_x e + k_y e=P_M(x)+P_M(y)
$$

# 1

## 题目

![1568908538125](assets/1568908538125.png)

## 思路

![1568908602567](assets/1568908602567.png)

## 解答

记 $P_2=\{f|f(t)=at^2+bt+c\}$。

显然 $I$ 是正线性算子且满足 $\forall f\in P_2$，有 $If=f$。

假设存在正线性算子 $L\neq I$，满足 $\forall f\in P_2$，有 $Lf=f$。

故 $\exist g\notin P_2$，满足 $Lg\neq g$，即 $\exist t_0 \in [a,b]$，满足 $(Lg)(t_0)\neq g(t_0)$，不妨设 $(Lg)(t_0)<g(t_0)$，否则取 $g'=-g$，则 $(Lg')(t_0)<g'(t_0)$。

取 $g_0 = \frac{(Lg)(t_0) + g(t_0)}{2} > (Lg)(t_0)$ 

显然 $\exist f\in P_2$，满足 $f(t)=at^2+bt+c$，$a<0$，$-\frac{b}{2a}=t_0$，$f(t_0)=g_0$，且 $g(t)>f(t)$（$a$ 足够小即可）。

令 $h=g-f$，则 $h>0$，故 $Lh\ge0$。

由于 $(Lh)(t_0)=(Lg)(t_0)-f(t_0)=(Lg)(t_0)-g_0<0$，与 $Lh\ge 0$ 矛盾。

所以假设不成立，即不存在正线性算子 $L\neq I$，满足 $\forall f\in P_2$，有 $Lf=f$。

综上，$I$ 是唯一正线性算子。

# 2

## 题目

![1568963626239](assets/1568963626239.png)

## 思路

![1568963762193](assets/1568963762193.png)

![1568968852202](assets/1568968852202.png)

![1568968829799](assets/1568968829799.png)

## 解答

当 $f(x)=1$ 时，有
$$
\begin{aligned}
P_n(f,x) = P_n(1,x)
&=\sum_{k=0}^n \left[C_n^k\right] x^k (1-x)^{n-k}\\
&=\sum_{k=0}^n C_n^k x^k (1-x)^{n-k}\\
&=1
\end{aligned}
$$
当 $f(x)=x$ 时，有
$$
\begin{aligned}
P_n(f,x) = P_n(x,x)
&=   \sum_{i=0}^n \left[C_n^k\frac{k}{n}\right] x^k (1-x)^{n-k}\\
&=   \sum_{i=0}^n \left[C_{n-1}^{k-1}\right] x^k (1-x)^{n-k}\\
&= x \sum_{i=0}^n C_{n-1}^{k-1} x^{k-1} (1-x)^{n-k}\\
&= x\\
\end{aligned}
$$
当 $f(x)=x^2$ 时

一方面
$$
\begin{aligned}
P_n(f,x) = P_n(x^2,x)
&=   \sum_{k=0}^n \left[C_n^k\frac{k^2}{n^2}\right] x^k (1-x)^{n-k}\\
&\le \sum_{k=0}^n C_n^k\frac{k^2}{n^2} x^k (1-x)^{n-k}\\
&=   \sum_{k=0}^n \left(\frac{1}{n}C_{n-1}^{k-1}+\frac{n-1}{n}C_{n-2}^{k-2}\right) x^k (1-x)^{n-k}\\
&=   \frac{x}{n}+(1-\frac{1}{n})x^2\\
\end{aligned}
$$
另一方面
$$
\begin{aligned}
P_n(f,x) = P_n(x^2,x)
&=       \sum_{k=0}^n \left[C_n^k\frac{k^2}{n^2}\right] x^k (1-x)^{n-k}\\
&=   x^2 \sum_{k=0}^n \left[C_{n-2}^{k-2}\frac{(n-1)k}{(k-1)n}\right] x^{k-2} (1-x)^{n-k}\\
&\ge x^2 \sum_{k=0}^n \left[C_{n-2}^{k-2}\right] x^{k-2} (1-x)^{n-k}\\
&=   x^2 \sum_{k=0}^n C_{n-2}^{k-2} x^{k-2} (1-x)^{n-k}\\
&= x^2
\end{aligned}
$$
则
$$
x^2 = \lim_{n\to\infty} x^2\le \lim_{n\to\infty}P_n(x^2,x)\le \lim_{n\to\infty} \left(\frac{x}{n}+(1-\frac{1}{n})x^2\right)= x^2
$$
故
$$
\lim_{n\to\infty}P_n(x^2,x) = x^2
$$
综上，任意 $f\in C[a,b]$，$(P_nf)(x)$ 一致收敛于 $f$。

# 3

## 题目

![1568970270249](assets/1568970270249.png)

## 思路

![1568970390682](assets/1568970390682.png)

![1568970971083](assets/1568970971083.png)

## 解答

记该多项式集合为 $P$，则 $P \subset C[a,b]$，显然 $P$ 是代数。所以 $P$ 是 $C[a,b]$ 的子代数。

显然 $1, x^{17}\in P$，且 $x^{17}$ 是严格单调连续函数，所以 $\overline{P}=C[a,b]$。

所以 $P$ 在 $C[a,b]$ 中稠密。

