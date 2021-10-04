---
layout  : wiki
title   : 10년안에 프로그래밍 독학하기 
summary : 피터 노빅의 유명한 글 
date    : 2021-08-20 21:26:17 +0900
updated : 2021-10-04 23:55:00 +0900
tag     : essay 
toc     : true
public  : false
parent  : [[Books-Category]] 
latex   : false
comment : false
---
* TOC
{:toc}

# 개요

* 원문 링크 : [Teach Yourself Programming in Ten Years](http://www.norvig.com/21-days.html)
* 본문에도 설명이 나오지만 원제는 초보자를 위한 프로그래밍 책들의 일반적인 제목인 "Teach Yourself ... in 21days"를 비꼰 제목이다
* 원문 링크를 타고 가보면 오른쪽에 각국어로 번역된 링크가 줄지어 있는데 한국어 번역링크도 있다.
  * [John Hwang 님이 번역](http://www.tavon.org/site/work/21-days)했다고 되어 있는데 현재(2021-08-20)는 링크가 끊어져있다.
  * 내가 번역해보면서 공부해야겠다

## 저자 설명

### 피터 노빅 (Peter Norvig)

<style>
.author-container {display: flex; align-items: center; justify-content: space-around;}
</style>

<div markdown="1" class="author-container">

 ![Drew Neil Photo][author-img]

* 구글 연구 이사 ( Director of Research in ![Google Logo][Google-Logo] )
* [HomePage](http://norvig.com/)
  * 재미있게 읽었던 글 중 [Solving Every Sudoku Puzzle](http://norvig.com/sudoku.html)이 있다 
* [GitHub](https://github.com/norvig/)
* [TED 연설 : 10만명의 학생들이 공부하는 강의실](https://www.ted.com/talks/peter_norvig_the_100_000_student_classroom?language=ko#t-162781)

</div>

[author-img]:https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Peter_Norvig_in_2019.jpg/375px-Peter_Norvig_in_2019.jpg
{:width="375" height="281" object-fit="cover" object-position="20% 10%"}

[Google-Logo]:https://www.gstatic.com/images/branding/googlelogo/2x/googlelogo_color_284x96dp.png
{:width="57em" height="20em" object-fit="cover" object-position="left bottom"}

# Teach Yourself Programming in Ten Years

* by Peter Norvig

## Why is everyone in such a rush? (모든 사람이 왜 이렇게 급한가? )

* 아무 서점에 들어가보면 *24시간내에 Java 독학하기* 라는 책 옆으로 유사한 책들이 얼마나 많은지 알게된다
  * 주제는 C, SQL, Ruby, Algorithms 등등 으로 다양하고
  * 걸리는 시간도 며칠에서 몇시간 정도로 다양하다
* [`title:teach, yourself, hours, since: 2000`](https://www.amazon.com/s?i=stripbooks&rh=p_28%3Ateach+yourself+hours&s=relevanceexprank&Adv-Srch-Books-Submit.x=16&Adv-Srch-Books-Submit.y=5&field-dateop=After&field-dateyear=2000&unfiltered=1&ref=sr_adv_b) 으로 아마존 상세검색을 해보면 ..
  * 이런 책이 512개 (2021-08-20 현재는 346개) 가 검색될 정도다 
  * 그 중 9할 정도가 프로그래밍책이다 ( 나머지는 bookkeeping에 대한것들) 
  * 여기에서 "teach yourself"를 "learn" 으로, "hours"를 "days"로 바꿔도 유사한 결과가 나온다.
* 결론은 이렇다.
  * 사람들이 프로그래밍을 배워야 하는 매우 급한 상황이거나
  * 프로그래밍이 다른 어떠한 것보다도 엄청나게 배우기 쉬운 어떤 것이거나다
* Felleisen 등은 그의 책 [How to Design Programs](https://htdp.org/2021-5-4/Book/index.html) 에서 이러한 트렌드에 대해 고개를 끄덕였다
  * 그들은 이렇게 말했다. (온라인 판이 공개되어있는데 아래 문구를 찾지는 못했다...)
  > 나쁜 프로그래밍은 쉽다. 바보들도 21일 이면 배울수 있다
  * `Abstruse Goose`도 이 문제 [관련한 작품](https://abstrusegoose.com/249) 이 하나 있다.
    * (역자주) 타임머신을 발명할 정도로 공부해서 21째 되는날로 점프해서 자기자신을 (죽이고) 대체한다
    * (역자주) 재미있게도 위의 `Abstruse Goose` 작품에서도 이 글에 링크를 걸어두었다. (누가 먼저 링크한 거지?) 
* `Teach Yourself C++ in 24 Hours`라는 타이틀이 어떤 것을 의미하는지 분석해보자
  * **Teach Yourself**:
    * 24시간안에 당신이 해내지 못할 것으로는 다음과 같은 것들이 있다
      * 몇가지 중요한 프로그램 작성하기
      * 위 프로그램들을 작성하며 경험한 실패와 성공에서 교훈 배우기
      * 경험있는 베테랑 프로그래머와 같이 일하기
      * C++ 환경에서 생활한다는 것이 어떤건지 이해하기
    * 간단하게 말해서 이 많은것들을 배우기에는 24시간은 부족하다
    * 따라서, 책이 말하는 것은 `수박 겉핥기` 정도 일것이며, 깊은 이해가 되는 정도까지는 아닐것이다
    * 알렉산터 포프가 말했듯, [`조금 아는 것은 위험한 것이다`](https://www.goodreads.com/author/quotes/25157.Alexander_Pope)
  * **C++**:
    * 24시간안에 당신이 해낼수 있을것으로 예상되는 것은 다음과 같다
      * C++ 문법의 일부를 배울 수 있다 ( 당신이 이미 다른 언어를 안다는 전제가 필요하다)
        * 하지만 언어를 어떻게 사용해야하는지 많이 배울수는 없다.
      * 간단하게 말하면
        * 당신이 Basic 프로그래머라면 
        * C++ 문법을 이용해 Basic 스타일의 프로그램을 만들 수 있다
      * 하지만, 이 수준으로는 C++을 어떤 곳에 사용하면 좋을지 (아니면 나쁠지) 배울수 없다 
    * 그래서 여기서 말하는 포인트는 무엇일까?
      * [Alan Perlis가 일찌기 말했다, 목록중 19번](http://pu.inf.uni-tuebingen.de/users/klaeren/epigrams.html)
        > 당신이 프로그래밍에 대해 생각하는 방식에 영향을 주지 않는 언어는 알아둘 필요가 없다
      * 당신이 그 일부분의 C++ (Javascrip나 Processing이어도 된다) 지식이라도 알아둬야할 경우가 있긴하다
        * 어떤 특별한 task의 완수를 위해 기존에 존재하는 도구와의 interface 목적으로 필요할 경우이다
        * 다만, 이때에는 어떻게 프로그램 하는지 배우는 상황은 아니다.
        * 단지 그 주어진 task를 어떻게 완수하는지 배우는 상황일 뿐이다.
  * **in 24 Hours**:
    * 불행하게도, 이 시간은 부족하다.
    * 이어지는 섹션에서 그 이유를 보여줄 것이다
 
## Teach Yourself Programming in Ten Years
 
* 많은 연구자들이 그들의 연구에서 보여주듯이
  * [Bloom (1985)](https://www.amazon.com/exec/obidos/ASIN/034531509X/), Bryan & Harter (1899)[^BH],[Hayes (1989)](https://www.amazon.com/exec/obidos/ASIN/0805803092), Simmon & Chase (1973)[^SC]
  * 어떤 분야에서든 전문성을 기르는데는 최소한 10년이 걸린다
  * 체스 게임, 음악 작곡, 전보 조작(telegraph Operation), 그림, 피아노 연주, 수영, 테니스, ...
  * ..., 신경 심리학및 위상학 연구등 다양한 분야가 이 들 연구에 포함되었다
  * 여기서 중요한 점은
    * 그 기간동안 집중하며 몰두하는 상태에서의 수련이어야 한다는 것이다
    * 단순하게 반복하는 것이 아니라
    * 당신의 현재 능력을 넘어서는 과제에 도전하며, 계속 시도해보고
    * 그 과제를 하면서 자신의 퍼포먼스를 분석하고
    * 실수가 발견되면 끊임없이 수정하는 수준의 수련이 계속되어야 한다
    * 그리고나서, 이 과정을 반복하고 또 반복하라
  * 여기에서 더 빠른 지름길은 없는 것으로 보인다
    * 4살 부터 음악적 천재였던 모짜르트조차도, 월드 클래스 작곡을 하기까지 13년 이상이 걸렸다
    * 비틀즈는 1964년 에드 설리반쇼에 출연하여 연속 1위 히트를 기록하며 깜짝 등장한 것처럼 보이지만..
      * 그들은 1957년 부터 리버풀과 함부르크에 작은 클럽에서 공연했고..
      * 초기에 대중에 관심을 끌었지만,
      * 첫번째로 큰 성공을 거둔 Sgt. Peppers는 1967년에 출시되었다
  * 말콤 글래드웰은 그의 저서 [아웃라이어](https://www.amazon.com/Outliers-Story-Success-Malcolm-Gladwell/dp/0316017922) 에서 10년이 아니라 10,000시간에 주목하긴 했지만 이 생각을 대중화 시켰다.
    * 사진가 앙리 카르티에 브레송(1908-2004)은 "처음 10,000장의 사진이 최악의 사진이다"라고 했다
      * 그는 이 말을 할 때 디지털 카메라는 예상하지 못했는데, 어떤 이들은 1주일만에 1만장을 찍을수도 있다
    * 진정한 전문 지식은 평생이 걸리기도 한다
      * 새뮤얼 존슨(1709-1784)는 "어떤 분야에서든 탁월함은 평생의 노력으로만 도달할 수 있다; 더 싼 비용으로 가질수는 없다"고 했다
      * 제프리 초서(1340-1400)는 "인생은 짧고, 기술을 배우는데는 너무 오래걸린다"고 불평했다.
      * 히포크라테스(c. 400BC)는 "예술은 길고, 인생은 짧다"고 했는데..
        * 원래 문장은 이렇다. "예술은 길고, 인생은 짧고, 기회는 덧없고, 실험은 위험하고, 판단은 어렵다"
    * 물론, 10년이나 10,000 시간 같은 숫자 하나가 최종 답안이라는 것은 아니다.
      * 프로그래밍, 체스 게임, 체커 게임, 악기 연주 같은 다양한 기술을 각각 마스터 하는데에
      * 정확히 같은 시간이 걸린 다는 것이 합리적이지는 않다.
      * 또한 모든 사람이 개인의 능력에 관계에 없이 정확히 같은 시간이 필요할리도 없다
      * K. 안데르스 에릭손 교수는 이렇게 말했다
        > 대부분의 분야에서 가장 재능있는 개인이 최고 레벨에 도달하기까지 얼마나 많은 시간이 필요한지 알게되면 놀라게된다
        > 10,000 시간이라는 숫자는 , 천부적으로 타고났지만 아직도 최고레벨에는 도달하지 못한 사람들에게는 수년동안 일주일에 10 에서 20시간정도 걸릴것으로 논쟁할 만한 것이라는 인상을 준다?
        * (역자주) 윗 줄 해석이 잘 안됨.TT

## So You Want to be a Programmer (그래서 프로그래머가 되겠다는 거군요)

###  프로그래밍 분야에서 성공을 위한 레시피가 있다.

* 프로그래밍에 **재미**를 느껴라. 프로그래밍이 즐겁기 때문에 해야한다
  * 10년이나 10,000 시간을 기꺼이 투자해도 꾸준히 재미를 느낄수 있다고 확신해야 한다 
* **프로그램**.
  * 가장 좋은 종류의 배움은 [직접 하면서 배우는 것](https://www.engines4ed.org/hyperbook/nodes/NODE-120-pg.html) 이다
  * 좀더 기술적으로 묘사하자면..
    > 어떤 분야에서 개인의 최고 수준의 능력은, 오래된 경험의 축척으로 자동적으로 획득되는 것이 아니다
    > 고도로 훈련된 개인이라 하더라도, 능력의 레벨은 개선하고자 하는 의도적인 노력의 결과로만 향상될 수 있다.
    
    * 위 글에 대한 원문 링크가 있는데 잘 연결이 안됨.. (P. 366)
     
    > 가장 효과적인 배움에는, 특정한 개인 대상으로 적절히 어려운 수준으로 잘 정의된 과제가 요구되며
    > (진행중인 과제에 대한) 유용한 피드백과 (과제 수행하면서 저지른) 오류를 수정하고 다시할 수 있는 기회가 제공되어야 한다
    
    * 윗 글의 페이지는 (P.20-21)
    * [Cognition in Practice: Mind, Mathermatics, and Culture in Everyday Life](https://www.amazon.com/exec/obidos/ASIN/0521357349) 책은 이러한 관점을 가진 흥미로운 레퍼런스이다
* 다른 프로그래머 들과 **이야기 하라**
  * 다른 사람의 프로그램을 읽어봐라
  * 이것은 다른 어떤 책이나 트레이닝 코스보다 중요한 경험이다
* `당신이 원한다면` **대학** 에 4년을 투자해라( 대학원까지 간다면 더 긴 시간이 필요하다)
  * 이것은 자격을 요구하는 Job에 도전할수 있게 허락해주며
  * 당신의 분야에 대한 좀 더 깊은 이해도를 줄 수도 있다
  * 하지만, 당신이 학교에서 즐겁지 않다면
    * 독학이나 Job에서 유사한 경험을 얻을수도 있다 (대학의 경우보다는 좀 더 전념할 필요는 있다) 
  * 하지만 어떤 경우라도
    * 책으로 혼자 배우는 것은 충분하지 않다
  * "The New Hacker's Dictionary"의 저자 Eric Raymond가 이렇게 말했다
    > 붓과 물감에 대한 공부로 전문 화가가 될수 없는 것처럼 Computer Science 교육으로 전문 프로그래머가 될 수는 없다
  * 내가 고용했던 최고의 프로그래머중 한명은 고등학교만 졸업했었다
    * 그는 수많은 [훌륭한](http://www.xemacs.org/) [소프트웨어](https://www.mozilla.org/ko/)를 개발했으며
    * 자신만의 [News Group](https://groups.google.com/search?pli=1&q=alt.fan.jwz&inOrg=false) 을 가지고 있고
    * 충분한 스톡옵션으로 자신의 [나이트클럽](https://en.wikipedia.org/wiki/DNA_Lounge)을 샀다
    * (역자주) [이 사람](http://www.xemacs.org/People/jamie.zawinski/)! 프로필에 나이트클럽 얘기가 있음. 위의 위키백과 내용에도 있고..
* 다른 프로그래머들과 **함께 프로젝트**에 참여하라
  * 가장 잘하는 프로그래머와 가장 못하는 프로그래머 를 각각 다른 프로젝트에서 경험해 보라 
  * 최고의 프로그래머 자격으로 당신은...
    * 프로젝트를 이끄는 당신의 능력을 테스트 할 수 있고
    * 당신의 비전으로 다른 프로그래머에게 영감을 줄 수 있다
  * 최저의 프로그래머 자격으로 당신은 ...
    * 달인이 어떻게 작업하는지 배울수 있으며
    * 그들이 어떤것을 하기 싫어하는지 배울수 있다 (왜냐하면 그들이 당신에게 그것을 시킬것이기 때문이다)
* 다른 프로그래머가 했던 **프로젝트를 넘겨 받아서** 작업해 보라
  * 다른 사람이 작업한 코드를 이해해보라
  * 원래 프로그래머가 부재중일때 그것을 수정하고 이해하는데 무엇이 필요한지 확인하라
  * 그 경험으로..
    * 당신의 프로그램을 어떻게 디자인할지 생각하라
    * 당신 이후에 작업할 프로그래머들이 유지보수하기 편하도록 무엇을 할지 생각하라
* 적어도 6개 이상의 **프로그램 언어**를 익혀라
  * 클래스 추상화(class abstractions)를 강조하는 언어를 적어도 한개이상 포함해라(Java나 C++ 같은것)
  * 함수적 추상화(functional abstraction)를 강조하는 언어도 한개 이상 포함해라(Lisp나 ML 혹은 Haskell)
  * 구문 추상화(syntactic abstraction)을 지원하는 언어도 필요하다 (Lisp 같은것)
  * 선언적인 지정(declrative specification)을 지원하는 언어도 필요하다 (Prolog나 C++ 템플릿 같은것)
  * 병행성(parallelism)을 강조하는 언어도 필요하다 (Clojure나 Go같은것)
* "컴퓨터 과학(Computer science)" 이라는 문구에 **"Computer"**가 있음을 기억하라
  * 당신의 컴퓨터에 다음의 과정에서 시간이 얼마나 걸리는지 알아라 
    * 한 개의 instruction을 수행 
    * 메모리에서 단어 한개를 fetch ( cache miss가 있을때와 없을때 모두)
    * 연속된 단어들을 disk에서 읽기
    * 디스크에서 새로운 위치를 찾기
  * [답은 여기에 있다](#answers)
* 언어 **표준화(standardization)** 작업에 참여하라
  * ANSI C++ 위원회가 될 수도 있고
  * 아니면, 당신의 local PC에서의 코딩 스타일이 2개 혹은 4개의 공백 들여쓰기를 할지를 결정하는 것일수도 있다
  * 어느쪽이든, 아래 내용을 배우게 될 것이다.
    * 언어를 사용하면서 다른 사람들이 뭘 좋아하는지
    * 그들이 얼마나 깊이 그런 감정을 느끼는지
    * 아마도 그들이 그렇게 느끼는 이유에 대해 조금이라도 알게될 것이다
* 언어 **표준화** 작업에서 가능한한 빨리 손떼는 지혜도 가져라
  * (역자주) 너무 표준화 작업에 몰두하는 것도 안좋다는 의미 
  * (역자주) 나는 너무 환경을 꾸미는 작업(예를 들어 vim plugin 선택이라든가..)에 몰두할 때가 있는데 이 것도 비슷할 듯 

### 피터 노빅의 개인적인 경험 

* (역자주) 여기에서 섹션이 나뉘어 있진 않지만 위의 레시피와는 확실히 구분되어야 할 것 같아 나눔
* 위에서 말한 모든 내용을 염두에 두면 
  * 책을 공부하는 것만으로 얼마나 얻을수 있는지 의문이 든다
* 나의 첫번째 아이가 태어나기전에
  * 나는 `How To` 책을 모두 읽었지만
  * 어떻게 해야할지 아무것도 모르는 초보자처럼 느껴졌다.
* 30 개월이 지난후에, 둘째가 출산예정이었을때
  * 내가 다시 책읽기 복습으로 돌아갔을까?
  * 아니다. 나는 내 개인 경험에 의지하기로 했는데
    * 그 방법이 전문가에 의해 작성된 수천 페이지 보다 훨신 유용했고 
    * 내게 확신을 주었다
  


---

## Answers

* 일반적인 PC에서 다양한 Operatoin에 대한 대략적인 시간은 다음과 같다
  
| 수행작업                                 | Operation                           | 걸리는 시간                            |
| :---                                     | :---                                | ---:                                   |
| 일반적인 instruction 수행                | execute typical instruction         | 1/1,000,000,000 sec = 1 nanosec        |
| L1 캐시 메모리에서 fetch                 | fetch from L1 cache memory          | 0.5 nanosec                            |
| 분기 오예측                              | branch misprediction                | 5 nanosec                              |
| L2 캐시 메모리에서 fetch                 | fetch from L2 cache memory          | 7 nanosec                              |
| 뮤텍스 잠금/풀기                         | Mutex lock/unlock                   | 25 nanosec                             |
| 메인 메모리에서 fetch                    | fetch from main memory              | 100 nanosec                            |
| 1Gbps 망에서 2K 바이트 보내기            | send 2K bytes over 1Gbps network    | 20,000 nanosec                         |
| 메모리에서 1MB 연속적으로 읽기           | read 1MB sequentially from memory   | 250,000 nanosec                        |
| 새 disk 위치에서 fetch (seek포함)        | fetch from new disk location (seek) | 8,000,000 nanosec                      |
| disk에서 1MB 연속적으로 읽기             | read 1MB sequentially from disk     | 20,000,000 nanosec                     |
| 미국에서 유럽으로 packet을 보냈다가 받기 | send packet US to Europe and back   | 150 milliseconds = 150,000,000 nanosec |

## Appendix: Language Choice

---

## References

[^BH]: Bryan, W.L. & Harter, N. "Studies on the telegraphic language: The acquisition of a hierarchy of habits. Psychology Review, 1899, 8, 345-375
[^SC]: Chase, William G. & Simon, Herbert A. "Perception in Chess" Cognitive Psychology, 1973, 4, 55-81.
