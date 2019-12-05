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

## 10.2 对称多项式和开花算法

### 10.2.1 多项式的开花

 设 $b(u)$ 是一个 $n$ 次多项式，它对应一个 $n$ 元多项式 $b(u_1,\dots,u_n)$，满足

- 仿射：$\begin{aligned}&b(u_1,\dots,u_{i-1},\alpha u+(1-\alpha) v,u_{i+1},\dots,u_n)\\=&\alpha b(u_1,\dots,u_{i-1},u,u_{i+1},\dots,u_n)+(1-\alpha)b(u_1,\dots,u_{i-1},v,u_{i+1},\dots,u_n)\end{aligned}$
- 对称：$b(u_1,\dots,u_n)=b(u_{\sigma(1)},\dots,u_{\sigma(n)})$ 
- 对角：$b(u)=b(u,\dots,u)$ 

**定义 10.1** 将满足对角关系的、对称的、$n$ 仿射的多项式 $b(u_1,\dots,u_n)$ 称为多项式 $b(u)$ 的**开花** blossom，也称为**极形式** polar form

> $b(u)=\sum_{i=0}^m c_iu^i$，则
> $$
> b(u_1,\dots,u_m)=\sum_{i=0}^m\frac{c_i}{\mathrm{C}_m^i}\sum_{1\le j_1<\cdots<j_i\le n}u_{j_1}\dots u_{j_i}
> $$

**定理 10.2** 对于任意 $n$ 次多项式 $b(u)$，存在唯一的、满足对角关系的、对称的、$n$ 仿射的多项式 $b(u_1,\dots,u_n)$，且
$$
b_i=b(\underbrace{0,\dots,0}_{n-i},\underbrace{1,\dots,1}_i)
$$
是 $b(u)$ 在 $[0,1]$ 上的 **Bezier 系数（点）**，即
$$
b(u)=\sum_{i=0}^n b_iB^n_i(u)
$$
其中
$$
B^n_i(u)\triangleq \mathrm{C}_n^iu^i(1-u)^{n-i}
$$
为 **Bernstein 多项式** 

---

对区间 $[a,b]$，有
$$
b(u)=\sum_{i=0}^n b(\underbrace{a,\dots,a}_{n-i},\underbrace{b,\dots,b}_{i})B^n_i(u)
$$
其中
$$
B^n_i(u)=\mathrm{C}_n^i\left(\frac{u-a}{b-a}\right)^i\left(\frac{b-u}{b-a}\right)^{n-i}=\mathrm{C}_n^it^i(1-t)^{n-i}
$$

其中 $t=\frac{u-a}{b-a}$ 

### 10.2.2 多项式开花的算法

**定理 10.3** 设已知 $n+1$ 个值 $b(t_{i+1},\dots,t_{i+n})\ (i=0,\dots,n)$，为了计算 $b(u_1,\dots,u_n)$，我们有如下算法：

设 $b^0_i=b(t_{i+1},\dots,y_{i+n})\ (i=0,\dots,n)$，则
$$
b^r_i(u_1,\dots,u_r)=\alpha_{i,r-1}b^{r-1}_i(u_1,\dots,u_{r-1})+(1-\alpha_{i,r-1})b^{r-1}_{i-1}(u_1,\dots,u_{r-1})
$$
其中
$$
\begin{aligned}
&\alpha_{i,r-1}=\frac{u_r-t_i}{t_{i+n+1-r}-t_i}\\
&b^r_i(u_1,\dots,u_r)=b(u_1,\dots,u_r,t_{i+1},\dots,t_{i+n-r})\\
&(r=1,\dots,n;i=r,\dots,n)
\end{aligned}
$$
因此
$$
b^n_n(u_1,\dots,u_n)=b(u_1,\dots,u_n)
$$

> 计算框架
>
> ![image-20191206004021567](assets/image-20191206004021567.jpg)
>
> ---
>
> **证明** 
> $$
> \begin{aligned}
> b^r_i(u_1,\dots,u_r)
> &=b(u_1,\dots,u_r,t_{i+1},\dots,t_{i+n-r})\\
> &=\alpha_{i,r-1} b(u_1,\dots,u_{r-1},t_{i+1},\dots,t_{i+n+1-r})+(1-\alpha_{r-1})b(u_1,\dots,u_{r-1},t_i,\dots,t_{i+n-r})\\
> &=\alpha_{i,r-1} b^{r-1}_i(u_1,\dots,u_{r-1})+(1-\alpha_{i,r-1})b^{r-1}_{i-1}(u_1,\dots,u_{r-1})\\
> \end{aligned}
> $$
> 因此
> $$
> b^n_n(u_1,\dots,u_n)=b(u_1,\dots,u_n)
> $$

**定理 10.4** 设 $s(u)=\sum_i c_iN^m_i(x)$，当 $u\in[y_j,y_{j+1})$ 时，$s(u)=s_j(u)$。设 $s_j(u_1,\dots,u_{m-1})$ 是 $s_j(u)$ 的开花，则
$$
s(u)=s_j(u,\dots,u)=\sum_{j-m+1}^j s_j(y_{i+1},\dots,y_{i+m-1})N^{m-1}_i(u)
$$
