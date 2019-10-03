# 04. 曲线微分几何

## 参数曲线

曲线方程 $c(t)$，$t$ 常被视为时间

像集称为轨迹（trace），不同参数化的曲线可以轨迹相同，轨迹中一点对应多个时间时称为自交（self-intersection）

![1569479309382](assets/1569479309382.jpg)

$c'(t)$ 称为速度向量，$|c'(t)|$ 是速度

> 示例
> $$
> \alpha(t)=(\cos t, \sin t), t\in[0,2\pi]\\
> \beta(t)=(\cos 2t, \sin 2t), t\in[0,\pi]
> $$
> ![1569479953734](assets/1569479953734.jpg)
>
> 同一轨迹但不同参数化（$c(t)$ 不同），得到的速度向量 $c'(t)$ 也不一样，方向共线（切线方向，同向或反向），但大小有别

正则（regular）参数化是指 $c'(t)\ne 0$（没有驻点）。曲线上正则点称为平凡点（ordinary point），非正则点称为奇异点（singular point）。

> 同一轨迹，不同参数化正则性可以不同
>
> ![1569480372937](assets/1569480372937.jpg)

给定一个光滑的正则参数化，允许的参数改变是任意实值（real）光滑（smooth，可微分）函数
$$
f:I_1\to I,f'(t_1)\neq 0,t_1\in J
$$
![1569480647367](assets/1569480647367.jpg)

我们可以视正则曲线为正则参数化的集合（等价类），关注不同参数变换下的不变性。

切线过 $c(t)$ 且与 $c'(t)$ 平行，$c'(t)$ 的单位向量称为切向量（tangent vector）
$$
\pmb{t}=\frac{c'}{\|c'\|}
$$
![1569480907474](assets/1569480907474.jpg)

法平面（normal plane）过 $c$ 且垂直于 $c'$。

法平面上一点 $p$ 满足 $p-c\perp c'$，即 $(p-c)\cdot c' = 0$。

![1569481208928](assets/1569481208928.jpg)

密切平面（osculating plane）过 $c$ 且垂直于复法向（binormal）$\pmb{b}$，为
$$
\pmb{b}=\frac{c'\times c''}{\|c'\times c''\|}
$$
密切平面上一点 $p$ 满足 $p-c\perp c'\times c''$。

密切平面有定义要求 $c'$ 与 $c''$ 不共线。

曲线上三点趋近于 $c$ 时，这三点确定的平面收敛至密切平面。

![1569481598504](assets/1569481598504.jpg)

> 密切平面的几何解释
>
> ![1569481748880](assets/1569481748880.jpg)
>
> $p(t_0+\Delta t)$ 与过 $p(t_0)$ 法向为 $\pmb{a}$ 的平面之间的距离为
> $$
> \pmb{a} \cdot \left( p \left( t _ { 0 } + \Delta t \right) - p \left( t _ { 0 } \right) \right) = \pmb{a} \cdot \left( p' \left( t _ { 0 } \right) \Delta t + \frac { p'' \left(  t _ { 0 } \right) } { 2 ! } \Delta t ^ { 2 } + \cdots \right)
> $$
> 当距离最小时，有
> $$
> \pmb{a}\cdot p' \left( t _ { 0 } \right) =0,\pmb{a}\cdot p''(t_0)=0
> $$
> 密切平面是在 $p(t_0)$ 最契合曲线的平面。

从切平面（rectifying plane）R 垂直于法平面和密切平面。

从切平面上一点 $p$ 满足
$$
((c'\times c'')\times c')\cdot(p-c)=0
$$
![1569482371745](assets/1569482371745.jpg)

从切平面的法向称为主法向（principal normal）$\pmb{n}=\pmb{b}\times\pmb{t}$。

曲率（curvature）衡量曲线的弯曲程度，定义为
$$
\kappa(t)=\frac{\|c'(t)\times c''(t)\|}{\|c'(t)\|^3}
$$

> 直线曲率为 0
>
> 圆曲率为常数（$\kappa=1/r,r=1/\kappa$）
>
> ![1569483280640](assets/1569483280640.jpg)

对于平面正则曲线 $c(t)=(x(t),y(t))$ 有
$$
\kappa ( t ) = \frac { \left| x ^ { \prime } y ^ { \prime \prime } - x ^ { \prime \prime } y ^ { \prime } \right| } { \left( x ^ { \prime 2 } + y ^ { \prime 2 } \right) ^ { \frac { 3 } { 2 } } }
$$
相应的带符号曲率为
$$
\kappa ( t ) = \frac { x ^ { \prime } y ^ { \prime \prime } - x ^ { \prime \prime } y ^ { \prime } } { \left( x ^ { \prime 2 } + y ^ { \prime 2 } \right) ^ { \frac { 3 } { 2 } } }
$$
扰率（torsion）衡量副法线的变化率，定义为
$$
\tau(t)=\frac{(c'\times c'')\cdot c'''}{\|c'\times c''\|^2}
$$

> 平面曲线和二次曲线的扰率为 0

## 弧长参数化曲线

正则曲线（$\dot c\neq 0$）弧长定义为
$$
\text{length}_c=\int_a^b\|\dot{c}\|\mathbb{d}t
$$
其中 $\dot{c}=\mathbb{d}c/\mathbb{d}t$。

![1569484074669](assets/1569484074669.jpg)

弧长独立于参数化。（积分变量代换可证）

从 0 到 t 的弧长为
$$
s(t)=\int_0^t\|c'(\tau)\|\mathbb{d}\tau
$$
则
$$
\frac{\mathbb{d}s}{\mathbb{d}t}=\|c'(\tau)\|>0
$$
弧长参数化曲线 $c(s)$ 有
$$
\|c'(s)\|
=\left\|\frac{\mathbb{d} c}{\mathbb{d}s}\right\|
=\left\|\frac{\mathbb{d} c/\mathbb{d} t}{\mathbb{d} s/\mathbb{d} t}\right\|=1
$$
> $\|c'(t)\|=1$ 的曲线 $c(t)$ 就是弧长参数化曲线

则 $c'\cdot c'=1$，两边求导可得 $c'\cdot c''=0$，故主法向为
$$
\pmb{n}=\frac{c''}{\|c''\|}
$$

> 注意这里的 $c'$ 和 $c''$ 是对 $s$ 求导

弧长参数化曲线的曲率为
$$
\kappa=\|c''\|
$$

## Frenet 曲线

Frenet 曲线 $c(s)$ 是一种在 $\mathbb{R}^n$ 上的弧长参数化曲线，要求 $c'(s),c''(s),\dots,c^{(n)}(s)$ 线性无关。

每个 Frenet 曲线有唯一的 Frenet 坐标系 $e_1(s),e_2(s),\dots,e_n(s)$，它们正交。可对 $\{c',c'',\dots,c^{(n)}\}$ 进行 Gram-Schmidt 正交化。

> Gram-Schmidt 正交化
>
> ![1569487873868](assets/1569487873868.jpg)

平面曲线
$$
e_1(s)=c'(s)\\
e_2(s)=R^{90^\circ}e_1(s)\\
\left( \begin{array} { l } { e _ { 1 } ( s ) } \\ { e _ { 2 } ( s ) } \end{array} \right) ^ { \prime } = \left( \begin{array} { c c } { 0 } & { \kappa ( s ) } \\ { - \kappa ( s ) } & { 0 } \end{array} \right) \left( \begin{array} { l } { e _ { 1 } ( s ) } \\ { e _ { 2 } ( s ) } \end{array} \right)\\
\kappa ( s ) = \left\langle e _ { 1 } ^ { \prime } ( s ) , e _ { 2 } ( s ) \right\rangle\\
$$

> 密切圆可表示为
> $$
> c(S)+\frac{1}{\kappa}e_2(s)
> $$

刚性变换（保形，不含缩放）为 $x\to Ax+b$ 其中 $A$ 是正交矩阵，$|A|=1$ 保向，$|A|=-1$ 镜像。

曲率在刚性变换下不变（绝对值不变，带符号值在保向变换下不变）。两曲率相同的曲线只差一个刚性变换。

找一个参数曲线的弧长参数化很难，但是仍然可以计算 Frenet 坐标系和弧长参数化曲线的导数。

任意可微函数的弧长导数为
$$
\frac{\mathbb{d}f}{\mathbb{d}s}=\frac{\mathbb{d}f}{\mathbb{d}t}\frac{\mathbb{d}t}{\mathbb{d}s}=\frac{\mathbb{d}f/\mathbb{d}t}{\|\mathbb{d}c/\mathbb{d}t\|}=\frac{\mathbb{d}f/\mathbb{d}t}{\|\dot{c}(t)\|}
$$
则

平面曲线的 Frenet 坐标系为
$$
e_1(t)=c'(t)=\frac{\dot{c}(t)}{\|\dot{c}(t)\|}\\
e_2(s)=R^{90^\circ}e_1(s)\\
$$
带符号曲率为
$$
\kappa ( t ) = \left\langle e _ { 1 } ^ { \prime } ( t ) , e _ { 2 } ( t ) \right\rangle=\frac { \left\langle \ddot { c } ( t ) , R ^ { 90 ^ { \circ } } \dot { c } ( t ) \right\rangle } { \| \dot { c } ( t ) \| ^ { 3 } }
$$
弧长参数化空间曲线的 Frenet 坐标系

切向量
$$
e_1(s)= c'(s)
$$
法向量
$$
e_2(s)=\frac{c''(t)}{\|c''(t)\|}
$$
副法向
$$
e_3(s)=e_1(s)\times e_2(s)
$$
Frenet-Serret equations
$$
\left( \begin{array} { c } { e _ { 1 } ( s ) } \\ { e _ { 2 } ( s ) } \\ { e _ { 3 } ( s ) } \end{array} \right) ^ { \prime } = \left( \begin{array} { c c c } { 0 } & { \kappa ( s ) } & { 0 } \\ { - \kappa ( s ) } & { 0 } & { \tau ( s ) } \\ { 0 } & { - \tau ( s ) } & { 0 } \end{array} \right) \left( \begin{array} { c } { e _ { 1 } ( s ) } \\ { e _ { 2 } ( s ) } \\ { e _ { 3 } ( s ) } \end{array} \right)
$$
带符号曲率为 $\kappa(s)=\langle e_1'(s),e_2(s) \rangle$，扰率 $\tau(s)=\langle e_2'(s),e_3(s)\rangle$。

## 总结

正则曲线

- 切向 $\pmb{t}=c'/\|c'\|$ 
- 副法向 $\pmb{b}=c'\times c''/\|c'\times c''\|$ 
- 主法向 $\pmb{n}=\pmb{b}\times{t}$ 
- 曲率 $\kappa(t)=c'\times c''/\|c'\|^3$ 
- 扰率 $\tau=(c'\times c'')\cdot c'''/\|c'\times c''\|^2$ 

弧长参数化曲线

- 切向 $\pmb{t}=c'$
- 副法向 $\pmb{b}=\pmb{t}\times\pmb{n}$ 
- 主法向 $\pmb{n}=c''/\|c''\|$ 
- 曲率 $\kappa(t)=\|c''\|$ 
- 带符号曲率 $\kappa(s)=c''$ 
- 扰率 $\tau = -\pmb{b'}\cdot \pmb{n}$ 

平面曲线

- 正则曲线曲率 $\kappa ( t ) =  \left| x ^ { \prime } y ^ { \prime \prime } - x ^ { \prime \prime } y ^ { \prime } \right| /  \left( x ^ { \prime 2 } + y ^ { \prime 2 } \right) ^ { \frac { 3 } { 2 } }$ 
- 正则曲线带符号曲率 $\kappa ( t ) = x ^ { \prime } y ^ { \prime \prime } - x ^ { \prime \prime } y ^ { \prime } /  \left( x ^ { \prime 2 } + y ^ { \prime 2 } \right) ^ { \frac { 3 } { 2 } }$ 

