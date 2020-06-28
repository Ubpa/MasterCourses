# HW11 Remeshing

> 庄涛
>
> SA19001074

## 1. 问题描述

参考 A Remeshing Approach to Multiresolution Modeling 实现 remeshing

## 2. 算法原理

伪代码

```
remesh(target_edge_length)
  low = 4/5 * target_edge_length
  high = 4/3 * target_edge_length
  for i = 0 to 10 do
    spilt_long_edges(high)
    collapse_short_edges(low, high)
    equalize_valences()
    tangential_relaxation()
    project_to_surface()
```

其中`target_edge_length`是网格的目标长度，可取为原网格 $M$ 的平均边长
$$
\bar{L}=\frac{1}{|E(M)|}\sum_{e\in E(M)}\operatorname{length}(e)
$$
其中 $E(M)$ 是网格的边集

### 2.1 网格局部操作

![img](https://pic1.zhimg.com/80/v2-dd497084ee08fdba37d37a628919a3d8_720w.jpg)

在用半边结构时，算法实现简单但繁琐，Edge Spilt 和 Edge Flip 没什么坑，注意判断网格边界即可。Edge Collapse 比较坑，在部分情况下会不合法，如下（产生了二度点和重边，不再是三角网格）

![img](https://pic4.zhimg.com/80/v2-6e47f090492c57a36f4d1085a864309f_720w.jpg)

合法时的判断条件为 $|N(v_1)\cap N(v_2)|\le 2$，其中 $v_1$ 和 $v_2$ 

### 2.2 Spilt Long Edges

该步骤将所有长于`high = 4/3 * target_edge_length`的边进行 Edge Spilt 操作，新增的点位置为边两端点的中点。伪代码如下

```cpp
spilt_long_edges(high)
  while exists edge e with length(e) > high do
    spilt e at midpoint(e)
```

对于具体实现，关键在于边的遍历，特别注意 Edge Spilt 后会新增 4 条边，C++ 实现如下

```cpp
unordered_set<E*> edges = mesh->Edges();
while(!edges.empty()){
  auto iter = edges.begin();
  E* e = *iter;
  edges.erase(iter);
  if(e->Length() > high){
    V* v = mesh->SpiltEdge(e, e->Centroid());
    for(E* adjE : v->AdjEdges()) // add adjacent edges of new vertex v
      edges.push_back(adjE);
  }
}
```

### 2.3 Collapse Short Edges

该步骤将所有短于`low = 4/5 * target_edge_length`的边进行 Edge Collapse 操作，新增的点位置为边两端点的中点，另外要求新的边不会长于`high = 4/3 * target_edge_length`。伪代码如下

```cpp
collapse_short_edges(low, high)
  while exists unchecked edge e with length(e) < low do
    if collapse e will make some edges longer than high
      continue
    collapse e at midpoint(e)
```

对于具体实现，关键在于边的遍历，特别注意 Edge Collapse 后相邻边的长度会发生改变，需要重新考虑。此外 Edge Collapse 会有不合法的情形。对于有边界的网格，一般要求边界不动，边两顶点不能是边界点。另外，如果边两顶点的邻点是边界点的话，collapse 后会导致新点度数增加（有大量的邻接点是边界点），因而也要求边两点的邻点没有边界点。

C++ 实现如下

```cpp
unordered_set<E*> edges(mesh->Edges().begin(), mesh->Edges().end());
while(!edges.empty()){
  auto iter = edges.begin();
  E* e = *iter;
  edges.erase(iter);
  
  if(!e->IsCanCollapse(minL, maxL)) // test lots of contidons
    continue;
  
  vector<E*> eAdjEs = e->AdjEdges();
  if(eAdjEs.size() <= 2)
    continue; // dihedron
  
  V* v = mesh->CollapseEdge(e, c);
  if(v){ // collapse e success
    for(E* eAdjE : eAdjEs)
      edges,erase(eAdjE); // erase old edges
    for(E* adjE : v->AdjEdges())
      edges.insert(adjE); // add new edges
  }
}
```

### 2.4 Equalize Valences

该步骤目的是平衡顶点的度数，最佳度数 optimal valence 为

- 内部点：6
- 边界点：4

![img](https://pic4.zhimg.com/80/v2-5273c6ca278f469d3a8cf1f4c59cc95b_720w.jpg)

如果 Edge Flip 能减少与最佳度数的差 $\sum_{i=1}^4(\operatorname{valence}(v_i)-\operatorname{opt_valence}(v_i))^2$，则进行 Edge Flip，伪代码如下

```cpp
equalize_valences()
  for each edge e do
    if flip e can reduce valence excess do
      flip(e)
```

Edge Flip 会导致边原两端点度数减 1，新两端点度数加 1

![img](https://pic3.zhimg.com/80/v2-1b7c002f82bd83f931ce4af31d0be616_720w.jpg)

这里有坑

- 对于三角网格，除了边界点度数可为 2，内部点度数都在 3 及以上，故若 Edge Flip 会产生 2 度内部点时不合法
- 边界边不可进行 Edge Flip 操作
- 对于凹四边形，flip 后会导致逆向的面

![img](https://pic1.zhimg.com/80/v2-d49e783648f28ad86ddc63b14a1e6078_720w.jpg)凹四边形

C++ 实现如下

```cpp
vector<E*> edges = mesh->Edges();
for(E* e : edges){
  if(e->IsBoundary())
    continue;
  int valenceExcess = /*...omit calulate ...*/;
  int flipedValenceExcess = /*...omit calulate ...*/;
  if(flipedValenceExcess >= valenceExcess)
    continue;
  if(/*non convex polygon*/)
    continue;
  flip(e);
}
```

## 2.5 Tangential Relaxation

2.2 节和 2.3 节解决了边的长度问题，2.4 节解决了顶点度数问题，本节步骤解决的是三角形面积问题。

简单来说，将顶点向中心（邻接点的平均 $\mathbf{c}_i=\frac{1}{|N(v_i)|}\sum_{v_j\in N(v_i)}\mathbf{p}_j$）平移即可，如下所示

![img](https://pic2.zhimg.com/80/v2-a8fb443d4f4859ae5158a6e9c654ca61_720w.jpg)

另外平移时为了能保持原有网格的形状，且防止抖动，需要在切向进行平移，并且投影回原网格上，示例如下

![img](https://pic1.zhimg.com/80/v2-1c264ad58ada51a5363f32daece442a8_720w.jpg)
$$
\mathbf{c}_i^\prime=\mathbf{c}_i+\mathbf{n}_i\mathbf{n}_i^\top(\mathbf{p}_i-\mathbf{c}_i)
$$

### 2.6 Project to Surface

这里简单实现为沿法向将 $\mathbf{c}^\prime$ 投影回 $\mathbf{p}_i$ 的 1-ring 上

### 2.7 其他细节问题

#### 2.7.1 二面体

算法可能在 Collapse Edge 后引入二面体（三个点，两个面，顺序相反）

![img](https://pic1.zhimg.com/80/v2-851eb339996ca8c8f17af7d090154454_720w.jpg)

此时应及时停止算法

#### 2.7.2 并行

网格局部操作可以并行，但在进行操作时需要进行必要的锁资源。简单上锁整个网格就没法并行了，我采取的方案是锁相关顶点，比如 Edge Flip 需要锁住四个顶点。注意再加锁过程中可能有其他线程修改了邻接关系，导致锁点错误，因此需在最后检测所锁点是否仍为邻接点。因此并行的 overhead 比较大，效果不是很明显。

暂时只实现了 Edge Flip 的并行，日后会继续探究 Edge Spilt 和 Edge Collapse 的并行策略。

## 3. 实现步骤

- [x] 求平均边长 $\bar{L}$ 
- [x] 迭代
  - [x] Collapse Short Edges
  - [x] Equalize Valences
  - [x] Tangential Relaxation
  - [x] Project to Surface

## 4. 测试结果

![image-20200628184541580](assets/README/image-20200628184541580.png)

