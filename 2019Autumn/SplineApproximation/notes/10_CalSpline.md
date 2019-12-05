# 10. 样条函数的计算

## 10.1 样条函数及其导数值的计算

给定样条函数
$$
s(x)=\sum_{i}c_iN^m_i(x)
$$
**定理 10.1**（de Boor 算法）设
$$
s(x)=\sum_ic_iN^m_i(x)\quad(y_l\le x<y_{l+1})
$$
则
$$
\begin{aligned}
s(x)
&=\sum_{i=l+1-m}^lc^{[0]}_i(x)N^m_i(x)\\
&=\sum_{i=l+2-m}^lc^{[1]}_i(x)N^{m-1}_i(x)\\
&\dots\\
&=\sum_{i=l}^lc^{[m-1]}_i(x)N^1_i(x)\\
&=c^{[m-1]}_l(x)
\end{aligned}
$$
其中
$$
\begin{aligned}
c_i^{[0]}(x) &= c_i\\
c^{[j+1]}_i(x) &= \alpha_{i,j}(x)c^{[j]}_i(x)+(1-\alpha_{i,j}(x))c^{[j]}_{i-1}(x)\quad(j=0,\dots,m-2)\\
\alpha_{i,j}(x) &= \frac{x-y_i}{y_{i+m-1-j}-y_i}
\end{aligned}
$$

> 求 $s(x)$ 最终就是要求 $c^{[m-1]}_l(x)$，这可以通过递归公式来求解
>
> 基本的计算框架
>
> ![image-20191205190409994](assets/image-20191205190409994.jpg)
>
> ---
>
> 
> $$
> \begin{aligned}
> s(x)
> &= \sum_{i=l+1-m}^l c^{[0]}_i(x) N^m_i(x) \\
> &= \sum_{i=l+1-m}^l c^{[0]}_i(x) \left(\frac{x-y_i}{y_{i+m-1-y_i}}N^{m-1}_i(x)+\frac{y_{i+m}-x}{y_{i+m}-y_{i+1}}N^{m-1}_{i+1}(x)\right) \\
> &= \sum_{i=l+2-m}^l \frac{(x-y_i)c^{[0]}_i(x)+(y_{i+m-1}-x)c^{[0]}_{i-1}(x)}{y_{i+m-1}-y_i} N^{m-1}_i(x) \\
> &= \sum_{i=l+2-m}^l c^{[1]}_i(x) N^{m-1}_i(x)
> \end{aligned}
> $$
> 其中 $c^{[1]}_{i}(x)=\alpha_{i,0}(x)c^{[0]}_i(x) + (1-\alpha_{i,0}(x))c^{[0]}_{i-1}(x)$ 
>
> 对于一般的 $j$，有
> $$
> \begin{aligned}
> s ( x )
> & = \sum _ { i = l + j + 1 - m } ^ { l } c _ { i } ^ { [ j ] } ( x ) N _ { i } ^ { m - j } ( x ) \\
> & = \sum _ { i = l + j + 1 - m } ^ { l } c _ { i } ^ { [ j ] }(x) \left( \frac { \left( x - y _ { i } \right) N _ { i } ^ { m - j - 1 } ( x ) } { y _ { i + m - j - 1 } - y _ { i } } + \frac { \left( y _ { i + m - j } - x \right) N _ { i + 1 } ^ { m - j - 1 } ( x ) } { y _ { i + m - j } - y _ { i + 1 } } \right) \\
> & = \sum _ { i = l + j + 2 - m } ^ { l }  \frac { \left( x - y _ { i } \right)c _ { i } ^ { [ j ] }(x)+ \left( y _ { i + m - j -1 } - x \right)c _ { i-1 } ^ { [ j ] }(x) } { y _ { i + m - j - 1 } - y _ { i } } N _ { i } ^ { m - j - 1 } ( x )\\
> & = \sum _ { i = l + j + 2 - m } ^ { l } c _ { i } ^ { [ j + 1 ] } ( x ) N _ { i } ^ { m - j - 1 } ( x )
> \end{aligned}
> $$
> 其中
> $$
> \begin{aligned}
> c _ { i } ^ { [ j + 1 ] }
> &= \frac { \left( x - y _ { i } \right)c _ { i } ^ { [ j ] }(x)+ \left( y _ { i + m - j -1 } - x \right)c _ { i-1 } ^ { [ j ] }(x) } { y _ { i + m - j - 1 } - y _ { i } }\\
> &= \alpha_{i,j}(x)c^{[j]}_i(x) + (1-\alpha_{i,j}(x))c^{[j]}_{i-1}(x)
> \end{aligned}
> $$
> 则最终
> $$
> s(x)=\sum_{i=l}^lc^{[m-1]}_i(x) N^1_i(x)=c^{[m-1]}_l(x)
> $$

---

设 $x\in [y_l,y_{l+1})$，则
$$
\begin{aligned}
D_+s(x)
&=\sum_{i=l+1-m}^lc^{[0]}_iD_+N^m_i(x)\\
&=(m-1)\sum_{l+1-m}^lc^{[0]}_i\left(Q^{m-1}_i(x)-Q^{m-1}_{i+1}(x)\right)\\
&=(m-1)\sum_{l+1-m}^l\left(c^{[0]}_i-c^{[0]}_{i-1}\right)Q^{m-1}_i(x)\\
&=\sum_{i=l+2-m}^l c^{[1]}_iN^{m-1}_i(x)
\end{aligned}
$$
其中
$$
\begin{aligned}
c^{[0]}_i &= c_i\\
c^{[d]}_i &= \frac{(m-d)\nabla c^{[d-1]}_i}{y_{i+m-d}-y_i}
\end{aligned}
$$
其中 $\nabla c^{[d-1]}_i=c^{[d-1]}_i-c^{[d-1]}_{i-1}$ 

一般地，有
$$
D^d_+s(x)=\sum_{i=l+d+1-m}^l c^{[d]}_iN^{m-d}_i(x)
$$

> 这里的 $c^{[d]}_i$ 是常数，与 de Boor 算法定义的 $c^{[j]}_i(x)$ 不同