# 课堂小测

> 庄涛
>
> SA19001074

## 1. 三角形重心坐标

![image-20200628193737977](assets/README/image-20200628193737977.png)

令 $\mathbf{x}=\mathbf{v}_1+\beta(\mathbf{v}_2-\mathbf{v}_1)+\gamma(\mathbf{v}_3-\mathbf{v}_2)$ 

则
$$
A=\frac{1}{2} \|\mathbf{v}_2-\mathbf{v}_1\|\|\mathbf{v}_3-\mathbf{v}_1\|\sin\langle\mathbf{v}_2-\mathbf{v}_1, \mathbf{v}_3-\mathbf{v}_1\rangle\\
A_2 = \frac{1}{2} \|\mathbf{v}_2-\mathbf{v}_1\|(\beta\|\mathbf{v}_3-\mathbf{v}_1\|)\sin\langle\mathbf{v}_2-\mathbf{v}_1, \mathbf{v}_3-\mathbf{v}_1\rangle\\
A_3 = \frac{1}{2} (\gamma\|\mathbf{v}_2-\mathbf{v}_1\|)\|\mathbf{v}_3-\mathbf{v}_1\|\sin\langle\mathbf{v}_2-\mathbf{v}_1, \mathbf{v}_3-\mathbf{v}_1\rangle\\
$$
则
$$
\beta = \frac{A_2}{A},\gamma =\frac{A_3}{A}
$$
则
$$
\begin{aligned}
\mathbf{x}
&=(1-\beta-\gamma)\mathbf{v}_1+\beta\mathbf{v}_2+\gamma\mathbf{v}_3\\
&=\frac{A_1}{A}\mathbf{v}_1+\frac{A_2}{A}\mathbf{v}_2+\frac{A_3}{A}\mathbf{v}_3\\
\end{aligned}
$$

## 2. MVC 推导

![image-20200628200431651](assets/README/image-20200628200431651.png)

其中 $v_i-v_0=(\cos\theta_i,\sin\theta_i)$，$\alpha_i=\theta_{i+1}-\theta_i$ 

求证：$\sum_{i=1}^n\left(\tan\frac{\alpha_{i-1}}{2}+\tan\frac{\alpha_i}{2}\right)(v_i-v_0)=0$ 

证：
$$
\begin{aligned}
 &\sum_{i=1}^n\left(\tan\frac{\alpha_{i-1}}{2}+\tan\frac{\alpha_i}{2}\right)(v_i-v_0)\\
=&\sum_{i=1}^n\left(\tan\frac{\alpha_{i-1}}{2}+\tan\frac{\alpha_i}{2}\right)(\cos\theta_i,\sin\theta_i)\\
=&\sum_{i=1}^n\tan\frac{\alpha_i}{2}\Big((\cos\theta_i,\sin\theta_i)+(\cos\theta_{i+1},\sin\theta_{i+1})\Big)\\
=&\sum_{i=1}^n\tan\frac{\alpha_i}{2}\Big((\cos\theta_i+\cos\theta_{i+1},\sin\theta_i+\sin\theta_{i+1})\Big)\\
\end{aligned}
$$
即要证
$$
\begin{aligned}
\sum_{i=1}^n\tan\frac{\alpha_i}{2} (\cos\theta_{i}+\cos\theta_{i+1})&=0\\
\sum_{i=1}^n\tan\frac{\alpha_i}{2} (\sin\theta_{i}+\sin\theta_{i+1})&=0
\end{aligned}
$$
对于上式
$$
\begin{aligned}
 &\sum_{i=1}^n\tan\frac{\alpha_i}{2} (\cos\theta_{i}+\cos\theta_{i+1})\\
=&2\sum_{i=1}^n\tan\frac{\theta_{i+1}-\theta_i}{2}\left(\cos\frac{\theta_{i+1}+\theta_i}{2}\cos\frac{\theta_{i+1}-\theta_i}{2}\right)\\
=&2\sum_{i=1}^n\sin\frac{\theta_{i+1}-\theta_i}{2}\cos\frac{\theta_{i+1}+\theta_i}{2}\\
=&\sum_{i=1}^n\left(\sin\theta_{i+1}-\sin\theta_{i}\right)\\
=&0
\end{aligned}
$$
对于下式
$$
\begin{aligned}
 &\sum_{i=1}^n\tan\frac{\alpha_i}{2} (\sin\theta_{i}+\sin\theta_{i+1})\\
=&2\sum_{i=1}^n\tan\frac{\theta_{i+1}-\theta_i}{2}\left(\sin\frac{\theta_{i+1}+\theta_i}{2}\cos\frac{\theta_{i+1}-\theta_i}{2}\right)\\
=&2\sum_{i=1}^n\sin\frac{\theta_{i+1}-\theta_i}{2}\sin\frac{\theta_{i+1}+\theta_i}{2}\\
=&\sum_{i=1}^n\left(\cos\theta_{i}-\cos\theta_{i+1}\right)\\
=&0
\end{aligned}
$$
