# 1

$d=1$，$\pmb{x}=(0,0,0)$ 的正方体的八个顶点对应矩阵为（第四列是齐次项）
$$
X_0 = \left[\begin{matrix}
        -1 &-1& -1 & 1\\
        -1 &-1 &1& 1\\
        1 &-1 &1& 1\\
        1 &-1& -1& 1\\
        -1 &1& -1& 1\\
        -1& 1& 1& 1\\
        1 &1 &1& 1\\
        1 &1 &-1& 1\\
\end{matrix}\right]
$$
模型矩阵为
$$
M=TS=\left[\begin{matrix}
1 & 0 & 0 & \pmb{x}.x\\
0 & 1 & 0 & \pmb{x}.y\\
0 & 0 & 1 & \pmb{x}.z\\
0 & 0 & 0 & 1\\
\end{matrix}\right]
\left[\begin{matrix}
d & 0 & 0 & 0\\
0 & d & 0 & 0\\
0 & 0 & d & 0\\
0 & 0 & 0 & 1\\
\end{matrix}\right]
$$
假设相机处于 $(0,0,0)$，朝向 $(0,0,-1)$，上方向为 $(0,1,0)$，成像距离为 1，则相机视矩阵 $V$ 和投影矩阵 $P$ 分别为
$$
\text{V} =
\left[\begin{matrix}
1 & 0 & 0& 0\\
0 & 1 & 0& 0\\
0 & 0 & -1& 0\\
0 & 0 & 0& 1\\
\end{matrix}\right], \quad 
P = \left[\begin{matrix}
1 & 0 & 0 & 0\\
0 & 1 & 0 & 0\\
0 & 0 & 1 & 0\\
0 & 0 & 1 & 0\\
\end{matrix}\right]
$$
则投影后坐标为
$$
X_1=(PVMX_0^\top)^\top
$$
最后做透视除法即可得成像平面坐标

示例如下

![image-20191103184412263](assets/image-20191103184412263.png)

# 2 和 3

3 个控制点的有理 Bezier 曲线和其对偶曲线可绘制椭圆和双曲线

记椭圆的控制点为 $\pmb{p}_0,\pmb{p}_1,\pmb{p}_2$，Bezier 曲线为 $\pmb{x}(t)$，对偶曲线为 $\pmb{x}^\prime(t)$；双曲线的控制点为 $\pmb{q}_0,\pmb{q}_1,\pmb{q}_2$，Bezier 曲线为 $\pmb{y}(t)$，对偶曲线为 $\pmb{y}^\prime(t)$ 

椭圆控制点矩阵 $P$ 和双曲线控制点矩阵 $Q$ 分别为
$$
P = 
\left[\begin{matrix}
\pmb{p}_0 & \pmb{p}_1 & \pmb{p}_2
\end{matrix}\right]
=
\left[\begin{matrix}
a & 0 & 1\\ 
a & b & 1\\ 
0 & 2b & 2\\ 
\end{matrix}\right],\quad 
Q = 
\left[\begin{matrix}
\pmb{q}_0 & \pmb{q}_1 & \pmb{q}_2
\end{matrix}\right]
=
\left[\begin{matrix}
a & 0 & 1\\ 
a & b & 1\\ 
2a & 2b & 0\\ 
\end{matrix}\right]
$$
其对偶曲线相当于 $\omega_1$ 取反，则对偶曲线的控制点矩阵为
$$
P^\prime
=
\left[\begin{matrix}
a & 0 & 1\\ 
-a & -b & -1\\ 
0 & 2b & 2\\ 
\end{matrix}\right],\quad 
Q^\prime =
\left[\begin{matrix}
a & 0 & 1\\ 
-a & -b & -1\\ 
2a & 2b & 0\\ 
\end{matrix}\right]
$$
采样点 $0=t_0<\dots<t_n=1$ 矩阵为
$$
T=\left[\begin{matrix}
1 & t_0 & t_0^2\\
\vdots & \vdots & \vdots\\
1 & t_n & t_n^2\\
\end{matrix}\right]
$$
二次 Bezier 相应矩阵为
$$
B = \left[\begin{matrix}
 1 &  0 & 0\\
-2 &  2 & 0\\
 1 & -2 & 1
\end{matrix}\right]
$$
则 $\pmb{x}(t),\pmb{x^\prime}(t),\pmb{y}(t),\pmb{y^\prime}(t)$ 上的采样点 $X,X^\prime,Y,Y^\prime$ 为
$$
X = T B P,\quad X^\prime=TBP^\prime\\
Y = T B Q,\quad Y^\prime=TBQ^\prime\\
$$
直接画出来就是 3D 的，进行透视投影后画出来就是 2D 的

![image-20191103191131914](assets/image-20191103191131914.png)

![image-20191103191150833](assets/image-20191103191150833.png)

![image-20191103191235672](assets/image-20191103191235672.png)

![image-20191103191628329](assets/image-20191103191628329.png)