---
title: DiagrammeR 包与 Graphviz 软件问答
author: sanchufy
date: '2022-10-11'
slug: r graphviz faq
categories:
  - R 语言
  - 工具
tags:
  - 流程图
lastmod: '`r strftime(as.POSIXlt(Sys.time(), Sys.timezone()), "%Y-%m-%dT%H:%M:%S%z")`'
toc-title: 目录
features:
  - +toc
  - +number_sections
  - +sidenotes
description: '个人在使用过程中收集。'
---

<br/>

> While graphviz is great for generating graphs for large datasets, it is less awesome for creating things like ER diagrams, flow-chars and sequence diagrams. It's possible and relatively straight forward, but the amount of time you have to put down to make something come out right is often unjustified because you could achieve the same thing with a Wsywig-GUI modeling tool in a fraction of the time.  
> —— Ярослав Рахматуллин, [*Creating Straight Edges in Graphviz*](https://stackoverflow.com/a/12869546)

如未特别说明，以下内容均针对 Graphviz 中的语法，使用 DiagrammeR 包调用。

# 功能实现

1. 如何渲染公式？
    - 参考 [DiagrammeR: latex formula embeded](https://github.com/rich-iannone/DiagrammeR/issues/91)
1. 如何实现上、下标？
    - 参考 [DiagrammeR: using subscripts in diagrams](https://github.com/rich-iannone/DiagrammeR/issues/71)
    - [DiagrammeR and MathJax do not correctly render a graph in a rmarkdown document](https://stackoverflow.com/a/70428603)

# Graphviz 语法

## Graphs

1. DOT 中默认全局 [`rankdir="TB"`](https://www.graphviz.org/docs/attrs/rankdir/)，可否在 cluster 中将此另设为与全局不同，如 `rankdir = LR`？
    - 否。[\[Dot\] Allow different rankdir for subgraph cluster](https://gitlab.com/graphviz/graphviz/-/issues/887)
    - 参考 [top-down subgraphs, left-right inside subgraphs](https://stackoverflow.com/a/7787488)
    - [Graphviz: Left-Right subgraphs, Left-Right inside subgraphs](https://stackoverflow.com/q/63827606)
1. DOT 中默认全局 [`splines=TRUE`](https://www.graphviz.org/docs/attrs/splines/) (同 `splines=spline`)，可否在 cluster 中将此另设为与全局不同，如 `splines = line`？
    - 否。"splines is an attribute of edges - graph (root) only"
    - [Is there a way to have different edge splines between nodes in the same cluster vs between nodes in different clusters using fdp layout in graphviz?](https://stackoverflow.com/a/62689184)
    - [Graphs with mixed splines OR merge layers with different splines](https://stackoverflow.com/a/69353248)
    - [Combine Graphs for Different Splines: Not possible with overlap or processing failure](https://forum.graphviz.org/t/combine-graphs-for-different-splines-not-possible-with-overlap-or-processing-failure/865)
    - [The state of splines](https://forum.graphviz.org/t/the-state-of-splines/366)
    - [Fun with edges!](https://forum.graphviz.org/t/fun-with-edges/888)
    - [In Graphviz, how to set only one edge to spline=curve](https://stackoverflow.com/questions/62466115/in-graphviz-how-to-set-only-one-edge-to-spline-curve#comment110511141_62468557)

## Node

1. 使用 [`group`](https://graphviz.org/docs/attrs/group/) 如果一条边的端点属于同一个组，即具有相同的组属性，则设置该参数以避免交叉并使边为直线。
    - 参考 [Forcing "main line" nodes into a straight line in Graphviz (or alternatives)](https://stackoverflow.com/a/4673624)

## Edge

1. 使用直线代替曲线。
    - [fake levels and support nodes](https://stackoverflow.com/a/12869546)
1. 局部使用曲线。
    - 将 "DOT" 修改为 "neato"：[Curve Some Edges in GraphViz](https://stackoverflow.com/a/32497722)
1. 使用 [`weight`](https://graphviz.org/docs/attrs/weight/) 设置连接的距离的优先级
    - 参考 [Graphviz: how to have sub-graph nodes lined-up in a straight line?](https://stackoverflow.com/a/5309679)
    - [Forcing "main line" nodes into a straight line in Graphviz (or alternatives)](https://stackoverflow.com/a/4671684)

## Subgraphs

1. [`rank=same|min|source|max|sink`](https://www.graphviz.org/docs/attrs/rank/) 的区别及生效条件？
    - 经测试；在不同形式的 subgraph 中效果不同，带标识的 `cluster_{...}` 中不生效，无标识的 `{...}` 中生效；但 `cluster_{...}` 中可包含 `{...}`，参考 [Subgraphs horizontal and its nodes vertical aligned](https://stackoverflow.com/a/39490573)
    - 参考 [Rank attribute is confusing to me](https://stackoverflow.com/a/6155783)
1. 在 subgraph 中嵌套 subgraph 实现 cluster 的排序控制。
    - 参考 [graphviz / DiagrammeR - subgraphs top to bottom, then left to right](https://stackoverflow.com/a/61467169)

# 其它资料

1. 官方 FAQ：[General](https://graphviz.org/faq/#general)
