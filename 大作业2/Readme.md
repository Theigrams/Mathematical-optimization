# 后记

> 最终版作业是这个：https://github.com/Theigrams/Mathematical-optimization/blob/master/%E5%A4%A7%E4%BD%9C%E4%B8%9A2/Report.pdf

总算写完了这次大作业，我自认为是写得非常用心了，之前以为题目都做过，再增添几句话就行，没想到这一修改就是两三个星期，期间每一道题都查阅了很多资料，尤其是Stephen Boyd的Convex Optimization，给我提供了一个全新的思路以坐标变换的角度去审视最速下降法和牛顿法，然后是Alfio Quarteroni的Scientific Computing with MATLAB and Octave,书的排版格式很美观，插图也很漂亮，内容详尽，配合大量习题，还有MATLAB代码。

还有就是Jonathan Richard Shewchuk 的An Introduction to the Conjugate Gradient Method Without the Agonizing Pain ，格式也挺漂亮，只是没咋看，英文看起来太累了。

另外是Lingya Wang 的Implementation of Trust-region Algorithm with FieldOpt Optimization Framework，这本写得详尽，但感觉水平一般。

 

写这次大作业仿佛有一种写书的感觉，并不完全是为了写作业，而是为这学期最优化的课程画上一个圆满的句号。

之所以会选这个任务作为大作业，是觉得之前作业写过一次，在之前的基础上增添一些内容，应该不会太麻烦.

经历了很多:

独自发现梯度下降法奥秘时的喜悦

从书上得知牛顿法的震惊

第三题一开始没加越界判定的摸不着头脑

PCG的明了

527调参的苦逼

雅可比写成梯度的痛哭流涕

最后总结一下收货：

-  梯度下降法:2—范数意义下的最速下降法，对于二次函数，每次迭代的点都在两条直线$v_1,v_2$上，且满足$Gv_1\bot Gv_2$，即$v_1,v_2$关于矩阵$G^TG$共轭：$v_1^T(G^TG)v_2=0$，且每次迭代方向与$Gv_1,Gv_2$平行.
-  Newton法:Hessian范数意义下的最速下降法，本质上是在该点用二次函数近似原曲线，然后迭代到二次函数的极小点，Newton方向是在L-变化后的空间中的负梯度方向。
-  信赖域法:本质上是限制了步长的Newton法，根据近似情况好坏更改限制步长。
-  共轭梯度法:构造关于$G$共轭的迭代方向，${p^{(k+1)}}^TGp^{(k)}=0\ {p^{(k+1)}}^TL^TTp^{(k)}=(Lp^{(k+1)})^T(Lp^{(k)})=0$，本质上是在L-变化后的空间中寻找正交的搜索方向，因此在二次函数的情况下，执行精确步长后具有n次终止性。
