---
layout  : wiki
title   : Javascript 초급 코딩 요령 
summary : Google Apps Script 에서 사용하는 요령도 포함 
date    : 2020-06-05 23:30:03 +0900
updated : 2024-02-26 10:04:51 +0900
tag     : javascript typescript falsy truthy npm-install package_json google-apps-script
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

## git 에서 javascript 프로젝트 clone 하고나서 뭐 해야 하지 ?

* google 개발자는 gas unit-testing 어떻게 하나 보려고 [apps-script-oauth2, github](https://github.com/googleworkspace/apps-script-oauth2)를 다운받아 봤다.
* package.json을 보니 mocha와 chai를 쓰는군..
* 근데 clone 하고 나서 뭐 해야 하지? (오랜만에 다시해서..) ▶ `npm install`을 한다 !! 

### npm install

* #npm-install #package_json
* 참고 링크 : [npm-install](https://docs.npmjs.com/cli/v7/commands/npm-install)
* `npm install` (in a package directory, no arguments):
  * (이 명령으로) 로컬 `node_modules` folder에 의존하는 패키지들을 모두 설치한다
  * 여기에 global mode를 추가하면 (즉, command에 `-g` 나 `--global`을 덧붙이면)
    * 현재 package context (즉, 현재 working directory)를 global package로 설치한다 
  * 기본적으로 `npm install` 명령은 `package.json`에 들어있는 모든 의존 모듈(dependencies)을 설치한다
  * `--production` flag이 추가되면 (혹은 `NODE_ENV` 환경 변수가 `production`으로 설정되어있으면)
    * npm은 `devDependencies`에 등록된 모듈을 설치하지 않는다
  * `NODE_ENV` 환경 변수가 `production`으로 설정된 상황에서 
    * `dependencies`와 `devDependencies`의 모든 모듈을 설치하려면 
    * `--production=false` 옵션을 추가해라
      - NOTE : `--production` flag은 프로젝트에 dependency 추가할 때는 별 의미가 없다.

## vanila javascript로 오늘 날짜 만들고 날짜 비교하기

- #google-apps-script
- 참조
  - [사용된 AppsScript](https://script.google.com/home/projects/17hCVZq2nXrmbBKpFrQe3rk2tYzWLKYOmrjXcmHxUHoHWLGTCmXSjeM_P/edit)
  - [date object의 날짜 비교 방법, stackoverflow](https://stackoverflow.com/a/493018/9457247)
- 상황
  - 'A12' range가 오늘 날짜인지 확인하여 `needUpdate 변수 생성하고 필요하면 오늘 날짜로 업데이트하기
  ```js
  const finalDay = new Date(sheet.getRange('A12').getValue());
  const today = new Date();
  today.setHours(0,0,0,0);
  const needUpdate = finalDay.getTime() !== today.getTime();
  if(needUpdate) {
    sheet.getRange(12, 1).setValue(today);
  }
  ```

## javascript 에서 python의 range 함수 만들기

- 이 [링크](https://velog.io/@jinyongp/연속된-배열을-얻는-방법) 에서 보이는 바와 같이 많은 방법이 있지만
- [MDN Site에 나와 있는 아래 방법](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/from#sequence_generator_range)이 표준이라고 보여진다
    ```js
    // Sequence generator function (commonly referred to as "range", e.g. Clojure, PHP, etc.)
    const range = (start, stop, step) => Array.from({ length: (stop - start) / step +1 }, (_, i) => start + i * step);
    
    // Generate numbers range 1..10 with step of 2
    range(1, 10, 2);
    // [1, 3, 5, 7, 9]
    ```
- 여기서 사용된 낯선 문법을 알아보자
    - `{ length: n }` 은 유사 배열 (array-like)를 만드는 문법이다 . 참조링크: [유사배열 객체](https://kamang-it.tistory.com/entry/JavaScript15유사배열-객체Arraylike-Objects)
    - `Array.from()`은 유사 배열을 실제 배열로 만드는 대표적인 method 로 ES6부터 추가된 기능이다
