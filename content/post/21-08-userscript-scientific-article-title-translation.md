---
title: 科技文章标题翻译脚本
author: sanchufy
date: '2021-08-23'
slug: userscript scientific article title translation
categories:
  - JavaScript
  - 工具
tags:
  - userscript
  - 翻译
lastmod: '2021-08-23T08:30:24+08:00'
toc-title: 目录
features:
  - +toc
  - +number_sections
  - +sidenotes
description: '这是一个浏览器用户脚本，目前支持 WOS、Google Scholar、Inoreader 文章标题的自动翻译。'
---

最开始是看到小伙伴在开始选题时，在 Web of Science 上使用划词翻译软件快速阅读、筛选大量相关文章——一篇一篇取词、翻译、再取词、再翻译......当然，这是我们大家都很熟悉的动作了。当时，深深觉得这应该是脚本很适合干的活儿。

最近便发现一个十分强大的用户脚本------[**翻译机：该脚本用于翻译各类常用社交网站为中文，不会经过中间服务器**](https://greasyfork.org/zh-CN/scripts/378277-%E7%BF%BB%E8%AF%91%E6%9C%BA)，可以实现这样的功能。这个脚本格式清晰，也比较好入手"~~借鉴~~抄袭"。Ta 已经把最核心的调用翻译工具的代码都写好了，并且设定了很友好的框架逻辑，看起来剩下的只要会简单的 CSS 选择器，就可以很方便地"~~移植~~抄袭"了。

原脚本支持的翻译网站仅是社交网站，未免太浪费了。内置的翻译源包括：谷歌翻译、有道翻译、 彩云小译、必应翻译等 8 种以上主流的来源[^1]，已经非常强大够用了。

[^1]: 这些翻译通常是使用的公共免费服务，一般均有访问频次、每日访问次数等限制，因此是不稳定的，更好地体验可以自行申请 API。

接下来，我们试着加入科技学术论文数据库网站，实现标题的自动翻译。

# Web of Science

CSS 选择器：

-   支持检索页、详情页；
-   仅一个标题时翻译，多标题时不翻译[^2]，例如，含英文及中文标题时，则不翻译;
-   已知的 bug：经翻译的详情页无法通过标题上方的 Results 链接返回结果页，该链接被吞。

[^2]: 目的是为了有中文标题时，则不翻译。但这应该无法单纯通过 CSS 选择器完美实现，要么另写 jQuery/JS 选择，要么就是如此这般一刀切。

``` js
'WebofScience':{
    name:'WebofScience',
    matcher:/https:\/\/.*?.webofscience.com\/.+/,
    selector:baseSelector('app-summary-title > \
    h3.ng-star-inserted:only-child, \
    #snMainArticle > div:nth-child(1) > div:only-child \
    #FullRTa-fullRecordtitle-0[class="title text--large"]'),
    textGetter:baseTextGetter,
    textSetter:baseTextSetter
}
```

效果展示：

[![WOS 检索页](/assets/image/21-08-wos-summary-title-translation.png "Figure 1: WOS 检索页标题翻译")](https://www.webofscience.com/)

[![WOS 详情页](/assets/image/21-08-wos-record-title-translation.png "Figure 2: WOS 详情页标题翻译")](https://www.webofscience.com/)

详情页中的 DOI 跳转和复制按钮使用了另一脚本实现。

# Google Scholar

CSS 选择器：

``` js
'GoogleScholar':{
    name:'谷歌学术',
    matcher:/https:\/\/(scholar.google.com|en.yaodeyo.com:92)\/.+/,
    selector:baseSelector('.gs_ri > h3 a'),
    textGetter:baseTextGetter,
    textSetter:baseTextSetter
}
```

效果展示：

[![谷歌学术](/assets/image/21-08-scholar-title-google-translation.png "Figure 3: 谷歌学术 - 谷歌翻译")](https://scholar.google.com/)

[![谷歌学术](/assets/image/21-08-scholar-title-youdao-translation.png "Figure 4: 谷歌学术镜像 - 有道翻译")](https://en.yaodeyo.com:92/)

# Inoreader/Innoreader

CSS 选择器：

``` js
'Inoreader':{
    name:'Inoreader',
    matcher:/https:\/\/.*?.inn?oreader.com\/.+/,
    selector:baseSelector('div[class^="article"][class$="title"] > a, \
    div[class~="article_title"] > a'),
    textGetter:baseTextGetter,
    textSetter:baseTextSetter
}
```

效果展示：

[![Inoreader](/assets/image/21-08-inoreader-column-title-translation.png "Figure 5: Inoreader 订阅器 - 分列模式")](https://www.inoreader.com/)

[![Innoreader](/assets/image/21-08-innoreader-card-title-translation.png "Figure 6: innoreader 订阅器 - 卡片模式")](https://www.innoreader.com/)

# 提示

- 一般的[用户脚本安装指南](https://greasyfork.org/zh-CN/)
- 免费服务，就不要恶意频繁地请求了，不然会经常看到翻译报错
- 目前不确定这个脚本的开源许可协议，权作自用
- 本脚本很好扩展至其它网站（含镜像站），若有其它好的建议，可下方留言/评论
