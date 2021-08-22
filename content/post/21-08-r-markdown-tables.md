---
title: 在 Markdown、R Markdown 中使用表格
author: sanchufy
date: '2021-08-05'
slug: r-markdown-tables
categories:
  - R 语言
tags:
  - rmarkdown
  - markdown
draft: true
features: [+toc, +number_sections, +sidenotes]
description: Markdown 表格大概有两种，一种经数据转换，另一种为手动输入。使用复杂表格可以说是 Markdown 的一大痛点。
---

# 表格形式

Markdown 表格大概有两种，一种是经数据存储格式转换为标准表格样式，通常是整齐的数据或文本（这里暂称为“转换的数据表格”）；另一种是手动输入为表格形式，一般是为了便于组织内容，使文本更清晰易读（这里暂称为“输入的文本表格”）。

## 转换的数据表格

在 R Markdown 中可以通过各种包（packages）将数据转为表格形式。在 *[R Markdown Cookbook](https://bookdown.org/yihui/rmarkdown-cookbook/tables.html)* 一书中主要介绍了两种方式，`knitr::kable()` 和 **[kableExtra](https://cran.r-project.org/web/packages/kableExtra/vignettes/awesome_table_in_html.html)** 包，后者是对前者的进一步补充和扩展。

书中还列举了一些[其它的包](https://bookdown.org/yihui/rmarkdown-cookbook/table-other.html)，比如：

- **[flextable](https://davidgohel.github.io/flextable/)** 包，支持多种输出格式
- **[huxtable](https://hughjonesd.github.io/huxtable/)** 包，支持多种输出格式
- **[stargazer](https://cran.r-project.org/package=stargazer)** 包，支持列表
- **[pixiedust](https://github.com/nutterb/pixiedust)** 包，为 **broom** 包整理后的结果创建表格

结合 **[broom](https://broom.tidymodels.org/)** 等包，可以将统计模型与计算的结果便捷的输出为整洁的表格。


## 输入的文本表格

Mardown 中的表格需要扩展支持，常见的是简单表（simple tables）和管道表（pipe tables），更为复杂的是网格表（grid tables）。

对于 Markdown 解析器（parsers；标记识别符，markup identifier），R markdown 需要 [Pandoc](https://pandoc.org/)  提供支持；blogdown 依赖 Hugo，其 0.60.0 版以后默认使用 [Goldmark](https://github.com/yuin/goldmark/) 识别，尽管也可使用 Pandoc 或 [AsciiDoc](https://asciidoctor.org/) 等替代；而常用的源代码托管服务平台 Github 自身也支持 Markdown。下面对这些常用的工具进行简单的了解。

### Pandoc {#pandoc-tables}

[Pandoc](https://pandoc.org/MANUAL.html) 目前仍[不支持合并单元格](https://github.com/jgm/pandoc/issues/6317)，不过它们能将各种类型标记的表格渲染成它们所支持的表格样式，参见[Better tables](https://github.com/jgm/pandoc-types/pull/66)。

1. 扩展：[simple_tables](https://pandoc.org/MANUAL.html#extension-simple_tables)

```markdown
  Right     Left     Center     Default
-------     ------ ----------   -------
      1     2          34            56

Table:  Demonstration of simple table syntax.
```

2. 扩展：[pipe_tables](https://pandoc.org/MANUAL.html#extension-pipe_tables)

```markdown
| Right | Left | Default | Center |
|------:|:-----|---------|:------:|
|   12  |  12  |    12   |    12  |

: Demonstration of pipe table syntax.
```

3. 扩展：[grid_tables](https://pandoc.org/MANUAL.html#extension-grid_tables)

```markdown
: Sample grid table.

+---------------+---------------+--------------------+
| Fruit         | Price         | Advantages         |
+===============+===============+====================+
| Bananas       | $1.34         | - built-in wrapper |
|               |               | - bright color     |
+---------------+---------------+--------------------+
```

### GitHub Flavored Markdown, GFM

[GitHub Flavored Markdown](https://github.github.com/gfm/#tables-extension-) 表格扩展支持管道表，不支持网格表。Goldenmark 采用了 GitHub Flavored Markdown 的表格扩展规范，因此语法相同。

1. 管道表（1）

```markdown
| foo | bar |
| --- | --- |
| baz | bim |
```

2. 管道表（2）

```
| abc | defghi |
:-: | -----------:
bar | baz
```


### 其它

Pandoc、GMF 和 Hugo 都不支持单元格跨行（rowspan）、跨列（colspan），即合并单元格（merge cells）。如果要在 Markdown 文档中实现这种合并行或合并列的表格，可采取如下步骤 [^1]：

[^1]: 上一篇笔记《 [R 速查表：标准假设检验](/note/r-cheatsheet-standard-tests/)》中的表格便是采用了这一流程实现。

1. 使用其它工具支持的表格语法创建：
    - [MultiMarkdown](https://fletcher.github.io/MultiMarkdown-6/) 仅支持列合并，不支持行合并；支持用空行生成 `<tbody>` 标签衔接和强调表格的不同部分
    - [Markdig](https://github.com/xoofx/markdig/blob/master/src/Markdig.Tests/Specs/GridTableSpecs.md) 支持规则矩形的合并行及合并列
    - 在线工具 [Madoko](https://www.madoko.net/editor.html)，也支持合并列
2. 在本地或 [babelmark3](https://babelmark.github.io/) 等在线平台生成 HTML 编码及表格预览；
3. 如可正常预览，则复制其 HTML 源码；也可将 HTML 源码粘贴至 [HTML-Cleaner](https://html-cleaner.com/) 中，进一步微调；
4. 在 Markdown 文档中粘贴此源码，绝大部分编译工具应该支持这种混合的语法。


经个人实践：

- MultiMarkdown：在本地 PowerShell 中运行命令，中文出现了乱码，而 CMD 中正常，猜测与本地的编码设置有关。如需跨行合并，建议采用上述步骤 3 中的方法实现。
- Markdig 目前似乎对中文不够友好，在相同格式情况下，[babelmark3](https://babelmark.github.io/) 和 Notepad++ 扩展 [MarkdownViewerPlusPlus](https://github.com/nea/MarkdownViewerPlusPlus) 对英文正确渲染而中文不行。其次，babelmark3 中常常不能对长表格、多个或大号合并单元格正确识别，如果将表格拆分成多次提交，则可拼接成完整表格。

#### Markdig: Grid Table

Markdig 中的[网格表](https://github.com/xoofx/markdig/blob/master/src/Markdig.Tests/Specs/GridTableSpecs.md)语法部分展示如下：

```
+---------+---------+
| Header  | Header  |
| Column1 | Column2 |
+=========+=========+
| 1. ab   | > This is a quote
| 2. cde  | > For the second column 
| 3. f    |
+---------+---------+
```

```
+---+---+---+
| AAAAA | B |
+---+---+ B +
| D | E | B |
+ D +---+---+
| D | CCCCC |
+---+---+---+
```

# 表格内容

## 表格标题

1. Pandoc

扩展：[table_captions](https://pandoc.org/MANUAL.html#extension-table_captions)

另参考本文 [Pandoc]({{< relref "#pandoc-tables" >}} "Pandoc tables") 示例。



## 表格脚注


# 表格样式

HTML 表格一般通过 CSS 设定各种主题（颜色、格式等）。R 中也有一些包或工具帮助科学和技术交流文档实现贴合的主题样式，并且不限于表格，也不限于 HTML 格式。此处简要的罗列几种：

- RStudio: [Distill web framework](https://rstudio.github.io/distill) 创建网络发布格式
    - `rmarkdown::paged_table()`：可分页的表格
    - **gt** 包和 **gtsummary** 包：可供出版的分析和汇总表
- 前面提到过的在线工具 [Madoko](https://www.madoko.net/editor.html) 也是一个专注于学术和技术文章的 Markdown 解析器。其它可参考：[Academic blogging workflow](https://danmackinlay.name/notebook/academic_blogging_workflow.html#distill)

其它可以了解的包或项目：

- **[Output Nice-Looking Formatted Tables](https://community.rstudio.com/t/output-nice-looking-formatted-tables/1084)**
- **[sfirke/packagemetrics](https://github.com/ropenscilabs/packagemetrics#creating-a-pretty-metrics_table)** | [tableGallery](https://github.com/sfirke/packagemetrics/blob/master/inst/examples/tableGallery.Rmd)
- **[sjPlot](https://dmyee.files.wordpress.com/2016/03/table_workshop.pdf)**
- **[renkun-ken/formattable](https://github.com/renkun-ken/formattable/)**


# 后记

2004 年 John Gruber 和 Aaron Swartz 合作开发了 Markdown，这一早期的简单版本在随后十年间得到了大规模的使用，并引入了大量的扩展语法，与此同时也带来了语法多样而混乱的现象，这与最初的 Markdown 设计初衷背道而驰。于是，Pandoc 的开发者 John MacFarlane 连同其它开发者一起发展形成了 [CommonMark](https://commonmark.org/) 这一标准语法规范，旨在让 Markdown 使用起来简单而明确，无论使用何种解析器，都可以得到相似的输出显示。Pandoc、Github、Goldmark 均与 CommonMark 兼容。在这一规范的讨论区，也有对表格长期的讨论，如 [Tables in pure Markdown](https://talk.commonmark.org/t/tables-in-pure-markdown/81)。

