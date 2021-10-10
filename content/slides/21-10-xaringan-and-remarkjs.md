---
title: 'xaringan + remark.js 制作幻灯片'
author: sanchufy
date: '2021-10-05'
slug: xaringan and remarkjs
categories:
  - 工具
  - R 语言
tags:
  - markdown
  - rmarkdown
  - 指南
lastmod: '2021-10-05T16:34:12+08:00'
description: '使用 R Markdown (**xaringan** 包) 与 Javascript (**remark.js** 库) 快速制作幻灯片'
output:
  xaringan::moon_reader:
    lib_dir: libs
    chakra: js/remark/0.15.0.min.js
    css: [css/chinese.css]
    seal: false
    nature:
      highlightStyle: github
      highlightLines: true
      countIncrementalSlides: false
      beforeInit: js/macro.js
---

class: center, middle, inverse, title-slide

#  xaringan + remark.js <br/>制作幻灯片
## 👁
### sanchufy
### 2021-10-05

---

## 官方教程

.pull-left[
### [xaringan](https://github.com/yihui/xaringan)

--- 
R Markdown 扩展，可结合 remark.js 生成 HTML5 演示文档。

- 简明版 [Presentation Ninja with xaringan](https://slides.yihui.org/xaringan/)
- 书籍章节 [Chapter 7 xaringan Presentations](https://bookdown.org/yihui/rmarkdown/xaringan.html)
- Wiki 版 [yihui/xaringan/wiki](https://github.com/yihui/xaringan/wiki)
]

.pull-right[
### [remark.js](https://github.com/gnab/remark)

--- 
使用 JavaScript 和 CSS 将 Markdown 在浏览器内渲染成幻灯片。

- 简明版 [remark](https://remarkjs.com/)
- Wiki 版 [gnab/remark/wiki](https://github.com/gnab/remark/wiki)
]

--- 

两者的主要区别，见：<https://slides.yihui.org/xaringan/#15>

---
class: inverse, middle, center

# remark.js
### Markdown 制作幻灯片（基础）
## 🎞🎞🎞

---

## remark.js 核心功能

- 支持 Markdown，可版本控制
- 支持各种快捷键（按 **h** 或 **?** 可查看）
    - 按 **c** 复制演示窗口
    - 按 **p** 进入演讲者模式
    - 按 **f** 全屏模式
- 支持语法高亮
- 支持背景图片
- 支持线上托管浏览，若离线使用，需下载[本库（最新版）](http://remarkjs.com/downloads/remark-latest.min.js)

---
layout: true

## remark.js 语法设计

---

- 幻灯片划分
- 幻灯片[递增显示](https://slides.yihui.name/xaringan/incremental.html)（类似动画效果）
    - 两个短横线 `--`
    - 使用 `layout`
- 幻灯片模板（单个页面）：`template`
- 幻灯片属性：
    - 命名 (`name`)：用于创建链接锚点、导航、识别与引用等
    - 定义样式 (`class`)：用于对齐等
    - 使用模板 (`template`、`layout`)
- **class**：为不同“类”的内容便捷地设定特定的样式，形如：`.footnote[Note: this is a useless footnote]`

---

- 幻灯片注释、隐藏
- 全幅背景图片：`background-image: url(image.jpg)`
- 内容属性：定义样式 (**Content Classes**)：搭配 CSS 设定元素样式
- 语法高亮：代码块、行内
    - [支持的语言](https://github.com/highlightjs/highlight.js/blob/main/SUPPORTED_LANGUAGES.md)，如 `DOS`、`Markdown` 等
    - [支持的风格](https://github.com/gnab/remark/wiki/Configuration#highlighting)，如 `github`、`solarized-light` 等
- 幻灯片页面比例、计时等

---
layout: false

## 保存与使用

- 打印、保存为 PDF：[Printing](https://github.com/gnab/remark#printing)、[Printing Export to PDF](https://github.com/gnab/remark/wiki/Printing---Export-to-PDF)
- 网页离线使用：[Offline use without an internet connection](https://github.com/gnab/remark/wiki#offline-use-without-an-internet-connection)

---
class: inverse, middle, center

![:image 20%, naruto](https://static.wikia.nocookie.net/naruto/images/5/56/Sharingan_Triple.svg)

# xaringan
### R Markdown 制作幻灯片（扩展）

---

## xaringan 功能与扩展<sup>*</sup>

- 通过设置 YAML 元数据，传递参数给 remark.js
- 支持运行 R 代码
- 自动渲染 `\(\LaTeX\)` [数学公式](https://slides.yihui.org/xaringan/#16)
- 可自动生成首页，即标题页
- 自动播放与计时（含倒计时）
- 代码[行内高亮](https://bookdown.org/yihui/rmarkdown/some-tips.html#highlight-code-lines)
- 自定义 macros，提供 JavaScript 函数扩展
- [HTML widgets](https://slides.yihui.org/xaringan/#20)：可交互

.footnote[\* 注：一些功能由 remark.js 自带。]

---

## Infinite Moon Reader

同步编辑与预览：

```r
xaringan::inf_mr()
```

---

## 幻灯片主题

- remark.js 主题：[HTML CSS JS samples](https://github.com/gnab/remark/wiki/HTML-CSS-JS-samples)
- 查看 xaringan 内置主题：[源码](https://github.com/yihui/xaringan/tree/master/inst/rmarkdown/templates/xaringan/resources)、[主题展示 Theme Showcase](https://github.com/yihui/xaringan/wiki/Themes#theme-showcase)

```r
names(xaringan:::list_css())
```

- 详细的 CSS 设定技巧请查看 <https://github.com/yihui/xaringan/wiki/> 中的 Customization 部分。例如：编号、切换效果、页眉和页脚、进度条、代码换行与缩进等
- 其它：
    - R 包 **[xaringanthemer](https://github.com/gadenbuie/xaringanthemer)** 主题美化助手
    - R 包 **fansi** 美化终端结果输出 terminal output

---

## 保存与使用

- 打印、保存为 PDF：[Export Slides to PDF](https://github.com/yihui/xaringan/wiki/Export-Slides-to-PDF)
    - 使用 R 包 **Pagedown**：[2.3 Print to PDF](https://pagedown.rbind.io/#print-to-pdf)
- 网页离线使用：[7.6.4 Working offline](https://bookdown.org/yihui/rmarkdown/some-tips.html#working-offline)

---

## 部署或嵌入到 (blogdown) 网站中

两种方式：

1. xaringan 驱动：以外部对象嵌入到博客的内容页面中
    - 教程：[Deploy Slides Online](https://github.com/yihui/xaringan/wiki/Deploy-Slides-Online)
    - 示例1：[The Impact of Sickle Cell...](https://silvia.rbind.io/talk/2021-03-22-amia-informatics-summit/)、[Deploying xaringan Slides...](https://silvia.rbind.io/blog/deploying-xaringan-slides/)
    - 示例2：[xaringan_gh](https://tcgriffith.github.io/xaringan_gh/)
    - 优点：灵活，充分使用 xaringan 的全部功能
2. Hugo 驱动：直接以单独的展示页面作为内容呈现
    - 教程：[Using with Hugo](https://github.com/gnab/remark/wiki/Using-with-Hugo)
    - 示例：[Creating Beautiful Presentations with Story](https://story.xaprb.com/slides/) ([源码](https://github.com/xaprb/story/blob/master/exampleSite/content/slides/adirondack/index.md)、[Hugo 页面渲染模板](https://github.com/xaprb/story/blob/master/layouts/slides/single.html))
    - 优点：简洁

???

可以说是为了备份本页的内容，才有了本指南。小站现在采用了方式 2，可能更好的方案是两个都用。

---
class: inverse, middle, center

![Cat in meercats](https://slides.yihui.org/gif/impossible-parking.gif)

总之，以上不过是对官方教程的简单回顾和粗暴罗列......

---
class: inverse, middle, center

## 所以，还是去看官方教程吧！
### 直接又详尽！
