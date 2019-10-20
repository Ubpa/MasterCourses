# 05. B-Splines

文件夹 [codes\\](codes\) 中含有代码，运行脚本 [codes\App_BSpline.m](codes\App_BSpline.m) 即可

<img src="assets/1571489286069.png" alt="1571489286069" style="zoom:40%;" />

<video id="video" controls="" preload="none">
    <source id="mp4" src="demo.mp4" type="video/mp4">
</video>

## 软件使用说明

- 红色圆圈是 $C^2$ 点，绿色圆圈是直线点，蓝色圆圈是尖点，青色点是控制点，虚线是控制点间的连线，蓝色实线是 B 样条曲线
- 运行脚本后，进入**输入模式** 
- `Control` 按键可以显示 / 隐藏控制点
- `Back` 按键可以删除最后一个型值点，进入**输入模式** 
- `Reset` 清空型值点，进入**输入模式** 
- 型值点的类型在左边的下拉框选择，有 $C^2$、直线点和尖点
- 输入模式
  - 在坐标系内**左键**点击可以输入型值点
  - 在坐标系内**右键**点击停止输入型值点，进入**调节模式** 
- 调节模式
  - 靠近控制点会显示**红圈**
  - 靠近型值点，点击鼠标**左键**不放可以**拖动型值点** 
  - 靠近型值点，点击鼠标**右键**可以**修改型值点类型** 
  - 调解模式下，隐藏控制点时，暂时无法修改型值点

## 代码说明

- [`UIMngr.m`](codes/UIMngr.m)：管理 UI 的类
- [`PointData.m`](codes/PointData.m)：储存型值点数据的类型
- [`N.m`](codes/N.m)：B-Spline 基函数
- [`testN.m`](codes/testN.m)：简单测试 B-Spline 基函数
- [`DrawCircle.m`](codes/DrawCircle.m)：绘制圆
- [`DrawBSpline.m`](codes/DrawBSpline.m)：绘制 B 样条曲线
- [`DeBoorPoints.m`](codes/DeBoorPoints.m)：根据型值点求控制点，核心
- [`BSpline.m`](codes/BSpline.m)：根据控制点和结序列，求特定点 $t$ 的曲线值 $\pmb{x}(t)$ 
- [`App_BSpline.m`](codes/App_BSpline.m)：应用，运行这个脚本以运行程序
- `App_BSpline.fig`：UI 相关二进制文件，有 guide 自动生成

## 性能说明

求解步骤每次消耗 0.001s 左右，绘制大概在 0.001s 左右，一般情况帧率能有几百帧每秒。

且随着型值点数增多，绘制消耗增速大于求解速度，所以再优化没有太大意义。