---
layout  : wiki
title   : Anaconda 기초 사용법 
summary : 
date    : 2022-05-26 21:29:38 +0900
updated : 2023-11-06 00:40:11 +0900
tag     : python anaconda conda
toc     : true
public  : true
parent  : [[Python-Category]] 
latex   : false
---
* TOC
{:toc}

# What is Anaconda Distribution ?

* 발췌 링크 : [Anaconda Starter Guide, pdf file](https://docs.anaconda.com/_downloads/9ee215ff15fde24bf01791d719084950/Anaconda-Starter-Guide.pdf)
* Anaconda Distribution : 무료 배포판 Anaconda  

## Before Starting

* Why do I need Anaconda Distribution ?
  * Scientific Package들이 특정 Python 버전을 요구한다
  * Package 간의 간섭으로 인해 안정성을 유지하면서 최신버전으로 유지 하기 어렵다
  * Anaconda는 각 Package에 맞는 여러 버전의 Python의 가상환경을 유지할 수 있도록 해준다
* What is Anaconda Distribution
  * 무료판 Anaconda Full Package ( requires 3GB )
  * Anaconda public repo 에서 Python 과 R을 지원하는 over 1.5k packages 지원
  * Conda-forge나 bioconda 같은 community channel에서 more than 20k packages 지원
* What is Miniconda?
  * 꼭 필요한 기능만 넣은 축소판 ( only 400 MB) 
    
## Anaconda Navigator or conda ?

* Anaconda Navigator : command line 환경보다 UI환경에 익숙한 사람에게 적합
* Conda : command line 환경을 선호한다면 이쪽으로 진행 (Anaconda prompt)
  * [20-minute conda test drive](https://conda.io/projects/conda/en/latest/user-guide/getting-started.html) : conda 처음 사용할 때 볼것 
    
# Troubleshooting

- BillMaker를 Anaconda로 실행하면서 발생했던 문제와 해결책을 적어둔다

## 

