# 9. 细分曲线和曲面

样条曲面的拓扑是受限的，拼接多块样条曲面很困难

## 9.1 细分曲线

- 提供几何体的粗略表示
- 获得光滑的表示
- 通过递归使用一些方法来实现
- 简化建模

![image-20191127143902162](assets/image-20191127143902162.jpg)

> 缺点：没有了参数化表示

基础方案

- 细分当前网格
- 插入线性插值点（spiltting）
- 移动点（局部加权平均）（averaging）

![image-20191127144326680](assets/image-20191127144326680.jpg)

### 9.1.1 Corner Cutting Splines [Chaikin 1974]

- 划分每条直线段成两半
- 与顺时针的邻点求平均
- 重复

![image-20191127144816254](assets/image-20191127144816254.jpg)

记号

- $l$ 阶控制点：$p^{(l)}_i$ 
- $l+1$ 阶划分点：$\widetilde{p}_i^{l+1}$ 
- $l+1$ 阶平均后的控制点：$p_i^{l+1}$ 

![image-20191127145616746](assets/image-20191127145616746.jpg)

矩阵表示

- 划分矩阵

$$
\left[\begin{matrix}
\vdots\\
\widetilde{x}_{2i-2}^{(l+1)}\\
\widetilde{x}_{2i-1}^{(l+1)}\\
\widetilde{x}_{2i}^{(l+1)}\\
\widetilde{x}_{2i+1}^{(l+1)}\\
\widetilde{x}_{2i+2}^{(l+1)}\\
\vdots
\end{matrix}\right]_{2n \times 1}
=
\left[\begin{matrix}
\ddots & & & &\\
& 1 & & &\\
& \frac{1}{2} & \frac{1}{2} & &\\
& & 1 & &\\
& & \frac{1}{2} & \frac{1}{2} &\\
& & & 1 &\\
& & & &\ddots\\
\end{matrix}\right]_{2n\times n}
\left[\begin{matrix}
\vdots\\
x_{i-1}^{(l)}\\
x_{i}^{(l)}\\
x_{i+1}^{(l)}\\
\vdots
\end{matrix}\right]_{n \times 1}
$$

- 平均矩阵

$$
\left[\begin{matrix}
\vdots\\
x_{2i}^{(l+1)}\\
\vdots
\end{matrix}\right]_{2n \times 1}
=
\left[\begin{matrix}
\ddots & & &\\
& \frac{1}{2} & \frac{1}{2} &\\
& & &\ddots\\
\end{matrix}\right]_{2n\times 2n}
\left[\begin{matrix}
\vdots\\
\widetilde{x}_{2i}^{(l)}\\
\widetilde{x}_{2i+1}^{(l)}\\
\vdots
\end{matrix}\right]_{2n \times 1}
$$

相同方法的不同表示
$$
\begin{aligned}
Q_{2i}&=\frac{3}{4}P_i+\frac{1}{4}P_{i+1}\\
Q_{2i+1}&=\frac{1}{4}P_i+\frac{3}{4}P_{i+1}
\end{aligned}
$$
![image-20191127151101172](assets/image-20191127151101172.jpg)

- 对每条边，插入 $\frac{1}{4}$ 和 $\frac{3}{4}$ 点，删去旧点；重复
- 极限曲线是 $C^1$ 的

![image-20191127151225217](assets/image-20191127151225217.jpg)

准确的写为
$$
\begin{aligned}
P^{(k+1)}_{2i}&=\frac{3}{4}P^{(k)}_i+\frac{1}{4}P^{(k)}_{i+1}\\
P^{(k+1)}_{2i+1}&=\frac{1}{4}P^{(k)}_i+\frac{3}{4}P^{(k)}_{i+1}
\end{aligned}
$$
每次迭代点数加倍

写成矩阵的形式
$$
\left[\begin{matrix}
\vdots\\
p^{k+1}_{2i-2}\\
p^{k+1}_{2i-2}\\
p^{k+1}_{2i-2}\\
p^{k+1}_{2i-2}\\
p^{k+1}_{2i-2}\\
p^{k+1}_{2i-2}\\
\vdots
\end{matrix}\right]_{2n\times 1}
=\frac{1}{4}
\left[\begin{matrix}
\ddots\\
 & 3 & 1 & 0 & 0\\
 & 1 & 3 & 0 & 0\\
 & 0 & 3 & 1 & 0\\
 & 0 & 1 & 3 & 0\\
 & 0 & 0 & 3 & 1\\
 & 0 & 0 & 1 & 3\\
 &   &   &   &   &\ddots\\
\end{matrix}\right]_{2n\times n}
\left[\begin{matrix}
\vdots\\
p^{k+1}_{i-1}\\
p^{k+1}_{i}\\
p^{k+1}_{i+1}\\
p^{k+1}_{i+2}\\
\vdots\\
\end{matrix}\right]_{n\times 1}
$$
极限是 2 次 B 样条

### 9.1.2 d 次 B 样条细分

Lane -Riesenfeld subdivision 算法

- 各边加中点
- 将每条边用中点替代，重复 $d$ 次

> **示例** 
>
> $d=2$ 
>
> ![image-20191127153832697](assets/image-20191127153832697.jpg)
>
> ![image-20191127154259349](assets/image-20191127154259349.jpg)
>
> ![image-20191127154314121](assets/image-20191127154314121.jpg)
>
> $a_1$ 是 $A$ 和 $B$ 的中点
>
> $c_1$ 是 $B$ 和 $C$ 的中点

$d=2$ 时

矩阵表示
$$
\left[\begin{matrix}
\vdots\\
p_{2i}^{(l+1)}\\
p_{2i+1}^{(l+1)}\\
\vdots
\end{matrix}\right]
=
\left[\begin{matrix}
\ddots\\
& \frac{1}{8} & \frac{3}{4} & \frac{1}{8} \\
&             & \frac{1}{2} & \frac{1}{2} \\
&             &             &             & \ddots\\
\end{matrix}\right]
\left[\begin{matrix}
\vdots\\
p_{i}^{(l)}\\
p_{i+1}^{(l)}\\
p_{i+2}^{(l)}\\
\vdots
\end{matrix}\right]
$$

$$
p_{2i}^{(l+1)}=\frac{1}{8}p_i^{(l)}+\frac{3}{4}p_{i+1}^{(l)}+\frac{1}{8}p_{i+2}^{(l)}
$$

极限是 $C^2$ 连续的

mask 为 $h=\frac{1}{8}[\dots,0,0,1,4,6,4,1,0,0,\dots]$ 

一般情况时，mask为
$$
\frac{1}{2^{d+1}}\left(\dots,C_{d+2}^0,\dots,C_{d+2}^{d+2},\dots\right)
$$

### 谱收敛分析

> 考虑三次 B 样条细分策略

局部收敛

![image-20191127164559582](assets/image-20191127164559582.jpg)
$$
\left( \begin{array} { c }
{ x _ { - } ^ { [ l + 1 ] } } \\
{ x ^ { [ l + 1 ] } } \\
{ x _ { + } ^ { [ l + 1 ] } } \end{array}
\right)
= \left( \begin{array} { c c c } { \frac { 1 } { 2 } } & { \frac { 1 } { 2 } } & { 0 } \\
{ \frac { 1 } { 8 } } & { \frac { 3 } { 4 } } & { \frac { 1 } { 8 } } \\
{ 0 } & { \frac { 1 } { 2 } } & { \frac { 1 } { 2 } }
\end{array} \right)
\left( \begin{array} { c }
{ x _ { - } ^ { [ l ] } } \\
{ x ^ { [ l ] } } \\
{ x _ { + } ^ { [ l ] } }
\end{array} \right)
$$
令
$$
M
=\left( \begin{array} { c c c }
{ \frac { 1 } { 2 } } & { \frac { 1 } { 2 } } & { 0 } \\
{ \frac { 1 } { 8 } } & { \frac { 3 } { 4 } } & { \frac { 1 } { 8 } } \\
{ 0 } & { \frac { 1 } { 2 } } & { \frac { 1 } { 2 } }
\end{array} \right)
=\left( \begin{array} { c c c }
{ 1 } & { -1 } & { -2 } \\
{ 1 } & { 0 } & { 1 } \\
{ 1 } & { 1 } & { -2 }
\end{array} \right)
\left( \begin{array} { c c c }
{ 1 } & { 0 } & { 0 } \\
{ 0 } & { \frac{1}{2} } & { 0 } \\
{ 0 } & { 0 } & { \frac{1}{4} }
\end{array} \right)
\left( \begin{array} { c c c }
{ \frac{1}{6} } & { \frac{2}{3} } & { \frac{1}{6} } \\
{ -\frac{1}{2} } & { 0 } & { \frac{1}{2} } \\
{ -\frac{1}{6} } & { \frac{1}{3} } & { -\frac{1}{6} }
\end{array} \right)\triangleq UDU^{-1}
$$
则
$$
\begin{aligned}
\left( \begin{array} { c }
{ x _ { - } ^ { [ \infty ] } } \\
{ x ^ { [ \infty ] } } \\
{ x _ { + } ^ { [ \infty ] } } \end{array}
\right)
&=\lim_\limits{l\to\infty}M^l
\left( \begin{array} { c }
{ x _ { - } ^ { [ 0 ] } } \\
{ x ^ { [ 0 ] } } \\
{ x _ { + } ^ { [ 0 ] } }
\end{array} \right)\\
&=\lim_\limits{l\to\infty}UD^lU^{-1}
\left( \begin{array} { c }
{ x _ { - } ^ { [ 0 ] } } \\
{ x ^ { [ 0 ] } } \\
{ x _ { + } ^ { [ 0 ] } }
\end{array} \right)\\
&=U\left(\lim_\limits{l\to\infty}D^l\right)U^{-1}
\left( \begin{array} { c }
{ x _ { - } ^ { [ 0 ] } } \\
{ x ^ { [ 0 ] } } \\
{ x _ { + } ^ { [ 0 ] } }
\end{array} \right)\\
&=U
\left[\begin{matrix}
1 & 0 & 0\\
0 & 0 & 0\\
0 & 0 & 0
\end{matrix}\right]
U^{-1}
\left( \begin{array} { c }
{ x _ { - } ^ { [ 0 ] } } \\
{ x ^ { [ 0 ] } } \\
{ x _ { + } ^ { [ 0 ] } }
\end{array} \right)\\
\end{aligned}
$$
则
$$
x^{[\infty]}=
\left[\frac{1}{6},\frac{2}{3},\frac{1}{6}\right]
\left( \begin{array} { c }
{ x _ { - } ^ { [ 0 ] } } \\
{ x ^ { [ 0 ] } } \\
{ x _ { + } ^ { [ 0 ] } }
\end{array} \right)
$$
收敛必要条件：1 是最大的特征值（绝对值）

仿射不变性要求局部矩阵行和为 1，这意味着 $\pmb{1}$ 向量必须是特征值 $1$ 的特征向量

## 9.2 细分曲面

### 9.2.1 张量积 B 样条细分曲面

- 从一个**四边形网格**出发
- 细分步骤
  - 将每个四边形划分成四个
  - 使用 2D 的平均 mask

![image-20191127190422992](assets/image-20191127190422992.jpg)

![image-20191127200539987](assets/image-20191127200539987.jpg)

双二次

B 样条块的矩阵表示为
$$
P(u,v)=
\left[\begin{matrix}
1 & u & u^2
\end{matrix}\right]
MPM^\top
\left[\begin{matrix}
1\\v\\v^2
\end{matrix}\right]
$$
其中
$$
M=\frac{1}{2}\left[\begin{matrix}
1 & 1 & 0\\
-2 & 2 & 0\\
1 & -2 & 1\\
\end{matrix}\right],\quad 
P=\left[\begin{matrix}
P_{0,0} & P_{0,1} & P_{0,2}\\
P_{1,0} & P_{1,1} & P_{1,2}\\
P_{2,0} & P_{2,1} & P_{2,2}
\end{matrix}\right]
$$
![image-20191127204859604](assets/image-20191127204859604.jpg)

考虑 2 x 2 块的其中一块（如 $u,v\in[0,\frac{1}{2}]$），考虑新的曲面块 $P^\prime$ 参数为 $u^\prime=\frac{u}{2}$，$v^\prime=\frac{v}{2}$ 

则
$$
\begin{aligned}
P^\prime(u,v)
&=P(\frac{u}{2},\frac{v}{2})\\
&=\left[\begin{matrix}
1&\frac{u}{2}&\frac{u^2}{4}
\end{matrix}\right]MPM^\top
\left[\begin{matrix}
1\\\frac{v}{2}\\\frac{v^2}{4}
\end{matrix}\right]\\
&\dots\\
&=\left[\begin{matrix}
1 & u & u^2
\end{matrix}\right]MP^\prime M^\top \left[\begin{matrix}
1\\v\\v^2
\end{matrix}\right]
\end{aligned}
$$
其中
$$
P^\prime=SPS^T\\
S=M^{-1}\left[\begin{matrix}
1 & 0 & 0\\
0 & \frac{1}{2} & 0\\
0 & 0 & \frac{1}{4}
\end{matrix}\right]M=\frac{1}{4}\left[\begin{matrix}
3 & 4 & 0\\
1 & 3 & 0\\
0 & 3 & 1
\end{matrix}\right]
$$

```matlab
M=0.5*[1 1 0
-2 2 0
1 -2 1];
S = inv(M)*diag([1,1/2,1/4])*M;
syms P00 P01 P02 P10 P11 P12 P20 P21 P22;
P=[P00 P01 P02
P10 P11 P12
P20 P21 P22];
nP = S*P*S';
```

![image-20191127205916135](assets/image-20191127205916135.jpg)

对于三次的情形
$$
S=\frac{1}{8}\left[\begin{matrix}
4 & 4 & 0 & 0\\
1 & 6 & 1 & 0\\
0 & 4 & 4 & 0\\
0 & 1 & 6 & 1
\end{matrix}\right]
$$
![image-20191127210757293](assets/image-20191127210757293.jpg)

### Catmull-Clark subdivision

- Step 0: split every polygon (any # of sides) into quadrilaterals: 
- New vertex positions are weighted combination of old ones: 

![image-20191127213527531](assets/image-20191127213527531.jpg)

![image-20191127213813628](assets/image-20191127213813628.jpg)

### 其他细分方法

- Catmull-Clark：quad-mesh，近似，$C^2$ 曲面，顶点 $C^1$ 
- loop：triangular，近似，$C^2$ 曲面，顶点 $C^1$ 
- butterfly：triangular，插值，$C^1$ 曲面，顶点 $C^1$ 

![image-20191127214015051](assets/image-20191127214015051.jpg)

**loop** 

- Subdivision scheme for triangle meshes 
- Curvature is continuous away from irregular vertices (“C2”) 
- Algorithm:
  - Split each triangle into four (4-1 subdivision)![image-20191127214319275](assets/image-20191127214319275.jpg)
  - Assign new vertex positions according to weights![image-20191127214342597](assets/image-20191127214342597.jpg)
  - 4-1 subdivision
    - Split every edge of the mesh *in any order whatsoever*.
    - Flip any new edge that touches a new vertex and an old vertex.![image-20191127214436544](assets/image-20191127214436544.jpg)

**butterfly** 

- 原本的点不变（插值）
- 新点取平均![image-20191127214628178](assets/image-20191127214628178.jpg)
- $C^1$，除了顶点
- 能变成各处 $C^1$ 

## 9.3 扩展

### 9.3.1 硬件曲面细分

![image-20191127214705658](assets/image-20191127214705658.jpg)

![image-20191127214717674](assets/image-20191127214717674.jpg)

### 9.3.2 随机细分

- 粗糙的网格形成形状
- 使用光滑细分方法
- 在每一个细分步骤，对新增的点施加噪声
- 想法
  - 一开始控制低频，然后控制高频

![image-20191127214851151](assets/image-20191127214851151.jpg)

