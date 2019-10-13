# 1

证：令 $g=f-S$，设 $a=t_0<t_1<\dots<t_n=b$ 为插值节点，则 $g(t_i)=0(i=0,1,\dots,n)$，且
$$
\int _ { a } ^ { b } \left( f ^ { \prime \prime } ( x ) \right) ^ { 2 } \mathbb{d} x= \int _ { a } ^ { b } \left( S ^ { \prime \prime } ( x ) \right) ^ { 2 } \mathbb{d} x + \int _ { a } ^ { b } \left( g ^ { \prime \prime } ( x ) \right) ^ { 2 } \mathbb{d} x + 2 \int _ { a } ^ { b } \left( S ^ { \prime \prime } ( x ) g ^ { \prime \prime } ( x ) \right) \mathbb{d} x
$$
$S(x)$ 是自然插值三次样条函数，则 $S^{\prime\prime}(t_0)=S^{\prime\prime}(t_n)=0$ 且每个区间 $[t_{i-1},t_i]$ 上 $S^{\prime\prime\prime}(t)$ 是常数，记为 $s_i$，则
$$
\begin{aligned}
\int _ { a } ^ { b } \left( S ^ { \prime \prime } ( x ) g ^ { \prime \prime } ( x ) \right) \mathbb{d} x
& = \sum _ { i = 1 } ^ { n } \int _ { t _ { i - 1 } } ^ { t _ { i } } \left( S ^ { \prime \prime } ( x ) g ^ { \prime \prime } ( x ) \right) \mathbb{d} x \\
& = \sum _ { i = 1 } ^ { n } \left( S ^ { \prime \prime } g ^ { \prime } \left( t _ { i } \right) - S ^ { \prime \prime } g ^ { \prime } \left( t _ { i - 1 } \right) - \int _ { t _ { i - 1 } } ^ { t _ { i } } \left( S ^ { \prime \prime \prime } ( x ) g ^ { \prime } ( x ) \right) \mathbb{d} x \right) \\
& = S ^ { \prime \prime } g ^ { \prime } (t_n)-S ^ { \prime \prime } g ^ { \prime }(t_0) - \sum _ { i = 1 } ^ { n } \int _ { t _ { i - 1 } } ^ { t _ { i } } \left( S ^ { \prime \prime \prime } ( x ) g ^ { \prime } ( x ) \right) \mathbb{d} x \\
& = - \sum _ { i = 1 } ^ { n } s _ { i } \left( g \left( t _ { i } \right) - g \left( t _ { i - 1 } \right) \right) \\
& = 0
\end{aligned}
$$
则
$$
\int _ { a } ^ { b } \left( S ^ { \prime \prime } ( x ) \right) ^ { 2 } \mathbb{d} x = \int _ { a } ^ { b } \left( f ^ { \prime \prime } ( x ) \right) ^ { 2 } \mathbb{d} x - \int _ { a } ^ { b } \left( g ^ { \prime \prime } ( x ) \right) ^ { 2 } \mathbb{d} x \le \int _ { a } ^ { b } \left( f ^ { \prime \prime } ( x ) \right) ^ { 2 } \mathbb{d} x
$$

# 2

证：令 $g=S-S_f$，设 $a=t_0<t_1<\dots<t_n=b$ 为插值节点，则 $g(t_i)=0(i=0,1,\dots,n)$，且
$$
\int _ { a } ^ { b } \left( f ^ { \prime \prime } ( x ) - S ^ { \prime \prime } ( x ) \right) ^ { 2 } \mathbb{d} x

= \int _ { a } ^ { b } \left( f ^ { \prime \prime } ( x ) - S _ { f } ^ { \prime \prime } ( x ) \right) ^ { 2 } \mathbb{d} x

+ \int _ { a } ^ { b } \left( g ^ { \prime \prime } ( x ) \right) ^ { 2 } \mathbb{d} x

- 2 \int _ { a } ^ { b } \left( \left( f ^ { \prime \prime } ( x ) - S _ { f } ^ { \prime \prime } ( x ) \right) g ^ { \prime \prime } ( x ) \right) \mathbb{d} x
$$
$S_f(x)$ 带有斜率边界条件，则 $(f-S_f)^{\prime}(t_0)=(f-S_f)^{\prime}(t_n)=0$.

$S_f(x)$ 和 $S(x)$ 是三次样条函数，则每个区间 $[t_{i-1},t_i]$ 上 $S_f^{\prime\prime\prime}$ 和 $S^{\prime\prime\prime}$ 是常数，则 $g^{\prime\prime\prime}=S^{\prime\prime\prime}-S_f^{\prime\prime\prime}$ 也是常数，记为 $g_i$，则
$$
\begin{aligned}

\int _ { a } ^ { b } \left( \left( f ^ { \prime \prime } ( x ) - S _ { f } ^ { \prime \prime } ( x ) \right) g ^ { \prime \prime } ( x ) \right) \mathbb{d} x & = \sum _ { i = 1 } ^ { n } \int _ { t _ { i - 1 } } ^ { t _ { i } } \left( \left( f ^ { \prime \prime } ( x ) - S _ { f } ^ { \prime \prime } ( x ) \right) g ^ { \prime \prime } ( x ) \right) \mathbb{d} x \\

& = \sum _ { i = 1 } ^ { n } \left(\left( \left( f - S _ { f } \right) ^ { \prime } g ^ { \prime \prime } \left( t _ { i } \right) - \left( f - S _ { f } \right) ^ { \prime } g ^ { \prime \prime } \left( t _ { i - 1 } \right) \right) - \int _ { t _ { i - 1 } } ^ { t _ { i } } \left( \left( f - S _ { f } \right) ^ { \prime } ( x ) g ^ { \prime \prime \prime } ( x ) \right) \mathbb{d} x\right)\\

&= \left( f - S _ { f } \right) ^ { \prime } g ^ { \prime \prime } \left( t _ { n } \right) 
- \left( f - S _ { f } \right) ^ { \prime } g ^ { \prime \prime } \left( t _ { 0 } \right)
- \sum _ { i = 1 } ^ { n } \int _ { t _ { i - 1 } } ^ { t _ { i } } \left( \left( f - S _ { f } \right) ^ { \prime } ( x ) g ^ { \prime \prime \prime } ( x ) \right) \mathbb{d} x\\

&= - \sum _ { i = 1 } ^ { n } g _ { i } \int _ { t _ { i - 1 } } ^ { t _ { i } } \left( f - S _ { f } \right) ^ { \prime } ( x ) \mathbb{d} x\\

&= - \sum _ { i = 1 } ^ { n } g _ { i } \left( \left( f - S _ { f } \right) \left( t _ { i } \right) - \left( f - S _ { f } \right) \left( t _ { i - 1 } \right) \right)\\

&= 0

\end{aligned}
$$
则
$$
\int _ { a } ^ { b } \left( f ^ { \prime \prime } ( x ) - S _ { f } ^ { \prime \prime } ( x ) \right) ^ { 2 } \mathbb{d} x

= \int _ { a } ^ { b } \left( f ^ { \prime \prime } ( x ) - S ^ { \prime \prime } ( x ) \right) ^ { 2 } \mathbb{d} x

- \int _ { a } ^ { b } \left( g ^ { \prime \prime } ( x ) \right) ^ { 2 } \mathbb{d} x

\le \int _ { a } ^ { b } \left( f ^ { \prime \prime } ( x ) - S ^ { \prime \prime } ( x ) \right) ^ { 2 } \mathbb{d} x
$$
