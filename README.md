# DHVectorDiagram

#Description

用来构造一个抽象的2D矢量图

可进行平移、缩放、旋转

可渲染到一个视图上

也可以直接使用我自己简单的封装的DHVectorDiagramView来绘制一个矢量图

所有对矢量图的变形操作只操作了构成矢量图的点，不会对渲染矢量图的那个视图产生任何影响

由于只对点进行了操作，所以缩放不会影响线宽，旋转不会造成锯齿;)

里面的DHMatrix是矩阵结构体，为了解决矢量图的各种变形算法而设计出来的，暂时只有乘法，可用于其他地方

![1](https://github.com/DHUsesAll/GitImages/blob/master/DHVectorDiagram/1.png)
