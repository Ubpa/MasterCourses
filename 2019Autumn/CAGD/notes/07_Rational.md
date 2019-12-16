# 07. 有理样条曲线

Bezier 和 B 样条曲线不能表示圆锥 conic 曲线（椭圆/圆 ellipse/circles，双曲线 hyperbolas）

## 07.1 二次曲线和圆锥曲线

> Quadrics and Conics

### 07.1.1 定义

圆锥曲线可以表示为二次函数的零集
$$
\begin{aligned}
ax^2+bxy+cy^2+dx+ey+f&=0\\
\pmb{x}^\top\left[\begin{matrix}
a & \frac{b}{2}\\
\frac{b}{2} & c
\end{matrix}\right]
\pmb{x}
+
\left[\begin{matrix}
d & e
\end{matrix}\right]
\pmb{x}
+f=0
\end{aligned}
$$

> **示例** 
>
> 圆锥的隐式表示 $Ax^2+By^2=z^2$ 
>
> 平面的隐式表示 $z=Dx+Ey+F$ 
>
> 圆锥曲线 $Ax^2+By^2=(Dx+Ey+F)^2$ 
>
> ![image-20191101202012008](assets/image-20191101202012008.jpg)

二次曲线是二次方程（任意维数）的零集
$$
\{\pmb{x}\in \mathbb{R}^d|\pmb{x}^\top M \pmb{x}+\pmb{b}^\top \pmb{x}+\pmb{c}=0\}
$$
圆锥曲线是 $d=2$ 时的二次曲线

### 07.1.2 圆锥曲线类型

记（$a>0$）
$$
M\triangleq \left[\begin{matrix}
a & \frac{b}{2} \\
\frac{b}{2} & c
\end{matrix}\right]
$$
M 的特征值为
$$
\lambda_{1,2}=\frac{a+c \pm \sqrt{(a-c)^2+b^2}}{2}
$$

> **推导** 
> $$
> \begin{aligned}
> \det(\lambda I-M) &= 0\\
> \left|\begin{matrix}
> \lambda - a & -\frac{b}{2}\\
> -\frac{b}{2} & \lambda - c\\
> \end{matrix}\right| &= 0\\
> (\lambda-a)(\lambda - c)-\frac{b^2}{4} &= 0\\
> \lambda^2-(a+c)\lambda+ac-\frac{b^2}{4} &= 0
> \end{aligned}
> $$
> 则
> $$
> \begin{aligned}
> \lambda &= \frac{a+c\pm\sqrt{(a+c)^2-4\left(ac-\frac{b^2}{4}\right)}}{2}\\
> &= \frac{a+c\pm\sqrt{(a-c)^2+b^2}}{2}\\
> \end{aligned}
> $$
> 记
> $$
> \begin{aligned}
> \lambda_1&=\frac{a+c+\sqrt{(a-c)^2+b^2}}{2}\\
> \lambda_2&=\frac{a+c-\sqrt{(a-c)^2+b^2}}{2}\\
> \end{aligned}
> $$

- 椭圆：$b^2<4ac$ 
  - 圆：$b=0$，$a=c$ 
- 抛物线 parabola：$b^2=4ac$ 
- 双曲线：$b^2>4ac$ 

![image-20191101212214420](assets/image-20191101212214420.jpg)

![image-20191101212235388](assets/image-20191101212235388.jpg)

> **推导** 
>
> 存在可逆正交矩阵 $D$，使得
> $$
> M=D^\top
> \left[\begin{matrix}
> \lambda_1 & \\
> &\lambda _2
> \end{matrix}\right]
> D
> $$
> 则
> $$
> \begin{aligned}
>  &\pmb{x}^\top M \pmb{x}+\pmb{b}^\top \pmb{x}+\pmb{c}\\
> =&\pmb{x}^\top M \pmb{x}+\pmb{b}^\top \pmb{x}+\pmb{c}\\
> =&\pmb{x}^\top D^\top \left[\begin{matrix} \lambda_1 & \\
> &\lambda _2 \end{matrix}\right] D\pmb{x} +\pmb{b}^\top \pmb{x}+\pmb{c}\\
> \xlongequal{\pmb{y=D\pmb{x}}}&\pmb{y}^\top \left[\begin{matrix} \lambda_1 & \\
> &\lambda _2 \end{matrix}\right] \pmb{y}+\pmb{b}^\top D^\top\pmb{y}+\pmb{c}\\
> \end{aligned}
> $$
> 因此圆锥曲线的类型取决于 $\lambda_1$ 和 $\lambda_2$ 的符号，下边探讨
>
> 若 $c\ge0$，则 $\lambda_1>0$，若 $c<0$，则
> $$
> \lambda_1\ge \frac{a+c+a-c}{2} = a > 0
> $$
> 故 $\lambda_1 > 0$ 
>
> - 抛物线 $b^2=4ac$：$\lambda_2=0$ 
> - 椭圆 $b^2<4ac$：$\lambda_2 > 0$ 
> - 双曲线 $b^2>4ac$：$\lambda_2 < 0$ 

### 07.1.3 二次曲线投影

给定一条空间二次曲线，将 $z$ 坐标设为齐次项 $\omega$，将曲线中心投影到平面 $\omega=1$ 上

![image-20191101212505639](assets/image-20191101212505639.jpg)

空间二次曲线为
$$
\pmb{f} ^ { ( h o m ) } ( t ) = \pmb{p} _ { 0 } + t \pmb{p} _ { 1 } + t ^ { 2 } \pmb{p} _ { 2 } = \left( \begin{array} { c } { \pmb{p} _ { 0 } \cdot x } \\ { \pmb{p} _ { 0 } \cdot y } \\ { \pmb{p} _ { 0 } \cdot \omega } \end{array} \right) + t \left( \begin{array} { c } { \pmb{p} _ { 1 } \cdot x } \\ { \pmb{p} _ { 1 } \cdot y } \\ { \pmb{p} _ { 1 } \cdot \omega } \end{array} \right) + t ^ { 2 } \left( \begin{array} { c } { \pmb{p} _ { 2 } \cdot x } \\ { \pmb{p} _ { 2 } \cdot y } \\ { \pmb{p} _ { 2 } \cdot \omega } \end{array} \right)
$$

投影曲线
$$
\pmb{f} ^ { ( e u c l ) } ( t ) = \frac { \left( \begin{array} { c } { \pmb{p} _ { 0 } \cdot x } \\ { \pmb{p} _ { 0 } \cdot y } \end{array} \right) + t \left( \begin{array} { c } { \pmb{p} _ { 1 } \cdot x } \\ { \pmb{p} _ { 1 } \cdot y } \end{array} \right) + t ^ { 2 } \left( \begin{array} { c } { \pmb{p} _ { 2 } \cdot x } \\ { \pmb{p} _ { 2 } \cdot y } \end{array} \right) } { \pmb{p} _ { 0 } \cdot \omega + t \pmb{p} _ { 1 } \cdot \omega + t ^ { 2 } \pmb{p} _ { 2 } \cdot \omega }
$$

> 齐次 homogeneous
>
> 欧式 euclidean

#### 07.3.1 抛物线

对于
$$
y=x^2
$$
参数化为
$$
\left\{\begin{array}{l}
x=t\\
y=t^2
\end{array}\right.
$$
则
$$
\pmb{p}_0=\left[\begin{matrix}
0\\
0\\
1
\end{matrix}\right],
\pmb{p}_1=\left[\begin{matrix}
1\\
0\\
0
\end{matrix}\right],
\pmb{p}_2=\left[\begin{matrix}
0\\
1\\
0
\end{matrix}\right]
$$
故
$$
\pmb{f} ^ { ( e u c l ) } ( t ) = \frac { \left( \begin{array} { c } { 0 } \\ { 0 } \end{array} \right) + t \left( \begin{array} { c } { 1 } \\ { 0 } \end{array} \right) + t ^ { 2 } \left( \begin{array} { c } { 0 } \\ { 1 } \end{array} \right) } { 1 + 0 t + 0 t ^ { 2 } }=\left( \begin{array} { c } { t } \\ { t^2 } \\ { 1 } \end{array} \right)
$$

#### 07.3.2 圆

对于
$$
x^2+y^2=1
$$
参数化为
$$
\left\{\begin{array}{l}
x=\cos\varphi=\frac{1-\tan^2\frac{\varphi}{2}}{1+\tan^2\frac{\varphi}{2}}=\frac{1-t^2}{1+t^2}\\
y=\sin\varphi=\frac{2\tan\frac{\varphi}{2}}{1+\tan^2\frac{\varphi}{2}}=\frac{2t}{1+t^2}\\
\end{array}\right.
$$
其中 $t=\tan \frac{\varphi}{2}$ （$\varphi\in[0,\frac{\pi}{4}]$，$t\in[0,1]$）

则
$$
\pmb{p}_0=\left[\begin{matrix}
1\\
0\\
1
\end{matrix}\right],
\pmb{p}_1=\left[\begin{matrix}
0\\
2\\
0
\end{matrix}\right],
\pmb{p}_2=\left[\begin{matrix}
-1\\
0\\
1
\end{matrix}\right]
$$
故
$$
\pmb{f} ^ { ( e u c l ) } ( t ) = \frac { \left( \begin{array} { c } { 1 } \\ { 0 } \end{array} \right) + t \left( \begin{array} { c } { 0 } \\ { 2 } \end{array} \right) + t ^ { 2 } \left( \begin{array} { c } { -1 } \\ { 0 } \end{array} \right) } { 1 + 0 t + 1 t ^ { 2 } }=\left( \begin{array} { c } { 1-t^2 } \\ { 2t } \\ { 1+t^2 } \end{array} \right)
$$

#### 07.3.3 双曲线

对于
$$
x^2-y^2=1
$$
参数化为
$$
\left\{\begin{array}{l}
x=\frac{1}{\cos\varphi}=\frac{1+t^2}{1-t^2}\\
y=\tan \varphi = \frac{2t}{1-t^2}
\end{array}\right.
$$
其中 $t=\tan \frac{\varphi}{2}$（$\varphi\in[0,\frac{\pi}{4}]$，$t\in[0,1]$）

则
$$
\pmb{p}_0=\left[\begin{matrix}
1\\
0\\
1
\end{matrix}\right],
\pmb{p}_1=\left[\begin{matrix}
0\\
2\\
0
\end{matrix}\right],
\pmb{p}_2=\left[\begin{matrix}
1\\
0\\
-1
\end{matrix}\right]
$$
故
$$
\pmb{f} ^ { ( e u c l ) } ( t ) = \frac { \left( \begin{array} { c } { 1 } \\ { 0 } \end{array} \right) + t \left( \begin{array} { c } { 0 } \\ { 2 } \end{array} \right) + t ^ { 2 } \left( \begin{array} { c } { 1 } \\ { 0 } \end{array} \right) } { 1 + 0 t - 1 t ^ { 2 } }=\left( \begin{array} { c } { 1+t^2 } \\ { 2t } \\ { 1-t^2 } \end{array} \right)
$$

## 07.2 有理 Bezier 曲线

### 07.2.1 定义

$\mathbb{R}^n$ 上 $d$ 阶的 Bezier 曲线，$n+1$ 个控制点 $\pmb{p}_0,\dots,\pmb{p}_n$ 是 $n+1$ 维的，最后一维视为齐次项，欧式坐标由中心投影获得
$$
\begin{aligned}
\boldsymbol { f } ^ { ( h o m ) } ( t ) &= \sum _ { i = 0 } ^ { n } B _ { i } ^ { ( d ) } ( t ) \boldsymbol { p } _ { i } , \quad \boldsymbol { p } _ { i } \in \mathbb { R } ^ { n + 1 }\\
\boldsymbol { f } ^ { ( e u c l ) } ( t ) &= \frac { \sum _ { i = 0 } ^ { n } B _ { i } ^ { ( d ) } ( t ) \left( \begin{array} { c } { p _ { i } ^ { ( 1 ) } } \\ { \cdots } \\ { p _ { i } ^ { ( n ) } } \end{array} \right) } { \sum _ { i = 0 } ^ { n } B _ { i } ^ { ( d ) } ( t ) p _ { i } ^ { ( n + 1 ) } }
\end{aligned}
$$
等价地可写成

$$
\begin{aligned}
\boldsymbol { f } ^ { ( e u c l ) } ( t ) &= \frac { \sum _ { i = 0 } ^ { n } B _ { i } ^ { ( d ) } ( t ) \omega _ { i } \left( \begin{array} { c } { p _ { i } ^ { ( 1 ) } } \\ { \cdots } \\ { p _ { i } ^ { ( n ) } } \end{array} \right) } { \sum _ { i = 0 } ^ { n } B _ { i } ^ { ( d ) } ( t ) \omega _ { i } }\\
&=\sum_{i=0}^n q_i(t) \pmb{p}_i\\
\end{aligned}
$$
其中 $q_i(t)=\frac{B_i(t)^{(d)}\omega_i}{\sum_{j=0}^nB_j(t)^{(d)}\omega_j}$，满足 $\sum_{i=0}^nq_i(t)=1$ 

> **几何解释** 
>
> “正常的”（$\mathbb{R}^{n+1}$ 上的）Bezier 曲线通过中心投影得到有理 Bezier 样条
>
> ![image-20191102112736066](assets/image-20191102112736066.jpg)
>
> **权重与移动的比较** 
>
> ![image-20191102113647904](assets/image-20191102113647904.jpg)
>
> **示例** 
>
> ![image-20191102113714244](assets/image-20191102113714244.jpg)

### 07.2.2 有理 de Casteljau 算法

三种方法

- 在 $n+1$ 维上计算，最后投影：$\boldsymbol { b } _ { i } ^ { ( r ) } ( t ) = ( 1 - t ) \boldsymbol { b } _ { i } ^ { ( r - 1 ) } ( t ) + t \boldsymbol { b } _ { i + 1 } ^ { ( r - 1 ) } ( t )$ 

- 分别计算分子和分母，然后相除：类似于上一种

- 每一个步骤相除
  $$
  \begin{aligned} \boldsymbol { b } _ { i } ^ { ( r ) } ( t ) = ( & 1 - t ) \frac { \omega _ { i } ^ { ( r - 1 ) } ( t ) } { \omega _ { i } ^ { ( r ) } ( t ) } \boldsymbol { b } _ { i } ^ { ( r - 1 ) } ( t ) + t \frac { \omega _ { i + 1 } ^ { ( r - 1 ) } ( t ) } { \omega _ { i } ^ { ( r ) } ( t ) } \boldsymbol { b } _ { i + 1 } ^ { ( r - 1 ) } ( t ) \\ & \text { with } \quad \omega _ { i } ^ { ( r ) } ( t ) = ( 1 - t ) \omega _ { i } ^ { ( r - 1 ) } ( t ) + t \omega _ { i + 1 } ^ { ( r - 1 ) } ( t ) \end{aligned}
  $$

  > 这种方法很傻其实，每次除了权重之后，下一次又乘了回去

> 综合来看第一种最简单

## 07.3 二次有理 Bezier 曲线

### 07.3.1 标准形式

二次有理曲线对于表达圆锥曲线是充足且必要的

$$
\begin{aligned}
\pmb{f} ^ { ( e u c l ) } ( t )
&= \frac { B _ { 0 } ^ { ( 2 ) } ( t ) \omega _ { 0 } \boldsymbol { p } _ { 0 } + B _ { 1 } ^ { ( 2 ) } ( t ) \omega _ { 1 } \boldsymbol { p } _ { 1 } + B _ { 2 } ^ { ( 2 ) } ( t ) \omega _ { 2 } \boldsymbol { p } _ { 2 } } { B _ { 0 } ^ { ( 2 ) } ( t ) \omega _ { 0 } + B _ { 1 } ^ { ( 2 ) } ( t ) \omega _ { 1 } + B _ { 2 } ^ { ( 2 ) } ( t ) \omega _ { 2 } }\\
&=\frac { (1-t)^2 \omega _ { 0 } \boldsymbol { p } _ { 0 } + 2t(1-t) \omega _ { 1 } \boldsymbol { p } _ { 1 } + t^2 \omega _ { 2 } \boldsymbol { p } _ { 2 } } { (1-t)^2 \omega _ { 0 } + 2t(1-t) \omega _ { 1 } + t^2 \omega _ { 2 } }
\end{aligned}
$$

其中一个权重不为零，分子分母同时除以它则可以消去一个自由度（对曲线无影响）

只关心曲线形状，可以通过重参数化移除一个自由度
$$
t=\frac{\tilde{t}}{\alpha(1-\tilde{t})+\tilde{t}}
$$
![image-20191217021638513](assets/image-20191217021638513.png)

形状只与 $\alpha$ 有关

这样标准形式变为
$$
\begin{aligned} f ^ { ( e u c l ) } ( t )
=& \frac {
    \left( \frac { \alpha ( 1 - \tilde { t } ) } { \alpha ( 1 - \tilde { t } ) + \tilde { t } } \right) ^ { 2 } \omega _ { 0 } \boldsymbol { p } _ { 0 }
    + 2 \left( \frac { \alpha ( 1 - \tilde { t } ) } { \alpha ( 1 - \tilde { t } ) + \tilde { t } } \right) \left( \frac { \tilde { t } } { \alpha ( 1 - \tilde { t } ) + \tilde { t } } \right) \omega _ { 1 } \boldsymbol { p } _ { 1 }
    + \left( \frac { \tilde { t } } { \alpha ( 1 - \tilde { t } ) + \tilde { t } } \right) ^ { 2 } \omega _ { 2 } \boldsymbol { p } _ { 2 }
}{
	\left( \frac { \alpha ( 1 - \tilde { t } )} { \alpha ( 1 - \tilde { t } ) + \tilde { t } } \right) ^ { 2 } \omega _ { 0 }
	+ 2 \left( \frac { \alpha ( 1 - \tilde { t } ) } { \alpha ( 1 - \tilde { t } ) + \tilde { t } } \right) \left( \frac { \tilde { t } } { \alpha ( 1 - \tilde { t } ) + \tilde { t } } \right) \omega _ { 1 }
	+ \left( \frac { \tilde { t } } { \alpha ( 1 - \tilde { t } ) + \tilde { t } } \right) ^ { 2 } \omega _ { 2 }
}\\
= &\frac { \alpha ^ { 2 } ( 1 - \tilde { t } ) ^ { 2 } \omega _ { 0 } \boldsymbol { p } _ { 0 } + 2 \alpha ( 1 - \tilde { t } ) \tilde { t } \omega _ { 1 } \boldsymbol { p } _ { 1 } + \tilde { t } ^ { 2 } \omega _ { 2 } \boldsymbol { p } _ { 2 } } { \alpha ^ { 2 } ( 1 - \tilde { t } ) ^ { 2 } \omega _ { 0 } + 2 \alpha ( 1 - \tilde { t } ) \tilde { t } \omega _ { 1 } + \tilde { t } ^ { 2 } \omega _ { 2 } }\\
= &\frac { \alpha ^ { 2 } B_0^{(2)}(\tilde{t}) \omega _ { 0 } \boldsymbol { p } _ { 0 } + \alpha B_1^{(2)}(\tilde{t}) \omega _ { 1 } \boldsymbol { p } _ { 1 } + B_2^{(2)}(\tilde{t}) \omega _ { 2 } \boldsymbol { p } _ { 2 } } { \alpha ^ { 2 } B_0^{(2)}(\tilde{t}) \omega _ { 0 } + \alpha B_1^{(2)}(\tilde{t}) \omega _ { 1 } + B_2^{(2)}(\tilde{t}) \omega _ { 2 } }\\
\xlongequal{\alpha=\sqrt{\frac{\omega_2}{\omega_0}}}&\frac { B_0^{(2)}(\tilde{t}) \omega _ { 2 } \boldsymbol { p } _ { 0 } + B_1^{(2)}(\tilde{t}) \sqrt{\frac{\omega_2}{\omega_0}} \omega _ { 1 } \boldsymbol { p } _ { 1 } + B_2^{(2)}(\tilde{t}) \omega _ { 2 } \boldsymbol { p } _ { 2 } } { B_0^{(2)}(\tilde{t}) \omega _ { 2 } + B_1^{(2)}(\tilde{t}) \sqrt{\frac{\omega_2}{\omega_0}} \omega _ { 1 } + B_2^{(2)}(\tilde{t}) \omega _ { 2 } }\\
=&\frac { B_0^{(2)}(\tilde{t})\boldsymbol { p } _ { 0 } + B_1^{(2)}(\tilde{t}) \sqrt{\frac{1}{\omega_0\omega_2}} \omega _ { 1 } \boldsymbol { p } _ { 1 } + B_2^{(2)}(\tilde{t}) \boldsymbol { p } _ { 2 } } { B_0^{(2)}(\tilde{t}) + B_1^{(2)}(\tilde{t}) \sqrt{\frac{1}{\omega_0\omega_2}} \omega _ { 1 } + B_2^{(2)}(\tilde{t}) }\\
\xlongequal{\omega=\sqrt{\frac{1}{\omega_0\omega_2}}\omega_1}&\frac { B_0^{(2)}(\tilde{t})\boldsymbol { p } _ { 0 } + B_1^{(2)}(\tilde{t}) \omega \boldsymbol { p } _ { 1 } + B_2^{(2)}(\tilde{t}) \boldsymbol { p } _ { 2 } } { B_0^{(2)}(\tilde{t}) + B_1^{(2)}(\tilde{t}) \omega + B_2^{(2)}(\tilde{t}) }
\end{aligned}
$$
这个就是二次有理 Bezier 曲线的**标准形式** 

### 07.3.2 分类

- $\omega < 1$：椭圆曲线
- $\omega=1$：抛物线
- $\omega>1$：双曲线

![image-20191102130425785](assets/image-20191102130425785.jpg)

> **推导** 
>
> 将参数形式转换成隐式形式，将曲线表示成重心坐标
> $$
> \pmb{f}(t)=\tau_0(t)\pmb{p}_0+\tau_1(t)\pmb{p}_1+\tau_2(t)\pmb{p}_2
> $$
> ![image-20191102172340513](assets/image-20191102172340513.jpg)
>
> > $\tau_0$ 和 $\tau_1$ 就相当于 $x$ 和 $y$，两者可以用一个可逆变换相互转换
> >
> > ~~当 $\text{angle}(\pmb{p}_0,\pmb{p}_1,\pmb{p}_2)=90^\circ$ 时，该变化是正交的~~
> >
> > 所以下边就探究 $\tau_0$ 和 $\tau_1$ 满足的隐式方程
>
> 对比二次有理曲线，可知
> $$
> \begin{array}{lll}
> \tau_0(t) &= \frac{(1-t)^2\omega_0}{\omega(t)}
> &\Rightarrow 1-t=\sqrt{\frac{\tau_0(t)\omega(t)}{\omega_0}}\\
> \tau_1(t) &= \frac{2t(1-t)\omega_1}{\omega(t)}\\
> \tau_2(t) &= \frac{t^2\omega_2}{\omega(t)}
> &\Rightarrow t=\sqrt{\frac{\tau_2(t)\omega(t)}{\omega_2}}\\
> \end{array}
> $$
> 其中
> $$
> \omega(t)=(1-t)^2\omega_0+2t(1-t)\omega_1+t^2\omega_2
> $$
> 则
> $$
> \tau_1(t)
> =2\frac{\omega_1}{\omega(t)}\sqrt{\frac{\tau_0(t)\omega(t)}{\omega_0}\frac{\tau_2(t)\omega(t)}{\omega_2}}
> =2\omega_1\sqrt{\frac{\tau_0(t)\tau_2(t)}{\omega_0\omega_2}}
> $$
> 故
> $$
> \begin{aligned}
> \omega_0\omega_2\tau_1^2(t)
> &=4\omega_1^2\tau_0(t)\tau_2(t)\\
> &=4\omega_1^2\tau_0(t)(1-\tau_0(t)-\tau_2(t))\\
> \end{aligned}
> $$
> 整理可得
> $$
> 4\omega_1^2\tau_0^2(t)+4\omega_1^2\tau_0(t)\tau_1(t)+\omega_0\omega_2\tau_1^2(t)-4\omega_1^2\tau_0(t)=0
> $$
> 对于标准形式 $\omega_0=\omega_2=1$，$\omega_1=\omega$，则
> $$
> 4\omega^2\tau_0^2(t)+4\omega^2\tau_0(t)\tau_1(t)+\tau_1^2(t)-4\omega^2\tau_0(t)=0
> $$
> 则（参考 [07.1.2 圆锥曲线类型](#07.1.2 圆锥曲线类型)）
> $$
> \lambda_{1,2}=\frac{4\omega^2+1\pm\sqrt{(4\omega^2-1)^2+16\omega^4}}{2}
> $$
>
> - $\omega=1$：抛物线
> - $\omega<1$：椭圆
> - $\omega>1$：双曲线

### 07.3.3 对偶

对偶段为 $t\in \mathbb{R}\backslash [0,1]$，则可用参数化
$$
\hat{t}=\frac{t}{2t-1}
$$
$t$ 从 $0$ 到 $\frac{1}{2}$ 时 $\hat t$ 从 $0$ 到 $-\infty$，$t$ 从 $\frac{1}{2}$ 到 $1$ 时 $\hat t$ 从 $+\infty$ 到 $1$ 

代入标准形式可得
$$
\begin{aligned}
\pmb{x}(\hat{t})&= \frac { ( 1 - \hat { t } ) ^ { 2 } \pmb{p} _ { 0 } + 2 \hat { t } ( 1 - \hat { t } ) \omega \pmb{p} _ { 1 } + \hat { t } ^ { 2 } \pmb{p} _ { 2 } } { ( 1 - \hat { t } ) ^ { 2 } + 2 \hat { t } ( 1 - \hat { t } ) \omega + \hat { t } ^ { 2 } }\\
&= \frac { ( 1 - t ) ^ { 2 } \pmb{p} _ { 0 } - 2 t ( 1 - t ) \omega \pmb{p} _ { 1 } + t ^ { 2 } \pmb{p} _ { 2 } } { ( 1 - t ) ^ { 2 } - 2 t ( 1 - t ) \omega + t ^ { 2 } }\end{aligned}
$$

仅是 $\omega$ 取负

> ![image-20191102183757440](assets/image-20191102183757440.jpg)

考虑分母等于 $0$ 的情形 

$$
\omega(t)=(1-t)^2-2t(1-t)\omega+t^2
$$

这是一个抛物线，可推得

- $\omega<1$：没有奇异点（零点），椭圆
- $\omega=1$：一个奇异点，抛物线
- $\omega>1$：两个奇异点，双曲线

![image-20191102184245800](assets/image-20191102184245800.jpg)

### 07.3.4 圆

控制点满足

- $\|\pmb{b}_1-\pmb{b}_0\|=\|\pmb{b}_1-\pmb{b}_2\|$ 
- $\text{dot}(\pmb{b_1}-\pmb{b_0},\pmb{b_2}-\pmb{b_0})=\text{dot}(\pmb{b_1}-\pmb{b_2},\pmb{b_0}-\pmb{b_2})=\cos\alpha$ 

则 $\omega=\cos \alpha$ 

![image-20191102185035624](assets/image-20191102185035624.jpg)

### 07.3.5 Farin 点

$$
\begin{aligned}
\overline{\pmb{f}_i}
&=\frac{1}{2}(\overline{\pmb{b}_i}+\overline{\pmb{b}_{i+1}})\\
\pmb{f}_i&=\frac{\omega_ib_i+\omega_{i+1}b_{i+1}}{\omega_i+\omega_{i+1}}
\end{aligned}
$$

![image-20191102190352559](assets/image-20191102190352559.jpg)

满足关系
$$
\frac { \omega _ { i + 1 } } { \omega _ { i } } = \frac { \left\| \pmb{b} _ { i } - \pmb{f} _ { i } \right\| } { \left\| \pmb{b} _ { i + 1 } - \pmb{f} _ { i } \right\| }
$$
对于标准形式
$$
\pmb{q} _ { 0 } = \frac { \pmb{p} _ { 0 } + \omega _ { 1 } \pmb{p} _ { 1 } } { 1 + \omega _ { 1 } } , \pmb{q} _ { 1 } = \frac { \pmb{p} _ { 1 } + \omega _ { 1 } \pmb{p} _ { 2 } } { 1 + \omega _ { 1 } }
$$
![image-20191102190655140](assets/image-20191102190655140.jpg)

### 07.3.6 性质

- 端点插值

- 凸包 $(\pmb{b}_0,\pmb{f}_0,\dots,\pmb{f}_{n-1},\pmb{b}_n)$ 内

  ![image-20191102190934950](assets/image-20191102190934950.jpg)

- 导数
  $$
  \begin{aligned}
  \pmb{f}(t)&=\frac{\sum_{i=0}^n B^{(d)}_i(t)\omega_i\pmb{p}_i}{\sum_{i=0}^n B^{(d)}_i(t)\omega_i}\triangleq\frac{\pmb{p}(t)}{\omega(t)}\\
  \pmb{f}^\prime(t)
  &=\frac{\pmb{p}^\prime(t)\omega(t)-\omega^\prime(t)\pmb{p}(t)}{\omega^2(t)}\\
  &=\frac{\pmb{p}^\prime(t)-\omega^\prime(t)\pmb{f}(t)}{\omega(t)}\\
  \pmb{f}^\prime(0)&=\frac{d(\omega_1\pmb{p}_1-\omega_0\pmb{p}_0)-d(\omega_1-\omega_0)\pmb{p}_0}{\omega_0}=d\frac{\omega_1}{\omega_0}(\pmb{p}_1-\pmb{p}_0)\\
  \pmb{f}^\prime(1)&=\frac{d(\omega_{d}\pmb{p}_{d}-\omega_{d-1}\pmb{p}_{d-1})-d(\omega_{d}-\omega_{d-1})\pmb{p}_{d}}{\omega_d}=d\frac{\omega_{d-1}}{\omega_d}(\pmb{p}_d-\pmb{p}_{d-1})\\
  \end{aligned}
  $$

## 07.4 NURBS

> **N**on-**U**niform **R**ational **B**-**S**plines

$$
\boldsymbol { f } ( t ) = \frac { \sum _ { i = 1 } ^ { n } N _ { i,k } ( t ) \omega _ { i } \boldsymbol { p } _ { i } } { \sum _ { i = 1 } ^ { n } N _ { i,k } ( t ) \omega _ { i } }
$$

类似于有理 Bezier 曲线

