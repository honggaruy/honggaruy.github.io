---
layout  : wiki
title   : IT 문서에서 자주쓰이는 idioms 모음
summary : 주의 - 다소 주관적인 선정 기준 
date    : 2022-10-08 20:20:41 +0900
updated : 2024-03-11 15:54:51 +0900
tag     : idiom english 영어 
toc     : true
public  : true
parent  : [[Term-Category]] 
latex   : false
fontawe : false
---
* TOC
{:toc}

# `a system whereby` or `an arrangement whereby`

## 의미

- whereby는 `conjunction`과 `adverb`의 두가지 용법이 있다, [Merriam-Webster](https://www.merriam-webster.com/dictionary/whereby)
  - abverb 용법은 obsolet(고어)로 더이상 쓰이지 않는다 ( 아래 성서예문)
  - conjuction은 `by, through, or in accordance with which`의 뜻이 있다
- [다음 사전의 whereby 예문](https://dic.daum.net/word/view.do?wordid=ekw000185098&q=whereby) 에 따르면 whereby의 선행사로 system, arrangement가 주로 쓰인다고 한다
  - 그러므로 해석은 `... 하는 바의 시스템(협정)` `그 시스템(협정)에 의하여 whereby절의 내용이 수행된다` 정도로 해석하면된다

## 예문

- `Cache invalidation` is a process in a computer system whereby entries in a cache are replaced or removed. - [Cache invalidation, wikipedia](https://en.wikipedia.org/wiki/Cache_invalidation)
- an arrangement whereby that company will buy more imports - (다음사전 whereby 예문)
- Whereby shall I know this? <성서, 누가복음 1:18> - (다음사전 whereby 예문)

# semantic classes vs non-semantic classes

## 아래 문장에서 `non-semantic`의 의미는 ?

> They make it easy to avoid using non-semantic classes like `.float-left`, and to distribute collections of styles in libraries. [<Sass/At-Rules/@mixin and @include>](https://sass-lang.com/documentation/at-rules/mixin)

## 의미

- 발췌: [Semantic vs non-semantic, MaintainableCSS](https://maintainablecss.com/chapters/semantics/)
- Semantic vs non-semantic
  ```html
  <!--- non semantic --->
  <div class="red pull-left pb3">
  <div class="grid row">
  <div class="col-xs-4">
  <div class="col-xs-4">
  
  <!--- semantic -->
  <div class="basket">
  <div class="product">
  <div class="searchResults">
  ```
- Non-semantic classes don't convey what an elemnt represents. 
  - At most they give you an idea of what an element looks like. 
  - Atomic, visual, behavioural and utility classes are all forms of non-semantic classes.
- Semantic classes don't convey their styles, but that's fine--that's what CSS is for.
  - Semantic classes mean something to HTML, CSS, Javascript and automated functional tests.

# At-rules ?

- 발췌 : https://developer.mozilla.org/en-US/docs/Web/CSS/At-rule
- `At-rules` are [CSS statements](https://developer.mozilla.org/en-US/docs/Web/CSS/Syntax#css_statements) that instruct CSS how to behave.
  - They begin with an at sign,`'@'`(U+0040 COMMERCIAL AT)
    -,followed by an identifier and includes everything up to the next semicolon
    -,`';'`(U+003B SEMICOLON), or the next [CSS block](https://developer.mozilla.org/en-US/docs/Web/CSS/Syntax#css_declaration_blocks), whichever comes first.

# What does "rc" mean in dot files ?

## 발단

- vim에서 `:help startup` 문서 에서 `3. Execute Ex commands...` 문단에서
  - `vimrc exrc`의 keyword를 가진 문장이 나오는데
- 둘다 rc 접미사를 가지는 것을 보고 의문점이 생겼다

## 내용

- 발췌1: [What does "rc" mean in dot files, SO](https://stackoverflow.com/q/11030552/9457247)
- 발췌2: [Configruation file, wikipedia](https://en.wikipedia.org/wiki/Configuration_file)
- 어러가지 설이 있다
  - run commands
  - resource control
  - run control
  - runtime configuration
- 그리고 이 [문서](http://www.catb.org/~esr/writings/taoup/html/ch10s03.html)를 찾았다
  > The 'rc' suffix goes back to Unix's grandparent, CTSS, It had a command-script feature called "runcom". Early Unixes used 'rc' for the name of the operationg system's boot script, as a tribute to CTSS runcom. 

# the understatement of the year/decade/century

- `세기의 천재`라고 할때 세기는 100년을 의미하는데 여기서는 `세기의 절제된표현`이라는 의미이다 
- 관련 사전 링크
    - [understatement, Cambridge Dictionary](https://dictionary.cambridge.org/us/dictionary/english/understatement)
    - 이 곳의 예문
        - "it didn't go well?" "That's the understantement of the centry. It was a disaster."

## 사용례

- [The Rust I Wanted Had No Future](https://graydon2.dreamwidth.org/307291.html) 의 첫번째 문장
  > In a recent podcast about Rust leadership, the BDFL question came up again and Jermy Soller said (in <mark style="font-size:0.83em; background-color:lightblue;">the understatement of the centruy</mark>) that "I believe Graydon would have said no to"

# 관련 글감

- [10 Useful Idioms about Technology, linkedin.com](https://www.linkedin.com/pulse/10-useful-idioms-technology-deborah-rhoden/)
