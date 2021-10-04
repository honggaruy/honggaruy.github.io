---
layout  : wiki
title   : 위키 편집 안내서 
summary : 위키의 기본 작성법및 기능 추가 방법
date    : 2021-03-10 15:14:25 +0900
updated : 2021-10-03 02:28:54 +0900
tag     : liquid tags jekyll 
toc     : true
public  : true
parent  : [[Wiki-Setting-Category]] 
latex   : false
---
* TOC
{:toc}

# 일단 시작

* 최상단 폴더의 index.html 부터 분석 시작
* 사용중인 템플릿팅 언어는 jekyll에서 채용한 [Liquid](https://shopify.github.io/liquid/)
* index.html 가장 아랫쪽에 `include createLink.html`
  * vimwiki 링크를 html <a> 태그로 보여주는 javascript 코드
  * 이 [include 문법](https://jekyllrb.com/docs/includes/)을 사용
  * 이 내용은 [johngrib님 위키](https://johngrib.github.io/wiki/my-wiki/#test형식의-vimwiki-링크를-html-a-태그로-보여준다)에 잘 설명 되어있다

# 기본 편집 방법

## 마크다운 작성법 가이드 모음 {#guide-collection}

* [Markdown Basic Syntax, Makrdown Guide ](https://www.markdownguide.org/basic-syntax/) :star: :star: :star: :star: :star:
* [Markdown Extended Syntax, Makrdown Guide ](https://www.markdownguide.org/extended-syntax/) :star: :star: :star: :star: :star:
  * [Tables](https://www.markdownguide.org/extended-syntax/#tables) : 테이블 마크다운
  * [Fenced Code Blocks](https://www.markdownguide.org/extended-syntax/#fenced-code-blocks) : Basic의 Code Block과 문법이 다름 , 백틱 세개를 연속으로 구분함 
  * [Footnotes](https://www.markdownguide.org/extended-syntax/#footnotes) : 각주 달기
  * :star: :star: :star: [Heading IDs](https://www.markdownguide.org/extended-syntax/#heading-ids) : html에 id를 임의로 달수 있게 해줌. 현재 위키에서 가능함. 매우 유용할 듯 :star: :star: :star:
  * [Definition Lists](https://www.markdownguide.org/extended-syntax/#definition-lists) : definition 태그및 목록을 달아줌. 현재 위키에서 동작함. dl, dt 태그에 대한 CSS 설정필요함 (안 이쁨)
  * [Strikethrough](https://www.markdownguide.org/extended-syntax/#strikethrough) : ~~취소줄 긋기~~ 
  * [Task Lists](https://www.markdownguide.org/extended-syntax/#task-lists) : 체크 박스 생성하기 
    - [x] 체크박스 넣기 
    - [ ] 안 넣기
  * Automatic URL Linking, Disable Automatic URL Linking은 안 되는듯 한데, 딱히 쓸 일도 없음
* [markdown-guide, readthdocs](https://markdown-guide.readthedocs.io/en/latest/index.html) :
* [Mardown Reference, typora.io](https://support.typora.io/Markdown-Reference/#blockquotes)

## 기타 작성법

### 텍스트 highlighting 하기

* 참고링크 : [text highlight in markdown 질문의 답변, stackoverflow](https://stackoverflow.com/a/36039773/9457247)
* code block의 Syntax highlighting 과는 별개로, 문서의 특정 부분에 형광펜 칠한 것 처럼 할수 있는지 질문
* 몇 가지 방법 ( 본문을 [raw 보기](https://raw.githubusercontent.com/honggaruy/honggaruy.github.io/master/_wiki/wiki-update-guide.md) 로 확인할 것)
  * mark 태그로 <mark>highlighting</mark> 하기 (mark 태그 기본 컬러는 yellow) 
  * span 태그로 지정 컬러로  <span style="background-color: #00FFFF">hightlighting</span> 하기 
  * 근데 mark 태그도 지정 컬러로 <mark style="background-color: lightblue">highlighting</mark> 하기 가능함

### markdown 내용 접기 (Folding 하기)

<style>
  details > summary {
    background-color: #ddd;
    border: none;
    box-shadow: 3px 3px 4px black;
    cursor: pointer;
  }
</style>
<details open markdown="1">
  <summary> 직접 raw 코드를 보고 참고할 수 있도록 본 내용 자체에 폴딩 하기를 걸어둠. 내용을 접으려면 Click!! </summary>

* 옛날에 작성한 내용중 더 이상 유효하지 않거나 , 오래된 내용이지만 제거하기는 아까울 때가 있다
* 이 때 해당 내용을 잠시 접어 둘 수 있다면 좋을 것이다.
* 찾아보니 [details html 태그, mdn](https://developer.mozilla.org/ko/docs/Web/HTML/Element/details) 가 있었다
* 그런데 html 태그도 사용하면서 마크다운도 같이 사용할 수 있을까?

#### 참고한 사이트

* [How can I fold content in Github markdown?](https://stackoverflow.com/a/52215506) : 여기서 `details` 태그와 `summary` 태그를 사용하면 된다는 것을 캐치
* [Kramdown Systax , html-blocks](https://kramdown.gettalong.org/syntax.html#html-blocks) : `details` 태그에 `markdown` attibute을 `1`로 설정하면 내부 마크다운이 유지됨 확인
* [Two Issues Styling the Details Element and How to Solve Them, CSS-Tricks](https://css-tricks.com/two-issues-styling-the-details-element-and-how-to-solve-them/) : detail 태그 사용시 고려해야할 style 관련 설명
* [details element, mdn](https://developer.mozilla.org/ko/docs/Web/HTML/Element/details#외형_바꾸기) : `details` 태그 적용시 고려해볼만한 CSS Style 소개

#### 실제 적용 사례

* 실제 적용 페이지 : [로컬에서 구글 Apps Script 개발하기의 Amit 방식을 Folding 함](/wiki/apps-script-starter#amit-agarwal-way)
* Amit 방식을 현재는 사용하지 않아서 제거할까 하다가 정리한게 아까워서 접어두기로 함

#### 적용 방식 톺아보기

* 직접 참고 할수 있도록 본 내용 자체에 접기 기술을 사용해보았다
* 적용 포인트
  * folding 적용할 부분을 `<details>`, `</details>` 태그로 둘러싼다
  * 셋트로 `<summary>` 태그를 사용하는데 접히는 부분의 설명을 적어넣을 수 있다 (이 부분은 안 접힌다)
    * `<summary>` 태그는 Folding을 적용했다는 것을 인지하도록 눈에 띄게 styling 하는 것이 좋다
    * 여기에 꼭 적용해야할 style중 하나는 `cursor` 속성이다 ( `pointer`를 적용하여 cursor를 손가락으로 변환시킨다) 
  * detail 태그에 markdown="1" attribute을 적용해야 한다 (kramdown 문법)
    * 적용하지 않거나 markdown="0"으로 적용하면 detail 태그로 둘러싼 부분의 markdown 파싱이 적용되지 않는다
  * detail 태그의 default 상태는 접혀 있는 상태이지만 열림을 default 상태로 하려면 `open` attribute을 추가한다
    * 현재 이곳에 적용중
  
</details>

## 사이트내 문서에 링크하는 방법

* 링크는 `[링크 문구](링크 주소)` 형식인데 `링크 주소`의 문자열에 따라 내부 링크인지 외부링크인지가 구분된다
  * 외부 링크는 `링크 주소`가 "http..."로 시작한다
  * 내부 링크는 `같은 페이지`인지 `다른 내부 문서`인지로 구분된다
* `같은 페이지`내에서의 참조
  * 제목은 `#<제목문자열>`으로 참조가 가능하다.
  * 아래 마크다운 코드는 현재 페이지에서 가장 첫번째 제목인 `일단 시작` 세션에 링크된다.
    ```markdown
    [일단 시작](#일단-시작)
    ```
  * 스페이스는 보통 가운데 대쉬로 변환된다.
  * 물론, 위에서 소개한 [`Heding-ID`](#guide-collection)를 써도 된다  ◀ 셀프 예제
* `다른 내부 문서` 참조
  * `wiki 참조`와 `blog 참조`가 조금 다르다
  * `wiki 참조`의 `링크 주소`는 `/wiki/`로 시작한다
    * 다음은 해당 페이지의 영문 파일명, 섹션 제목을 붙이면 된다 (영문 제목명 다음 `.md`는 붇이지 않는다)
    * 실제 사례 : [로컬에서 구글 Apps Script 개발하기의 Amit 방식 링크](/wiki/apps-script-starter#amit-agarwal-way)
  * `blog 참조`의 `링크 주소`는 `/blog/`로 시작한다
    * 다음은 블로그 작성 날짜를 `yyyy/mm/dd/`형태로 붙이고, 영문제목, 섹션 제목을 차례로 붙인다 
    * 실제 사례 : [20년 48주차 블로그 포스팅#meet-puppeteer](/blog/2020/11/23/week-48th/#meet-puppeteer--2020-11-25)

# tag 페이지에 stackoverflow tag 정보도 같이 넣기 (개선 사항)

* tag 페이지에 같은 태그로 검색한 stackoverflow의 결과도 넣고 싶다.
* 그럼 일단 axios를 써야 하는데.. 이걸 참조 [JavaScript: using axios in the browser to make API requests](https://gabrieleromanato.name/javascript-using-axios-in-the-browser-to-make-api-requests)
* 구현 후 실제 반영한 [commit](https://github.com/honggaruy/honggaruy.github.io/commit/ae64485c090a045baf1d10142741a246d4a39c96)

## insertAfter 기능 구현하기

* jQuery에서는 기본적으로 제공하는 기능이라서 jQuery를 사용하면 간단하지만 ... 딱 이 기능 하나 쓰자고 jQuery 도입하기 싫을 때
* 참조할 링크 : [자바스크립트 insertAfter() 구현하기](https://blog.asamaru.net/2016/12/06/how-to-do-insertafter-in-javascript/) 

## StackExchange API 사용법

* 원문 : [StackExchange API v2.2](https://api.stackexchange.com/docs)
* 파라메터 이름이 복수형 이름(이름뒤에 ~s가 붙는식)이면 복수의 인자를 사용할수 있다.
  * 참조 : [vectorized requests](https://api.stackexchange.com/docs/vectors)
  * 예를들어 [/tags/{tags}/wikis](https://api.stackexchange.com/docs/wikis-by-tags) 을 사용한다고 했을 때..
    * {tags} 가 20개의 tag를 한 번의 request로 받아올 수 있다고 설명되어있다.
    * 복수의 tag를 조사한다면 `tags` 에 `javascript;python` 으로 `;` 구분자를 넣어 구분하는식이다. 
      
* anonymous quota가 있어 몇번하니까 bad request 에러남
* 등록하고 써야함 : [내 app 링크](https://stackapps.com/apps/oauth/view/19796)
* 대충 등록하면 위의 app 링크 페이지로 리다이렉트 되는데 여기에서 `key`를 요청하는 파라메터중 하나로 넣으면 quota가 풀림.

## 태그 편집시 참고할 사항

* 중요한 사항임. (:star: :star2: )
 
### 에러 상황

* `stackoverflow` 태그 중에서는 태그 가운데 `.`이 들어가는 태그가 종종 있다.
  * 예: [`vue.js`](https://stackoverflow.com/questions/tagged/vue.js) , [`vuetify.js`](https://stackoverflow.com/questions/tagged/vuetify.js)
* 가운데 `.`이 들어가는 태그를 사용할 경우 태그페이지에서 태그를 클릭할 때 아래에 위키 링크가 나타나지 않는다.
  * 디버그 창을 보면 뭔가 에러가 나고 있다.

### 해결책

* 위와 같이 `vue.js`를 태그로 사용하고 싶으면 대신 `vue_js`를 사용하라 ( :star: :star2: )
* 위키내의 태그링크도 문제가 없으며, `stackoverflow`의 태그 페이지도 잘 연결된다

### 태그 변경후 수동 확인 방법

* 매번 필요할 때 마다 까먹어서 다시 적는다..
* 태그 변경 사항은 `./generateData.js`를 `git hook`을 걸어서 `commit`시에 자동으로 반영되도록 하고 있다.
* 수동으로 확인하려면 다음과 같이 command line에서 입력한다.
  ```sh
  > node ./generateData.js
  tagMap saved.
  pageMap saved.
  tagList saved.
  ```
* `_data/tagLists.yml`, `_data/tagMap.yml`, `tag.html`이 편집된다.
* 다시 되돌리려면 `git restore` 명령을 사용한다.

## 추가하고 싶은 기능 (2021-05-20)

* 현재 default로 StackExcahgne 의 태그만 가져오고 있는데..
* [vi.stackexchange.com/tags](https://vi.stackexchange.com/tags)에 등록된 태그들도 있다.
* 요것도 하고 싶은데..
  * default로 SO 것 먼저하고 SE 것을 선택할 수 있도록 할지..
  * 아님 자동으로 순회해서 갯수가 제일 많은 것으로 선택하도록 할지..
  * 고민중인데.. 아무거나 먼저 구현하고 다른것도 구현해보자 

# 블로그 포스트에 이전 포스트, 다음 포스트로 가는 링크를 넣고 싶다.

## 필요성

* 2021년 현재 블로그는 주차별로 기록하고 있다.
* 어느 시점에 어떤 작업을 했는지 정확히 기억이 안날 때 앞 뒤로 검색해보면서 뒤져야 한다.
* 목록으로 다시 나갔다가 콘텐츠로 돌아오기는 귀찮다.
* 포스팅 콘텐츠 페이지에서 이전과 이후 포스팅으로 연결해주는 링크가 필요했다.

## 구글링 

* [Jekyll - how to link to next/previous post on your blog](http://david.elbe.me/jekyll/2015/06/20/how-to-link-to-next-and-previous-post-with-jekyll.html)
  * 찾았다. 거의 그대로 소스를 복사했다.
    * 댓글을 보면 CSS관련하여 다른 의견이 많던데 나중에 확인해볼것 
  * 제목을 이전과 다음링크 사이에 위치하도록 CSS를 추가했다.
* [How to Link to Next and previous Posts for Same Blog Category](https://talk.jekyllrb.com/t/how-to-link-to-next-and-previous-posts-for-same-blog-category/629)
  * 위 링크를 찾게된 소스이다. 
* [page.previous, page.next 문서가 없다는 이슈에 달린 답글 참조](https://github.com/jekyll/jekyll/issues/1545)
  * 초반에 달린 답글의 링크는 2021년 5월 현재 없음
  * [Jekyll Variables 에 있긴 있음](https://jekyllrb.com/docs/variables/)

## 반영

* [반영한 commit](https://github.com/honggaruy/honggaruy.github.io/commit/fcfde15c600a2258b9dc445b96fbb01e37fa3cf4)

# ToDos

## github 페이지에 private 공간 만들기? 

* 아직 해본건 없지만 일단 자료 조사한 건 적어보자
* [Types of GitHub Pages sites, GitHub Docs](https://docs.github.com/en/pages/getting-started-with-github-pages/about-github-pages#types-of-github-pages-sites)
* [Github Pages and authentication, we are not that far](https://rmannibucau.metawerx.net/github-pages-authentication.html)
* [Jekyll Auth](https://github.com/benbalter/jekyll-auth)
* [Is it possible to create a login system for GitHub pages?](https://www.quora.com/Is-it-possible-to-create-a-login-system-for-GitHub-pages)
* [How do I provide authntication on GitHub Pages?, ASK.CYBERINFRASTRUCTURE](https://ask.cyberinfrastructure.org/t/how-do-i-provide-authentication-on-github-pages/950)
