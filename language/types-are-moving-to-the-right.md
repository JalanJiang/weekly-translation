- 原文：[Types are moving to the right](https://medium.com/@elizarov/types-are-moving-to-the-right-22c0ef31dd4a)
- 作者：[Roman Elizarov](https://medium.com/@elizarov)

## 类型声明右移的原因

![](https://cdn-images-1.medium.com/max/800/0*cKzCpeFCRxQQM77R.jpg)

如果你仔细观察一些诞生于上个世纪、如今仍在流行的静态类型编程语言，你会注意到它们当中的大多数，同时也是最受关注、最为流行的一些：例如 C 语言（约 1972 年），C++ （1985 年），Java（1995 年），它们都在变量的左侧声明类型：

```
Dog   fido = ...
^^^   ^^^^
Type  Name
```

当你编写多个声明时，它们依旧具有很好的可读性：

```
int count = ...
double average = ...
List<String> strings = ...
Map<Warehouse, List<OrderItem>> items = ...
```

然而，当你观察诞生于二十一世纪的现代编程语言，你很难不注意到，一些受欢迎的编程语言越来越多地将类型放在变量的右侧。

![](https://cdn-images-1.medium.com/max/800/1*c4glYoRWwPRaYWpj9aCtgQ.png)

为什么会这样呢？对于任何熟悉上个世纪 “类型-变量” 书写风格的开发者而言，这一风格的改变无疑十分怪异，且造成了书写的不便。尽管存在打破传统的风险，但现代编程语言的设计者仍然改变了这一书写方式。难道他们都是 Pascal 的脑残粉吗？还是有什么别的原因呢？

这里有个似是而非的解释。首先，这一现象与 Pascal（约 1970 年）与 Visual Basic（1991 年）的历史遗留无关，真正的答案是：我们已经进入了*类型推断*的时代。

类型推断在编程语言的设计中曾是被忽略的细微特征，如今却成为主流。它曾出现在一些诞生年代较早的编程语言中，现在我们也可以使用 `var` 和 `auto` 关键字来省略类型。即使在已有的编程语言中，我们也开始看到这样的代码：

```
var count = ...
var average = ...
var strings = ...
var items = ...
```

Woot！这看起来很工整，十分讨好我们的眼球。但是当类型过于复杂，又或是偶尔需要拼写出类型以便让读者理解时，又会发生些什么呢？看：

```
var count = ...
var average = ...
var strings = ...
Map<Warehouse, List<OrderItem>> items = ...
```

Emmmm……这打破了整个代码的阅读流程。所以，如果你在类型推断时代开启时设计一门编程语言，你就会通过在变量右侧放置一个可选的类型来解决这个问题：

```
var count = ...
var average = ...
var strings = ...
var items: Map<Warehouse, List<OrderItem>> = ...
```

这种书写方式看起来又很棒了吧。在以下编程语言中，基本上已经实现了这样的做法：Scala（2004），F#（2005），Go（2009），Rust（2010），TypeScript（2012），Swift（2014）。它们之间存在许多语法差异，但有个特性是相同的 —— “变量-类型” 的书写顺序：

```
fido   Dog
^^^^   ^^^
Name   Type
```

这一代码书写方式正在日渐流行。它是否会成为未来的主流呢？现在还很难确定，但趋势确实如此。

## 生词与短语

- statically-typed：静态类型
- increasingly：日益
- plausible：似是而非
- first of all：首先
- legacy：遗产
- inference：推理
- used to be：过去是；曾是
- omit：忽略
- aligns：对齐
- occasionally：偶尔
- behold：看
- essentially：基本上；本质上