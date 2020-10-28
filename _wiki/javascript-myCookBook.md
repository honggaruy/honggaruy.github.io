---
layout  : wiki
title   : Javascript 초급 코딩 요령 
summary : js/ts 뉴비가 생각하는 ... 
date    : 2020-06-05 23:30:03 +0900
updated : 2020-10-25 16:41:03 +0900
tag     : javascript typescript falsy truthy 
toc     : true
public  : true
parent  : [[Web-Category]] 
latex   : false
---
* TOC
{:toc}

# 1. 시작

* 최근에 Google-Apps-Script 프로젝트 하나를 완성하면서 정리해놓고 싶은 Javascript 요령을 적고자 한다.

# 2. 전개

바로 내용으로 들어간다

## 빈 배열 값이 false로 평가 받길 원할 때

* 폴더 상에서 특정 파일들을 검색하여 검색된 **파일 이름을 배열로** (예를 들면, `newFiles` 배열) 반환하는 함수가 있다고 하자 
* 이 때 배열이 비어있을 경우 이어지는 파일처리를 하지 않도록 빈배열이  `falsy value`로 평가 받고 싶을 것이다.
* 하지만 Python 과는 다르게 `if ( newfiles )` 로 처리할 때 `false`로 판단하지 않는다.
* **제목의 의도대로 판단 하고자 한다면 `if ( newfiles.length )`를 사용한다.**

### 해당 내용의 자세한 설명은...

* 참조할 책 : 이선 브라운, 러닝 자바스크립트, 3rd Edition(2016), 번역판-한빛미디어(2017), p151. 5.7.1 참 같은 값과 거짓 같은 값
* [MDN > Definitions of Web-realated terms > Fasly](https://developer.mozilla.org/en-US/docs/Glossary/Falsy) : 거짓 같은 값
* 위 값 외에는 모두 참 같은 값 (Truthy)
  * [MDN > Definitions of Web-realated terms > Truthy](https://developer.mozilla.org/en-US/docs/Glossary/Truthy) : 참 같은 값
* 주의할 Truthy values
  * 모든 객체, valueOf( ) 메서드 호출시 false를 반환하는 객체도 참 값임
  * 모든 배열, 빈 배열도 참 값
  * 공백만 있는 문자열 (" " 등)
  * 문자열 "false"

## isEven & isOdd 한 줄 함수

```js
const isEven = n => n % 2 == 0
const isOdd = n => Math.abs(n % 2) == 1
```

## eventlistner에서 this의 사용에 혼동이 있을 때

* 참조링크 : [What is 'this' in event listeners?](https://metafizzy.co/blog/this-in-event-listeners/)

### 문제
* eventlistener 콜백함수내에서 this를 사용할 경우 , this가 콜백함수를 멤버로 가진 Object를 참조하지 않는다
* 이때의 this는 eventlistner의 bound element를 this로 사용하므로 원래의 의도대로 수행할 수 없다

### 해결책
* 구식 solution : [handleEvent](https://developer.mozilla.org/en-US/docs/Web/API/EventListener/handleEvent)
* 요즘 solution : [bind()](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener#Specifying_this_using_bind())
* 다른 solution : 화살표 함수 
* 자세한 내용은 위 참조링크 본문 참조

