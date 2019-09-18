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

