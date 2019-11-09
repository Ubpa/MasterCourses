# 1

控制点为
$$
\begin{aligned}
\left[\begin{matrix}
\pmb{p}_{11} & \pmb{p}_{21} & \pmb{p}_{31}
\end{matrix}\right]
&
=
\left[\begin{matrix}
1 & 1 & 0\\
0 & 0 & 0\\
0 & 1 & 2\\
1 & 1 & 2
\end{matrix}\right]\\
\left[\begin{matrix}
\pmb{p}_{12} & \pmb{p}_{22} & \pmb{p}_{32}
\end{matrix}\right]
&=
\left[\begin{matrix}
1 & 1 & 0\\
1 & 1 & 0\\
0 & 1 & 2\\
1 & 1 & 2
\end{matrix}\right]\\
\left[\begin{matrix}
\pmb{p}_{13} & \pmb{p}_{23} & \pmb{p}_{33}
\end{matrix}\right]
&=
\left[\begin{matrix}
0 & 0 & 0\\
2 & 2 & 0\\
0 & 2 & 4\\
2 & 2 & 4
\end{matrix}\right]\\
\end{aligned}
$$
双二次有理 Bezier 曲面公式为
$$
\pmb{p}^{(hom)}(u,v)=\sum_{i=0}^2\sum_{j=0}^2B^2_i(u)B^2_j(v)\pmb{p}_{ij}
$$
投影即可得到欧式空间的球面

这只是 $\frac{1}{8}$ 球面，将所有控制点通过多次镜面反射可得到完整球面

![image-20191109110933585](assets/image-20191109110933585.png)

# 2

椭圆的一般方程为

$$
\frac{x^2}{a^2}+\frac{y^2}{b^2}+\frac{z^2}{c^2}=1
$$

对于题设可知 $a=\frac{\sqrt{3}}{3}$，$b=\frac{\sqrt{2}}{2}$，$c=1$ 
$$
\frac{x^2}{a^2}+\frac{y^2}{b^2}+\frac{z^2}{c^2}=1
$$
控制点为
$$
\begin{aligned}
\left[\begin{matrix}
\pmb{p}_{11} & \pmb{p}_{21} & \pmb{p}_{31} & \pmb{p}_{41}
\end{matrix}\right]
&= \left[\begin{matrix}
a & a & \frac{2}{3}a & 0\\
0 & 0 & 0 & 0\\
0 & \frac{2}{3}c & \frac{4}{3}c & 2c\\
1 & 1 & \frac{4}{3} & 2\\
\end{matrix}\right]\\
\left[\begin{matrix}
\pmb{p}_{12} & \pmb{p}_{22} & \pmb{p}_{32}  & \pmb{p}_{42}
\end{matrix}\right]
&=
\left[\begin{matrix}
a & a & \frac{2}{3}a & 0\\
\frac{2}{3}b & \frac{2}{3}b & \frac{4}{9}b & 0\\
0 & \frac{2}{3}c & \frac{4}{3}c & 2c\\
1 & 1 & \frac{4}{3} & 2\\
\end{matrix}\right]\\
\left[\begin{matrix}
\pmb{p}_{13} & \pmb{p}_{23} & \pmb{p}_{33}  & \pmb{p}_{43}
\end{matrix}\right]
&=
\left[\begin{matrix}
\frac{2}{3}a & \frac{2}{3}a & \frac{4}{9}a & 0\\
\frac{4}{3}b & \frac{4}{3}b & \frac{8}{9}b & 0\\
0 & \frac{8}{9}c & \frac{16}{9}c & \frac{8}{3}c\\
\frac{4}{3} & \frac{4}{3} & \frac{16}{9} & \frac{8}{3}\\
\end{matrix}\right]\\
\left[\begin{matrix}
\pmb{p}_{14} & \pmb{p}_{24} & \pmb{p}_{34}  & \pmb{p}_{44}
\end{matrix}\right]
&=
\left[\begin{matrix}
0 & 0 & 0 & 0\\
2b & 2b & \frac{4}{3}b & 0\\
0 & \frac{4}{3}c & \frac{8}{3}c & 4c\\
2 & 2 & \frac{8}{3} & 4\\
\end{matrix}\right]\\
\end{aligned}
$$

双三次有理 Bezier 曲面公式为
$$
\pmb{p}^{(hom)}(u,v)=\sum_{i=0}^3\sum_{j=0}^3B^3_i(u)B^3_j(v)\pmb{p}_{ij}
$$
投影即可

这只是 $\frac{1}{8}$ 椭球面，将所有控制点通过多次镜面反射可得到完整椭球面

![image-20191109111005705](assets/image-20191109111005705.png)

# 3

$$
\begin{array}{llll}
p_1 &=\frac{1}{2}a  &         &+\frac{1}{2}c\\
p_2 &=\frac{7}{10}a  &-\frac{3}{40}b  &+\frac{3}{8}c\\
p_3 &=\frac{1}{4}a &+\frac{1}{4}b   &+\frac{1}{2}c\\
\end{array}
$$

则 $p_1$ 在三角形边上，$p_2$ 在三角形外，$p_3$ 在三角形内
$$
\begin{aligned}
F(a,p_3)
&=F\left(a,\frac{1}{4}a+\frac{1}{4}b+\frac{1}{2}c\right)\\
&=\frac{1}{4}F(a,a)+\frac{1}{4}F(a,b)+\frac{1}{2}F(a,c)\\
&=
\left[\begin{matrix}
\frac{5}{2}\\
-\frac{1}{2}\\
4
\end{matrix}\right]\\
F(b,p_3)
&=F\left(b,\frac{1}{4}a+\frac{1}{4}b+\frac{1}{2}c\right)\\
&=\frac{1}{4}F(a,b)+\frac{1}{4}F(b,b)+\frac{1}{2}F(b,c)\\
&=
\left[\begin{matrix}
\frac{11}{2}\\
\frac{3}{2}\\
3
\end{matrix}\right]\\
F(c,p_3)
&=F\left(c,\frac{1}{4}a+\frac{1}{4}b+\frac{1}{2}c\right)\\
&=\frac{1}{4}F(a,c)+\frac{1}{4}F(b,c)+\frac{1}{2}F(c,c)\\
&=
\left[\begin{matrix}
6\\
-\frac{5}{2}\\
\frac{9}{2}
\end{matrix}\right]\\
F(p_3,p_3)&=F\left(\frac{1}{4}a+\frac{1}{4}b+\frac{1}{2}c,p_3\right)\\
&=\frac{1}{4}F(a,p_3)+\frac{1}{4}F(b,p_3)+\frac{1}{2}F(c,p_3)\\
&=\left[\begin{matrix}
5\\
-1\\
4
\end{matrix}\right]
\end{aligned}
$$
