---
layout  : wiki
title   : Python Snippet 모음 
summary : 바로 사용가능한 조각 코드 모음 
date    : 2021-08-04 20:00:22 +0900
updated : 2021-10-04 23:38:16 +0900
tag     : python code-snippets pandas 
toc     : true
public  : true
parent  : [[Python-Category]] 
latex   : false
---
* TOC
{:toc}

# 1. 개요

* BillMaker 개발중에 정리해둔 Python Snippet 모음

# 2. 전개

## inline_diff, 두 개의 문자열을 비교하여 틀린 부분을 표시

* 한 눈에 비교하기 어려운 복잡한 문자열을 비교하고, 틀린부분을 표시하는 snippet

### 테스트 코드의 입력과 출력

* 두개의 URL 샘플이 다른 경우
  * `http://i121.seoul.go.kr/cs/cyber/NR_cgJungInfo.do?_m=m1_1_1&napgi=2015-09&mkey=123457689&csNm=`
  * `http://i121.seoul.go.kr/cs/cyber/NR_cgJungInfo.do?_m=m1_1_1&napgi=2018-06&mkey=123456789&csNm=`
  * GET method 파라메터에서 `napgi`의 `년-월`부분이 서로 틀림 ( `2015-09` != `2018-06` ) 
  * `mkey` 파라메터에서 `76`과 `67`부분이 서로 틀림 ( `76` != `67` ) 
* 다른 경우 함수의 출력
  * 아래와 같이 다른 부분이 `{}` 괄호로 표시된다. 
  ```
  출력 리스트
  http://i121.seoul.go.kr/cs/cyber/NR_cgJungInfo.do?_m=m1_1_1&napgi=201{5 -> 8}-0{9 -> 6}&mkey=12345{+ 6}7{- 6}89&csNm=
  ```
 
### inlinne_diff 함수 , 테스트 코드, 출력

* [inline diff 스니펫 코드, cacher](https://snippets.cacher.io/snippet/a280ddca1dd5d8034967)

### 분석

* 참고 링크1 : [two - python number of differences between strings, CODE Q&A](https://code.i-harness.com/en/q/11131e1)
* 참고 링크2 : [difflib - Helpers for computing deltas](https://docs.python.org/3/library/difflib.html?highlight=difflib#module-difflib)
* python 표준 라이브러리인 `difflib`을 사용한다
