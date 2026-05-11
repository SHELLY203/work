# 📄 论文复现：Anthropogenic climate change may reduce global diazotroph diversity

**简介**：本项目基于R语言复现了论文《Anthropogenic climate change may reduce global diazotroph diversity》中的图2。

## 小组成员

姓名：陈昊天 学号：2025303120055 @Chenht111
姓名：陈   雨 学号：2025303110013  @ChenYu-7317
姓名：黄君蕾 学号：2025303120158 @Ray111-Arch
姓名：汤   灿 学号：2025303120034  @SHELLY203
姓名：刘君若 学号：2025303110023  @Liujunruo

## ℹ️ 论文信息

**作者**: Peng Li, Zhuo Pan, Jingyu Sun, Yu Geng, Yiru Jiang, Yue-zhong Li \& Zheng Zhang
**原始链接**:https://doi.org/10.1038/s41467-025-62843-2
**原始代码来源**: CodeOcean
**研究背景**
氮是生命必需元素，生物可利用氮不足限制全球生态系统生产力，而固氮微生物主导的生物固氮是自然界最主要的天然氮输入途径，其群落多样性与氮循环密切相关；气候变化已被证实会改变微生物群落结构并降低多样性，且对固氮速率存在纬度差异影响，但当前学界仍不清楚固氮微生物的全球生物地理分布规律、关键驱动因子，以及其对气候变化的整体响应，同时传统单一nifH基因标记存在鉴定偏差，而海量宏基因组数据的积累为填补这一全球尺度研究空白提供了可能。

## 📁 项目结构说明

* data: 存放项目原始数据文件
* code: 存放分析代码（Rmd文件）
* outputs: 存放分析生成的图片和HTML报告
* renv: R环境管理文件夹，用于复现项目环境

## 🚀 如何运行 (R 语言版)

### 1\. 环境准备

确保你安装了 R (建议 4.0 以上版本) 和 RStudio。

### 2\. 安装依赖包

install.packages("data.table")
install.packages("ggplot2")
install.packages("ggpubr")
install.packages("scales")
install.packages("ggpmisc")

