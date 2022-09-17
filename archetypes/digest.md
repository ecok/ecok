---
title: "{{ replace .Name "-" " " | title }}"
author: []
date: {{ .Date }}
lastmod: '`r strftime(as.POSIXlt(Sys.time(), Sys.timezone()), "%Y-%m-%dT%H:%M:%S%z")`'
slug: []
categories: []
tags: []
description: []
bibliography: ../../../static/bib/scholar.bib
link-citations: true
toc-title: 目录
features:
  - +toc
  - +number_sections
  - +sidenotes
---

```{r, echo=FALSE, warning=FALSE, message=FALSE, results='asis'}
source("../readbib.R")
bib[key = "A_KEY"]
```

---

# 背景

## 问题 (创新点)

## 目标

# 主要结论

# 结果

# 讨论

# 方法

---

# 笔记
