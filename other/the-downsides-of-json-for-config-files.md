- 原文：[The downsides of JSON for config files](https://arp242.net/json-config.html)
- 作者：[Martin Tournoij](https://arp242.net/)
- 翻译：[江五渣](http://jalan.space)

# 用 JSON 作为配置文件的缺陷

近来我发现了人们越来越喜欢把 JSON 作为配置文件，我觉得这不是一个好的用法。

这不是 JSON 设计的初衷，也不是它所擅长的领域。JSON 旨在成为 “轻量级数据交换格式”，并对外声称 “对人类来说易于读写”、“对机器而言易于解析和生成”。

JSON 是一种非常好的数据交换格式。人们阅读或书写 JSON 都相对来说较为容易，并且对机器而言解析也十分简单（尽管存在一些 [问题](http://seriot.ch/parsing_json.php)）。

JSON 是机器可读性和人类可读性的良好折衷，对于许多使用场景而言，它也是对 XML 格式的良好改进。

将 JSON 用作其他目的就好像再说：“嘿，这把锤子用来钉钉子好赞赞！我喜欢它！为什么不用它来拧螺丝呢！”当然，锤子是好的锤子，但不适合拧螺丝的工作。

<p align="center"><img src="/img/common/split-line/son.jpg" alt></p>

到目前为止，最大的问题是你不能在 JSON 中添加注释。偶尔也存在一些支持注释解析的 JSON 解析器，但这并不常见，大多数解析器还是不支持注释解析的。并且，这里有充分的理由 [从 JSON 中移除注释解析](https://web.archive.org/web/20120506232618/https://plus.google.com/118095276221607585885/posts/RK8qyGVaGSr) 的支持。

你肯定有很多想要在 JSON 中添加注释的理由：在文档中标注某个的字段为什么设置这个值、需要在文档中添加助记词或附加描述、警告之前配置中出现过的错误、在文档中维护更新日志、或仅仅只想在调试时为段落或值添加注解。

一个 [建议的变通做法](http://stackoverflow.com/a/244858/660921) 是使用一个新的键名，例如 `__comment`：

```json
{"__comment": "a comment", "actual_data": "..."}
```

但在我看来，这种写法太丑了。

有些人指出你可以把注释放入提交日志，但能有几个人会仔细阅读历史提交记录呢？毕竟很少会有重要信息隐藏在其中。

一些 JSON 的变种，例如 JSON5，Hjson 和 HOCON，和某些 JSON 解析器一样支持在 JSON 中添加注释，这很棒棒，我也支持你使用它们。但它们不是 JSON，而是 JOSN 的超集。在这篇文章中我们只讨论 JSON，而不讨论这些基于 JSON 构建的超集。

<p align="center"><img src="/img/common/split-line/son.jpg" alt></p>

我还发现 JSON 的手写用户体验非常不理想：你经常会弄混尾随的逗号，带引号的语义令人讨厌，与此同时它也不支持多行字符串的写法。这些属性适用于 JSON 的预期用途（数据交换），但并不适用于编辑配置文件。JSON 可以作为配置文件吗？是可行的，但并不适用。

我也没发现 JSON 文件特别易读，使用它还要忍受一堆引号和其他糟糕的语法。好吧，我承认这可能是我个人喜好的问题。

<p align="center"><img src="/img/common/split-line/son.jpg" alt></p>

JSON 是一种陈述性质的配置语言。陈述性配置（DC）适用于某些范围内的问题，但不适用于这些范围之外。DC 尤其不适合用于控制逻辑。

激起我写这篇文章的是 MediaWiki 的新扩展系统。旧系统核心的 MediaWiki 代码中挂载了简单的 PHP 文件（PHP 赛高 `(๑•̀ㅂ•́)و✧`），用于加载所需要的依赖项。而新系统使用 JSON 文件替代了它。这其中所丢失的包括巧妙解决与其他插件兼容性的能力与处理其他逻辑问题的能力。

并且这实现起来也更加复杂，之前我们只需要简单地 `require('plugin/foo/plugin.php');`，而现在需要解析一个 JSON 文件并且对其中的内容做进一步处理。这个过程更加复杂了，也 [难以调试](https://arp242.net/easy.html)。

使用 JSON 文件记录基础的元数据是说得通的（易于解析且在网页展示），但使用 JSON 来描述代码是如何运作则是对 DC 的一种误用。毕竟，这是代码的用途啊。

<p align="center"><img src="/img/common/split-line/son.jpg" alt></p>

很多人来问我该选取什么作为配置文件。这个问题很容易回答，这取决于你的使用场景、编程语言、程序库环境和周围的文化因素。可能除了“最简单且满足你的所有需求”，这没有一个唯一的“正确答案”。其实我也写了一篇 [关于这个问题的文章](https://arp242.net/negative-argument.html)。

一个优秀的可替代方案可能是只 [使用命令行标志](https://arp242.net/flags-config.html)。

还有一些专为人类编辑所设置的 JSON 超集，例如：[JSON5](https://json5.org/)、[Hjson](http://hjson.org/) 和 [HOCON](https://github.com/lightbend/config/blob/master/HOCON.md)。它们都像是对常规 JSON 的合理升级，尽管我不使用它们当中的任何一种。JSON5 看起来像是一个好的替代品，因为它对 JSON 的改动最小。

对于安利其他的替代品我也很是犹豫，因为我并没有对所有格式做深入的评估（[除了 YAML](https://arp242.net/yaml-config.html)）。仅看一眼规范很难看到它们潜在的缺陷（YAML 就是一个很好的例子，它有很多微妙的骚操作）。我真的没有时间或是兴趣对所有的替代品做深入的评述。

# 文章概要总结

作者说明了 JSON 不适用于作为配置文件的原因：

1. JSON 设计的初衷是“轻量级数据交换格式”，而不是作为配置文件，因此它的一些特性不适用于配置文件
2. JSON 不支持注释
3. 手写用户体验不理想，不适合用来频繁编辑
4. 糟糕的语法让它读起来也不是特别容易
5. JSON 是陈述性质的配置语言，不适合用来控制代码逻辑

可以用以下方案作为配置文件替代 JSON：

- JSON 的一系列超集：[JSON5](https://json5.org/)、[Hjson](http://hjson.org/) 和 [HOCON](https://github.com/lightbend/config/blob/master/HOCON.md)
- YAML

当然，使用何种方案取决于：

> Your use case, programming language, library environment, and social factors.


# 生词和短语

- downsides

> n. 下降趋势，缺点

- witnessed: I’ve recently witnessed the trend of using JSON for configuration files. 

> v. 目睹，作证

- consequently

> adv. 所以，因此

- intended to be

> 打算成为

- lightweight

> adj. 轻量的; 不重要的

> n. 轻量级选手

- comparatively

> adv. 对比地；相对地；比较地；有点；

- trade-off 

> n. 交易，权衡

- nails

> n. 钉子；指甲

> v. 钉住；抓住

- By far

> 到目前为止

- explicitly 

> adv. 明确，显然

- mnemonics

> n. 帮助记忆的词句(或诗歌等)；助记符号

- caveats

> n. 警告；附加说明

- workaround

> n. 变通方法

- peruse

> v. 仔细阅读；研读

- dialects

> n. 方言

- UX

> n. 【IT】 用户体验

- suboptimal

> adj. 次优的

- semantics for quoting

> n. 语义

- lacks

> v. 缺乏

- properties

> n. 属性；性能

- doable

> adj. 可行；可做

- syntax

> n. 句法；语法

- declarative

> adj. 陈述的；说明的

- metadata

> n. 元数据

- makes sense

> 言之有理；情理之中；说得有道理

- misuse

> n./v. 滥用；误用

- after all

> 毕竟；终究

- other than

> 除了……；以外

- alternative

> adj. 可供替代的；非传统的；另类的

- potential drawbacks

> 潜在的缺点