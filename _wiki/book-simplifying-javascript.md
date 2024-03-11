---
layout  : wiki
title   : 자바스크립트 코딩의 기술
summary : 똑똑하게 코딩하는 법 
date    : 2021-05-13 12:28:37 +0900
updated : 2022-07-14 03:47:10 +0900
tag     : br*** book regex 
toc     : true
public  : false
parent  : [[Books-Category]] 
latex   : false
comment : false
---
* TOC
{:toc}

# 개요

| ![표지](https://gimg.gilbut.co.kr/book/BN002655/rn_view_BN002655.jpg) | 저자: 조 모건(Joe Morgan) <br> 책제목 : 자바스크립트 코딩의 기술<br> (원서 제목 : Simplifying JavaScript) <br> 부제 : 똑똑하게 코딩하는 법, ES5, ES6를 넘어 최신 표준을 따르는 모던 자바스크립트 작성하기! <br> (원서 부제: Writing Modern JavaScript with ES5, ES6, and Beyond)<br><br> 출판사 : [도서출판 길벗](https://www.gilbut.co.kr/book/view?bookcode=BN002655&pdscode=pds&keyword=자바스크립트&collection=GB_BOOK#bookTab)(원책: [The Pragmatic Bookshelf](https://pragprog.com/titles/es6tips/simplifying-javascript/)) <br> ISBN 한글 : [979-11-6521-020-5](https://www.google.com/search?q=9791165210205) <br> ISBN 영문 : [9781680502886](https://www.google.com/search?q=9781680502886) <br> <br> 정가: 24,000원 |

## 추가 개요 

* 이 책은 1판 번역서이다. ( 출간일: 2010-09-17 , [한빛출판사 링크](https://www.hanbit.co.kr/store/books/look.php?p_code=B1048739715))
* 영문판은 2판 까지 나왔다. ( 출간일: 2012년, [O'Reilly 링크](https://www.oreilly.com/library/view/regular-expressions-cookbook/9781449327453/))
* 번역서 2판은 2021-03-25 현재 아직 없는듯.
* [멘탈저장소의 해당 북 리뷰](https://commontoday.tistory.com/126)

## 저자 설명

### 조 모건 (Joe Morgan)

<style>
.author-container {display: flex; align-items: center; justify-content: space-around;}
</style>

<div markdown="1" class="author-container">

 ![Joe Morgan][joemorgan-img]
 
* [홈 페이지](http://thejoemorgan.com/)
* [트위터](https://twitter.com/joesmorgan)

</div>

[joemorgan-img]:http://thejoemorgan.com/static/2ef7ef668ed3f21927f2289e2e9d3173/9dc27/me.jpg
{:height="200px" object-fit="cover" object-position="20% 10%"}

# Chapter1. Signal Intention with Variable Assignment 

* 특이한 함수 ( currying ) 와 변수의 사용 빈도를 비교해 보면 변수를 옳게 사용하는 것의 영향력에 대해 판단할 수 있다
* Modern JavaScript has several new ways to declare variables.
  * const
  * let

## Tip 1. Signal Unchanging Values with const

* (당신 자신을 포함한) 다음 프로그래머에게 프로그램의 정확한 의도를 알리기 위해 `const`를 사용하라

## Tip 2. Reduce Scope Conflicts with let and const

### terms & jagons

* [be better off, Collins Dictiornay](https://www.collinsdictionary.com/dictionary/english/be-better-off)
* lexically scoped
* block scoped : the block where the variable was declared is enclosed by curly braces

