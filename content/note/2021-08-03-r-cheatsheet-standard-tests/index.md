---
title: "R 速查表：标准假设检验"
author: "sanchufy"
date: '2021-08-04'
description: >
  常常为了快速查找 R 函数，会把一些功能相近的 R
  函数做成速查表（cheatsheet），供参考索引。
slug: r-cheatsheet-standard-tests
tags:
  - cheatsheet
  - 假设检验
categories:
  - R
  - 统计
---

常常为了快速查找 R 函数，会把一些功能相近的 R 函数做成**速查表**（cheat sheets/cheatsheets，也见翻译成小抄、备忘录），便于索引、参考，比如，RStudio 做了很多这种[速查表](https://www.rstudio.com/resources/cheatsheets/)（管理的 [Github 仓库](https://github.com/rstudio/cheatsheets)）。记得早几年也有过一些流行的中文翻译版，想必难以与原版的更新同步，又正值如今网上资源泛滥，流传得少了。

统计分析也有一些这样的速查表，似乎容易被大众忽略。印象比较深的是统计之都上的一篇文章《[翻译：常见统计检验的本质都是线性模型（或：如何教统计学）](https://cosx.org/2019/09/common-tests-as-linear-models/)》，尽管这个[表格](https://www.fyears.org/tests-as-linear/linear_tests_cheat_sheet.html)并不是以速查表作为目的而设计。

使用 R 进行统计分析的速查表似乎较少见到，但“我”更愿意相信：我能想到的东西别人也能想到，只是还没有被自己发现。遂搜了一下，的确是有的，比如[Statistics Cheat Sheets](https://cheatography.com/tag/statistics/)（[Basic statistics with R Cheat Sheet](https://cheatography.com/xeonkai/cheat-sheets/basic-statistics-with-r/)），看来日后也可收集一二。

回到正题，这里所列的标准假设检验（**Standard Hypothesis Testing**）的速查表，是直接引用自 *[The R Software : Fundamentals of Programming and Statistical Analysis](https://link.springer.com/book/10.1007%2F978-1-4614-9020-3)* （p.447）及其中文翻译版《[R软件教程与统计分析——入门到精通](https://academic.hep.com.cn/im/CN/book/978-7-04-041950-4-00)》（pp.406-407），供查阅参考。


**Table 1 标准检验**（中文译版）

<table><colgroup> <col style="text-align: left;" /> <col style="text-align: left;" /> <col style="text-align: left;" /> <col style="text-align: left;" /> </colgroup>
<thead>
<tr>
<th style="text-align: left;">本质</th>
<th style="text-align: left;">数据</th>
<th style="text-align: left;">有效性条件</th>
<th style="text-align: left;">R 函数</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;" colspan="4"><strong>参数检验</strong>：</td>
</tr>
<tr>
<tbody>
<td style="text-align: left;" rowspan="4">均值&nbsp;&nbsp;&nbsp;</td>
<td style="text-align: left;">单样本</td>
<td style="text-align: left;"><span class="math">\(n &gt; 30\)</span> 或正态性</td>
<td style="text-align: left;"><code>t.test(x,...)</code></td>
</tr>
<tr>
<td style="text-align: left;">两样本</td>
<td style="text-align: left;">正态性与同方差</td>
<td style="text-align: left;"><code>t.test(x,y,...)</code></td>
</tr>
<tr>
<td style="text-align: left;">两样本</td>
<td style="text-align: left;">正态性</td>
<td style="text-align: left;"><code>t.test(x,y,var.equal=F)</code></td>
</tr>
<tr>
<td style="text-align: left;">两配对样本</td>
<td style="text-align: left;"><span class="math">\(n &gt; 30\)</span> 或正态性</td>
<td style="text-align: left;"><code>t.test(x,y,paried=T)</code></td>
</tr>
<tr>
</tbody>
<tbody>
<td style="text-align: left;" rowspan="3">方差&nbsp;&nbsp;</td>
<td style="text-align: left;">单样本</td>
<td style="text-align: left;">正态性</td>
<td style="text-align: left;"><code>sigma2.test(x,...)</code></td>
</tr>
<tr>
<td style="text-align: left;">两样本</td>
<td style="text-align: left;">正态性</td>
<td style="text-align: left;"><code>var.test(x,y,...)</code></td>
</tr>
<tr>
<td style="text-align: left;">两样本</td>
<td style="text-align: left;">大样本</td>
<td style="text-align: left;"><code>asymp.test(x,y,...)</code></td>
</tr>
</tbody>
<tbody>
<tr>
<td style="text-align: left;" rowspan="2">相关系数&nbsp;</td>
<td style="text-align: left;">单样本</td>
<td style="text-align: left;">正态性, <span class="math">\(H_0:\rho=\rho_0\)</span></td>
<td style="text-align: left;"><code>cor.test(x,y...)</code></td>
</tr>
<tr>
<td style="text-align: left;">两样本</td>
<td style="text-align: left;">正态性</td>
<td style="text-align: left;"><code>cor.test.2.sample(x,y,...)</code></td>
</tr>
<tr>
</tbody>
<tbody>
<td style="text-align: left;" rowspan="3">比例&nbsp;&nbsp;</td>
<td style="text-align: left;">单样本</td>
<td style="text-align: left;"><span class="math">\(np&ge;5\)</span> 且 <span class="math">\(n(1-p)&ge;5\)</span></td>
<td style="text-align: left;"><code>prop.test(x,...)</code></td>
</tr>
<tr>
<td style="text-align: left;">单样本</td>
<td style="text-align: left;">&nbsp;</td>
<td style="text-align: left;"><code>binom.test(x,...)</code></td>
</tr>
<tr>
<td style="text-align: left;">两样本</td>
<td style="text-align: left;">大样本</td>
<td style="text-align: left;"><code>prop.test(x,y,...)</code></td>
</tr>
</tbody>
</tbody>
<tbody>
<tr>
<td style="text-align: left;" colspan="4"><strong>独立性检验</strong>：</td>
</tr>
<tr>
<td style="text-align: left;"><span class="math">\(\chi^2\)</span> 独立性检验</td>
<td style="text-align: left;">列联表</td>
<td style="text-align: left;">理论计数 <span class="math">\(&ge;5\)</span></td>
<td style="text-align: left;"><code>chisq.test(.,correct=F)</code></td>
</tr>
<tr>
<td style="text-align: left;">Yates <span class="math">\(\chi^2\)</span> 检验</td>
<td style="text-align: left;">2&times;2 表</td>
<td style="text-align: left;">理论计数 <span class="math">\(&ge;2.5\)</span></td>
<td style="text-align: left;"><code>chisq.test()</code></td>
</tr>
<tr>
<td style="text-align: left;">Fisher 精确检验</td>
<td style="text-align: left;">列联表</td>
<td style="text-align: left;">&nbsp;</td>
<td style="text-align: left;"><code>fisher.test()</code></td>
</tr>
</tbody>
<tbody>
<tr>
<td style="text-align: left;" colspan="4"><strong>一个分布的拟合效果的检验</strong>：</td>
</tr>
<tr>
<td style="text-align: left;">Shapiro-Wilk</td>
<td style="text-align: left;">单样本</td>
<td style="text-align: left;">&nbsp;</td>
<td style="text-align: left;"><code>shapiro.text(x,...)</code></td>
</tr>
<tr>
<td style="text-align: left;">一个分布的拟合效果的 <span class="math">\(\chi^2\)</span> 检验</td>
<td style="text-align: left;">单样本</td>
<td style="text-align: left;">理论计数 <span class="math">\(&ge;5\)</span></td>
<td style="text-align: left;"><code>chisq.test()</code></td>
</tr>
<tr>
<td style="text-align: left;">Kolmogorov-Smirnov</td>
<td style="text-align: left;">单样本</td>
<td style="text-align: left;">&nbsp;</td>
<td style="text-align: left;"><code>ks.test(x,.)</code></td>
</tr>
<tr>
<td style="text-align: left;">&nbsp;</td>
<td style="text-align: left;">两样本</td>
<td style="text-align: left;">&nbsp;</td>
<td style="text-align: left;"><code>ks.test(x,y)</code></td>
</tr>
</tbody>
<tbody>
<tr>
<td style="text-align: left;" colspan="4"><strong>位置的检验</strong>：</td>
</tr>
<tr>
<td style="text-align: left;">中位数</td>
<td style="text-align: left;">单样本</td>
<td style="text-align: left;">&nbsp;</td>
<td style="text-align: left;"><code>binom.test(x,)</code></td>
</tr>
<tr>
<td style="text-align: left;"  rowspan="2">符号检验</td>
<td style="text-align: left;">两样本</td>
<td style="text-align: left;">&nbsp;</td>
<td style="text-align: left;"><code>fisher.test(x,y)</code></td>
</tr>
<tr>
<td style="text-align: left;">两配对样本</td>
<td style="text-align: left;">&nbsp;</td>
<td style="text-align: left;"><code>binom.test(x,y,paired=T)</code></td>
</tr>
<tr>
<td style="text-align: left;">Mann-Whitney</td>
<td style="text-align: left;">两样本</td>
<td style="text-align: left;"><span class="math">\(min(n_1,n_2)&ge;10\)</span></td>
<td style="text-align: left;"><code>wilcox.test(x,y,exact=F)</code></td>
</tr>
<tr>
<td style="text-align: left;">Mann-Whitney</td>
<td style="text-align: left;">两样本</td>
<td style="text-align: left;"><span class="math">\(min(n_1,n_2)&le;10\)</span></td>
<td style="text-align: left;"><code>wilcox.test(x,y)</code></td>
</tr>
<tr>
<td style="text-align: left;">Wilcoxon</td>
<td style="text-align: left;">两配对样本</td>
<td style="text-align: left;">&nbsp;</td>
<td style="text-align: left;"><code>wilcox.test(x,y,paried=T)</code></td>
</tr>
</tbody>
</table>


引自：Pierre Lafaye de Micheaux, Rémy Drouilhet, Benoit Liquet. 2013. The R Software: Fundamentals of Programming and Statistical Analysis. Springer, New York, NY. doi: [10.1007/978-1-4614-9020-3](https://doi.org/10.1007/978-1-4614-9020-3). p.447. 潘东东, 李启寨, 唐年胜, 译. 2015. R 软件教程与统计分析——入门到精通. 北京：高等教育出版社. pp.406-407.

**Table 2 Standard tests**（英文原版）

<table>
  <col style="width:25.96%" />
  <col style="width:18.27%" />
  <col style="width:28.85%" />
  <col style="width:26.92%" />
  <thead>
    <tr>
      <th>
        Nature
      </th>
      <th>
        Data
      </th>
      <th>
        Conditions for validaty
      </th>
      <th>
        R function
      </th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="4">
        <strong>Parametric tests</strong>
      </td>
    </tr>
  </tbody>
  <tbody>
    <tr>
      <td rowspan="4">
        Mean
      </td>
      <td>
        1 sample
      </td>
      <td>
        <span class="math">
          \(n > 30\)
        </span> or normality
      </td>
      <td>
        <code>
          t.test(x,...)
        </code>
      </td>
    </tr>
    <tr>
      <td>
        2 samples
      </td>
      <td>
        Normality and equal variances
      </td>
      <td>
        <code>
          t.test(x,y,...)
        </code>
      </td>
    </tr>
    <tr>
      <td>
        2 samples
      </td>
      <td>
        Normality
      </td>
      <td>
        <code>
          t.test(x,y,var.equal=F)
        </code>
      </td>
    </tr>
    <tr>
      <td>
        2 paired samples
      </td>
      <td>
        <span class="math">
          \(n > 30\)
        </span> or normality
      </td>
      <td>
        <code>
          t.test(x,y,paried=T)
        </code>
      </td>
    </tr>
  </tbody>
  <tbody>
    <tr>
      <td rowspan="3">
        Variance
      </td>
      <td>
        1 sample
      </td>
      <td>
        Normality
      </td>
      <td>
        <code>
          sigma2.test(x,...)
        </code>
      </td>
    </tr>
    <tr>
      <td>
        2 samples
      </td>
      <td>
        Normality
      </td>
      <td>
        <code>
          var.test(x,y,...)
        </code>
      </td>
    </tr>
    <tr>
      <td>
        2 samples
      </td>
      <td>
        Large sample size
      </td>
      <td>
        <code>
          asymp.test(x,y,...)
        </code>
      </td>
    </tr>
  </tbody>
    <tbody>
    <tr>
      <td rowspan="2">
        Correlation
      </td>
      <td>
        1 sample
      </td>
      <td>
        Normality, <span class="math">\(H_0:\rho=\rho_0\)
        </span>
      </td>
      <td>
        <code>
          cor.test(x,y)
        </code>
      </td>
    </tr>
    <tr>
      <td>
        2 samples
      </td>
      <td>
        Normality
      </td>
      <td>
        <code>
          cor.test.2.sample(x,y)
        </code>
      </td>
    </tr>
  </tbody>
  <tbody>
    <tr>
      <td rowspan="3">
        Proportion
      </td>
      <td>
        1 sample
      </td>
      <td>
        <span class="math">
          \(np≥5\)
        </span> and <span class="math">\(n(n-p)≥5\)
        </span>
      </td>
      <td>
        <code>
          prop.test(x,...)
        </code>
      </td>
    </tr>
    <tr>
      <td>
        1 sample
      </td>
      <td>
      </td>
      <td>
        <code>
          binom.test(x,...)
        </code>
      </td>
    </tr>
    <tr>
      <td>
        2 samples
      </td>
      <td>
        Large sample size
      </td>
      <td>
        <code>
          prop.test(x,y,...)
        </code>
      </td>
    </tr>
  </tbody>
  <tbody>
    <tr>
      <td colspan="4">
        <strong>Independence tests</strong>
      </td>
    </tr>
    <tr>
      <td>
        <span class="math">
          \(\chi^2\)
        </span> for independence
      </td>
      <td>
        contingency table
      </td>
      <td>
        Theoretical counts ≥ 5
      </td>
      <td>
        <code>
          chisq.test(.,correct=F)
        </code>
      </td>
    </tr>
    <tr>
      <td>
        Yates' <span class="math">\(\chi^2\)
        </span>
      </td>
      <td>
        2×2 table
      </td>
      <td>
        Theoretical counts ≥ 2.5
      </td>
      <td>
        <code>
          chisq.test()
        </code>
      </td>
    </tr>
    <tr>
      <td>
        Fisher's exact test
      </td>
      <td>
        contingency table
      </td>
      <td>
      </td>
      <td>
        <code>
          fisher.test()
        </code>
      </td>
    </tr>
  </tbody>
  <tbody>
    <tr>
      <td colspan="4">
        <strong>Tests of fit to a distribution</strong>
      </td>
    </tr>
    <tr>
      <td>
        Shapiro-Wilk
      </td>
      <td>
        1 sample
      </td>
      <td>
      </td>
      <td>
        <code>
          shapiro.test(x,...)
        </code>
      </td>
    </tr>
    <tr>
      <td>
        <span class="math">
          \(\chi^2\)
        </span> of fit to a distribution
      </td>
      <td>
        1 sample
      </td>
      <td>
        Theoretical counts ≥ 5
      </td>
      <td>
        <code>
          chisq.test()
        </code>
      </td>
    </tr>
    <tr>
      <td rowspan="2">
        Kolmogorov-Smirnov
      </td>
      <td>
        1 sample
      </td>
      <td>
      </td>
      <td>
        <code>
          ks.test(x,.)
        </code>
      </td>
    </tr>
    <tr>
      <td>
        2 samples
      </td>
      <td>
      </td>
      <td>
        <code>
          ks.test(x,y)
        </code>
      </td>
    </tr>
  </tbody>
   <tbody>
    <tr>
      <td colspan="4">
        <strong>Tests of position</strong>
      </td>
    </tr>
    <tr>
      <td>
        Median
      </td>
      <td>
        1 sample
      </td>
      <td>
      </td>
      <td>
        <code>
          binom.test(x,.)
        </code>
      </td>
    </tr>
    <tr>
      <td rowspan="2">
        Sign test
      </td>
      <td>
        2 samples
      </td>
      <td>
      </td>
      <td>
        <code>
          fisher.test(x,y)
        </code>
      </td>
    </tr>
    <tr>
      <td>
        2 paired samples
      </td>
      <td>
      </td>
      <td>
        <code>
          binom.test(x,y,paried=T)
        </code>
      </td>
    </tr>
    <tr>
      <td>
        Mann-Whitney
      </td>
      <td>
        2 samples
      </td>
      <td>
        <span class="math">
          \(min(n_1,n_2)≥10\)
        </span>
      </td>
      <td>
        <code>
          wilcox.test(x,y,exact=F)
        </code>
      </td>
    </tr>
    <tr>
      <td>
        Mann-Whitney
      </td>
      <td>
        2 samples
      </td>
      <td>
        <span class="math">
          \(min(n_1,n_2)≤10\)
        </span>
      </td>
      <td>
        <code>
          wilcox.test(x,y)
        </code>
      </td>
    </tr>
    <tr>
        <tr>
      <td>
        Wilcoxon
      </td>
      <td>
        2 paired samples
      </td>
      <td>
      </td>
      <td>
        <code>
          wilcox.test(x,y,paired=T)
        </code>
      </td>
    </tr>
  </tbody>
</table>

<br />
