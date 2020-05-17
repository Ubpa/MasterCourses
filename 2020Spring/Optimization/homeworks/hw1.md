# 最优化理论 作业 1

庄涛

SA19001074

## exercise 1

![image-20200510202852041](assets/hw1/image-20200510202852041.png)

### p(1)(t)

设
$$
p^{(1)}(t)=At^2+Bt+C
$$
有
$$
\begin{array}{l}
A a_{1}^{2}+a_{1}B+C=\varphi_{1} \\
2 a_{1}A +B=\varphi_{1}^\prime \\
\alpha^{2}A +\alpha B +C=\varphi
\end{array}
$$
即
$$
\left[\begin{array}{ccc}
a_{1}^{2} & a_1 & 1 \\
2 a_{1} & 1 & 0 \\
\alpha^{2} & \alpha & 1
\end{array}\right]\left[\begin{array}{c}
A \\
B \\
C
\end{array}\right]=\left[\begin{array}{c}
\varphi_{1} \\
\varphi_{1}^{\prime} \\
\varphi
\end{array}\right]
$$
则
$$
\begin{align}A=& \frac{(\varphi-\varphi_1)-(a_1 - \alpha)\varphi_{1}}{(a_1-\alpha)^2}\\B=& \frac{2a_1(\varphi_1-\varphi)- \varphi_{1}^\prime(a_1^2 - \alpha^2)}{(a_1-\alpha)^2}\\C=&(a_1^2\varphi- \varphi_1(- \alpha^2 + 2a_1\alpha))/(a_1-\alpha)^2 + a_1\alpha\varphi_{1}^\prime/(a_1 - \alpha)\\ \end{align}
$$

### p(2)(t)

设
$$
p^{(2)}(t)=At^2+Bt+C
$$
有
$$
\begin{array}{l}
2 a_{1}A +B=\varphi_{1}^\prime \\
\alpha^{2}A +\alpha B+C=\varphi \\
2 \alpha A +B=\varphi^\prime \\
\end{array}
$$
即
$$
\left[\begin{array}{ccc}2a_{1} & 1 & 0 \\
\alpha^{2} & \alpha & 1 \\
2\alpha & 1 & 0\end{array}\right]\left[\begin{array}{c}A \\B \\C\end{array}\right]=\left[\begin{array}{c}\varphi_{1}^{\prime} \\\varphi\\\varphi^\prime\end{array}\right]
$$
则
$$
\begin{align}
A=&-(\varphi^\prime - \varphi_1^\prime)/(2(a_1 - \alpha))\\
B=&(a_1\varphi^\prime - \alpha\varphi_1^\prime)/(a_1 - \alpha)\\
C=&\varphi - (\varphi^\prime(- \alpha^2 + 2a_1\alpha))/(2(a_1 - \alpha)) + (\alpha^2\varphi_1^\prime)/(2(a_1 - \alpha))\\ \end{align}
$$

## exercise 2

![image-20200510211757396](assets/hw1/image-20200510211757396.png)

我们有
$$
-\rho \alpha {g^{(k)}}^\top d^{(k)}\le f(x^{(k)})-f(x^{(k+1)})\le -(1-\rho)\alpha {g^{(k)}}^\top d^{(k)}\tag{1}
$$
由泰勒定理，有
$$
f(x^{(k+1)})-f(x^{(k)})=\alpha \nabla f(x^{(k)}+t\alpha d^{(k)})^\top d^{(k)}
$$
其中 $t\in[0,1]$ 

则
$$
-\rho \alpha {g^{(k)}}^\top d^{(k)}\le -\alpha \nabla f(x^{(k)}+t\alpha d^{(k)})^\top d^{(k)}\le -(1-\rho)\alpha {g^{(k)}}^\top d^{(k)}
$$
由 Lipschitz 连续性和上式右侧知
$$
L(t\alpha)^2\|d^{(k)}\|^2\ge t\alpha (\nabla f(x^{(k)}+t\alpha d^{(k)})^\top d^{(k)}-\nabla f(x^{(k)})^\top d^{(k)})\ge -(t\alpha)\rho {g^{(k)}}^\top d^{(k)}
$$
则
$$
\alpha\ge t\alpha\ge -\frac{\rho {g^{(k)}}^\top d^{(k)}}{L\|d^{(k)}\|^2}
$$
上式以及 $|{g^{(k)}}^\top d^{(k)}|=\|g^{(k)}\|\|d^{(k)}\|\cos\theta^{(k)}$ 代入式 (1)，有
$$
f(x^{(k)})-f(x^{(k+1)})\ge \frac{(\rho {g^{(k)}}^\top  d^{(k)})^2}{L\|d^{(k)}\|^2}=\frac{\rho^2}{L}\cos^2\theta^{(k)}\|g^{(k)}\|^2
$$
由于 $f(x)$ 有界，则
$$
\infty>f(x^{(0)})-f(x^{(\infty)}) \geq \sum_{k=0}^{\infty} f(x^{(k)})-f(x^{(k+1)}) \geq \frac{\eta^{2}}{L} \sum_{k=0}^{\infty} \cos ^{2} \theta^{(k)}\|g^{(k)}\|^2
$$
则
$$
\lim_{k\to\infty}\cos\theta^{(k)}\|g^{(k)}\|=0
$$
又
$$
\cos\theta^{(k)}\ge \sin\mu
$$
则
$$
\|g^{(k)}\| \to 0
$$

## exercise 3

![image-20200510224102668](assets/hw1/image-20200510224102668.png)

对 $F(x)=0$ 的牛顿迭代为
$$
x^{(k+1)}=x^{(k)}-\frac{F(x^{(k)})}{F^\prime(x^{(k)})}
$$
最优化问题可以转成求解 $f^\prime(x)=0$ 的求根问题，则相应迭代格式为
$$
x^{(k+1)}=x^{(k)}-\frac{f^\prime(x^{(k)})}{f^{\prime\prime}(x^{(k)})}
$$

## exercise 4

![image-20200510224505722](assets/hw1/image-20200510224505722.png)

### 遗传性

假设 Hessian G 正定，终止时有
$$
y^{(l)}=Gs^{(l)},l=0,1,\dots,n-1
$$
当 $k=1$ 时，显然成立

假设当 $k\ge 1$ 时成立，我们有
$$
H_{k+1}=H_ky^{(l)}+\frac{(s^{(k)}-H_ly^{(k)})(s^{(k)}-H_ky^{(k)})^\top y^{(l)}}{(s^{(k)}-H_ky^{(k)})^\top y^{(k)}}
$$
当 $l<k$ 时，由假设知
$$
\begin{align}(s^{(k)}-H_ky^{(k)})^\top y^{(l)}&= {s^{(k)}}^\top y^{(l)}-{y^{(k)}}^\top H_k y^{(l)}\\&= {s^{(k)}}^\top y^{(l)}-{y^{(k)}}^\top s^{(l)}\\&= {s^{(k)}}^\top G s^{(l)} - {s^{(k)}}^\top  G s^{(l)}\\&= 0\end{align}
$$
则
$$
H_{k+1}y^{(l)}=H_k y^{(l)}=s^{(l)},l<k
$$
当 $l=k$ 时，显然成立

故 $k+1$ 时成立

综上，由归纳法知，结论成立

### 终止性

由遗传性知，
$$
s^{(l)}=H_ny^{(l)}=H_nGs^{(l)},l=0,1,\dots,n-1
$$
且 $s^{(l)}(l=0,1,\dots,n-1)$ 线性无关，则
$$
H_n G = I
$$
即 $H_n=G^{-1}$ 

## exercise 5

![image-20200510224515674.png](assets/hw1/image-20200510224515674.png)

记
$$
A_k=H_k+\frac{s^{(k)}{s^{(k)}}^\top}{{s^{(k)}}^\top y^{(k)}}
$$
有 $H_k^{-1}=B_k$ 

则由求逆公式有
$$
A_k^{-1}=B_k-\frac{B_ks^{(k)}{s^{(k)}}^\top B_k}{{s^{(k)}}^\top y^{(k)}+{s^{(k)}}^\top B_k s^{(k)}}
$$
故
$$
\begin{align}
B^{(DFP)}_{k+1}
&= {H_{k+1}^{(DFP)}}^{-1}=\left(H_k+\frac{s^{(k)}{s^{(k)}}^\top}{{s^{(k)}}^\top y^{(k)}}-\frac{H_ky^{(k)}{y^{(k)}}^\top H_k}{{y^{(k)}}^\top H_k y^{(k)}}\right)^{-1}\\
&=\left(A_k-\frac{H_ky^{(k)}{y^{(k)}}^\top H_k}{{y^{(k)}}^\top H_k y^{(k)}}\right)^{-1}\\
&\dots\\
&= \left(I-\frac{{y}^{(k)} {s}^{(k)^{\top}}}{{y}^{(k)^{\top}} {s}^{(k)}}\right) B_{k}\left(I-\frac{{s}^{(k)} {y}^{(k)^{\top}}}{{y}^{(k)^{\top}}{s}^{(k)}}\right)+\frac{{y}^{(k)} {y}^{(k)^{\top}}}{{y}^{(k)^{\top}} {s}^{(k)}}
\end{align}
$$

## exercise 6

![image-20200510224523620.png](assets/hw1/image-20200510224523620.png)

## exercise 7

![image-20200510224531737.png](assets/hw1/image-20200510224531737.png)

## exercise 8

![image-20200510224541091.png](assets/hw1/image-20200510224541091.png)

