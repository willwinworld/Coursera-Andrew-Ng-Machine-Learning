# Coursera-Andrew-Ng-Machine-Learning
Implementing By Octave, Python For Now </br>
首先是笔记: http://daniellaah.github.io/2016/Machine-Learning-Andrew-Ng-My-Notes.html </br>
疑惑与解答: </br>
1. 实现cost-function </br>
损失函数: J(\theta) = \frac{1}{2m}\sum_{i=1}^{m}{(h_{\theta}(x^{(i)}) - y^{(i)})^2} </br>
首先补充在octave和matlab中 .* 代表对应矩阵元素相乘 </br>
假设函数为h_{\theta} (x) = \theta_{0} + \theta_{1}x </br>
那么这里的computeCost函数给了3个参数X, y, theta,并没有给\theta_{0},经人提醒，其实\theta_{0}可以等于\theta_{1}乘以列向量中为1的元素, </br>
即\theta_{0} = \theta * 1 </br>
a = [1,2,3,4] .* [1,2,3,4] = [1,4,9,16], 而sum(a) = 30 </br>
所以计算\sum_{i=1}^{m}{(h_{\theta}(x^{(i)})-y^{(i)})^{2}}这部分的时候，首先将列向量计算出来H = X * theta -y, 这个值对应的就是括号里的{(h_{\theta}(x^{(i)})-y^{(i)})}, 然后要求这个列向量的平方，而采用的方法是matlab的.*,这样就把列向量中的每个元素相乘起来，然后最后是求和，直接用sum就好，就把列向量中的所有元素都加起来了。
