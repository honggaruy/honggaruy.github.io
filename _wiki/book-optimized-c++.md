---
layout  : wiki
title   : C++ 최적화 
summary : Proven Techniques for Heightened Performance
date    : 2022-05-16 15:47:59 +0900
updated : 2022-05-16 20:48:46 +0900
tag     : c++ optimization
toc     : true
public  : false
parent  : [[Books-Categrory]] 
latex   : false
comment : false
---
* TOC
{:toc}

# 개요

<style>
.cover-table img { width: 300px }
</style>

{: .cover-table}
| ![optimizedcpp-kr-img] | 저자: 커트 건서로스(Kurt Guntheroth) <br> 옮긴이: 옥찬호 <br> 감수자: 박수현 <br> <br> 책제목 : C++ 최적화<br> (원서 제목 : Optimized C++) <br> 부제 : 최고 성능을 구현하는 10가지 검증된 기법<br> (원서 부제: PROVEN TECHNIQUES FOR HEIGHTENED PERFORMANCE)<br><br> 출판사 : [한빛미디어](https://www.hanbit.co.kr/store/books/look.php?p_code=B8975427001)(원책: [O'Reilly Media](https://www.oreilly.com/library/view/optimized-c/9781491922057/)) <br> ISBN 한글 : [979-11-6224-198-1](https://www.google.com/search?q=9791162241981) <br> ISBN 영문 : [978-1-491-92206-4](https://www.google.com/search?q=9781491922064) <br> <br> 정가: 38,000원 |

[optimizedcpp-kr-img]:https://www.hanbit.co.kr/data/books/B8975427001_l.jpg

## 저자 설명

### 커트 건서로스 (Kurt Guntheroth)

<style>
.author-container {display: flex; align-items: center; justify-content: space-evenly;}
</style>

<div markdown="1" class="author-container">

 ![author Photo][author-img]

* 집필당시 35년 이상의 C++ 개발자 경력 ( 2022-05-16 현재 40년이상..)
* [HomePage](http://www.guntheroth.com/)
* [LinkedIn](https://www.linkedin.com/in/kurt-guntheroth-b13919b)
* [Blog](http://oldhandsblog.blogspot.com/) : Kurt Guntheroth's Old Hands Blog, 2011 ~ 2020

</div>

[author-img]:https://scontent-ssn1-1.xx.fbcdn.net/v/t1.18169-9/23543_101205819918543_5949494_n.jpg?_nc_cat=101&ccb=1-6&_nc_sid=09cbfe&_nc_ohc=PnucehwFYwcAX-5-ooJ&tn=7tdRGi-y2CQ1sMIg&_nc_ht=scontent-ssn1-1.xx&oh=00_AT95pefe3_lscvUIF69w-bGI4KGvhRAp2jO36Ay1G4gfLg&oe=62A86F96
{:width="50%" object-fit="cover" object-position="20% 10%"}

## 최적화 10가지 방법 요약

* Locate performance hot spots using the profiler and software timers
* Learn to perform repeatable experiments to measure performance of code changes
* Optimize use of dynamically allocated variables
* Improve performance of hot loops and functions
* Speed up string handling functions
* Recognize efficient algorithms and optimization patterns
* Learn the strengths-and weaknesses-of C++ container classes
* View searching and sorting through an optimizer's eye
* Make efficient use of C++ streaming I/O functions
* Use C++ thread-based concurrency features effectively

# 1. An Overview of Optimization

# 2. Computer Behavior Affecting Optimization

# 3. Measure Performance

## The Optimizing Mindset

## Perform Experiments

## Profile Program Execution

* Profiler : a program that produces statistics about where another program spends its time
  * The profiler constructs a report showing ...
    * how freqenlty each statement or function is executed
    * how much time accumulates in each function
* 프로파일러는 보통 컴파일러와 함께 제공됨
  * VS는 예전에 유료버전에서만 제공했지만 VS2015 커뮤니티 버전부터 프로파일러를 제공함

### 참고자료 (역자주)

* [First look at profiling tools, MS Docs](https://docs.microsoft.com/en-us/visualstudio/profiling/profiling-feature-tour?view=vs-2022) : Docs / Visual Studio / IDE / Profiling /
* 실전에서 VS Profiler 사용해보기
  * [Using VS Profiler to reduce memrory allocations in the WT console, Visual Studio Blog](https://devblogs.microsoft.com/visualstudio/case-study-using-visual-studio-profiler-to-reduce-memory-allocations-in-the-windows-terminal-console-host-startup-path/)
  * 위 블로그 포스트에서 언급된 [WPA Tool 설명](https://docs.microsoft.com/ko-kr/windows-hardware/test/wpt/windows-performance-analyzer)
