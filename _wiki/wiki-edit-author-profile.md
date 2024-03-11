---
layout  : wiki
title   : 위키에 저자 프로필 작성하기 
summary : 이미지 + side text 배치 방법 
date    : 2023-06-02 18:21:54 +0900
updated : 2024-01-30 01:11:03 +0900
tag     : wiki편집 
toc     : true
public  : true
parent  : [[Wiki-Setting-Category]] 
latex   : false
fontawe : true
---
* TOC
{:toc}

# 발단
- 책읽고 정리할 때 저자 프로필도 작성하면 좋겠다고 생각했다
- 사용하다 보니 여러 곳에서 인물 프로필도 작성할 필요가 생겼다
- 인물 프로필 섹션을 사용할 때 생긴 문제와 해결책을 이곳에 적기로 한다

# 전개

## 참고 링크

### kramdown
- 본 위키는 Jekyll의 기본 markup langauge인 kramdown을 사용한다
- [HTML Spans , kramdown syntax](https://kramdown.gettalong.org/syntax.html#html-spans) 를 참고하면..
  - 기본적으로 kramdown은 span HTML tags 내부의 kramdown syntax를 파싱하지만
    - `parse_span_thml` 옵션으로 on/off 할 수 있다
    - html에 `markdown` attribute을 이용하여 tag 단위로도 syntax parsing을 enable/disable 할 수 있다
      - HTML tag가 `markdown="0"` attribute을 가지면, HTML tag 내에서 kramdown 파싱이 되지 않는다 
      - HTML tag가 `markdown="1"` attribute을 가지면, tag 내의 content는 span-leve(in line 수준)으로 파싱된다
      - HTML tag가 `markdown="block"` attribute을 가지면,
        - HTML spans는 block-level 요소를 포함할수 없기 때문에,  warning이 뜨고 attribute은 무시된다
      - HTML tag가 `markdown="span"` attribute을 가지면, tag 내의 content는 span-leve(in line 수준)으로 파싱된다
    - 대부분의 HTML tag 콘텐츠가 파싱되지만 script 태그 처럼 내부를 파싱할 수 없는 태그도 있다


## 기본 구조

### 사전 준비
- 현재 페이지 단위로 별도로 적용하도록 되어 있다. 형식이 확립되면 추후에 global하게 적용하도록 할 수 있다
- 아래 html 코드를 페이지 앞부분에 적당히 적용한다
  ```html
  <style>
  .author-container {display: flex; align-items: center; justify-content: space-around;}
  </style>
  ```

### 저자 프로필 작성
- 다음과 같이 작성하면..
  ```md
  ## Bram Moolenaar

  <div markdown="1" class="author-container">

  ![Bram Moolenaar Photo][Moolenaar-img]

  - Vim - the ubiquitous text editor 개발자
  - <i class="fa-solid fa-house fa-lg"></i> : [moolenaar.net](https://moolenaar.net/) 

  </div>
  
  [Moolenaar-img]:https://moolenaar.net/kopk.jpg
  {:width="100%" object-fit="cover" object-position="20% 10%"}
  ```
- 다음과 같은 결과를 얻는다
- ![Good Example 01](/wiki-img/2023/profile_good_example_01.png)

# 문제점 발생및 해결 과정  

## 문제점 설명 

- 원본 사진이 너무 크면 텍스트와 어울리지 않는다
  ```md
  ## Drew neil

  <div markdown="1" class="author-container">

  ![Drew neil Photo][Drewneil-img]
   
  - Vim 강연, 도서출판, media 제작을 활발히 하는 개발자
  - <i class="fa-solid fa-house fa-lg"></i> : [drewneil.com](http://drewneil.com/) 
  - [Drew Nail Github profile](https://github.com/nelstrom)
  - 도서
    - [Practical Vim, 2ed](https://pragprog.com/titles/dnvim2/practical-vim-second-edition/)
    - [Mordern Vim](https://pragprog.com/titles/modvim/modern-vim/) 
  - 미디어: [Vimcast.org](http://vimcasts.org/) 운영

  </div>
  
  [Drewneil-img]:https://avatars.githubusercontent.com/u/7069?v=4
  {:width="100%" object-fit="cover" object-position="20% 10%"}
  ```
  - 결과
    ![Bad Example 01](/wiki-img/2023/profile_bad_example_01.png)
- 이미지 width 옵션을 다음과 같이 줄여본다
  ```md
  [Drewneil-img]:https://avatars.githubusercontent.com/u/7069?v=4
  {:width="50%" object-fit="cover" object-position="20% 10%"}
  ```
  - 결과
    ![Bad Example 02](/wiki-img/2023/profile_bad_example_02.png)
  - 사진 오른쪽이 이상하게 여백이 넓다
  - img 사이즈는 원하는 대로 줄였지만..
    ![Bad Example 03](/wiki-img/2023/profile_bad_example_03.png)
  - img 사이즈의 parent node인 p 태그는 원본 사이즈로 그대로 유지되고 있다
    ![Bad Example 04](/wiki-img/2023/profile_bad_example_04.png)
- 일단 가장 큰 문제는 markdown 형식으로 작성된 image 요소가 html로 렌더링되면 p 태그로 한번더 감싸지는데 
  - 이 상태대로 rendering되면 image가 차지하는 영역을 줄일수 없다

## 해결책
- 위의 문제와 관련된 SO 질문과 답을 우선 보자 
  - [위와 관련한 SO 질문01](https://stackoverflow.com/q/24456010/9457247)
  - [위와 관련한 SO 질문02](https://shttp://www.unixwiz.net/techtips/tackoverflow.com/q/30590367/9457247)
- figure 태그나 div태그와 같은 block 태그로 감싸라는 해결책이 많이 보인다

### jekyll-figure
- [jekyll-figure github repository](https://github.com/paulrobertlloyd/jekyll-figure)
- jekyll 에 적용하는 custom ruby gem
- 기본 image 태그 대신 figure 태그로 markdown을 rendering하기 위해 채택함

### 해결책 적용 단계별 설명 
- 우선 jekyll-figure 를 설치한다
- kramdown에서 제공하는 [Link Definitions](https://kramdown.gettalong.org/syntax.html#link-definitions) 방법은 jekyll-figure에서 지원안되기 때문에
  - 일반적인 markdown image 링크를 사용한다 
- 다음은 해결책을 적용한 markdown이다 
  - 아래에서 liquid tag를 code fence내에 표시하기 위해 raw liquid tag를 사용함
  - raw liquid tag가 없으면 figure liquid tag가 작동하여 code fence가 깨짐
   
  ```md
  {% raw %}
  <div markdown="1" class="author-container">

  {% figure %}
  ![Drew neil Photo](https://avatars.githubusercontent.com/u/7069?v=4)
  {% endfigure %}
   
  - Vim 강연, 도서출판, media 제작을 활발히 하는 개발자
  - <i class="fa-solid fa-house fa-lg"></i> : [drewneil.com](http://drewneil.com/) 
  - [Drew Nail Github profile](https://github.com/nelstrom)
  - 도서
    - [Practical Vim, 2ed](https://pragprog.com/titles/dnvim2/practical-vim-second-edition/)
    - [Mordern Vim](https://pragprog.com/titles/modvim/modern-vim/) 
  - 미디어: [Vimcast.org](http://vimcasts.org/) 운영

  </div>
  {% endraw %}
  ```
- 결과
  - span-level인 img html tag 대신 block-level인 figure html tag가 들어가 p tag 감싸기가 사라졌다 !! 
  - p 태그가 들어가는 이유는 
    - span-level인 img html tag를 block들만 놀아야할 flex box에 (부모없이) 혼자 들어갔기 때문에 임시로 p 태그라는 보호자를 세워주는 보호책인것이다 !! (개발자의 실수를 보완해주는 markdown 엔진...)
  ![Good Example 02](/wiki-img/2023/profile_good_example_02.png)

## 기타

### figure의 사이즈 조정
- figure를 사용하니 image size가 자동으로 줄어들었다
- size를 조정하려면 다음과 같이 하면 되는데
  ```liquid
  {% raw %}
  {% figure %}
  ![Drew neil Photo](https://avatars.githubusercontent.com/u/7069?v=4)
  {% endfigure %}
  {:style="width:50%"}
  {% endraw %}
  ```
  - 다만 이렇게 하면 image html tag에 50%가 적용되는게 아니라 figure html tag에 적용되며
    - `.author-container` 블럭을 100%로 볼 때 `figure` tag가 50%를 차지하겠다는 것으로 해석되기 때문에.. 
    - 아래와 같이 커지게 된다
  ![Good Example 03](/wiki-img/2023/profile_good_example_03.png)

### 위 방법대로 적용했는데도 이미지와 글 사이의 사이가 벌어져 있다??
- 문제: 그러니까 아래와 같은 경우는 왜 발생할까? 
    - 맨 아래 `Steve Friedl`의 경우 이미지와 오른쪽 ul 태그와 사이의 공백이 크다 (이미지의 공백도 아니다!) 
    ![other Example 01](/wiki-img/2023/profile_other_example_01.png)
- 해결: 그 이유는.. 글이 가로길이가 너무 짧고, `justify-content` 옵션이 `space-around`로 설정되어 있기 때문이다
    - 즉, [글밥](https://korean.go.kr/front/onlineQna/onlineQnaView.do?mn_id=216&qna_seq=281016&pageIndex=1&searchCondition=&searchKeyword=)이 많아지면 앞의 예처럼 조정된다!! 
