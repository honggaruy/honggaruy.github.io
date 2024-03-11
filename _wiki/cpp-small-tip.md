---
layout  : wiki
title   : C++ 기초 상식
summary : C언어 관련 여러가지 궁금증및 주제기록 
date    : 2022-01-19 14:26:28 +0900
updated : 2022-02-26 16:49:04 +0900
tag     : c++ iostream standard-library 
toc     : true
public  : true
parent  : [[C-CPP-Category]] 
latex   : false
---
* TOC
{:toc}

# Tip 1. cin, cout 에서 c는 뭘 의미하나?

* console 입출력 하는 C standard 함수인 cin, cout 에는 `c` prefix가 붙어있다
* 이 놈은 `console` 의미하는지 , `char`를 의미하는지 ... 찾아보았다

## 구글링한 링크

* [What does 'c' in 'cout' mean?, the coding forums](https://www.thecodingforums.com/threads/what-does-c-in-cout-mean.545379/)
* [What does the "c" mean in cout, cin, cerr and clog?, stackoverflow.com](https://stackoverflow.com/q/2262232/9457247)

# Tip 2. `#pragma once`란?

* 관련 공식문서 : [once pragma, MS Doc - KR](https://docs.microsoft.com/ko-kr/cpp/preprocessor/once?view=msvc-170)
  * 참고해볼 글 : [#pragma once 란?](https://wiserloner.tistory.com/264)
* Visual Studio에서 제공하는 간편한 전처리기
* 컴파일러가 헤더 파일을 한번만 포함하도록 하는 표시를 하는 기능이다 
* 이러한 기능은 *multiple-include optimization* 이라는 용어로 불리기도 한다
* Visual C 가 아닌 환경에서는 `*include guard* idiom` 이라고 하는 다음과 같은 코드를 쓰기도 한다
  * 오직 C++ 문법 만으로 동일한 목적을 달성하게 하는 일종의 idiom 이다 
    ```cpp
    // header.h
    // Demonstration of the #include guard idiom.
    // Note that the defined symbol can be arbitrary.
    #ifndef HEADER_H_    // equivalently, #if !defined HEADER_H_
    #define HEADER_H_
    // Code placed here is included only once per translation unit
    #endif // HEADER_H_
    ```
