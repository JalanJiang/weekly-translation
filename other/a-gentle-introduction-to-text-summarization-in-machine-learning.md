- 原文：[A Gentle Introduction to Text Summarization in Machine Learning](https://blog.floydhub.com/gentle-introduction-to-text-summarization-in-machine-learning/)
- 作者：[Alfrick Opidi](https://blog.floydhub.com/author/alfrick/)
- 翻译：[Gaga Lee](http://gagalee.ink)

# 浅谈机器学习中的文本摘要

> Have you ever summarized a lengthy document into a short paragraph? How long did you take? Manually generating a summary can be time consuming and tedious. Automatic text summarization promises to overcome such difficulties and allow you to generate the key ideas in a piece of writing easily.

你有没有尝试过将一段冗长的文本总结为一段简单的文本？你需要花多长时间呢？手动来生成总结是一个既浪费时间又超没有意思的事情。自动文本摘要功能为我们提供了一个克服这个困难的方法，并且可以让你很方便地获得一段文本中的主要观点。

> Text summarization is the technique for generating a concise and precise summary of voluminous texts while focusing on the sections that convey useful information, and without losing the overall meaning.

当在我们关注一些传递有效信息的章节的时候，文本摘要技术可以帮助我们提炼简短且精确的摘要，而且不失去整体含义。

> Automatic text summarization aims to transform lengthy documents into shortened versions, something which could be difficult and costly to undertake if done manually. 

自动文本摘要的目标是将冗长的文本转换成更短的版本，而这种转换如果手动制作的话，有一定难度且需要花费大代价。

> Machine learning algorithms can be trained to comprehend documents and identify the sections that convey important facts and information before producing the required summarized texts. For example, the image below is of [this news article](https://www.autosport.com/motogp/news/142779/marquez-calls-austin-crash-hard-to-understand) that has been fed into a machine learning algorithm to generate a summary.

机器学习算法在制作所需要的文本摘要之前，要训练如何去理解文本的组成，并识别那些传递重要事实和信息的段落。举个栗子，下图中这篇新闻文章就被送入机器学习算法去生成摘要。

## 文本摘要的需求

> With the present explosion of data circulating the digital space, which is mostly non-structured textual data, there is a need to develop automatic text summarization tools that allow people to get insights from them easily. Currently, we enjoy quick access to enormous amounts of information. However, most of this information is redundant, insignificant, and may not convey the intended meaning. For example, if you are looking for specific information from an online news article, you may have to dig through its content and spend a lot of time weeding out the unnecessary stuff before getting the information you want. Therefore, using automatic text summarizers capable of extracting useful information that leaves out inessential and insignificant data is becoming vital. Implementing summarization can enhance the readability of documents, reduce the time spent in researching for information, and allow for more information to be fitted in a particular area.

随着现在数据存储空间中的流通数据的爆炸式增长，且大部分是没有结构化的文本数据，所以开发出一款可以帮助人们更方便的从文本中获取主要观点的文本摘要工具是十分必要的。目前，我们享受着快速获取到海量信息的便捷。然而，这些信息中大部分是多余的，无关紧要的，而且不能传递原义。举个栗子，假设你正在从一篇在线的新闻中寻找特定的信息，你在获得你想要的信息之前，必须得从文章内容中挖掘信息，并花好长的时间去剔除不必要的东西。因此，能够利用自动文本摘要来剔除无效或者不重要的信息，然后提取有效信息，这正变得越来越重要。实现了摘要可以有助于提升文本的可读性，减少了寻找信息的时间，并允许特定的范围内可以包含更多的信息。

## 文本摘要的主要类型

> Broadly, there are two approaches to summarizing texts in NLP: extraction and abstraction.

一般来说，应用 NLP 来进行文本摘要的方法有两种：提取和抽象。

### 基于提取的摘要

> In extraction-based summarization, a subset of words that represent the most important points is pulled from a piece of text and combined to make a summary. Think of it as a highlighter—which selects the main information from a source text.

在基于提取的摘要中，将从文本中提取出可以指出重要观点的词汇自己，并组合形成一个摘要。可以把它看做从源文本中选取一些主要信息进行高亮。

> In machine learning, extractive summarization usually involves weighing the essential sections of sentences and using the results to generate summaries.

在机器学习中，提取文本摘要经常涉及到计算句子的必要组成部分的权重，并且利用这个结果来生成摘要。

> Different types of algorithms and methods can be used to gauge the weights of the sentences and then rank them according to their relevance and similarity with one another—and further joining them to generate a summary.

不同类型的算法和方法可以用来测量句子的权重，并且根据他们的相关性和相似性对他们进行排序，并进一步的将他们连接起来生成摘要。

### 基于抽象的摘要

> In abstraction-based summarization, advanced deep learning techniques are applied to paraphrase and shorten the original document, just like humans do. Think of it as a pen—which produces novel sentences that may not be part of the source document.

在基于抽象的摘要中，前置的深度学习技术被用来解释和精简原始的文档，正如人类的做法。把它想象成一支钢笔，可以写出新的不属于源文档的任何部分的句子。

> Although abstraction performs better at text summarization, developing its algorithms requires complicated deep learning techniques and sophisticated language modeling.

虽然在文本摘要上，抽象方式表现的更好，但是不断发展它的算法还需要复杂的深度学习技术和复杂的语言模型。

> To generate plausible outputs, abstraction-based summarization approaches must address a wide variety of NLP problems, such as natural language generation, semantic representation, and inference permutation.

为了生成可信的输出结果，基于抽象的文本摘要方法必须处理一大堆 NLP 的问题，比如说自然语言生成、语义表示和推理排列。

> As such, extractive text summarization approaches are still widely popular. In this article, we’ll be focusing on an extraction-based method.

因为这样，基于抽取的文本摘要方法始终广受欢迎。在这篇文章中，我们也将主要聚焦于一个基于抽取的文本摘要方法。

## 如何执行文本摘要

> Let’s use a short paragraph to illustrate how extractive text summarization can be performed.

让我们使用一个简短的片段来说明，提取文本摘要是怎么样执行的。

> Here is the paragraph:

这里有个片段：

> Peter and Elizabeth took a taxi to attend the night party in the city. While in the party, Elizabeth collapsed and was rushed to the hospital. Since she was diagnosed with a brain injury, the doctor told Peter to stay besides her until she gets well. Therefore, Peter stayed with her at the hospital for 3 days without leaving.”

皮特和伊丽莎白乘坐出租车去参加城市里的夜间派对。在派对过程中，伊丽莎白晕倒了并马上被送去了医院。当她被诊断为脑部受伤之后，医生叮嘱皮特要陪护着她直到她好起来。因此，皮特没有离开医院，整整陪护了她三天。

> Here are the steps to follow to summarize the above paragraph, while trying to maintain its intended meaning, as much as possible.

这是总结上方文章片段的步骤，我们尽可能的要保持它原有的语义。

### 第一步：将文章段落转换为句子

> First, let’s split the paragraph into its corresponding sentences. The best way of doing the conversion is to extract a sentence whenever a period appears.

首先，我们将文章段落分割成对应的句子。最好的办法就是当句号出现的时候进行提取。

> 1. Peter and Elizabeth took a taxi to attend the night party in the city

1. 皮特和伊丽莎白乘坐出租车去参加城市里的夜间派对

> 2. While in the party, Elizabeth collapsed and was rushed to the hospital

2. 在派对过程中，伊丽莎白晕倒了并马上被送去了医院。

> 3. Since she was diagnosed with a brain injury, the doctor told Peter to stay besides her until she gets well

3. 当她被诊断为脑部受伤之后，医生叮嘱皮特要陪护着她直到她好起来。

> 4. Therefore, Peter stayed with her at the hospital for 3 days without leaving

4. 因此，皮特没有离开医院，整整陪护了她三天。

### 第二步：文本处理

> Next, let’s do text processing by removing the stop words (extremely common words with little meaning such as “and” and “the”), numbers, punctuation, and other special characters from the sentences.

接着，我们通过移除句子中的停顿词（尤其是常见的低语义的词语，比如“和”以及定冠词），数字，标点符号和其他特殊的字符来进行文本处理。

> Performing the filtering assists in removing redundant and insignificant information which may not provide any added value to the text’s meaning.

执行过滤将有助于移除多余且无用的信息，这些信息并不会为句子的意义增加价值。

> Here is the result of the text processing:

下面是文本处理后的结果：

> 1. Peter Elizabeth took taxi attend night party city

1. 皮特 伊丽莎白 乘坐 地址 参加 晚上 派对 城市

> 2. Party Elizabeth collapse rush hospital

2. 派对 伊丽莎白 晕倒 马上 医院

> 3. Diagnose brain injury doctor told Peter stay besides get well

3. 诊断 大脑 受伤 医生 告知 皮特 留在 边上 边好

> 4. Peter stay hospital days without leaving

4. 皮特 留在 医院 天（许多） 没有离开

### 第三步：词语切分

> Tokenizing the sentences is done to get all the words present in the sentences. Here is a list of the words:

词语切分是为了获得句子中的所有词语。下面是一串词语的列表。

```python
['peter','elizabeth','took','taxi','attend','night','party','city','party','elizabeth','collapse','rush','hospital', 'diagnose','brain', 'injury', 'doctor','told','peter','stay','besides','get','well','peter', 'stayed','hospital','days','without','leaving']
```

### 第四步：根据单词出现的频率来评估权重

> Thereafter, let’s calculate the weighted occurrence frequency of all the words. To achieve this, let’s divide the occurrence frequency of each of the words by the frequency of the most recurrent word in the paragraph, which is “Peter” that occurs three times.

之后，让我们来计算下所有出现的单词的加权频率。为了完成这件事儿，我们将每个出现的单词的频数除以段落中最常重复出现的单词，比如出现了三次的“皮特”。

> Here is a table that gives the weighted occurrence frequency of each of the words.

下面的表格中呈现了每个单词出现的加权频率。

<div style="text-align:center;">

单词 | 频数 | 加权频率
---|---|---
peter | 3 | 1
elizabeth | 2 | 0.67
took | 1 | 0.33
taxi | 1 | 0.33
attend | 1 | 0.33
night | 1 | 0.33
party | 2 | 0.67
city | 1 | 0.33
collapse | 1 | 0.33
rush | 1 | 0.33
hospital | 2 | 0.67
diagnose | 1 | 0.33
brain | 1 | 0.33
injury | 1 | 0.33
doctor | 1 | 0.33
told | 1 | 0.33
stay | 2 | 0.67
besides | 1 | 0.33
get | 1 | 0.33
well | 1 | 0.33
days | 1 | 0.33
without | 1 | 0.33
leaving | 1 | 0.33

</div>

### 第五步：根据单词的加权频率来进行替代

> Let’s substitute each of the words found in the original sentences with their weighted frequencies. Then, we’ll compute their sum.

我们用单词的加权频率来替代原句中的单词。然后，我们来计算下他们的总和。

> Since the weighted frequencies of the insignificant words, such as stop words and special characters, which were removed during the processing stage, is zero, it’s not necessary to add them.

而在处理阶段被移除的那些词语，比如停顿词或者特殊的字符，他们的加权频率为零，所以并不需要去添加他们。

<div style="text-align:center;">

句子 | 加权频率 | 加总过程 | 总和
---|---|---|---
1 | 皮特和伊丽莎白乘坐出租车去参加城市里的夜间派对 | 1 + 0.67 + 0.33 + 0.33 + 0.33 + 0.33 + 0.67 + 0.33 | 3.99
2 | 在派对过程中，伊丽莎白晕倒了并马上被送去了医院 | 0.67 + 0.67 + 0.33 + 0.33 + 0.67 | 2.67
3 | 当她被诊断为脑部受伤之后，医生叮嘱皮特要陪护着她直到她好起来 | 0.33 + 0.33 + 0.33 + 0.33 + 1 + 0.33 + 0.33 + 0.33 + 0.33 +0.33 | 3.97
4 | 因此，皮特没有离开医院，整整陪护了她三天 | 1 + 0.67 + 0.67 + 0.33 + 0.33 + 0.33 | 3.33

</div>

> From the sum of the weighted frequencies of the words, we can deduce that the first sentence carries the most weight in the paragraph. Therefore, it can give the best representative summary of what the paragraph is about.

从单词的权重频率总和来看，我们可以推断首句在文章段落中获得了最高权重。因此，首句是可以提供整个段落含义的最优总结。

> Furthermore, if the first sentence is combined with the third sentence, which is the second-most weighty sentence in the paragraph, a better summary can be generated.

此外，如果将首句和段落中具有第二大权重的第三句结合起来，将会获得一个更好的总结。

> The above example just gives a basic illustration of how to perform extraction-based text summarization in machine learning. Now, let’s see how we can apply the concept above in creating a real-world summary generator.

上面的栗子只是提供了一个基础的说明，如何在机器学习中基于提取来获得文本摘要。现在，我们来看看如何根据上方这个概念来进行一个真实可用的摘要生成器。

## 一篇维基百科文章的文本摘要

> Let’s get our hands dirty by creating a text summarizer that can shorten the information found in a lengthy web article. To keep things simple, apart from Python’s [NLTK toolkit](https://www.nltk.org/), we’ll not use any other machine learning library.

让我们来手动创造一个文本摘要器，可以用来精简网络上找到的冗长文章的信息量。为了简单方便一点，除了 Python 的 **LTK toolkit**，我们将不会使用其他的机器学习函数库。

> Here is the code blueprint of the summarizer:

下面是摘要器的伪代码模型：

```python
# Creating a dictionary for the word frequency table
frequency_table = _create_dictionary_table(article)

# Tokenizing the sentences
sentences = sent_tokenize(article)

# Algorithm for scoring a sentence by its words
sentence_scores = _calculate_sentence_scores(sentences, frequency_table)

# Getting the threshold
threshold = _calculate_average_score(sentence_scores)

# Producing the summary
article_summary = _get_article_summary(sentences, sentence_scores, 1.5 * threshold)

print(article_summary)

```

> Here are the steps for creating a simple text summarizer in Python.

下面是用 Python 来生成简单的文本摘要器的步骤。

### 第一步：准备好数据

> In this example, we want to summarize the information found on this Wikipedia article, which just gives an overview of the major happenings during the 20th century.

在这个栗子中，我们希望从这篇维基百科的文章中获取摘要信息，这个信息可以回顾 20 世纪中发生的主要的大事件。

> To enable us to fetch the article’s text, we’ll use the Beautiful Soup library.

为了获取文章的文本信息，我们将使用 **Beautiful Soup** 库。

> Here is the code for scraping the article’s content:

下面是抓取文章内容的代码：

```python
import bs4 as BeautifulSoup
import urllib.request  

# Fetching the content from the URL
fetched_data = urllib.request.urlopen('https://en.wikipedia.org/wiki/20th_century')

article_read = fetched_data.read()

# Parsing the URL content and storing in a variable
article_parsed = BeautifulSoup.BeautifulSoup(article_read,'html.parser')

# Returning <p> tags
paragraphs = article_parsed.find_all('p')

article_content = ''

# Looping through the paragraphs and adding them to the variable
for p in paragraphs:  
    article_content += p.text
```

> In the above code, we begin by importing the essential libraries for fetching data from the web page. The **BeautifulSoup** library is used for parsing the page while the [urllib library](https://docs.python.org/3/library/urllib.html) is used for connecting to the page and retrieving the HTML.

在上面的代码中，我们从导入最必要的用来抓取网页数据的库开始。**BeautifulSoup** 库是用来解析页面的，同时，**urllib library** 库是用来连接网页并检索 HTML 。

> BeautifulSoup converts the incoming text to Unicode characters and the outgoing text to UTF-8 characters, saving you the hassle of managing different charset encodings while scraping text from the web.

BeautifulSoup 将传入的文本转换为 Unicode 字符，并将发出的文本转换为 UTF-8 字符，解决了从网页抓取文本时候会遇到的文本编码管理的问题。

> We’ll use the `urlopen` function from the `urllib.request` utility to open the web page. Then, we’ll use the `read` function to read the scraped data object. For parsing the data, we’ll call the `BeautifulSoup` object and pass two parameters to it; that is, the `article_read` and the `html.parser`.

我们使用 `urllib.request` 程序中的 `urlopen` 函数来打开网页。接着，我们使用 `read` 函数来读取抓取到的数据对象。 为了解析数据，我们将调用 `BeautifulSoup` 对象并传入两个参数：分别是 `article_read` 和 `html.parser` 。

> The `find_all` function is used to return all the `<p>` elements present in the HTML. Furthermore, using `.text` enables us to select only the texts found within the `<p>` elements.

使用 `find_all` 函数来返回 HTML 中出现的所有 `<p>` 元素。此外，使用 `.text` 就可以选取到 `<p>` 元素中包裹的文本信息。

### 第二步：处理数据

> To ensure the scrapped textual data is as noise-free as possible, we’ll perform some basic text cleaning.  To assist us to do the processing, we’ll import a list of **stopwords** from the **nltk** library.

为了保证抓取到的文本数据尽可能的没有噪声干扰，我们将进行一些基础的数据清洗。为了完成这个步骤，我们将从 **nltk** 库里引入一系列的**停顿词**。

> We’ll also import **PorterStemmer**, which is an algorithm for reducing words into their root forms. For example, cleaning, cleaned, and cleaner can be reduced to the root clean.

我们同样也会引入 **PorterStemmer**,这是一种可以将词语还原成词根模式的算法。举个栗子， cleaning, cleaned 和 cleaner 将会被还原成最根本的 clean。

> Furthermore, we’ll create a dictionary table having the frequency of occurrence of each of the words in the text. We’ll loop through the text and the corresponding words to eliminate any stop words.

此外，我们将新建一个词典表来统计文本信息中的每个单词的出现频率。我们将循环遍历整个文本和相应的词语，来排除那些停顿词。

> Then, we’ll check if the words are present in the frequency_table. If the word was previously available in the dictionary, its value is updated by 1. Otherwise, if the word is recognized for the first time, its value is set to 1.

接着，我们要确认单词是否已经被记录进频率表。如果单词之前就已经在词典中存在，它的值将增加 1。否则的话，假如这个单词是第一次被验证的话，它的值将会被设置为1。

> For example, the frequency table should look like the following:

举个栗子，频数统计表应该看起来像下面这个表格：

<div style="text-align:center;">

词语 | 频数
---|---
century | 7
world | 4
United States | 3
computer | 1

</div>

> Here is the code: 

下面是代码：

```python
from nltk.corpus import stopwords
from nltk.stem import PorterStemmer
def _create_dictionary_table(text_string) -> dict:
   
    # Removing stop words
    stop_words = set(stopwords.words("english"))
    
    words = word_tokenize(text_string)
    
    # Reducing words to their root form
    stem = PorterStemmer()
    
    # Creating dictionary for the word frequency table
    frequency_table = dict()
    for wd in words:
        wd = stem.stem(wd)
        if wd in stop_words:
            continue
        if wd in frequency_table:
            frequency_table[wd] += 1
        else:
            frequency_table[wd] = 1

    return frequency_table
```

### 第三步：将文章拆分成句子

> To split the `article_content` into a set of sentences, we’ll use the built-in method from the **nltk** library.

为了将文章内容分割成一系列的句子，我们将使用 **nltk** 库里的 built-in 方法。

```python
from nltk.tokenize import word_tokenize, sent_tokenize

sentences = sent_tokenize(article)
```

### 第四步：求句子的加权频率

> To evaluate the score for every sentence in the text, we’ll be analyzing the frequency of occurrence of each term. In this case, we’ll be scoring each sentence by its words; that is, adding the frequency of each important word found in the sentence.

为了评估文本中每个句子的分数，我们将分析每一项出现的频率。在这种情况下，我们将根据每个句子中的词汇来进行评分，就是讲每个句子中的重要单词的频率进行加和。

> Take a look at the following code:

看一下下方的代码：

```python
def _calculate_sentence_scores(sentences, frequency_table) -> dict:   

    # Algorithm for scoring a sentence by its words
    sentence_weight = dict()

    for sentence in sentences:
        sentence_wordcount = (len(word_tokenize(sentence)))
        sentence_wordcount_without_stop_words = 0
        for word_weight in frequency_table:
            if word_weight in sentence.lower():
                sentence_wordcount_without_stop_words += 1
                if sentence[:7] in sentence_weight:
                    sentence_weight[sentence[:7]] += frequency_table[word_weight]
                else:
                    sentence_weight[sentence[:7]] = frequency_table[word_weight]

        sentence_weight[sentence[:7]] = sentence_weight[sentence[:7]] /        sentence_wordcount_without_stop_words
      
    return sentence_weight
```

> Importantly, to ensure long sentences do not have unnecessarily high scores over short sentences, we divided each score of a sentence by the number of words found in that sentence.

重要的是，为了保证长句一定不会比短句获得更高的分数，我们会将每个句子的得分除以句子中可以找到的单词数量。

> Also, to optimize the dictionary’s memory, we arbitrarily added entence[:7], which refers to the first 7 characters in each sentence. However, for longer documents, where you are likely to encounter sentences with the same first `n_chars`, it’s better to use hash functions or smart index functions to take into account such edge-cases and avoid collisions.

同时，为了优化词典的存储，我们将随机的加入句子[:7]，就是每个句子的最开始的 7 个字符。然而，对于更长的文本，你可能会遇到具有相同的首字母 `n_chars` 的句子们，所以最好使用 hash 函数或智能索引函数来应对这种边缘情况，并避免冲突。

### 第五步：计算句子的阈值

> To further tweak the kind of sentences eligible for summarization, we’ll create the average score for the sentences. With this threshold, we can avoid selecting the sentences with a lower score than the average score.

为了进一步调整适合概括的句子类型，我们要得出这些句子的平均分。根据这个阈值，我们可以避免选到得分比平均分还低的句子。

> Here is the code:

下方是代码：

```python
def _calculate_average_score(sentence_weight) -> int:
   
    # Calculating the average score for the sentences
    sum_values = 0
    for entry in sentence_weight:
        sum_values += sentence_weight[entry]

    # Getting sentence average value from source text
    average_score = (sum_values / len(sentence_weight))

    return average_score
```

### 第六步：获得摘要

> Lastly, since we have all the required parameters, we can now generate a summary for the article.

最后，当我们获得了所有必须的参数后，我们现在可以生成文章的摘要啦。

> Here is the code:

下面是代码：

```python
def _get_article_summary(sentences, sentence_weight, threshold):
    sentence_counter = 0
    article_summary = ''

    for sentence in sentences:
        if sentence[:7] in sentence_weight and sentence_weight[sentence[:7]] >= (threshold):
            article_summary += " " + sentence
            sentence_counter += 1

    return article_summary
```

## 尾声

> Here is the entire code for the simple extractive text summarizer in machine learning:

下面是机器学习中简单提取文本摘要器的代码：

```python
#importing libraries
from nltk.corpus import stopwords
from nltk.stem import PorterStemmer
from nltk.tokenize import word_tokenize, sent_tokenize
import bs4 as BeautifulSoup
import urllib.request  

#fetching the content from the URL
fetched_data = urllib.request.urlopen('https://en.wikipedia.org/wiki/20th_century')

article_read = fetched_data.read()

#parsing the URL content and storing in a variable
article_parsed = BeautifulSoup.BeautifulSoup(article_read,'html.parser')

#returning <p> tags
paragraphs = article_parsed.find_all('p')

article_content = ''

#looping through the paragraphs and adding them to the variable
for p in paragraphs:  
    article_content += p.text


def _create_dictionary_table(text_string) -> dict:
   
    #removing stop words
    stop_words = set(stopwords.words("english"))
    
    words = word_tokenize(text_string)
    
    #reducing words to their root form
    stem = PorterStemmer()
    
    #creating dictionary for the word frequency table
    frequency_table = dict()
    for wd in words:
        wd = stem.stem(wd)
        if wd in stop_words:
            continue
        if wd in frequency_table:
            frequency_table[wd] += 1
        else:
            frequency_table[wd] = 1

    return frequency_table


def _calculate_sentence_scores(sentences, frequency_table) -> dict:   

    #algorithm for scoring a sentence by its words
    sentence_weight = dict()

    for sentence in sentences:
        sentence_wordcount = (len(word_tokenize(sentence)))
        sentence_wordcount_without_stop_words = 0
        for word_weight in frequency_table:
            if word_weight in sentence.lower():
                sentence_wordcount_without_stop_words += 1
                if sentence[:7] in sentence_weight:
                    sentence_weight[sentence[:7]] += frequency_table[word_weight]
                else:
                    sentence_weight[sentence[:7]] = frequency_table[word_weight]

        sentence_weight[sentence[:7]] = sentence_weight[sentence[:7]] / sentence_wordcount_without_stop_words

       

    return sentence_weight

def _calculate_average_score(sentence_weight) -> int:
   
    #calculating the average score for the sentences
    sum_values = 0
    for entry in sentence_weight:
        sum_values += sentence_weight[entry]

    #getting sentence average value from source text
    average_score = (sum_values / len(sentence_weight))

    return average_score

def _get_article_summary(sentences, sentence_weight, threshold):
    sentence_counter = 0
    article_summary = ''

    for sentence in sentences:
        if sentence[:7] in sentence_weight and sentence_weight[sentence[:7]] >= (threshold):
            article_summary += " " + sentence
            sentence_counter += 1

    return article_summary

def _run_article_summary(article):
    
    #creating a dictionary for the word frequency table
    frequency_table = _create_dictionary_table(article)

    #tokenizing the sentences
    sentences = sent_tokenize(article)

    #algorithm for scoring a sentence by its words
    sentence_scores = _calculate_sentence_scores(sentences, frequency_table)

    #getting the threshold
    threshold = _calculate_average_score(sentence_scores)

    #producing the summary
    article_summary = _get_article_summary(sentences, sentence_scores, 1.5 * threshold)

    return article_summary

if __name__ == '__main__':
    summary_results = _run_article_summary(article_content)
    print(summary_results)

```

> In this case, we applied a threshold of 1.5x of the average score. It’s the [hyperparameter](https://blog.floydhub.com/guide-to-hyperparameters-search-for-deep-learning-models/) value that generated for us good results after a couple of trials. Of course, you can fine-tune the value according to your preferences and improve the summarization outcomes.

在这个栗子中，我们使用的阈值是平均分的 1.5 倍。这是我们通过几次尝试之后获得的好的结果值。当然，你可以根据你的倾向去调整这个值并提升摘要器的输出。

> As you can see, running the code summarizes the lengthy Wikipedia article and gives a simplistic overview of the main happenings in the 20th century.

正如你所看到的那样，运行代码来对冗长的维基百科进行总结，并提供了一个简要的 20 世纪大事纪的回顾。

> Nonetheless, the summary generator can be improved to make it better at producing a concise and precise summary of voluminous texts.

尽管如此，摘要生成器可以不断的提升优化去从冗杂的文本中得出更加精炼准确的总结。

## 提升高度试试~

> Of course, this article just brushed the surface of what you can achieve with a text summarization algorithm in machine learning.

当然，这篇文章仅仅只是片面的介绍了能通过机器学习完成的一个文本摘要算法。

> To learn more about the subject, especially about abstractive text summarization, here are some useful resources you can use:

为了拓展学习这个课题，特别是关于抽象文本摘要，下面是一些有用的资源可供使用：

> - Is it possible to combine the two approaches (abstractive and extractive)? It is the main idea behind the pointer-generator network that gets the best of both worlds by combining both extraction(pointing) and abstraction(generating).

- 是否有可能组合两种方法（抽象和提取）呢？这个是 指向-生成器 网络的最主要观点：让提取（指向）和抽象（生成）两种方法结合得到更好的效果。

> - [How to use WikiHow, a large-scale text summarization dataset](https://arxiv.org/pdf/1810.09305.pdf)—This paper introduces WikiHow, a new large-scale text summarization dataset that comprises of more than 230,000 articles extracted from the WikiHow online knowledge base. Most of the presently available datasets are not large enough for training sequence-to-sequence modelsmodels, they may provide only limited summaries, and they are more suited to performing extractive summarization. However, the WikiHow dataset is large-scale, high-quality, and capable of achieving optimal results in abstractive summarization.

- [如何使用 WikiHow，一个巨大规模的文本摘要数据集](https://arxiv.org/pdf/1810.09305.pdf)—这篇论文介绍了 WikiHow，一个新的拥有巨大规模的文本摘要数据集，它由超过了 230,000 篇从 Wiki How 在线知识库提取的文章组成。现存已有的大多数数据集的体量都不足以完成 sequence-to-sequence 模型的训练，他们有的只提供有限的摘要，这样会更适合进行摘要的提取。然而， WikiHow 数据集是一个大规模，高质量，而且能在抽象结果中获得最有结果。

> - [How a pretraining-based encoder-decoder framework can be used in text summarization](https://arxiv.org/pdf/1902.09243.pdf)—This paper introduces a unique two-stage model that is based on a sequence-to-sequence paradigm. The model makes use of [BERT](https://arxiv.org/abs/1810.04805) ([you can bet that we will continue to read about BERT in all 2019](https://blog.floydhub.com/ten-trends-in-deep-learning-nlp/)) on both encoder and decoder sides and focuses on reinforced objective during the learning process. When the model was assessed on some benchmark datasets, the outcome revealed that the approach performed better at text summarization, particularly when compared to other traditional systems.

- [如何在文本摘要中使用预训练的编解码框架](https://arxiv.org/pdf/1902.09243.pdf)—这篇论文介绍了一个独特的基于 sequence-to-sequence 范式的两段式模型。这个模型在解码和编码都使用了 [BERT](https://arxiv.org/abs/1810.04805) ([你可以确信我们将在整个 2019 继续研究 BERT ](https://blog.floydhub.com/ten-trends-in-deep-learning-nlp/))，并且在学习过程中聚焦于增强目标。当基于一些基准数据对模型进行评估时，结果表明该方法在文本摘要上表现的更好，尤其是和其他传统系统进行对比的时候。

# 生词与短语

- time consuming

> 浪费时间的

- tedious

> adj. 沉闷的；冗长乏味的

- redundant

> adj. 多余的，过剩的；被解雇的，失业的；冗长的，累赘的

- concise

> adj. 简明的，简洁的

- precise

> adj. 精确的；明确的；严格的

- voluminous

> adj. 大量的；多卷的，长篇的；著书多的

- collapsed

> adj. 倒塌的；暴跌的；收缩的；倾陷了的

> v. 倒塌；崩溃（collapse的过去分词）；价格暴跌

- corresponding

> adj. 相当的，相应的；一致的；通信的

> v. 类似（correspond的ing形式）；相配

- assists in

> 有助于

- insignificant

> adj. 无关紧要的

- representative

> n. 代表；典型；众议员

> adj. 典型的，有代表性的；代议制的

- eliminate

> vt. 消除；排除

- take into account

> 考虑；重视；体谅

- tweak

> n. 扭；轻微调整

> v. 扭；（非正式）稍微调整机器或系统；用力拉；焦急

- sophisticated

> adj. 复杂的；精致的；久经世故的；富有经验的

> v. 使变得世故；使迷惑；篡改（sophisticate的过去分词形式）

- semantic representation

> 语义表示

- inference permutation

> 推理排列