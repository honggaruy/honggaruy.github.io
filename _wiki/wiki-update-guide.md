---
layout  : wiki
title   : 위키 편집 안내서 
summary : 위키 구조 파악및 ... 
date    : 2021-03-10 15:14:25 +0900
updated : 2021-03-12 12:40:07 +0900
tag     : liguid 
toc     : true
public  : true
parent  : [[Wiki-Setting-Category]] 
latex   : false
---
* TOC
{:toc}

# 1. 일단 시작

* 최상단 폴더의 index.html 부터 분석 시작
* 사용중인 템플릿팅 언어는 jekyll에서 채용한 [Liquid](https://shopify.github.io/liquid/)
* index.html 가장 아랫쪽에 `include createLink.html`
  * vimwiki 링크를 html <a> 태그로 보여주는 javascript 코드
  * 이 [include 문법](https://jekyllrb.com/docs/includes/)을 사용
  * 이 내용은 [johngrib님 위키](https://johngrib.github.io/wiki/my-wiki/#test형식의-vimwiki-링크를-html-a-태그로-보여준다)에 잘 설명 되어있다

# 2. 넣고 싶은 기능

* tag 페이지에 같은 태그로 검색한 stackoverflow의 결과도 넣고 싶다.
* 그럼 일단 axios를 써야 하는데.. 이걸 참조 [JavaScript: using axios in the browser to make API requests](https://gabrieleromanato.name/javascript-using-axios-in-the-browser-to-make-api-requests)


# 3. tag 페이지에 stackoverflow tag 정보도 같이 넣기

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
