# CAGD Homework 01

> 姓名：庄涛
>
> 序号：36
>
> 学号：SA1900174
>
> 日期：2019/09/11

## 1. 原理

### 1.1 插值

数据点对应的方程组可写为
$$
M\boldsymbol{\alpha}=\mathbf{y}
$$
则有
$$
\alpha = M^{-1}y
$$

#### 1.1.1 幂基

$$
f(x) = \sum_{i=0}^{n-1}\alpha_i B_i(x)
$$

其中

$$
B_i(x)=x^i,i=0,1,2,\dots,n-1
$$

#### 1.1.2 Gauss 基

$$
f(x)=b_0 + \sum_{i=0}^{n-1}\alpha_i g_i(x)
$$

其中

$$
g_i(x)=\exp\left({-\frac{(x-\mu_i)^2}{2\sigma^2}}\right), \mu_i=x_i,i=0,1,2,\dots,n-1
$$

### 1.2 拟合

最小二乘法

$$
\mathop{\arg\min}_{\alpha} \sum_{i=0}^n(y_i-f(x_i))^2=\mathop{\arg\min}_{\boldsymbol{\alpha}} \boldsymbol{\alpha} M^\top M\boldsymbol{\alpha}-2\mathbf{y}^\top M\boldsymbol{\alpha}+\mathbf{y}^\top \mathbf{y}
$$

最小解满足
$$
M^\top M\boldsymbol{\alpha}=M^\top\mathbf{y}
$$
则
$$
\boldsymbol{\alpha}=(M^\top M)^{-1}M^\top\mathbf{y}
$$

#### 1.2.1 幂基

$$
f(x) = \sum_{i=0}^{m-1}\alpha_i B_i(x)
$$

其中 $m<n$ 

#### 1.2.2 傅里叶基

$$
f(x)=b_0+\sum_{i=1}^mb_iF_i(x)
$$

其中 $m<n$，且
$$
\begin{aligned}
F_{2i-1}(x) &= \sin(2i\pi x)\\
F_{2i}(x)   &= \cos(2i\pi x)\\
\end{aligned}
$$

## 2. 思考

(1) 变量比方程多，如何加约束条件？

我们可以取 $b_0=\frac{1}{n}\sum_{i=1}^n y_i$，这样使得插值结果具有上下（y轴）平移不变性

(2) 常数项 $b_0$ 也可以改为一个低次（比如 2 次或 3 次）的多项式，相应也要加约束条件

我们可以用逼近拟合的方法，用低次多项式去逼近，从而求出相应系数，接着再进行插值。这里相当于用低次多项式提供曲线的基本形状，再用基函数线性组合来确定拟合曲线的细节。

## 3. 结果

### 3.1 自动模式

数据由下列代码生成

```matlab
% config
n = 8; % the amount of data points
m = 4; % the highest degree of approximation functions
noiseYScale = 0.1;

% data
step = 1.0 / n;
noiseX = rand(n, 1) * step;
X = step * (0 : (n-1))' + noiseX;

noiseY = noiseYScale * (2 * rand(n, 1) - 1);
Y = - 4 * (X.*X.*X) + 3 * (X.*X) - 2 * X + 1 + noiseY;
```

用四种拟合方法后，拟合曲线的图像如下

![auto](assets/auto.jpg)

命令行输出为

```
Error of Interpolation Polynomial : 4.243802585012e-23
Error of Interpolation Gauss : 1.346402571046e-06
Error of Approximation Polynomial : 3.376872003024e-02
Error of Approximation Fourier : 7.678746478799e-01
```

分析结果如下

- 误差
  - 两插值拟合误差几乎为 0（误差不为 0 的原因主要是精度问题）
  - 两逼近拟合存在一定的误差（由于数据存在噪声，低阶幂基函数无法精确拟合）
- 数据点
  - 两插值拟合曲线经过所有数据点
  - 两逼近拟合曲线并不经过所有数据点
- 振荡
  - 两插值拟合曲线首尾振荡明显，内部较为平滑
  - 幂基函数逼近曲线很平缓
  - 傅里叶基函数逼近曲线整体都在小幅振荡

### 3.2 交互模式

弹出一个图像框，输入多边形，用以获取数据点。点击鼠标左键新增数据点，点击鼠标右键结束输入。

![1568184305921](assets/polyline.jpg)

结束输入后，将会展示四条拟合曲线

![user](assets/user.jpg)

分析同上，不再赘述

## 4. 病态问题

当数据点过多时，插值拟合会出现病态问题，矩阵的条件数过高

matlab 会抛出警告，如下

```
警告: 矩阵接近奇异值，或者缩放错误。结果可能不准确。RCOND =  2.792438e-18。 
> In InterpolationPolynomial (line 14)
  In Fit (line 30)
  In mainAuto (line 18)
```

对此，可以用伪逆来求解，修改如下

```matlab
if cond(M) > 1e15 % 条件数过大
    alpha = pinv(M) * Y;
else
    alpha = M \ Y;
end
```

但是并不能解决拟合误差增大的问题

![ill](assets/ill.jpg)

可见插值曲线也不再经过所有数据点了

## 5. 总结

拟合的两种方法

- 插值：经过所有数据点，不好的基函数极易产生病态问题。此外首尾振荡明显。
- 逼近：不要求经过数据点，整体比较平稳。

不同的基函数拟合结果不同



