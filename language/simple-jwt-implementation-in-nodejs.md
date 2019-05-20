- 原文：[Simple JWT Implementation in Node.js: Symmetric Variation](https://guseyn.com/posts/simple-jwt?v=1.0.85)
- 作者：[Guseyn Ismayylov](https://guseyn.com/)
- 翻译：[Gaga Lee](http://gagalee.ink)

# Node.js 的简单 JWT 实现
> In this article, I'll explain how easily you can implement authorization and authentication via JWT using only standard modules in Node.js. So, it might be interesting to you, if you really want to know how it works.

在这篇文章中，我会解释如何通过只使用 Node.js 里的标准模块来实现授权和通过 JWT 进行身份验证。因此，这或许对你来说很有趣，我希望你会知道它是怎么工作的。

> If you don't know what JWT is, you can read this article first. In few words, JWT is a JSON-based open standard for creating access tokens. Let's say you have a system with some REST API, and you want to securily detect a user who calls methods from this API. JWT is quite simple and effective solution for this problem.

如果你并不知道 JWT 是什么，你可以先阅读这篇文章。简单来说，JWT 是一个用来创建访问令牌的基于 JSON 的公开标准。假设你有一个带有部分 REST API 的系统,而且你想要检测调用这些 API 的用户是否是安全的。JWT 会是一个相对简单而且有效的解决方案。

> JWT is a string that has following format:

JWT 是一串如下方所示格式的字符串。

```javascript
'encodedHeaderInBase64.encodedPayloadInBase64.encodedSignatureInBase64'
```

> Let's go through typical workflow of using JWT.

我们来了解下使用 JWT 的典型工作流。

> 1. User signs in a system with some sensitive data like password and simple user data like email or user name. After successfull authentication user gets an access token from server. This token has expiration time, so user cannot use it forever.

1. 用户通过一些敏感数据比如密码和普通的用户数据比如邮箱或者账户名来登录系统。在成功的授权后，用户从服务器获得了一个令牌。这个令牌具有生效时间，所以用户不能永久地使用它。

> 2. We save it to local storage, so user can always have it for calling REST API methods.

2. 我们将它保存在本地的存储内，因此用户总是可以使用它来访问 REST API 的方法。

> 3. Every time user calls a method from API, we send JWT in headers of request and server verifies that token. If it's valid we are allowed to use API method, otherwise we must sign in the system again to get new access token. It's important to use secure protocols like https, because JWT is sensitive data.

3. 每次用户从 API 中调用方法，我们在请求的头文件中发送 JWT ，然后服务器可以识别这个令牌。如果它是存在的，那么就允许我们使用 API 方法，如果不是，那我们就必须再次登录系统去获取新的访问令牌。使用安全的协议如 https 是十分重要的，因为 JWT 是敏感数据。

> 4. If you signs out the system, we delete access token from local storage.

4. 如果你登出系统，我们将会从本地存储中删除访问令牌。

> For creating JWT we need two objects: header and payload.

为了创建 JWT，我们需要两个对象：头文件和负载文件。

> Header is a simple json:

头文件是一段简单的 json。

```javascript
{
 "alg" : "HS256",
 "type" : "JWT"
}
```

> **alg** identifies which algorithm is used to generate the signature, and **type** tell us that we use JSON Web Token. I would recommend you to hardcode this object as a header, if you want to use symmetric algorithms. I don't see any other reason to parametrize this object, so you can avoid a lot of checks on alg property and reduce complexity of your code. Or you can use asymmetric algorithms such as **RS256**, and allow your users to identify themselves via their public keys. But in this article we will consider only symmetric approach (**HS256**).

**alg** 用来确认使用哪一种算法来生成签名，**type** 告知我们，将使用 JSON Web 令牌。我建议你可以将这个对象硬编码为一个头文件，假如你想要使用对称加密算法。我没有发现其他的理由需要去参数化这个对象，所以你可以避免一大堆的对于 alg 属性的确认，并降低你代码的复杂度。或者你可以使用类似于 **RS256** 的对称加密算法，并允许你的用户通过他们的公钥去识别他们自己。不过在这篇文章里我们将只考虑对称的方法（**HS256**）。

> **Payload** is an object that identifies your user, so it has to contain unique data for specific user like email. It can also store some other user data, but you definetely shouldn't store there sensitive information like password. Also, it's useful to store expiration time of access token there.

**Payload** 是一个用来识别你的用户的对象，所以它必须包含特定用户的唯一数据如邮箱。它同样可以存储一些用户的其他数据，不过你绝对不能存储一些敏感数据如密码。除此之外，在这存储令牌的有效时间将会是一个好用的办法。

```javascript
{
  "email": "some@email",
  "exp": 1554540588448
}
```
> You can use following function to add expiration time to your payload:

你可以使用下方的函数来为你的负载增加有效时间。

```javascript
function payloadWithExpirationTime (payload, minutesFromNow) {
  let date = new Date()
  date.setMinutes(date.getMinutes() + minutesFromNow)
  payload.exp = date.getTime()
  return payload
} 
```
> You might wonder why some property names are just three charatecrs long. I have no idea. I read that's sort of some optimisations, but I don't think that's so important.

你或许会疑惑为什么有些属性名称只有三个字符的长度。我也不清楚。我阅读后了解那是部分的优化，不过我认为那是不重要的。

> So, we have header and payload as json structures. And we need to convert them in base64 encoded strings. For doing this, use following function:

所以，我们有了 json 结构的头部文件和负载文件。那么我们需要去将他们转换成 64 位编码的字符串。为了完成这个，我们使用如下的函数：

```javascript
function base64UrlEncodeJSON (json) {
  return Buffer.from(
    JSON.stringify(json)
  ).toString('base64')
   .replace(/\+/g, '-')
   .replace(/\//g, '_')
}
```

> Now we have to generate a signature for our token. For doing that, we need a some secret. It's a just simple string that only your server knows and it's very important to not compromise it.

现在我们需要为我们的令牌生成一个签名。为了做这个事情，我们需要一小许的不公开的内容。
这只是一串只有你的服务器知道的简单的字符串，而且符合规则是非常重要的。

> Use following function to generate a signature:

使用下方的函数来生成一个签名：

```javascript
const crypto = require('crypto')

function generateSignature (str, secret) {
  return crypto
      .createHmac('sha256', secret)
      .update(str)
      .digest('base64')
      .replace(/\+/g, '-')
      .replace(/\//g, '_')
}
```

> Function **generateSignature** also encodes string to base64.

**generateSignature** 函数也可以将字符串编码为64位的。

> So, for creating our access token we do something like this:

因此，为了创建我们的访问令牌我们可以做以下的事情：

```javascript
const encodedHeaderInBase64 = base64UrlEncodeJSON(header)
const encodedPayloadInBase64 = base64UrlEncodeJSON(payload)
const encodedSignatureInBase64 = generateSignature(`${encodedHeaderInBase64}.${encodedPayloadInBase64}`, 'some-secret')
const token = `${encodedHeaderInBase64}.${encodedPayloadInBase64}.${encodedSignatureInBase64}`
```

>Now we need to be able to verify our token from 'Authorization' request header:

现在，我们需要能够去辨别我们从“授权”的请求头文件获得的令牌。

```javascript
// Returns true if token is valid, otherwise returns false
// 如果获取的内容存在则返回true,除此之外返回false
function isValid (token, secret) {
  const parts = token.split('.')
  const header = base64UrlDecodeToJSON(parts[0])
  const payload = base64UrlDecodeToJSON(parts[1])
  if (header.alg !== 'HS256' || header.typ !== 'JWT') {
    return false
  }
  const signature = parts[2]
  const exp = payload.exp
  if (exp) {
    if (exp < new Date().getTime()) {
      return false
    }
  }
  return generateSignature(`${parts[0]}.${parts[1]}`, secret) === signature
}
function base64UrlDecodeToJSON (str) {
  return JSON.parse(
    Buffer.from(
      str.replace(/-/g, '+').replace(/_/g, '/'), 'base64'
    ).toString('utf8')
  )
}
```
> For testing your access token I would suggest this service.

我建议使用这个服务来测试你的访问令牌。

> So, that's it. You can also check this sample app that can show how you can use JWT with Google OAuth and GitHub OAuth.

以上就是全部了。你也可以通过测试这个示例应用程序，来看如何使用 JWT 来进行 Google 授权和 GitHub 授权。

---

> References

参考文献

- [JWT.io](https://jwt.io/)
- [JSON Web Token](https://en.wikipedia.org/wiki/JSON_Web_Token)
- [Sample app using JWT with Google OAuth and GitHub OAuth](https://github.com/Guseyn/simple-oauth-app)

---
# 生词与短语

- implement

> n. 工具，器具；手段  

> vt. 实施，执行；实现，使生效

- Let's say 

> 假设

- optimisation

> 优化

- token

> n. 表征；代币；记号；通证

> adj. 象征的；表意的；作为对某事的保证的

> vt. 象征；代表

- signature

> n. 署名；签名；信号

- protocols

> n. 协议；礼仪礼节；条款（protocol的复数）

> v. 拟定议定书；拟定草案（protocol的三单形式）

- parametrize

> v. 用参数表示；确定……的参数