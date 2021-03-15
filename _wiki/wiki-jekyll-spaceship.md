---
layout  : wiki
title   : 위키에 jekyll-spaceship 적용 
summary : 다양한 table 작성, emoji and more... 
date    : 2021-01-02 23:51:07 +0900
updated : 2021-03-13 20:13:10 +0900
tag     : jekyll-spaceship markdown-table plantuml mermaid emoji thequeensgambit
toc     : true
public  : true
parent  : [[Wiki-Setting-Category]] 
latex   : false
---
* TOC
{:toc}

# 1. 발단

* [2021년 1주차 블로그](/blog/2021/01/01/week-01th/#jekyll-spaceship-테스트) 에서 위키문서로 빼기로 하고 넘어옴 
* [2020년 50주차 블로그](/blog/2020/12/07/week-50th/#Markdown-table-작성시-table-셀-styling-하기)에 적었던 테이블 스타일링 기법도 여기로 모아 정리하기로 했다.


# 2. 전개

## Markdown table 작성시 table 셀 styling 하기

* 위키에서 table 작성하다가 특정 셀을 강조하고 싶을 때가 있다.
* inline으로 필요할 때만 하는 방법을 알아보자

### 관련 링크

* 로컬 페이지에서 markdown table 바로 앞에서 임시로 style 옵션 주기
  * [set background color for specific cell in markdown table, stackoverflow 답변](https://stackoverflow.com/a/64420939/9457247)
  * 위에서는 div 태그를 사용했지만 kramdown에서는 별도 코드가 있다

* Jekyll에서 사용하는 Kramdown table에 속성(attribute) 주기
  * [How to add multiple classes to MarkDown using Jekyll?, stackoverflow 답변](https://stackoverflow.com/a/27501209/9457247)
  * [Attirbute List Definitions, Kramdown Official 문서](https://kramdown.gettalong.org/syntax.html#attribute-list-definitions)

## 위 링크 정보를 참조하여 테이블 스타일링 예시

<style>
.customtable tr:nth-child(1) { background: red; }
.customtable td:nth-child(2) { color: white; background: blue; }
.customtable tr:nth-child(3) td { color: black; background: yellow; }
</style>

* 아래 테이블의 markdown 작성예를 보고 싶으면 
  * [현재 문서의 Raw 파일](https://raw.githubusercontent.com/honggaruy/honggaruy.github.io/master/_wiki/wiki-jekyll-spaceship.md)을 참조
  * 테이블 바로 위의 로컬 sytle 태그와 테이블 속성주는 명령어가 핵심

    {: .customtable}
    | 1열     | 2열    | 3열    |
    | :--     | :--    | :--    |
    | 빨간줄  | 파란열 | 빨간줄 |
    |         | 파란열 |        |
    | 노란줄  | 노란줄 | 노란줄 |
    |         | 파란열 |        |

## jekyll-spaceship 테스트


* github : [https://github.com/jeffreytse/jekyll-spaceship](https://github.com/jeffreytse/jekyll-spaceship)

### 1. Table Usage

#### Rowspan and Colsapn

* 예제 
  
  | Stage               | Direct Products | ATP Yields |
  | ---:                | ---:            | ---:       |
  | Glycolysis          | 2 ATP           ||
  | ^^                  | 2 NADH          | 3--5 ATP   |
  | Pyruvagye oxidation | 2 NADH          | 5 ATP      |
  | Citric acid cycle   | 2 ATP           ||
  | ^^                  | 6 NADH          | 15 ATP     |
  | ^^                  | 2 FADH          | 3 ATP      |
  | 30--32 ATP                                       |||


* vimwiki 에서 테이블 자동 포맷팅을 해주기 때문에 주의해서 편집해야 한다.
  * 우선 vimwiki 포맷에 따라 편집한다 (모든 delimiter 줄이 맞도록 한다)
  * 그다음 jekyll-spaceship 포맷에 따라 공백을 제거한다 
    
#### MultiLine    

* 줄 마지막의 backslash는 내용이 다음줄과 Join 한다는 표시이다
 
  | : Easy Multiline :    |||
  | : --- | :---   | :---   |
  | Apple | Banana | Orange \
  | Apple | Banana | Orange \
  | Apple | Banana | Orange |
  | Apple | Banana | Orange \ 
  | Apple | Banana | Orange |
  | Apple | Banana | Orange |

#### Headerless

<style>
.big-chess-table {font-size: 2.0rem;}
.big-chess-table tbody td {line-height: 1.32em; padding-top: 1px; padding-bottom: 1px;}
.big-chess-table td:nth-child(9) {font-size: 1rem; color: white; background: black;}
.big-chess-table tr:nth-child(9) {font-size: 1rem; color: white; background: black; text-align: center}
.big-chess-table tr:nth-child(-2n+7) td:nth-child(-2n+8) {background: burlywood;} 
.big-chess-table tr:nth-child(-2n+8) td:nth-child(-2n+7) {background: burlywood;}
.big-chess-table tr:nth-child(-2n+7) td:nth-child(-2n+7) {background: blanchedalmond;}
.big-chess-table tr:nth-child(-2n+8) td:nth-child(-2n+8) {background: blanchedalmond;}
.chess-container {display: flex; align-items: center; justify-content: space-around;}
</style>

* 원래 위 링크에 있던 체스 보드는 이랬지만...
  * 기물이 너무 작아 잘 안보이고 체스판이 너무 길쭉하다.

|---|---|---|---|---|---|---|---|---|
| ♜ | ♞ | ♝ | ♛ | ♚ | ♝ | ♞ | ♜ | 8 |
| ♟ | ♟ | ♟ |   | ♟ | ♟ | ♟ | ♟ | 7 |
|   |   |   |   |   |   |   |   | 6 |
|   |   |   | ♟ |   |   |   |   | 5 |
|   |   | ♙ | ♙ |   |   |   |   | 4 |
|   |   |   |   |   |   |   |   | 3 |
| ♙ | ♙ |   |   | ♙ | ♙ | ♙ | ♙ | 2 |
| ♖ | ♘ | ♗ | ♕ | ♔ | ♗ | ♘ | ♖ | 1 |
| a | b | c | d | e | f | g | h | x |

* custom table css 설정으로 확대한 체스보드 테이블을 그릴 수 있다.
  * 위에서 소개했던 테이블 스타일링을 활용했다
* 요즘 넷플릭스 영화로 유명한 [**퀸즈 갬빗** 오프닝](https://en.wikipedia.org/wiki/Queen%27s_Gambit) 이다. #thequeensgambit

<div markdown="1" class="chess-container">

{: .big-chess-table}
|---|---|---|---|---|---|---|---|---|
| ♜ | ♞ | ♝ | ♛ | ♚ | ♝ | ♞ | ♜ | 8 |
| ♟ | ♟ | ♟ |   | ♟ | ♟ | ♟ | ♟ | 7 |
|   |   |   |   |   |   |   |   | 6 |
|   |   |   | ♟ |   |   |   |   | 5 |
|   |   | ♙ | ♙ |   |   |   |   | 4 |
|   |   |   |   |   |   |   |   | 3 |
| ♙ | ♙ |   |   | ♙ | ♙ | ♙ | ♙ | 2 |
| ♖ | ♘ | ♗ | ♕ | ♔ | ♗ | ♘ | ♖ | 1 |
| a | b | c | d | e | f | g | h | x |

![poster][poster-img]

</div>

* 위의 표와 포스터 그림을 가로로 배열하는 방법
  * 표에 오른쪽으로 column을 한개더 만드는 방법은 표가 아래위로 길어지는 경향이 있어 보기 싫음
  * Kramdown 문법 에서 [HTML Blocks 문법](https://kramdown.gettalong.org/syntax.html#html-blocks)을 사용
  * 아래와 같이 구성하면 markdown 문법과 HTML 문법을 동시에 사용하여 문서를 작성할 수 있다. 
    ```html
    <style>
    .chess-container {display: flex; align-items: center; justify-content: space-around;}
    </style>
    
    <div markdown="1" class="chess-container">
    
    some markdown table
    
    some markdown image
    
    </div>
    ```
  * 위 코드에서 `justify-content`를 `center`로 설정하면 체스보드와 그림 사이에 여유가 없이 딱 붙게됨. 
  * 위에서 테이블과 포스터의 키를 맞추는 것은 `td` 태그의 `line-height` attr을 미세조정하여 맞춤. 
    * line-height: 1.32em 으로 맞춤
  * CSS flexbox 문법을 찾아볼 것

[poster-img]: https://upload.wikimedia.org/wikipedia/en/1/12/The_Queen%27s_Gambit_%28miniseries%29.png "The Queen's Gambit Poster"

#### Cell Alignment

* 예제
  
  | : Fruits \|\| Food         : |||
  | :---   | :---      | :---      |
  | Apple  | : Apple : | Apple     \
  | Banana | Banana    | Banana    \
  | Orange | Orange    | Orange    |
  | : Rowspan is 4 :  || How's It? |
  | ^^ A. Peach       || 1. Fine : |
  | ^^ B. Orange      || ^^ 2. Bad |
  | ^^ C. Banana      || It's OK!  |

#### Cell Markdown

<style>
.td-img img { width: 138px; }
</style>

* 예제
  * 아래 예제를 스타일링 하지 않고 그냥 작성하면 그림이 100% 크기로 꽉차게 된다
  * img 태그에 대해 height 속성을 정해줬다.
    * 브라우저에 F12로 디버깅모드에서 그림의 원래 크기를 알수 있는데..
    * height을 원래 크기 (552)의  1/4값인 138px로 정해주었다.
  * [vim에서 간단한 사칙연산을 하려면..](https://vim.fandom.com/wiki/Using_vim_as_calculator)
    * step1: insert mode로 진입
    * step2: <kbd>Ctrl</kbd>+<kbd>r</kbd> 입력
    * step3: `=552/4` 입력
    * step4: insert mode 시작한 자리에 138이 입력된다

* 예제

  {: .td-img}
  | : MathJax \|\| Image : |||
  | :--- | :--- | :--- |
  | Apple  | : Apple :| Apple                          \
  | Banana | Banana   | Banana                         \
  | Orange | Orange | Orange |
  | : Rowspan is 4 : || : How's it? :                  |
  | ^^ A. Peach      || 1. ![exmple][cell-image]      |
  | ^^ B. Orange     || ^^ 2. $I = \int \rho R^{2} dV$ |
  | ^^ C. Banana     || **It's OK!**                   |


* 주의
  * Kramdown 설명에는 Reference Style IAL로 그림에 attribute을 설정할 수 있다고 하는데..
    * [kramdown syntax.html #images](https://kramdown.gettalong.org/syntax.html#images)

      ```
      1. ![cell-image]
      [cell-image]: ~.png
      {:height="138px"}
      ```
    * table 밖에서는 동작하지만 table 내부에서는 동작하지 않음 (아래는 Reference 스타일 적용)
     
      ![cell-image]
    * 위의 표에서는 Reference Style로 적용하지 않고 별도 style 태그를 사용함.
      * 일단 표안에서의 해결책은 style block으로 설정하는것

[cell-image]: https://jekyllrb.com/img/octojekyll.png
{:height="138px"}


#### Cell Inline Attributes

* attribute definitions (ALDs) 를 사용하는 방법
  ```
  {:ref-name: #id .cls1 .cls2}
  {:second: ref-name #id-of-other title="hallo you"}
  {:other: ref-name second}
  ```
* ALD line 구조
  * 왼쪽 brace로 시작, 공백 3개까지 허용
  * colon(:) 으로 이어짐, 아이디를 적고 다시 colon 으로 마무리
  * 속성 정의가 이어짐 (허용되는 문자는 backslash로 escape된 closing brace 혹은 closing brace를 escape하지 않는 어떤 문자라도 허용) 
  * 오른쪽 brace로 마침, 줄 마지막까지 공백 허용함
* 같은 reference 이름을 가진 ALD가 한개 이상이면 한 곳에서 모두 정의된 것처럼 간주된다.
* 다른 element에 속성을 붙이고자 할 때 inline attribute list (IAL)도 사용할 수 있다
  ```
  {: #id .cls1 .cls2} <!-- #id <=> id="id", .cls1 .cls2 <=> class="cls1 cls2" -->
  {: ref-name title="hallo you"} 
  {: ref-name class='.cls3' .cls4} 
  ```

{:color-style: style="background: black;"}
{:color-style: style="color: white;"}
{:text-style: style="font-weight: 800; text-decoration: underline;"}

| : Here's an Inline Attribute Lists example : ||||
| --- | --- | --- | --- |
| : : | : <div style="color: red;"> &lt; Normal HTML Block > </div>   : |||
| ^^      | Red {: .cls style="background: orange" }                    |||
| ^^ IALs | Green {: #id style="background: green; color: white" }      |||
| ^^      | Blue {: style="background: blue; color: white" }            |||
| ^^      | Black {: color-style text-style}                            |||

* [Block Inline Attribute Lists](https://kramdown.gettalong.org/syntax.html#block-ials) - 이곳에서 IAL에 대해 자세하게 배울 수 있다. 
  
 
### 2. MathJax Usage

* 예제

$ a*b = c^b $

$ 2^{\frac{n-1}{3}} $

$ \int\_a^b f(x)\,dx. $

* [원래 johngrib님 가이드](https://johngrib.github.io/wiki/mathjax-latex/)대로 `$`를 두 개씩 써서 감쌌는데..
* `jekyll-spaceship`을 사용하면서 ...
  * 두개씩 쓰면 그 줄은 그 수식만 존재하게 되며 
  * 하나씩만 쓰면 다른 글자와도 어울릴수 있게됨.
  * 원래부터 이런 것은 아니었음.
    * [이 문서](/wiki/re2-translation/#syntax)에서 `$`를 두 개써도 다른 글자와 어울릴 수 있었음
    * 해당 문서 히스토리를 보면 알겠지만 jekyll-spaceship 적용이후 틀려져서 하나짜리로 변경하게 됨
    * 왜 이렇게 되는지는 아직 알아보지 않음. 

* `$` 하나로 감싼 예제 

example 1) 이 수식 $ a*b = c^b $을 다른 문자열과 같이 써 본다.

* `$` 두 개로 감싼 예제 

example 2) 이 수식 $$ a*b = c^b $$을 다른 문자열과 같이 써 본다.

### 3. PlantUML Usage

* #platuml
* [PlantUML 설명서](https://plantuml.com/)

* plantuml 예제
 
  ```plantuml!
  Bob -> Alice : hello world
  ```
* startuml 예제
 
  @startuml
  Bob -> Alice : hello world
  @enduml


### 4. Mermaid Usage

* #mermaid
* [mermaid-js 문서 홈페이지](https://mermaid-js.github.io/mermaid/#/)
* mermaid 예제

  ```mermaid!
  pie title Pets adopted by volunteers
    "Dogs" : 386
    "Cats" : 85
    "Rats" : 35
  ```
* startmermaid 예제
 
  @startmermaid
  pie title Pets adopted by volunteers
    "Dogs" : 386
    "Cats" : 85
    "Rats" : 35
  @endmermaid
  
### 5. Media Usage

* two ways to embed a video/audio in your jekyll blog page
  * inline-style
    ```
    ![]({media-link})
    ```
  * Reference-style
    ```
    ![][{reference}]
    [{reference}]: {media-link}
    ```
  * sample
  
    ![](https://www.youtube.com/watch?v=Ptk_1Dc2iPY?width=800&height=500)
    ![](https://www.dailymotion.com/video/x7tfyq3?width=100%&height=400&autoplay=1)
    
* Youtube Usage 

  ![](https://www.youtube.com/watch?v=Ptk_1Dc2iPY)
  ![](//www.youtube.com/watch?v=Ptk_1Dc2iPY?width=800&height=500)


* Vimeo Usage
 
  ![](https://vimeo.com/263856289)
  ![](https://vimeo.com/263856289?width=500&height=320)

* DailyMotion Usage
 
  ![](https://www.dailymotion.com/video/x7tfyq3)
  ![](https://dai.ly/x7tgcev?width=100%&height=400)

* Spotify Usage
 
  ![](http://open.spotify.com/track/4Dg5moVCTqxAb7Wr8Dq2T5)  
 
* SoundCloud Usage

  ![](https://soundcloud.com/aviciiofficial/preview-avicii-vs-lenny)
 
* General Video Usage

  * 이곳에 있던 usage는 다 잘되는데 비디오가 자동플레이 되어 제거함 

* General Audio Usage

  ![](https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3)
  
  * <span style="background:pink;">Audio는 안되는 듯.. 아직은 필요없어서 왜 안되는지는 확인안해봄.</span>
 
 
### 6. Hybrid HTML with Markdown

* script block은 무시되는 듯함 HTML로 렌더링 되지 않음
* 일단 Usage 예제는 삭제함

### 7. Markdown Polyfill 

#### 7.1 Escape Ordered List

Normal:

1. List item Apple.
3. List item Banana.
10. List item Cafe.

Escaped:

\1. List item Apple.
\3. List item Banana.
\10. List item Cafe.

* <span style="background:pink;">이건 잘 안되고 있음</span>
* `<li>` tag 로 렌더링 되어야 하는데 그냥 `<p>` tag로 렌더링 됨 

### 8. Emoji Usage :+1:

* #emoji
* I give this plugin two :+1:!
 
<style>
.emoji-size img { font-size: 4rem;}
</style>

{: .emoji-size}
* I give this plugin two :+1:!

* emoji size 조절건
  * [jekyll/jemoji](https://github.com/jekyll/jemoji)를 바로 사용했을 때는 height, width가 고정으로 20 이었음
  * jekyll-spaceship에 포함된 emoji는 문맥에 따라 emoji size가 변경됨
    * 1단계 제목에서는 35x35 size, li 에서 사용하면 16x16으로 변경됨 
    * 일단 예전에 20으로 고정되었던 상황보다는 훨씬 나아짐  
  * max-width: 1em 으로 문맥에 따라 변경되는 가변크기 
    * 폰트 사이즈를 재 설정해주면 emoji size를 변경할 수 있음!!
    * [stackoverflow에 이 건으로 질문을 올리고 자문자답함](https://stackoverflow.com/a/65550809/9457247)...:sweat_smile:


### 9. Modifying Element Usage

* _config.yml에 jekyll-spaceship 옵션을 설정하여 element 설정을 바꿀 수 있는건데.. 아직은 사용할 계획이 없어서 Pass.


