- 原文：[How are serverless computing and Platform-as-a-Service (PaaS) different?](https://www.cloudflare.com/learning/serverless/glossary/serverless-vs-paas/)
- 作者：[cloudflare](https://www.cloudflare.com/)
- 翻译：[江五渣](http://jalan.space)

# Serverless 和 PaaS 的区别

> 尽管 PaaS 和无服务器计算都不涉及开发人员的后端管理，但是有几个因素将这两个模型区分开来，包括可伸缩性、定价和在网络边缘部署的能力。

因为对后端开发人员而言，[无服务计算](https://www.cloudflare.com/learning/serverless/what-is-serverless/) 和 [平台即服务](https://www.cloudflare.com/learning/serverless/glossary/platform-as-a-service-paas/) 架构均是不可见的。它们有些许相似，然而还是有许多不同的地方将这两种架构区别开来，并且有许多应用场景仅适合在其中一个架构中使用。这两者最大的差别是可扩展性、价格、启动时间、工具和在 [网络边缘](https://www.cloudflare.com/learning/serverless/glossary/what-is-edge-computing/) 的部署能力。

![](https://www.cloudflare.com/img/learning/serverless/glossary/serverless-vs-paas/paas-serverless-comparison.svg)

## PaaS 和 serverless 哪个更方便伸缩？

无服务应用程序可以立即、自动地随需应变，不需要任何来自开发者或供应商的额外配置。它们能够按定义扩展。相比之下，虽然开发人员可以对 PaaS 托管的应用程序进行编程，以便于根据用户需求进行扩展或缩小，但这并不是 PaaS 的固有特性，开发人员必须进行一定量的预测才能对应用进行正确的扩容。

无服务计算可以被类比成从水龙头取水，水代表着计算能力。在现代家庭中，水龙头可以被随时打开，并能产生尽可能多的水。PaaS 则更像是饮水机或水瓶递送服务。它仍然可以获得所需的、尽可能多的饮用水，但它获取水的方式并不像直接打开水龙头一样那么简单，如果消费者的用水需求增长了，他必须让供应商运送更多的水资源。在这两个场景中都有人处理“后端” —— 清洁水资源，把水资源带到大楼中，以及其他。但只有水龙头能按需求、按时地精确控制水资源的量级。

serverless 架构能够通过在请求时启动应用程序功能的新实例来快速扩容。当它们不再需要该功能或该功能已经运行过一段时间后，它们也能通过关闭功能快速地缩小规模。事实上，serverless Web 应用在有需求的情况下就能不断地快速伸缩，并在几秒或几毫秒内再次响应一个事件并启动。基于 PaaS 构建的应用则无法达到 serverless 快速伸缩的程度。

## PaaS 和 serverless 的价格有何区别？

我们继续来看看水的比喻，从水龙头获取水资源的用户用多少水就付多少钱。同样的，serverless 账单是十分精确的，开发者只为他们使用到的部分付费。一些 serverless 的供应商按服务的运行时间向开发者收费，精确到每个实例下每个功能的几分之一秒。另外一些供应商则按照请求的次数收费。

使用饮水机和瓶装水的用户也只需支付他们用水的费用，但是他们是按瓶数付费，而不是按照水的吨数付费。同样的，一些 PaaS 的供应商按照应用程序使用的内容向开发者收费。然而，PaaS 的账单并不像 serverless 那样精确。另一些 PaaS 供应商向开发者每月收取固定费用。开发者一般可以定制他们所要付费服务的计算能力。然而，这是事先决定的，无法实时进行增加或减少。

这些不同之处并不能说明 serverless 架构更加实惠。如果一直开着水龙头也需要承担高昂的水费，具有稳定、大流量的 Web 应用程序使用 serverless 运行价格可能会变得昂贵。

## PaaS 和 serverless 的启用时间有何不同？

正如我们上面所说的，一旦事件触发应用程序的功能，serverless 应用几乎可以立即响应。PaaS 构建的应用可以快速启动和运行，但它们不像 serverless 应用那样轻量级，需要花费很长的事件来启动和运行。为了避免用户体验上的延迟，PaaS 上的一些功能都需要在大多数时间或全天候运行。

## PaaS 和 serverless 分别提供怎样的工具？

一般来说，PaaS 供应商会为开发者提供更多的工具来构建和管理他们的应用程序，包括用于测试和调试的工具。因为 serverless 应用都不在特定的机器上运行，不管是虚拟机还是其他机器，serverlss 的运行情况都应该是一样的。serverless 供应商可能会提供一些工具，但他们没有提供一个完整的环境供开发者构建和测试应用程序。

## serverless 可以部署在网络边缘吗？

serverless 的代码不在特定服务器中运行，但能运行在互联网的任何地方，这使得 serverless 应用可以在网络边缘部署，从而非常靠近终端用户，大大减少延迟情况的产生。Service workers 和 [Cloudflare Worders](https://www.cloudflare.com/products/cloudflare-workers/) 就是 serverless 靠近用户运行的例子。（请参阅：[Serverless JavaScript 是如何工作的](https://www.cloudflare.com/learning/serverless/serverless-javascript/)）

## 使用 PaaS 构建的应用程序是否可以部署在网络边缘？

从开发人员的角度来看，PaaS 中没有服务器。但是，就托管代码的位置而言，PaaS 仍然与无服务计算不同。PaaS 供应商要么利用其他供应商的 IaaS（基础架构即服务）产品，要么拥有自己的物理数据中心。结果是，构建在云平台上的应用程序可能仅在某些指定的计算机上运行，从而阻止开发人员通过在网络边缘运行代码来优化其应用程序的性能。

# 生词及短语

- architectures

> n. 架构

- divergences

> n. 分歧

- invisible

> adj. 不可见的；无形的

-  either one or the other

> 二者必居其一；或是

- scalability

> n. 可扩展性

- vendor

> n. 供应商

- instantly

> adv. 立刻的；马上

- scenario

> n. 场景

- purifyi

> v. 清洁

- precisely

> adv. 精确地；准确地

- a flat monthly fee

> 每月固定费用

- affordable

> adj. 负担得起

- prohibitively：prohibitively expensive

> adv. 过高地；过分地；禁止地