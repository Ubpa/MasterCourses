# 1

坐标系设置为

![image-20191107212120593](assets/image-20191107212120593.png)

x-z 平面内控制点为
$$
\begin{aligned}
\left[\begin{matrix}
\pmb{p}_{11} & \pmb{p}_{21} & \pmb{p}_{31}
\end{matrix}\right]
=
\left[\begin{matrix}
1 & 1 & 0\\
0 & 0 & 0\\
0 & 1 & 2\\
1 & 1 & 2
\end{matrix}\right]
\end{aligned}
$$
母线绕 $z$ 轴旋转 $\frac{\pi}{2}$ 所需控制点
$$
\begin{aligned}
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
有理 Bezier 曲面公式为
$$
\pmb{p}^{(hamo)}(u,v)=\sum_{i=0}^2\sum_{j=0}^2B^2_i(u)B^2_j(v)\pmb{p}_{ij}
$$
投影即可

这只是 $\frac{1}{8}$ 圆面，将所有控制点再旋转 7 次可得到完整球面

# 2

# 3