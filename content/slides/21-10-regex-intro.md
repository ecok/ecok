---
title: '正则表达式简明指南'
subtitle: '🧭<br/>&lt; R, Perl, JavaScript &gt;'
author: sanchufy
date: '2021-10-10'
slug: regex intro
categories:
  - 方法
  - 工具
tags:
  - 搜索
  - 指南
  - RegEx
  - 文本挖掘
description: '不会，了无影响；会了，上天入地。文字符号，查找、替换，无可遁形。'
output:
  xaringan::moon_reader:
    lib_dir: libs
    chakra: js/remark/0.15.0.min.js
    css: [css/chinese.css]
    nature:
      highlightStyle: github
      highlightLines: true
      countIncrementalSlides: false
      beforeInit: js/macro.js
---

## 参考来源

- Ben Forta (福达). 杨涛等译. 2015. *正则表达式必知必会（修订版）*. 人民邮电出版社.
- Jan Goyvaerts, Steven Levithan. 2012. *Regular Expressions Cookbook*, Second edition. O'Reilly Media.
- Jeffrey E. F. Friedl. 余晟译. 2012. *精通正则表达式*. 电子工业出版社.
- 资源合集：**[Awesome Regex](https://github.com/aloisdg/awesome-regex)** | [Awesome RegEx](https://regex.awesome-programming.com/) 
- 其它学习入口：
    - [正则表达式30分钟入门教程](https://deerchao.cn/tutorials/regex/regex.htm)
    - [Learn regex the easy way 中文版](https://github.com/ziishaned/learn-regex/blob/master/translations/README-cn.md) by ziishaned 等 | [学习正则表达式的简单方法](https://github.com/cdoco/learn-regex-zh) by cdoco 等
    - [Reference - What does this regex mean?](https://stackoverflow.com/q/22937618)
    - [Regular Expressions Quick Start](https://www.regular-expressions.info/quickstart.html)
    - Wikipedia: [Comparison of regular-expression engines](https://en.wikipedia.org/wiki/Comparison_of_regular-expression_engines)

---
class: inverse

## Regular Expression

<br>

### R、Perl、JavaScript

**POSIX vs. *Perl* (Perl-like)**

---

## R 正则表达式

- 官方教程：[Regular Expressions as used in R](https://stat.ethz.ch/R-manual/R-devel/library/base/html/regex.html)
- 中文教程：
    - 谢益辉[《R 语言忍者秘笈》 4.2 正则表达式](https://bookdown.org/yihui/r-ninja/text-data.html#section-4.2)
    - 黄湘云[《数据科学与 R 语言》第 10 章 正则表达式](https://bookdown.org/xiangyun/r4ds/dc-regular-expressions.html)
    - 战立侃：[R 使用的正则表达式](https://likan.info/cn/post/regular-expressions-used-in-r/)
    - 王敏杰[《数据科学中的 R 语言》数据科学中的 R 语言](https://bookdown.org/wangminjie/R4DS/stringr.html)
    - 李东风[《R语言教程》36 R 语言的文本处理](https://www.math.pku.edu.cn/teachers/lidf/docs/Rbook/html/_Rbook/text.html)

---

### R 中的设定与实现

- **ERE** (Extended Regular Expressions) + **Perl-like Regular Expressions**
    - [POSIX](https://www.regular-expressions.info/posix.html) 1003.2 + Perl 5.x
    - **[TRE](https://htmlpreview.github.io/?https://raw.githubusercontent.com/laurikari/tre/master/doc/tre-syntax.html)**<sup>[[wiki](https://en.wikipedia.org/wiki/TRE_%28computing%29)]</sup> 与 **[PCRE](https://en.wikipedia.org/wiki/Perl_Compatible_Regular_Expressions)** 引擎（库）的区别，可参考：  
.smaller[[regular expressions in base R: 'perl=TRUE' vs. the default (PCRE vs. TRE)](https://stackoverflow.com/a/47251004)]
- 在不同的 [locales](https://stat.ethz.ch/R-manual/R-devel/library/base/html/locales.html)（R 进程的语言环境，如 POSIX）与 implementation（实现）中，解释将有所差异
- 默认贪婪匹配

.footnote[
--- 
**PCRE**: Perl Compatible Regular Expressions  
**POSIX**: Portable Operating System Interface for uniX
]

???

ERE 只是 [TRE](https://github.com/laurikari/tre) 最主要的一部分？R 是使用了 TRE 中的 ERE，还是整个 TRE？

TRE 包含了？

- POSIX 1003.2 extended RE (ERE)
- basic RE (BRE)
- TRE extensions to the ERE

---

### R 包和扩展

- R 包 **stringi**：[Regular Expressions](https://stringi.gagolewski.com/weave/regular_expressions.html)
    - R 包 **stringr**：[Regular expressions](https://cran.r-project.org/web/packages/stringr/vignettes/regular-expressions.html)
    - R 包 **stringx**：[Drop-in replacements for base R string functions powered by stringi](https://stringx.gagolewski.com/) 基础 R 的增强版
    - R 包 **qdapRegex**：[trinker/qdapRegex](https://github.com/trinker/qdapRegex) 常用匹配模式打包集合
    - R 包 **rex**：[kevinushey/rex](https://github.com/kevinushey/rex) 封装为友好可读的语言
- RStudio 扩展 **[RegExplain](https://www.garrickadenbuie.com/project/regexplain/)**：预览匹配结果

---

### R [模式匹配与替换](https://stat.ethz.ch/R-manual/R-devel/library/base/html/grep.html)

- `sub()` 替换首个匹配，`gsub()` 全局替换
- `grep()` 匹配的（或不被匹配的）索引或值，`grepl()` 返回其逻辑向量
- `regexpr()` 首个匹配的起始位置及其匹配的长度，`gregexpr()` 向量构成的列表 <sup>*[1]*</sup>
- `regexec()` 同 *[1]*，匹配位置和长度，但返回列表，`gregexec()` 矩阵构成的列表 <sup>*[2]*</sup>
- [`regmatches()`](https://stat.ethz.ch/R-manual/R-devel/library/base/help/regmatches.html) 从 *[1][2]* 获得的匹配数据中提取或替换匹配的子字符串
- [`agrep()`](https://stat.ethz.ch/R-manual/R-devel/library/base/help/agrep.html)，`agrepl()` 近似 (approximate) 匹配
- [`match()`](https://stat.ethz.ch/R-manual/R-devel/library/base/help/match.html) 完全匹配，[`charmatch()`](https://stat.ethz.ch/R-manual/R-devel/library/base/help/charmatch.html)、[`pmatch()`](https://stat.ethz.ch/R-manual/R-devel/library/base/help/pmatch.html) 部分匹配，[`startsWith()`](https://stat.ethz.ch/R-manual/R-devel/library/base/help/startsWith.html) 匹配字符串的初始部分
- [`strsplit()`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/strsplit.html) 拆分字符串

???

`g/re/p`: "Global search for Regular Expression and Print matching lines"

一般来说，`perl = TRUE` 会比默认的正则表达式引擎快，而 `fixed = TRUE` 也会更快。

---

### 命名捕获组 Named Capturing Groups

.tiny[
输入文本：

```r
"Camellia sinensis (L.) O. Ktze. var. sinensis"
```

匹配模式：

```r
"(^[A-Z][a-z]+) ([a-z]+)+ (.*?) (var. [a-z]+)"
```

对捕获组进行**反向引用** (backreferences)：

```r
"\1, \2, \4, \3"
```

返回结果：

```r
"Camellia, sinensis, var. sinensis, (L.) O. Ktze."
```
]

---

## [PCRE](http://www.pcre.org/) 与 [Perl 正则表达式](https://perldoc.perl.org/perlre)

- [PCRE - Perl Compatible Regular Expressions](https://www.pcre.org/)
- [Perl regular expressions tutorial](https://perldoc.perl.org/perlretut)
- 其它非官方：
    - [PCRE 正则表达式](https://ngapps.cn/php/#!cheatsheet/pcre.md)
    - [Perl 正则表达式语法总结](https://markrepo.github.io/language/2018/07/07/regex/)

---

### 环视 Lookaround

**零宽断言** zero-length assertions，即不消耗字符串中的字符，而只是**断言**是否有可能匹配。

.large-table[
| Assertion | Lookbehind    | Lookahead    |
|-----------|---------------|--------------|
| Positive  | `(?<=pattern)`| `(?=pattern)`|
| Negative  | `(?<!pattern)`| `(?!pattern)`|
]

---

## JavaScript 正则表达式

JavaScript 的正则表达式风格是该语言的 [ECMA-262 标准](https://github.com/tc39/ecma262)的一部分。

- [MDN 中文教程](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Guide/Regular_Expressions)
- [微软：正则表达式语言 - 快速参考](https://docs.microsoft.com/zh-cn/dotnet/standard/base-types/regular-expression-language-quick-reference)
- [现代 JavaScript 教程中文版](https://zh.javascript.info/regular-expressions)
<br><br>
- 本站中的示例参考：[科技文章自定义词语高亮显示](/p/21/09/userscript-scientific-article-word-highlight/)

???

实现：[XRegExp](http://xregexp.com/)

---

## 在线学习、测试

- 在线交互学习：[RegexOne](https://regexone.com/)
- 小游戏：[Regex Cross-word](https://regexcrossword.com/)
- 再来一个小游戏：[Regex Golf](https://alf.nu/RegexGolf)
<br><br>
- [RegExr](https://regexr.com/): JavaScript & PHP/PCRE | [中译版](https://regexr-cn.com/)
- [Regex101](https://regex101.com/): PCRE, JavaScript, Golang, Python
- [RegExplain app demo](https://apps.garrickadenbuie.com/regexplain/): R
- [在线正则表达式测试工具](https://tools.fun/regexp.html)
- 菜鸟工具：[正则表达式在线测试](https://c.runoob.com/front-end/854/)
- [在线正则表达式测试器](https://deerchao.cn/tools/wegester/index.html)

???

<https://v2ex.com/t/595193>

---

## 速查表 Cheatsheets

- [Basic Regular Expressions in **R**](https://github.com/rstudio/cheatsheets/raw/master/regex.pdf)
- **R** [**stringr** cheatsheet](https://github.com/rstudio/cheatsheets/raw/master/strings.pdf)
- DaveChild: [Regular Expressions Cheat Sheet](https://cheatography.com/davechild/cheat-sheets/regular-expressions/)
- William Marble: [Regular Expressions Cheat Sheet](https://stanford.edu/~wpmarble/webscraping_tutorial/regex_cheatsheet.pdf)
- **JavaScript** [MDN: Regular expression syntax cheatsheet](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions/Cheatsheet)
- [**JavaScript** Regex Cheatsheet](https://www.debuggex.com/cheatsheet/regex/javascript)
- [**Python** 正则表达式速查表](https://www.cnblogs.com/huxi/archive/2010/07/04/1771073.html)
- **JavaScript** [正则表达式 CheatSheet 速查表](https://w3ctim.com/post/f08178c.html#%E6%AD%A3%E5%88%99%E8%A1%A8%E8%BE%BE%E5%BC%8F)

---

## 可视化与常用模板

- 可视化：
    - [Debuggex](https://www.debuggex.com/): JavaScript, Python, PCRE
    - [Regulex ](https://jex.im/regulex/): JavaScript
    - [RegExper](https://regexper.com/): JavaScript
    - [RegViz](http://regviz.org/): JavaScript
- 常见匹配模式模板：
    - [常用正则大全](https://github.com/any86/any-rule)
    - [常用正则表达式](https://github.com/cdoco/common-regex)
    - [正则表达式大全](https://vizztop.github.io/awesome-regex/dist/#/)
    - [The Regex Cheat Sheet](https://ihateregex.io/)
    - [RegexHub](https://projects.lukehaas.me/regexhub/)

---
class: inverse, middle, center

## 不懂就~~问~~查 [Stack Overflow](https://stackoverflow.com/questions/tagged/regex)

聊聊几个常见的问题

???

https://stackoverflow.com/questions/tagged/regex?tab=Votes  
https://stackoverflow.com/questions/tagged/regex%20r?sort=MostVotes

---

### 中文字符

- Unicode Scripts
    - `\p{Han}` (Wiktionary: [Category:Han script](https://en.wiktionary.org/wiki/Category:Han_script))
- Unicode Blocks
    - `\p{InCJK_Unified_Ideographs}`等同于 `U+4E00–U+9FFF` (20977) <sup>*[1]*</sup>
    - `\p{InCJK_Symbols_and_Punctuation}` 等同于 `U+3000–U+303F` (64)
- **[Unicode 编码](http://www.unicode.org/charts/)**，如 `[\u4E00-\u9FA5]`<sup>比 *[1]* 字符总数稍少</sup>

<br>

.tiny[
--- 
<https://www.regular-expressions.info/unicode.html>  
[What's the complete range for Chinese characters in Unicode?](https://stackoverflow.com/q/1366068)  
[Index of Unicode Version 13.0.0 character properties in Perl](https://perldoc.perl.org/perluniprops)  
[Simplified Chinese Unicode table](https://stackoverflow.com/q/4596576)
]

???

`/^[\x{4e00}-\x{9fa5}]+$/u` 十六进制 (PHP)

\p{Script_Extensions: Han} (Short: \p{Scx=Han}, \p{Han}) (94_492:
                            U+2E80..2E99, U+2E9B..2EF3,
                            U+2F00..2FD5, U+3001..3003,
                            U+3005..3011, U+3013..301F ...)
                            
Numbers in (parentheses) indicate the total number of Unicode code points matched by the property.
---

### Delimiters ("foo" vs. /foo/)

.center[`"字符串"` vs. `/斜杠定界符/`]

以字符串作为输入时，反斜杠 `\` 需要在字符串字面量中转义，即成倍出现。

```javascript
var re = /[a-z]\s/i;
var re = new RegExp("[a-z]\\s", "i");
```

```javascript
var re = /[a-z]:\\/i;
var re = new RegExp("[a-z]:\\\\","i");
```

---

### 贪婪 greedy vs. 懒惰 lazy

<br>

.center[
`*`、`+`、`?`

vs.

`*?`、`+?`、`??`
]

<br>

.footnote[
--- 
[What do 'lazy' and 'greedy' mean in the context of regular expressions?](https://stackoverflow.com/q/2301285)
]

---

### [经典问答](https://stackoverflow.com/questions/tagged/regex)

1. [What is a non-capturing group in regular expressions?](https://stackoverflow.com/q/3512471)
2. [`\d` less efficient than `[0-9]`](https://stackoverflow.com/q/16621738)
3. [Regular Expressions: Is there an AND operator?](https://stackoverflow.com/q/469913)
4. [How do I deal with special characters like `\^$.?*|+(){}[]` in my regex?](https://stackoverflow.com/q/27721008)
5. [How to use Regular Expressions (Regex) in Microsoft Excel both in-cell and loops](https://stackoverflow.com/q/22542834)

???

### [牛刀小试](https://stackoverflow.com/questions/tagged/regex%20r?sort=MostVotes)

1. [Regex to replace multiple spaces with a single space](https://stackoverflow.com/q/1981349)
2. [Extracting numbers from vectors of strings](https://stackoverflow.com/q/14543627)
3. [Regular expression to match a line that doesn't contain a word](https://stackoverflow.com/q/406230)  
  [How to negate specific word in regex?](https://stackoverflow.com/q/1240275)
4. [How do I remove all non alphanumeric characters from a string except dash?](https://stackoverflow.com/q/3210393)  
  [Remove all special characters from a string in R?](https://stackoverflow.com/q/10294284)
5. [Extract a substring according to a pattern](https://stackoverflow.com/q/17215789)
6. [How to match "anything up until this sequence of characters" in a regular expression?](https://stackoverflow.com/q/7124778)

---
class: inverse

# 应用场景示例

- 高级文本编辑器：文本查找与替换
- Everything：搜索
- Ditto：复制、粘贴
- userscript：文本高亮
- chrome extensions: [Gooreplacer](https://github.com/jiacai2050/gooreplacer)
- Total Commander：批量重命名
- R 爬虫之静态页面

---

## Ditto

移除换行符<sup>*</sup>：

```cpp
clip.AsciiTextReplaceRegex("([a-zA-Z0-9]\\b) *[\r\n]+ *", "$1 ");
clip.AsciiTextReplaceRegex("[\r\n]+ *(\\b[a-zA-Z0-9])", " $1");
clip.AsciiTextReplaceRegex(" *[\r\n]+ *", "");
clip.AsciiTextReplaceRegex(" {2,}", " ");

return false;
```

.footnote[\* <https://github.com/sabrogden/Ditto/wiki/Scripting>]

---

## 附录：术语

- metacharacter 元字符
- character classes 字符类
    - POSIX character classes/bracket expressions
- wildcard characters 通配符
- delimiters 定界符; 分隔符
- atoms 原子
- pattern 模式
- character set 字符集
    - encoding 编码，如：ASCII、Unicode
- 优先级: `*` (repetition) > concatenation > `|` (alternation)
    - concatenation 连接; 并置: `foobar`
    - alternation 交替; 置换: `foo|bar`
    - Kleene star 克林星号/Kleene closure 克林闭包: `foo*`

---
class: inverse, middle

**正则表达式是个投入很小回报很大的工具 ……**  
.right[—— [old9](https://v2ex.com/t/540910?p=2)]

<br>
**写正则还好，读正则才是痛苦的事。**
**正则表达式是可写不可读的。**  
.right[—— [Patrick95](https://v2ex.com/t/540910?p=1)]

<br>
**在大多数形式中，如果存在至少一个匹配特定集合的正则表达式，那么就存在无数个同样匹配它的其他正则表达式。**  
.right[—— [Wikipedia](https://en.wikipedia.org/wiki/Regular_expression)]