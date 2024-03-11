---
layout  : wiki
title   : LLVM의 이해 
summary : 
date    : 2021-10-29 15:58:04 +0900
updated : 2021-10-31 02:01:52 +0900
tag     : llvm gcc clang 
toc     : true
public  : true
parent  : [[C-CPP-Category]] 
latex   : false
---
* TOC
{:toc}

![LLVM 구조](https://i.stack.imgur.com/9xGDe.png)

# 링크

* [The LLVM Compiler Infrastructure, 공식사이트](https://llvm.org/)
  * [LLVM Logo, llvm.org](https://llvm.org/Logo.html) : 로고 알아두자
* [LLVM, 국문 위키피디아](https://ko.wikipedia.org/wiki/LLVM)
* [LLVM, 영문 위키피디아](https://en.wikipedia.org/wiki/LLVM)
* [What exactly is LLVM, stackoverflow](https://stackoverflow.com/q/2354725/9457247)
* [LLVM이란, Zedd0202블로그](https://zeddios.tistory.com/1175)
* [LLVM , Chris Lattner](http://www.aosabook.org/en/llvm.html)

# 단어 해석

* 원래는 `Low Level Virtual Machine` 에서 가져옴
  * 위 그림을 보면 `LLVM`이 `언어들`와 `Machine들` 사이에 위치함 
  * `C언어`보다 하드웨어에 가까운 낮은 위치(low level)에서 `여러가지 Machine`을 대신하여 가상으로 하나의 머신(Virtual Machine)처럼 보이게 해주는 기술인듯
* 모듈러 / 재사용되는 컴파일러 / 툴체인 기술의 모음 (collection)
* 전통적인 OS레벨의 가상머신과는 관계 없음
* 현재는 두문자어(acronym)가 아니라, `LLVM`자체가 프로젝트의 Full name이다
  > The LLVM Project is a collection of modular and reusable compiler and toolchain technologies. Despite its name, LLVM has little to do with traditional virtual machines. The name "LLVM" itself is not an acronym; it is the full name of the project.
  * 위 문단은 [llvm.org](https://llvm.org/) 에서 `LLVM Overview`의 가장 첫 문단이다

# 내부구조

* 프론트엔드와 백엔드로 나뉜다
  * 서브 프로젝트로 클랭 
