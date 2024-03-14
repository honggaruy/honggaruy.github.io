---
layout  : wiki
title   : 위키 편집 안내서 
summary : 위키의 기본 작성법및 기능 추가 방법
date    : 2021-03-10 15:14:25 +0900
updated : 2024-03-15 01:38:47 +0900
tag     : liquid tags jekyll vim vimwiki pipe_character vertical_bar blockquote markdown kramdown
toc     : true
public  : true
parent  : [[Wiki-Setting-Category]] 
latex   : false
fontawe : true
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

### 일반적인 마크다운 문법

#### Markdown Basic Syntax

- 이 섹션에서는 ..
    -  Headings, Paragraphs, Line Breaks, Emphasis, Blockquotes, Lists, Code, Horizontal Rules, Links, Images, Escaping Characters, HTML을 다룬다
- 자세한 내용은 이 링크 참조 ▶️ [Markdown Basic Syntax, Makrdown Guide ](https://www.markdownguide.org/basic-syntax/) :star: :star: :star: :star: :star:
- blockquotes 작성시 주의사항
    - blockquotes 영역에 있는  한 paragraph 내에서 줄바꿈을 하고 싶을 경우 `<br>` 태그를 추가한다 
        - 윗 내용이 공통 문법인지는 확인 필요함!
    - 다크테마 적용이후 blockquote에 데코레이션을 추가했는데 3줄 이상으로 해야 렌더링에 문제가 없다.
        - 될 수있으면 3줄에 맞추자
        - 1줄일 경우 중간에 공백줄 넣고, 발췌 출처를 마지막 줄에 적고 [`last_line_author` 공용 클래스](#last-line-author)를 적용하면 3줄로 바로 가능!!
        - 이 내용으로 [johngrip님과 질의응답을 진행한 내용](https://github.com/johngrib/johngrib.github.io/discussions/351#discussioncomment-8741613)이 있다

#### Markdown Extend Syntax

- 이 섹션에서는 ..
    - Tables, Fenced Code Blocks, Footnotes, Heading IDS, Definition Lists, Strikethrough, Task Lists, Emoji, Highlight, Subscript, Superscript, Automatic URL Linking을 다룬다 
- 자세한 내용은 이 링크 참조 ▶️ [Markdown Extended Syntax, Makrdown Guide ](https://www.markdownguide.org/extended-syntax/) :star: :star: :star: :star: :star:
  - [Tables](https://www.markdownguide.org/extended-syntax/#tables) : 테이블 마크다운
  - [Fenced Code Blocks](https://www.markdownguide.org/extended-syntax/#fenced-code-blocks) : Basic의 Code Block과 문법이 다름 , 백틱 세개를 연속으로 구분함 
  - [Footnotes](https://www.markdownguide.org/extended-syntax/#footnotes) : 각주 달기
  - :star: :star: :star: [Heading IDs](https://www.markdownguide.org/extended-syntax/#heading-ids) : html에 id를 임의로 달수 있게 해줌. 현재 위키에서 가능함. 매우 유용할 듯 :star: :star: :star:
    ```
    ### My Great Heading {#custom-id}
    ```
  - [Definition Lists](https://www.markdownguide.org/extended-syntax/#definition-lists) : definition 태그및 목록을 달아줌. 현재 위키에서 동작함. dl, dt 태그에 대한 CSS 설정필요함 (안 이쁨)
  - [Strikethrough](https://www.markdownguide.org/extended-syntax/#strikethrough) : ~~취소줄 긋기~~ 
  - [Task Lists](https://www.markdownguide.org/extended-syntax/#task-lists) : 체크 박스 생성하기 
    - [x] 체크박스 넣기 
    - [ ] 안 넣기
  - Automatic URL Linking, Disable Automatic URL Linking은 안 되는듯 한데, 딱히 쓸 일도 없음

#### 기타 관련 자료

- [markdown-guide, readthdocs](https://markdown-guide.readthedocs.io/en/latest/index.html) :
- [Mardown Reference, typora.io](https://support.typora.io/Markdown-Reference/#blockquotes)

### kramdown 문법

* [kramdown Syntax, kramdown.gettalong.org](https://kramdown.gettalong.org/syntax.html) : jekyll 에서 사용하는 kramdown 문법 참고 사이트

## 기타 주목할만한 작성법

### 텍스트 highlighting 하기

* 참고링크 : [text highlight in markdown 질문의 답변, stackoverflow](https://stackoverflow.com/a/36039773/9457247)
* code block의 Syntax highlighting 과는 별개로, 문서의 특정 부분에 형광펜 칠한 것 처럼 할수 있는지 질문
* 몇 가지 방법 ( 본문을 [raw 보기](https://raw.githubusercontent.com/honggaruy/honggaruy.github.io/master/_wiki/wiki-update-guide.md) 로 확인할 것)
  * mark 태그로 <mark>highlighting</mark> 하기 (mark 태그 기본 컬러는 yellow) 
  * span 태그로 지정 컬러로  <span style="background-color: #00FFFF">hightlighting</span> 하기 
  * 근데 mark 태그도 지정 컬러로 <mark style="background-color: lightblue">highlighting</mark> 하기 가능함
   
#### 관련하여 Kramdown 표기법 ⭐⭐

* 참고링크 : [Inline Attributes, Kramdown](https://kramdown.gettalong.org/quickref.html#inline-attributes)
* 예제 1 : This is *red*{: style="color: red"}
  *  직접 인라인 스타일을 적용하는 방법
    
    ```md
    * This is *red*{: style="color: red"}
    ```

<style>
.reddish { color:#d50000; background:#fce8e6;}
</style>

* 예제 2 : This is `reddish`{: .reddish}. But this is `not reddish`
  * style을 별도로 정의하여 인라인으로 여러곳에 스타일을 적용할 때 좀 더 간편하게 할 수 있음 
    
    ```md
    <style>
    .reddish { color:#d5000; background:#fce8e6;}
    </style>
    * This is `reddish`{: .reddish}. But this is `not reddish`
    ```
    
  * 앞에서 style을 설정하면 라인전체에 적용되는데 `뒤에 바로 붙여서` style을 적용하면서 해당 태그만 style을 변경함

### blockquotes 마지막 줄에 author 표시 {#last-line-author}

#### 방법 1

- markdown 코드

```md
> You can't have everything. Where would you put it?
>
> --- Steven Wright ---
{:  .last_line_author}
```
- render된 markdown

> You can't have everything. Where would you put it?
>
> --- Steven Wright ---
{: .last_line_author}

- 위 와 같이 blockquote  바깥쪽에 `{. last_line_author}`를 붙이면
- blockquote의 마지막 줄을 right-align 한다
- `_base.scss`에 `blockquote.last_line_author > p:last-child` style을 추가하여 구현함

#### 방법 2

- 예전에 "방법 1"을 구현한 줄 모르고 다시 다른 방법으로 알아냄
- markdown 코드
    ```md
    > Mixins allow you to define styles that can be re-used throughout your stylesheet.<br>
    > They make it easy to avoid using non-semantic classes like `.float-left`, and to distribute collections of styles in libraries.
    >
    >{:style="text-align:right;"}
    > 발췌: [<Sass/At-Rules/@mixin and @include>](https://sass-lang.com/documentation/at-rules/mixin)
    ```
- render된 markdown
    > Mixins allow you to define styles that can be re-used throughout your stylesheet.<br>
    > They make it easy to avoid using non-semantic classes like `.float-left`, and to distribute collections of styles in libraries.
    >
    >{:style="text-align:right;"}
    > 발췌: [<Sass/At-Rules/@mixin and @include>](https://sass-lang.com/documentation/at-rules/mixin)
- 두가지 방법 모두 Kramdown의 `Inline Attribute Lists` syntax를 사용하는데 ..
    - `IAL`은 변경하고자하는 요소의 앞이나 뒤에 붙여 사용하며
    - `IAL`syntax의 앞쪽이 blank일 경우 바로 다음에 위치한 블럭에 적용된다.
    - 즉, `방법 2`에서 IAL을 "발췌:..."로 시작하는 줄 맨 끝에 붙일 경우 바로 앞 블럭인 `a tag`에 적용되어 "right-align" 효과가 적용되지 않는다. 앞쪽에 붙일 경우에는 `p tag`에 적용되어 효과가 나타난다
    - 이 모든 설명은 [Inline Attribute Lists, Kramdown document](https://kramdown.gettalong.org/syntax.html#block-ials) 에 나와 있다
        > A block IAL (or two or more block IALs) has to be put directly before or after the block-level element to which the attributes should be attached. If a block IAL is directly after and before a block-level element, it is applied to preceding element.  
 
### fenced code block 작성 방법 

#### fenced code block을 적용할 때의 언어 목록

* 다음과 같은 형태로 코드를 삽입하는 것을 [`fenced code block`](https://www.markdownguide.org/extended-syntax/#fenced-code-blocks)이라고 한다
  * 일반적인 [`code block`](https://www.markdownguide.org/basic-syntax/#code-blocks)과는 다르다

    ~~~
    ```언어이름
    해당 언어로 작성한 코드
    ```
    ~~~
    
  * 작성하다보면 언어이름을 뭘로 해야할까 고민하는 경우가 많은데 [Rouge wiki](https://github.com/rouge-ruby/rouge/wiki/List-of-supported-languages-and-lexers)를 보면 된다
    * 윗 줄 링크는 [Rouge가 지원하는 언어 목록, 기계인간 Johngrib](https://johngrib.github.io/wiki/rouge-supported-languages/)에서 발견했다
  * fenced code block 안에 3연속 backtick을 escaping하기 위해서는 바깥쪽 code block을 4연속 backtick 혹은 3연속 tilde(~)를 해준다.
    * [Johngrib님 개인위키글 원본 참조함](https://raw.githubusercontent.com/johngrib/johngrib.github.io/master/_wiki/rouge-supported-languages.md)
  * 인라인 에서 code 태그를 소환하는 `` backtick(`) `` 을 escaping 하기 위해서는 doubel backtick을 사용한다. [참조할 링크](https://www.markdownguide.org/basic-syntax/#escaping-backticks)

#### fenced code block 내에 double backslash를 어떻게 넣는가? {#double-backslash-in-fenced-code-block}

* 일반적인 markdown에서 double backslash(\\\\)는 backslash 4개를 연달아 쳐서 입력되지만 
  * `fenced code block`에서는 이 방법이 안 먹힌다
* 좀 dirty한 방법을 써야하는데.. **invissible Unicode character**중에 [Zero width space](https://www.fileformat.info/info/unicode/char/200B/index.htm)라는 문자가 있다. 
  * 보이지는 않지만 존재해서 `<double backslash> + <zero width space> + <double backslash>` 와 같은 형식으로 fenced code block에 넣으면 `doube backslash`를 넣을수 있다.
  * 아래 예제에서 확인하자 
    ```powershell
    $regexAddpath = [regex]::Escape($addPath)
    $arrPath = $env:Path -split ';' | Where-Object {$_ -notMatch "^$regexAddPath\\​\\?"}
    ```
  * 위의 아이디어는 [How do I format a backslash ..., META/StackExchange](https://meta.stackexchange.com/a/252893/959121)의 답변에서 참고했다
  * 위의 링크에서는 Unicode 입력시에 복사하는 방법을 권하고 있지만 Vim을 사용하는 나는 전혀 그럴필요가 없다
  * Vim에서 Unicode를 입력하는 builtin 방법
    * 삽입모드에서 <kbd>Ctrl</kbd> + <kbd>v</kbd> 를 눌러서 특수문자 입력모드로 진입하고, u~로 시작하는 유니코드 문자열을 입력한다
    * [unicode.vim](https://github.com/chrisbra/unicode.vim) 플러그인을 설치하여 위의 과정을 Visual하게 진행할 수 있다

#### code block에 liquid 코드를 넣고 싶다

- 자료 : [Display Liquid code snippets](https://michaelcurrin.github.io/dev-cheatsheets/cheatsheets/jekyll/code-blocks/liquid-code.html)
- liquid 코드를 코드 블럭안에 보여주고 싶은데 rendering 되어버려 난감하다
- [liquild의 raw tag](https://shopify.github.io/liquid/tags/template/#raw)를 사용한다
  - raw tag의 효과는 일시적으로 tag processing을 멈춘다
- 사용방법 예제는, 이 페이지의 아래쪽에 있는 [image에-Caption을-넣고-싶다](#image에-caption을-넣고-싶다) 섹션의 "사용방법" 내의 code block에서 이 방법을 사용하여 liquid code block을 보여줬다

### markdown 내용 접기 (Folding 하기)

<style>
  details > summary {
    background-color: DimGray;
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

### MathJax 수식 편집하기

#### MathJax 문법 참고링크

* [MathJax basic tutorial and quick reference, StackExchange / Mathematics](https://math.meta.stackexchange.com/questions/5020/mathjax-basic-tutorial-and-quick-reference)
* [Detexify](http://detexify.kirelabs.org/classify.html) : 그림을 그려서 문법을 확인

### vimwiki table 셀 안에 `|` delimiter character 넣기

* #vimwiki, #vim, #pipe_character, #vertical_bar
* 오리지널 블로그 포스팅은 [2020년 50주차 기록](/blog/2020/12/07/week-50th/#pipe-char-in-vimtable)
* stackExchange > VI and VIM 사이트에 물어봄
  * [Is it possible to put "│" character in a vimwiki table cell ?, stackExchange](https://vi.stackexchange.com/q/28308/27406)
  * 답변
    * [`vimwiki pipe character in table` 로 구글링](https://www.google.com/search?q=vimwiki+pipe+character+in+table)하면 아래 vimwik issue가 젤 첨에 나온다
    * [Escaping of pipes in table cells, vimwiki issue](https://github.com/vimwiki/vimwiki/issues/281)
    * 결론 : 현재는 `dirty solution`밖에 없다.
      * dirty solution : vim에서 <kbd>Ctrl</kbd> + <kbd>k</kbd>,<kbd>v</kbd>,<kbd>v</kbd> 하면 `vertical bar` symbol이 나옴
      * Escape할 수 있는 방법이 있어야 하는건 맞다 ( But yes, There should be a way )
  * 교훈
    * `|`이 pipe character라는 이름을 가지고 있다는 것을 몰랐다
    * 이름을 찾아서 구글링 해보면 대부분 나옴 
    * 이름을 모르겠으면 [wikipedia에서 `|`기호를 쳐보자](https://en.wikipedia.org/w/index.php?search=%7C&title=Special%3ASearch&go=Go&ns0=1). 추천 항목이 나옴
      * [Vertical bar, wikipedia](https://en.wikipedia.org/wiki/Vertical_bar)

### vimwiki table 셀 안에 `:` colon character 넣기 (2022-01-14 확인)

#### 문제 상황

* [관련 포스팅](/wiki/vim-basic/#context) 내의 table을 편집하던중 colon을 일반적으로 typing해 넣으면 table 셀 내에서 backtick으로 시작하는 강조표시가 먹지 않는 문제 확인

#### 해결책

* 위의 `pipe character` 문제와 동일하게 해결가능
* Step 1 : `:` 에 해당하는 digraph 확인
  * [Vim digraphs](https://devhints.io/vim-digraphs) 참조 - `:R` 
* Step 2 : insert-mode에서 <kbd>Ctrl</kbd> + <kbd>k</kbd> 누르고 <kbd>:</kbd>, <kbd>R</kbd> 누르면 colon 닮은 특수문자 찍히는 것을 확인함
* Step 3 : visual-mode에서 변경할 영역 선택
* Step 4 : visual-mode로 선택된 상태에서 :를 눌러 명령줄 모드 진입
* Step 5 : 명령줄 모드에 `:'<,'>`로 뜨며 visula-mode로 선택된 영역에서 치환할 준비 완료
* Step 6 : 위에서 자동완성된 `:'<,'>` 이후에 `s/:/<kbd>Ctlr</kbd>+<kbd>k</kbd> 누르고 <kbd>:</kbd>, <kbd>R</kbd>/gc`를 이어 typing
* Step 7 : 하나씩 검토하면서 바꿀것은 `y`, 바꾸지 않을 놈은 `n`을 선택하면됨
  * 컬럼 alignment시에 `:` 문자를 사용하므로 해당 문자는 바꾸지 말아야 한다 

### image에 style attribue 설정하기

#### image에 IAL로 background-color를 설정할 수 있는가?

- [kramdwon Sytax의 Images 항목](https://kramdown.gettalong.org/syntax.html#images)에 가보면 다음과 같은 IAL 사용례가 나온다
  ```md
  Here is an inline ![smiley](smiley.png}{:height="36px"}
  ```
  - height만 지정하면 width는 aspect ratio에 맞게 설정된다
  - 그런데 여기에 혹시 "background-color"도 설정할 수 있을까?
  - 그림 배경이 투명일 경우, 당연히 `background-color`도 볼 수 있다
- 그런데 여기서 아래와 같이 설정하면 반영되지 않는다
    ```md
    Here is an inline ![smiley](smiley.png}{:height="36px" background-color="red"}
    ```
  - [HTML img Tag](https://www.w3schools.com/tags/tag_img.asp)의 attributes에는 `background-color` attributes가 없기 때문이다
  - 그럼 어떻게 적용해야 하나?

#### 답은 Global Attributes을 사용하는 것이다

- [HTML img Tag](https://www.w3schools.com/tags/tag_img.asp) 페이지에서 "Global Attributes" 섹션을 보면 img 태그는 Global Attributes 도 지원한다고 되어있다
- [HTML Globa Attirbutes](https://www.w3schools.com/tags/ref_standardattributes.asp) 페이지에는 `style` attributes이 있다
- `style`의 값으로 `background-color`를 설정해 줄수 있다
- 즉, `background-color`는 attributes 이 아니라 `style` attributes의 설정값인 것이다
- <kbd>해결책</kbd>{:style="color:yellow;background-color:red"} : 그러므로 다음과 같이 설정하면 된다
  ```md
  Here is an inline ![smiley](smiley.png}{:height="36px" style="background-color:red"}
  ```
  
     

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
    * 다음은 블로그 작성 날짜를 `yyyy/mm/dd/`형태로 붙이고, 날짜를 제외한 제목(예, `week-38th`), 섹션 제목(예,`#meet-puppet`)을 차례로 붙인다 
    * 실제 사례 : [20년 48주차 블로그 포스팅#meet-puppeteer](/blog/2020/11/23/week-48th/#meet-puppeteer--2020-11-25)

# 기존 구조 분석

## wiki 신규 페이지 작성시 템플릿은 어느곳에 구현되어 있나 ?

* 현재 신규 wiki 페이지를 만들 경우 다음과 같은 템플릿이 자동으로 작성된다

  ```md
  ---
  layout  : wiki
  title   : 
  ...
  ---
  
  * TOC
  {:toc}
  
  #
  ```

* 이 기능은 [Johngrib님이 vimrc에 추가하라고 알려준 vim 코드](https://johngrib.github.io/wiki/vimwiki/#vimscript-서포트-코드)로 구현된다
* 내 환경에서는 [`.vim/after/ftplugin/vimwiki/vimwikiauto.vim`](https://github.com/honggaruy/dotfiles/blob/master/.vim/after/ftplugin/vimwiki/vimwikiauto.vim)에 작성되어 있다 

# 신규 기능 구현

## tag 페이지에 stackoverflow tag 정보도 같이 넣기 (개선 사항)

* tag 페이지에 같은 태그로 검색한 stackoverflow의 결과도 넣고 싶다.
* 그럼 일단 axios를 써야 하는데.. 이걸 참조 [JavaScript: using axios in the browser to make API requests](https://gabrieleromanato.name/javascript-using-axios-in-the-browser-to-make-api-requests)
* 구현 후 실제 반영한 [commit](https://github.com/honggaruy/honggaruy.github.io/commit/ae64485c090a045baf1d10142741a246d4a39c96)

### insertAfter 기능 구현하기

* jQuery에서는 기본적으로 제공하는 기능이라서 jQuery를 사용하면 간단하지만 ... 딱 이 기능 하나 쓰자고 jQuery 도입하기 싫을 때
* 참조할 링크 : [자바스크립트 insertAfter() 구현하기](https://blog.asamaru.net/2016/12/06/how-to-do-insertafter-in-javascript/) 

### StackExchange API 사용법

* 원문 : [StackExchange API v2.2](https://api.stackexchange.com/docs)
* 파라메터 이름이 복수형 이름(이름뒤에 ~s가 붙는식)이면 복수의 인자를 사용할수 있다.
  * 참조 : [vectorized requests](https://api.stackexchange.com/docs/vectors)
  * 예를들어 [/tags/{tags}/wikis](https://api.stackexchange.com/docs/wikis-by-tags) 을 사용한다고 했을 때..
    * {tags} 가 20개의 tag를 한 번의 request로 받아올 수 있다고 설명되어있다.
    * 복수의 tag를 조사한다면 `tags` 에 `javascript;python` 으로 `;` 구분자를 넣어 구분하는식이다. 
      
* anonymous quota가 있어 몇번하니까 bad request 에러남
* 등록하고 써야함 : [내 app 링크](https://stackapps.com/apps/oauth/view/19796)
* 대충 등록하면 위의 app 링크 페이지로 리다이렉트 되는데 여기에서 `key`를 요청하는 파라메터중 하나로 넣으면 quota가 풀림.

### 태그 편집시 참고할 사항

* 중요한 사항임. (:star: :star2: )
 
#### 에러 상황

* `stackoverflow` 태그 중에서는 태그 가운데 `.`이 들어가는 태그가 종종 있다.
  * 예: [`vue.js`](https://stackoverflow.com/questions/tagged/vue.js) , [`vuetify.js`](https://stackoverflow.com/questions/tagged/vuetify.js)
* 가운데 `.`이 들어가는 태그를 사용할 경우 태그페이지에서 태그를 클릭할 때 아래에 위키 링크가 나타나지 않는다.
  * 디버그 창을 보면 뭔가 에러가 나고 있다.

#### 해결책

* 위와 같이 `vue.js`를 태그로 사용하고 싶으면 대신 `vue_js`를 사용하라 ( :star: :star2: )
* 위키내의 태그링크도 문제가 없으며, `stackoverflow`의 태그 페이지도 잘 연결된다

#### 태그 변경후 수동 확인 방법

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

### 추가하고 싶은 기능 (2021-05-20)

* 현재 default로 StackOverflow 의 태그만 가져오고 있는데..
* [vi.stackexchange.com/tags](https://vi.stackexchange.com/tags)에 등록된 태그들도 있다.
* 요것도 하고 싶은데..
  * default로 SO 것 먼저하고 SE 것을 선택할 수 있도록 할지..
  * 아님 자동으로 순회해서 갯수가 제일 많은 것으로 선택하도록 할지..
  * 고민중인데.. 아무거나 먼저 구현하고 다른것도 구현해보자 

## 블로그 포스트에 이전 포스트, 다음 포스트로 가는 링크를 넣고 싶다.

### 필요성

* 2021년 현재 블로그는 주차별로 기록하고 있다.
* 어느 시점에 어떤 작업을 했는지 정확히 기억이 안날 때 앞 뒤로 검색해보면서 뒤져야 한다.
* 목록으로 다시 나갔다가 콘텐츠로 돌아오기는 귀찮다.
* 포스팅 콘텐츠 페이지에서 이전과 이후 포스팅으로 연결해주는 링크가 필요했다.

### 구글링 

* [Jekyll - how to link to next/previous post on your blog](http://david.elbe.me/jekyll/2015/06/20/how-to-link-to-next-and-previous-post-with-jekyll.html)
  * 찾았다. 거의 그대로 소스를 복사했다.
    * 댓글을 보면 CSS관련하여 다른 의견이 많던데 나중에 확인해볼것 
  * 제목을 이전과 다음링크 사이에 위치하도록 CSS를 추가했다.
* [How to Link to Next and previous Posts for Same Blog Category](https://talk.jekyllrb.com/t/how-to-link-to-next-and-previous-posts-for-same-blog-category/629)
  * 위 링크를 찾게된 소스이다. 
* [page.previous, page.next 문서가 없다는 이슈에 달린 답글 참조](https://github.com/jekyll/jekyll/issues/1545)
  * 초반에 달린 답글의 링크는 2021년 5월 현재 없음
  * [Jekyll Variables 에 있긴 있음](https://jekyllrb.com/docs/variables/)

### 반영

* [반영한 commit](https://github.com/honggaruy/honggaruy.github.io/commit/fcfde15c600a2258b9dc445b96fbb01e37fa3cf4)


## 개인위키에서 font-awesome 아이콘을 사용하고 싶다

### 적용방법 ( 2022-06-13 현재 )

* `root/_includes/header.html` 변경사항 - 아래 코드 추가
  ```html
  { % if page.fontawe and page.fontawe == true % }
      <!-- https://fontawesome.com/kits/a86e231b11/use 참고 -->
      <script src="https://kit.fontawesome.com/<blabla>.js" crossorigin="anonymous"></script>
  { % endif % }
  ```
* 위 코드 예제 작성시 liquid 명령으로 인식 되지 않도록 `{` 와 `%` 사이에 space를 고의적으로 삽입함
* 혹시 페이지 로딩이 느려질까봐 필요한 페이지만 추가하도록 구현함

### 사용방법 ( 2022-06-13 현재 )

* 기본적인 방법은 font-awesome 사이트의 [Get Started](https://fontawesome.com/docs/web/setup/get-started) 에 나온대로 따라하면 된다
* 개인위키 특정 페이지에 아이콘을 넣고 싶으면
  * Step 1. 해당 페이지의 front matter에 `fontawe : true` 추가
  * Step 2. Font Awesome의 [검색 페이지](https://fontawesome.com/search) 에서 사용하려는 아이콘을 찾아 html코드를 가져온다
    * [업체 브랜드 로고 모음](https://fontawesome.com/search?o=r&f=brands)
  * Step 3. 원하는 위치에 <i class="fa-solid fa-font-awesome fa-xl fa-flip" style="--fa-animation-duration: 3s;"></i> 이와 같이 붙여넣는다
    * 간단하게 Customize 할 수 있다 ( 사이즈 조절, 애니메이션 적용등등 ) 
* 특이 사항
  * Version 6.xx 적용
  * 개인적인 CDN을 사용할수 있다 - 현재 본 위키용 폰트는 [이것](https://fontawesome.com/kits/a86e231b11/settings#domains)을 사용중이다
  * Pro Icon은 지원하지 않는다

## image에 Caption을 넣고 싶다

### 자료조사

- [Using an image caption in Markdown Jekyll, SO](https://stackoverflow.com/q/19331362/9457247)에 많은 답변이 있는데..
  - 난 plugin 사용에 큰 거부감은 없어서 일단 [이 답변](https://stackoverflow.com/a/51682829/9457247) 방법을 사용했다
- 선택한 방법인 [jekyll-fiigure](https://github.com/paulrobertlloyd/jekyll-figure) 홈페이지에 가면 사용법을 알 수 있다
  - 추가적으로 [Figure Styling 방법](https://www.w3.org/Style/Examples/007/figures.en.html)도 알아둘 필요가 있다

### 적용방법 ( 2022-12-29 현재 )

- [jeklly-figure 홈페이지](https://github.com/paulrobertlloyd/jekyll-figure)에 나온대로 ...
  1. Gemfile 파일에 `gem 'jekyll-figure'`를 넣고 `bundle`을 실행했다
  2. 아래 문구를 `_config.yml`에 삽입했다
   
    ```yml
    plugins:
      - jekyll-figure
    ```

### 사용방법 ( 2022-12-29 현재 )

- 일반적인 사용 방법은 다음과 같다

  ```liquid
  {% raw %}
  {% figure [caption:"Caption (markdown)"] [class:"class1 class2"] %}
  Figure content (markdown)
  {% endfigure %}
  {% endraw %}
  ```

  - 위 코드에서 `[ ]` 는 옵션으로 생략가능하다
  - 위 코드에서 `(markdown)`은 markdown 변환이 동작한다는 말이다
    - 예를 들어, caption 에 "링크 markdown"을 넣어도 "링크"로 변환된다 



# ToDos

## github 페이지에 private 공간 만들기? 

* 아직 해본건 없지만 일단 자료 조사한 건 적어보자
* [Types of GitHub Pages sites, GitHub Docs](https://docs.github.com/en/pages/getting-started-with-github-pages/about-github-pages#types-of-github-pages-sites)
* [Github Pages and authentication, we are not that far](https://rmannibucau.metawerx.net/github-pages-authentication.html)
* [Jekyll Auth](https://github.com/benbalter/jekyll-auth)
* [Is it possible to create a login system for GitHub pages?](https://www.quora.com/Is-it-possible-to-create-a-login-system-for-GitHub-pages)
* [How do I provide authntication on GitHub Pages?, ASK.CYBERINFRASTRUCTURE](https://ask.cyberinfrastructure.org/t/how-do-i-provide-authentication-on-github-pages/950)
