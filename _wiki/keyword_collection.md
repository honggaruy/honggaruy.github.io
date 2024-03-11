---
layout  : wiki
title   : 용어 설명 모음 
summary : 아직 안정함  
date    : 2020-04-27 11:15:09 +0900
updated : 2024-03-11 14:18:27 +0900
tag     : keyword hash string-interpolation terminology 
toc     : true
public  : true
parent  : [[Term-Category]] 
latex   : false
---
* TOC
{:toc}

용어 문서 정리 계획

* 1차로 이곳에 정리
* 용어에 따른 설명이 길어지면 별도 Category로 분리하여 문서로 정리
* 표준 용어 여부 확인 방법
  * 정보 검색에 실용성이 높을수록 표준 용어에 가깝다고 판단한다.
  * stack overflow에 태그로 등록되었는지 확인

# B로 시작

## BDFL

### 표준 용어 여부 확인

- [Wikipedia 등록여부 확인 완료](https://en.wikipedia.org/wiki/Benevolent_dictoator_for_life) : Benevolent dictator for life
    - [위키백과 등록여부 확인 완료](https://en.wikipedia.org/wiki/자비로운_종신독재자) : 자비로운 종신독재자

### 관련 링크


### 실제 사용례

- Rust의 창시자인 Graydon이 본인의 블로그(?)의 글인 [The Rust I Wanted Had No Future](https://graydon2.dreamwidth.org/307291.html) 에서 BDFL을 언급


# D로 시작

## Drop-in replacement

### 표준 용어 여부 확인

* [Wikipedia 등록여부 확인 완료](https://en.wikipedia.org/wiki/Drop-in_replacement)

### 관련 링크

* [컴퓨터 공학에서 drop-in replacement 뜻](https://woongheelee.com/entry/컴퓨터공학-책에서-쓰는-영어-dropin-replacement-뜻)
  * 아주 조금의 노력으로 A에서 B로 바꿔 성능을 향상 시킨다 
    
### 실제 사용례

* Drew Nail의 책 `Mordern Vim`/ Introduction / A Note on Vim Versions / Neovim 첫 문장
  > Neovim is a community-run fork of Vim that can be used as **a drop-in replacement** for Vim. 

# H로 시작

## Hash

### 표준 용어 여부 확인

* [stackoverflow 태그여부 확인 완료](https://stackoverflow.com/questions/tagged/hash)

### 관련 링크

* [해시와 해시함수가 뭔지 알아보자](https://steemit.com/kr/@twinbraid/4yjj7b): 쉬운 설명 버전
* [해시, 해시넷설명](http://wiki.hash.kr/index.php/%ED%95%B4%EC%8B%9C): 딱딱하지만 정확한 설명 버전

### 실제 사용례

* 이 [답변](https://stackoverflow.com/a/49265306/9457247)은 엑셀파일을 구글시트로 변환하는 과정에서 구현된 코드를 설명하고 있다. 코드 주석중 두번째 문단 첫번째 줄에 다음과 같이 써있다.

> Index the filenames of owned Google Sheets files as object keys (which are **hashed**). This avoids needing to search and do multiple string comparisons. 

  * 위 줄은 다음 코드를 설명하는 글이다
  ```js
  var gsi = dest.getFilesByType(MimeType.GOOGLE_SHEET), gsNames = {};
  ```
  * 구글 드라이브 상에서 파일이름은 `16K05RlmkOiUvo0MPleXWjdpCMsAUOf8` 이런식으로 일정한 길이를 갖지만 알수없는 내용의 `id`코드를 부여받는다. 이 id로 특정파일을 정확하게 지정할 수 있다. 이것을 **hashed** 되었다고 지칭하는 듯??
  * hash 특성으로 검색없이 즉시 저장하거나 찾고자하는 위치를 참조할 수 있다고 하는데 위 인용의 두번째 문장에서 그런 특성을 설명하고 있다.

# L로 시작

## Lead Time

### 표준 용어 여부 확인

* [리드 타임 - 위키백과](https://ko.wikipedia.org/wiki/리트_타임)
* [Lead time #Project management - 영문 wikipedia](https://en.wikipedia.org/wiki/Lead_time#Project_management)

### 관련 링크

* [리드타임 이란?, 네이버 블로그](https://m.blog.naver.com/sjzeloss/220233969342)

### 자매어

* [택트타임(tact time), 사이클타임(cycle time)](https://m.blog.naver.com/sjzeloss/220232848501)

### 실제 사용례 및 의미 해석 

* [vscode April 2021 Release Notes](https://code.visualstudio.com/updates/v1_56)
  > ... The VS Code team has been busy this month working on several longer **lead time** updates ...
  * 해석 : 개발하는데 시간이 많이 걸리는 기능들을 작업하느라 바빴다는 의미..

# M으로 시작

## Manifest

* [Computer 공학에서 manifest의 의미](https://en.wikipedia.org/wiki/Manifest_file) 
  * 유래 : 배에서 선원이름, 화물목록 등을 적은 문서를 적하목록(ship manifest) 이라고 했음
  * manifest는 동사로 많이 쓰는데 "명백하게 하다"라는 의미 

# P로 시작


## predicate

* 서술자?, 조건자?...
* 우리말로 번역이 어려운 용어임
 
### 관련 링크

* [predicate, 서술자 - 류광의 번역 이야기](http://occamsrazr.net/tt/82) : 서술자
* [술어 구문은 순수 함수로 만들자 - 최익필의 이름없는 블로그](https://www.ikpil.com/608) : 술어구문
* [23-3-1.function 모음, SoEn, 김상형](http://www.soen.kr/book/java/book/2331.htm) : 조건을 만족하는지 검사한다는 의미

### 실제 사용례 및 의미 해석

* [JavaScript Is A Great Language](https://betterprogramming.pub/its-time-we-admit-the-truth-about-javascript-98d197c0f1ec#9bb0) - predicate 사용. 조건자 정도로 해석하면 되는듯..
  > JavaScript arrays also have a `fileter` method that takes a **predicate** function and returns an array with only the elements that satisfy the **predicate**.
  
# R로 시작

## raster image

* [Shields.io](https://github.com/badges/shields) ReadMe 첫 문장에 나오는데 궁금해서 기록함

### 관련 링크

* [Raster Images, Vector Images, University of Michigan Library](https://guides.lib.umich.edu/c.php?g=282942&p=1885352)
  * 위의 링크에서는 Vector 이미지와 대비되는 개념으로 설명하는데 
    * 간단하게 확대하면 품질이 떨어지는 이미가 raster 이미지
    * 확대해도 품질이 유지되는 이미지가 vecter 이미지 

# S로 시작

## Short-circuit evaluation

* 별도 문서로 작성 : [Short-circuit evaluation](/wiki/term-short-circuit-evaluation/)

## String interpolation


* 별도 문서로 작성 : [String interpolation](/wiki/term-string-interpolation/)
