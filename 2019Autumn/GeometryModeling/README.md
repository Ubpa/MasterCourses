# 几何建模选讲

> - 课程编码：MA06424
> - 学分：4
> - 开课单位：001-数学学院
> - 教师：傅孝明
>
> ---
>
> 庄涛
>
> SA19001074
>
> 2020/01/15

## 作业要求 (60 分)

- 截止时间：2020/01/15
- 提交方式：发到邮箱 fire_fuxm@qq.com，注明姓名和学号
- 要求
  - 半边结构
  - I/O (obj)
  - UI (QT)
  - vertex, edge, face
  - collapse, spilt, flip
  - isotropic remesh

## 作业

本次作业写在了我之前开发了一年左右的渲染引擎 [RenderLab](https://github.com/Ubpa/RenderLab) 上

![img](README.assets/horizontal.png)

以下是本次作业的示例视频

<video id="video" controls="" preload="none">
    <source id="mp4" src="IsotropicRemeshing.mp4" type="video/mp4">
</video>

- 半边结构及相关操作：https://github.com/Ubpa/RenderLab/tree/master/include/CppUtil/Basic/HEMesh
- SObj 格式：自定义格式，类似 obj 格式，基于 XML
- Isotropic Remeshing：https://github.com/Ubpa/RenderLab/blob/master/src/CppUtil/Engine/MeshEdit/IsotropicRemeshing.cpp

## 简述

### 半边结构

基础逻辑实现参考了一篇博客[^HalfEdge]，只储存拓扑结构

为了支持自定义的点、线、面类型（比如点含位置等），同时保证易用性，采用了 [CRTP](https://link.zhihu.com/?target=https%3A//zh.wikipedia.org/wiki/%E5%A5%87%E5%BC%82%E9%80%92%E5%BD%92%E6%A8%A1%E6%9D%BF%E6%A8%A1%E5%BC%8F) “魔法”

spilt 和 flip 的实现比较简单，对于 collapse，可能会有不安全的情况[^collapse]，对应 $|N(v_0) \cap N(v_1)| \neq 2$，此时 collapse 失败

### SObj

[RenderLab](https://github.com/Ubpa/RenderLab) 是我开发一年左右的**渲染引擎**，本次实验也在其上完成，刚好以前没时间写场景序列化中关于三角网格的部分，这次就顺便补上了，存储格式类似于 obj，但不是用 `v`、`f` 等来标记，而是用 `<positions>`、`<triangles>` 等来标记

> **示例** 
>
> ```xml
> <SObj>
>     <name>Monster</name>
>     <components>
>         <CmptTransform>
>             <Position>0 0 0</Position>
>             <Rotation>0 0 0 1</Rotation>
>             <Scale>1 1 1</Scale>
>         </CmptTransform>
>         <CmptGeometry>
>             <primitive>
>                 <TriMesh>
>                     <code>
>                         <position>
>                             -0.375561 -0.253624 -0.240180
>                             -0.205857 0.344935 -0.364353
>                             0.200506 -0.297661 -0.301657
>                             ...
>                         </position>
>                         <triangles>
>                             21195 21196 21194
>                             38796 38797 38794
>                             18132 7229 34907
>                             ...
>                         </triangles>
>                     </code>
>                 </TriMesh>
>             </primitive>
>         </CmptGeometry>
>         <CmptMaterial>
>             <material>
>                 <BSDF_Frostbite>
>                     <colorFactor>1 1 1</colorFactor>
>                     <albedoTexture/>
>                     <metallicFactor>0.000000</metallicFactor>
>                     <metallicTexture/>
>                     <roughnessFactor>0.040000</roughnessFactor>
>                     <roughnessTexture/>
>                     <aoTexture/>
>                     <normalTexture/>
>                 </BSDF_Frostbite>
>             </material>
>         </CmptMaterial>
>     </components>
>     <children/>
> </SObj>
> ```

### Isotropic Remeshing

算法参考了 CMU15-462 的实验[^CMU15-462] 和 CS468-12 的实验[^CS468-12]，简单描述如下

- 计算平均边长 $L$，从而确定上下限 $L_\min=\frac{4}{5}L$ 和 $L_\max=\frac{4}{3}L$  

- 按序循环多次以下步骤

  - spilt 边长大于 $L_\max$ 的边

  - collapse 边长小于 $L_\min$ 的边

  - flip 能使点度均衡的边，即使 $\sum_{i=1}^4 (d(v_i)-6)^2$ 变小

  - 移动点
    $$
    \pmb{p}_i^\prime = \pmb{p}_i+w\Delta_i^\prime\\
    \Delta_i^\prime=\Delta_i - \langle\Delta_i,\pmb{n}_i\rangle\pmb{n}_i\\
    \Delta_i=\pmb{c}_i-\pmb{p}_i\\
    \pmb{c_i}=\frac{1}{d(\pmb{p}_i)}\sum_{v_j\in N(v_i)}\pmb{p}_j
    $$
    其中 $\pmb{p}$ 和 $\pmb{p}_i^\prime$ 是点 $v_i$ 的原位置和新位置，$\Delta_i$ 和 $\Delta_i^\prime$ 是与中心点 $\pmb{c}_i$ 的偏移和切向偏移，取更新系数 $w=0.2$ 

算法很简单，但实现上遇到很多 bug，一方面是 spilt, flip 和 collapse 有坑，另一方面是算法上有坑，就是 flip 会使边的原两点度数减一，而若 3 度点被减了一后就不再是三角网格了

## 引用

[^HalfEdge]: Kalle Rutanen. [Half-edge structure](https://kaba.hilvi.org/homepage/blog/halfedge/halfedge.htm).
[^collapse]: UTD praba. [3D Geometry Modeling](https://personal.utdallas.edu/~praba/6v81/3dModeling.pdf).
[^CMU15-462]:CMU. [Isotropic Remeshing](https://github.com/cmu462/Scotty3D/wiki/Isotropic-Remeshing).
[^CS468-12]: Stanford Computer Graphics Laboratory. [Remeshing I](http://graphics.stanford.edu/courses/cs468-12-spring/LectureSlides/13_Remeshing1.pdf).

