# 数字几何处理 —— 作业 1 报告

> 姓名：庄涛
>
> 学号：SA19001074

代码位置：https://github.com/Ubpa/DGP

核心代码

- [ShortestPath.cpp](https://github.com/Ubpa/DGP/blob/master/src/Engine/MeshEdit/ShortestPath.cpp) 
- [MST.cpp](https://github.com/Ubpa/DGP/blob/master/src/Engine/MeshEdit/MST.cpp) 

视频 demo 如下（点击播放）

<video id="video" controls="" preload="none">
    <source id="mp4" src="demo.mp4" type="video/mp4">
</video>

## Shortest path

- input：two vertices
- output：a edge path connectting the input two vertices with shortest length

核心算法为 dijkstra 算法

假设顶点数 $n$，边数 $e$ 

采用优先队列，则增删操作复杂度为 $O(\log{n})$，循环执行次数为 $O(e)$，则算法复杂度为 $O(e\log n)$ 

下图为一运行示例

![image-20200308231837611](assets/README/image-20200308231837611.png)

## Minimal spanning tree

- input: some(>2) vertices
- output: a tree passing through all input vertices with minimum length

核心算法为

![image-20200308233815733](assets/README/image-20200308233815733.png)

假设网格顶点数 $n$，边数 $e$，输入顶点数为 $N$ 

- 最短路用了 [Shortest path](#Shortest path) 的算法，算法复杂度为 $O(e\log n)$，总共需要调用 $N(N-1)/2$ 次

- 最小生成树用了 Prim 算法，采用了优先队列，算法复杂度为 $O(N\log N)$ 

总的算法复杂度为 $O(N^3 e \log n\log N)$ 

下图为算法结果示例

![image-20200308231637551](assets/README/image-20200308231637551.png)

