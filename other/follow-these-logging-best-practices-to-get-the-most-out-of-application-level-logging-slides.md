- 原文：[Logging best practices to get the most out of application level logging – Slides](https://geshan.com.np/blog/2019/03/follow-these-logging-best-practices-to-get-the-most-out-of-application-level-logging-slides/)
- 作者：[Geshan](https://geshan.com.np/)
- 翻译：[江五渣](http://jalan.space)

# 日志记录的最佳实践

来自应用层的日志是你的应用对你唯一的反馈。让日志合理化并具有良好的检索能力，就像在一个黑暗的房间里点亮了一个火把。

当任何问题出现时，“充分利用日志”这一做法带来的效果常常被我们低估。作为软件工程师，我们能利用应用层日志解决问题，以及了解应用整体的健康状况。

> 日志还可以帮助分析应用程序的性能。

多年前我也写过如何收集日志的文章。本文将重点介绍如何从应用级别的程序中获取日志，以及如何通过日志收集帮助你成为一名软件工程师。

![](https://geshan.com.np/images/logging-best-practices/logging-bp.jpg)

## 一目了然的最佳实践

以下方法是收集日志的最佳方式：

### 1. 合理地记录信息

过多的信息会干扰我们的视听，而信息太少又不足以满足我们的需求。至于记录多少的日志信息才最为合理，这很难把握平衡，对我们而言这也是个挑战。在微服务的场景中，我们也会思考如何进行服务之间请求的追踪，例如使用唯一的请求标识符来标记请求。我们需要记住的另一件事是：**日志是暂存的事物，而非永久存在的**。因为它们没有被存储在数据库中，往往只存在几天到几周的时间。

### 2. 始终遵循严格的日志级别

如果线上出现 emergency 级别日志，这意味着你的待命电话将在凌晨 2 点响起，如果出现的仅仅是 info 级别的日志，这不需要打扰到任何人。你和你的团队需要制定并同意一些日志设定标准，例如像 [syslog one](https://tools.ietf.org/html/rfc5424) 那样。

### 3. 结构化

在你的日志行中固定使用一个结构，例如结构可以有一条消息和一个上下文数组，数组用来扩展添加更多有关信息。遵循已经约定好的 JSON 标准格式来记录日志，固定的结构能让解析和搜索变得容易。你甚至能设置更多的规则，例如：日期是需要强制记录的，日志描述不能超过 255 个字符，额外的信息则记录在上下文中。拥有这些简单的规则后，你的日志信息就会变得易于检索。非常推荐在日志行中记录上下文信息，例如：当记录订单无法正常发货的日志时，可以同时添加订单的详细信息到日志中（当然是指订单中不敏感的信息）。

### 4. 小心地记录日志（不要影响系统性能）

确保添加日志后不会让程序的返回时间增加过多的毫秒数。尽可能地用异步方式记录日志，日志甚至能直接写入本地日志文件或使用日志传输工具传输至你所选择的日志服务。你也可以使用基于语言/框架开发的久经考验的库。使用队列也可以作为记录日志的选项，但请记住，在查看日志时可能存在延迟。

### 5. 使用合适的工具完成工作

你用于传输、查看、搜索、整理日志的工具或服务都是你和你团队的选择。考虑到预算和使用外部服务的兴趣，团队可以尝试使用完全自我管理的工具栈，例如 [ELK](https://www.elastic.co/elk-stack)/[Gralog](https://www.graylog.org/) 或充分利用 SAAS 服务例如 [Logentries](https://logentries.com/)/[Sematext Logsense](https://sematext.com/logsene/)。核心思想是，使用能有效满足你需求的工具。例如，如果你需要使用队列实时记录日志，这就不是一个不恰当的选择。因此，设计你的日志收集基础设施和工具栈时，需要充分满足你的需求。

## PPT 文件

二月份时，我在公司进行了有关“日志最佳实践”的演讲，演讲时所用的 PPT 如下：

你可以在 [slideshare](https://www.slideshare.net/geshan/logging-best-practices) 和 [speaker deck](https://speakerdeck.com/geshan/logging-best-practices) 查看 PPT。

## 总结

> 如果说狗是人类最好的朋友，那么日志就是软件工程师最好的朋友啦。

请最大限度地利用日志信息，并牢记此最佳实践。

# 生词和短语

- commendable：值得赞扬的
- torch：火炬
    - is like having a torch in a dark room
- exploit：利用
- underrate：过低评价，低估
- as well as：以及
- utilize：利用
- profile application performance：描述/分析应用的性能
- some years back：多年前
- optimally：最佳的、理想的、适宜地
- strike the balance：取得平衡
- in the case of：就……而言；至于；在……情况下
    - in case of：如果，万一
    - [in case of 和in the case of 是否意思相同](http://www.ecp.com.cn/cc/g1/nwwd/20070812121733.htm)
- temporal：暂时的；permanent：不变的
    - Another thing to keep in mind is logs are temporal, not permanent. 
- mandatory：强制性的
- sensitive：敏感的
    - things that are not sensitive of course
- appetite：胃口，食欲
- infrastructure：基础设施
- As far as possible：尽量，尽可能的
- tried and trusted：经考验证明好的；久经考验
    - You can also make use of **tried and trusted** library depending on the language/framework you are working with. 