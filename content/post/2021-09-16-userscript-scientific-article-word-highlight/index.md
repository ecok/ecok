---
title: 科技文章自定义词语高亮显示
author: sanchufy
date: '2021-09-16'
slug: userscript-scientific-article-word-highlight
categories:
  - javascript
  - 工具
tags:
  - userscript
  - 阅读
lastmod: '2021-09-16T19:01:32+08:00'
features:
  - +sidenotes
description: '一个浏览器用户脚本，自定义词语，在文章内以高亮显示，目前已支持 Inoreader、Elsevier、Wiley、Springer、Nature、Science、PNAS 各网站'
---

我们在阅读文章时，有些字词是我们想要特别关注的，如果可以被标记出来，想必会有利于阅读。在浏览器中这可以使用搜索功能，使某些词（即检索词）高亮显示，但毕竟、终究不够“懒”。故闲暇又水了一个浏览器用户脚本 (userscript)[^1]，通过自定义比较关注的一至多个主题词（允许使用正则表达式），当文章中一旦出现这些主题词时则自动以高亮显示。结合翻译脚本，~~又~~可以愉快的看文献了！

[^1]: 前一个是：[科技文章标题翻译脚本](/post/21/08/userscript-scientific-article-title-translation/)

已支持的网站有：

- [Inoreader](https://www.inoreader.com/) 或 [Innoreader](https://www.innoreader.com/)
- [Wiley](https://onlinelibrary.wiley.com/)
- [ScienceDirect](http://www.sciencedirect.com/) (Elsevier)
- [Springer](https://link.springer.com/)
- [Nature](https://www.nature.com/)
- [Science](https://www.science.org/)
- [PNAS](https://www.pnas.org/)

目前主题词的设定，需直接写入脚本中，这是一个示例：

``` js
var letI_Wrapper = new wrapTextWithElement ('conservation|\
    biological\\s*\\w*\\s*\\w*\\s*invasion|\
    restoration|ecosystems?'), '<span class="coloredWord">');
```

它匹配了如下这些词：

- conservation
- biological * invasion：此处 * 表示允许词组中间出现任意长度的 0 至 2 个词（含数字）
- restoration
- ecosystem 或 ecosystems

在脚本中修改对应位置的主题词，即可实现适合自己的自定义设置。

以下是部分效果展示：

![Innoreader 阅读页面](/assets/image/21-09-innoreader-highlight.png "Figure 1: Innoreader 主题词高亮")

![Wiley 文章页面](/assets/image/21-09-Wiley-highlight.png "Figure 2: Wiley 主题词高亮")

![Elsevier/ScienceDirect 文章页面](/assets/image/21-09-ScienceDirect-highlight.png "Figure 3: Elsevier/ScienceDirect 主题词高亮")

![Springer 文章页面](/assets/image/21-09-Springer-highlight.png "Figure 4: Springer 主题词高亮")


本人并没有学过 Javascript，这个脚本毫无意外是东拼西凑形成的，罗列如下并表示感谢：

- [How to change the color of one specific letter on a web page (wrap the text)?](https://stackoverflow.com/a/14178388)
- [waitForKeyElements.js](https://gist.github.com/BrockA/2625891)
- [翻译机](https://greasyfork.org/zh-CN/scripts/378277-%E7%BF%BB%E8%AF%91%E6%9C%BA/code)
