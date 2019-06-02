- 原文：[Why OO Sucks](http://www.cs.otago.ac.nz/staffpriv/ok/Joe-Hates-OO.htm)
- 作者：[Joe Armstrong](joe@bluetail.com)
- 翻译：[江五渣](http://jalan.space)

# 为什么面向对象糟透了

当我初次接触面向对象的概念时，我是持怀疑态度的，但我不知道这是为什么，只是本能地觉得它是“错的”。在面向对象面世后，它开始变得非常流行（稍后我会解释原因），而批评面向对象就像是“在教堂里说脏话”。对面向对象的支持成为了所有得体的编程语言需要拥有的东西。

当 Erlang 变得流行时我们经常被问到：“Erlang 是面向对象语言吗？”当然了，这个问题的回答是：“不，当然不是了”。但是我们并不在想把这个答案大声地告诉所有人 —— 所以我们发明了一种给人留下深刻印象且机智巧妙的回答：Erlang 是（有那么点）面向对象的语言（如果你此时拼命摆手）但并非完全是（如果你听到了我们实际所说的话，并仔细阅读了小字）。

在这一点上，我想起了当时法国 IBM 老总的主题演讲，他在巴黎举行的第七届 IEEE 逻辑变成会议上向观众致辞。当时IBM Prolog 增加了许多面向对象的扩展，当被问到为什么要这样做时，他回答说：

> 我们的客户想要面向对象的 Prolog，所以我们就制作了。

我记得当时我是这样想的：“为何都没有简单地进行自我反省，也没有任何地良心不安，不问问自己：‘这是否是正确的呢？’”。

## 为什么面向对象是糟糕的？

我对面向对象的主要反对可以追溯到它的基本思想，下面我将概述其中的一些看法和我对面向对象思想的反对意见。

### 异议一：数据结构和方法不应该绑定在一起

对象使得方法和数据结构被绑定在不可分割的单元内，我觉得这是根本性的错误。方法和数据结构本属于两个世界，为什么要把它们绑定在一起呢？

- 方法运行时，有自己的输入和输出。输入和输出的数据都是可以被方法改变的数据结构。在大多数编程语言中，函数是根据命令序列构建的：“先这样做，然后再……”。如果要理解方法的作用，你就要先理解事件被完成的顺序。（在惰性 FPLs 和逻辑变成语言中，这种限制是宽松的）
- 而数据结构是这样的，它们什么都不做。它们本质上是声明性质的，“理解数据结构”比“理解方法”来的容易的多

方法被看作将输入转为输出的黑盒子。如果我理解了输入到输出的转换，那么我就理解了这个方法。但并不意味着我可以写出这个方法。

方法通常是这样被理解的：它们是计算机系统中的某个东西，它们的工作是将计算机中类型为 T1 的数据结构转变为类型为 T2 的数据结构。

**因为方法和数据结构是两种完全不同的动物，所以将它们锁在同一个笼子里是完全错误的决定。**

### 异议二：一切都必须是一个对象

例如“时间”这个东西，在面向对象语言中，“时间”必须是一个对象（在 Smallttalk 中，甚至 “3” 也是一个对象）。但是在非面向对象语言中，“时间”仅仅是某个数据类型的实例。例如，在 Erlang 中有许多不同的时间变量，我们可以使用类型声明对时间进行准确无误的声明。如下所示：

```
-deftype day()     = 1..31.
-deftype month()   = 1..12.
-deftype year()    = int().
-deftype hour()    = 1..24.
-deftype minute()  = 1..60.
-deftype second()  = 1..60.
-deftype abstime() = {abstime,year(),month(),day(),hour(),min(),sec()}.
-deftype hms()     = {hms,hour(),min(),sec()}.
…
```

要注意的是，这些定义不属于任何特定对象，它们十分普遍，表示时间的数据结构可以被系统中的任何方法操纵。

没有什么与之相关联的方法。

### 异议三：在面向对象设计语言中，数据类型定义分布在各个地方

在面向对象设计语言中，数据类型的定义属于对象。所以我无法在一个地方找到所有数据类型的定义。在 Erlang 和 C 语言中，我可以在一个独立的被引入文件或数据字典中定义所有的数据类型。在面向对象设计语言中，我就不能这样做了 —— 反之，数据类型的定义分布在各个地方。

让我举一个例子。假设我想定义一个无处不在的数据结构，无处不在的数据类型就意味着一个在系统中“到处定义”的数据类型。

正如 Lisp 程序员很早之前就了解的那样：在系统功能中，最好是拥有少量无处不在的数据类型和大量的小规模方法，而不是拥有大量的数据类型和少量的方法。

无处不在的数据结构就像是链表、数组、散列表或其他更高级的对象，例如时间、日期或文件名。

在面向对象设计语言中，我必须选择一些基础的对象在其中定义无处不在的数据结构。想要使用此数据结构，那么所有其他对象必须继承此对象。假设现在我想创建一些“时间”对象，那么它需要属于哪个对象呢……

### 异议四：对象具有私有状态

形态是万恶之源，我们应当避免定义具有副作用的功能。

虽然在编程语言中，形态是不受欢迎的，但在现实生活中，形态的存在比比皆是。我对自身银行账户的形态十分感兴趣，当我从银行存款或取款时，我希望我银行账户的形态可以正确更新。

鉴于现实世界中存在形态，编程语言应该为处理形态提供哪些便利呢？

- 面向对象设计语言说：对开发者隐藏形态。只有通过访问方法才能隐藏和显示形态
- 传统的编程语言（C，Pascal）使用语言的范围规则控制表示形态变量的可见性
- 纯粹的声明性语言说：我这儿没有形态。系统的全局形态被带入所有方法并从方法中被输出，像 monad（用于 FPL）和 DCG（逻辑语言）这样的机制用于对程序员隐藏形态，因此他们在编程中”似乎形态无关紧要“。但如果有必要，他们也完全可以访问系统的形态

面向对象设计语言中“对程序员隐藏形态”的选项是最糟糕的。它没有选择暴露形态或降低形态产生的干扰，而是选择直接隐藏它。

## 为什么面向对象如此流行？

- 理由一：人们认为面向对象思想容易学习
- 理由二：人们认为面向对象思想使得代码重用更加容易
- 理由三：它被炒作了
- 理由四：它创造了一个新的软件产业

我没有理由一和理由二的具体证据。理由三和四似乎是技术背后的驱动力，如果语言技术如此糟糕以至于它要创建一个新的行业来解决自己本身糟糕的问题，这对于那些想要赚钱的朋友来说一定是个好主意了。

这才是面向对象背后真正的推动力。

## 参见第三份宣言

【这部分于 2000 年由 R.A.O Keefe 为 COSC345 添加】

由 Date 和 Darwen 所作的“第三份宣言”这本书是关于如何正确设计对象数据库的。在附录中，他们对 SQL3 的处理相当粗暴。他们对 ODMG 持批评态度，如果行业花费大量时间和金钱之后不能为对象数据库系统生成逻辑上一致的对象模型，那么面向对象可能就不像看起来得那么简单或可用。

# 生词和短语

- sceptical：adj. 怀疑的
- criticise：v. 批评
- respectable：adj. 得体的
- ingenious：adj. 精巧的；有创意的；机智的
- principal：adj. 重要的；主要的
- fundamental：adj. 根本的；基础的；基本的
- ubiquitous：adj. 似乎无处不在；十分普遍