---
layout  : wiki
title   : 구글 스크립트 라이브러리 사용법 
summary : beyond battery-included, 추가배터리 구하기  
date    : 2020-06-02 10:01:58 +0900
updated : 2020-08-06 14:48:58 +0900
tag     : google-apps-script library 
toc     : true
public  : true
parent  : [[GoogleAppsScript-Category]] 
latex   : false
---
* TOC
{:toc}

# 1. 개요

* Google-Apps-Script 개발을 하다보니 로깅 시스템이 필요했다.
* [공식적인 관련 페이지](https://developers.google.com/apps-script/guides/logging)가 있어서 찾아보니...
  > These are described in the following sections. In addition to these mechanisms, you can also build your own logger code that, for example, writes information to a **logging Spreadsheet** or JDBC database.
  * ...구글 Spreadsheet에도 로깅을 할수 있다고 나온다. 그런데 어떻게 하면 되는지 자세히 나와있지는 않다.
* 위 페이지에서 나와있는 방법중에 stackdriver를 사용하는 방법도 나쁘지는 않지만...
  * [내가 원하는 기간만큼 보관되지는 않는것 같다.](https://cloud.google.com/logging/quotas#logs_retention_periods)
* 구글링 해보니 [BetterLog](https://github.com/peterherrmann/BetterLog) 라고 구글시트에 로그를 기록할 수 있는 개인이 만든듯한 라이브러리가 나온다. 
  * 설명에 나온대로 간단히 Library로 등록하고 생각한 대로 잘 동작한다.
* github readme에 나온대로 Libraries..로 추가할 수 있는데 버전별로도 선택가능하고..., Open Source로 어떻게 등록하는지.. 궁금해졌다.
* [Script Examples](https://sites.google.com/site/scriptsexamples/custom-methods) : google apps script 코드 예제, 라이브러리등의 설명이 등록된 페이지 .. 일단 사이트주소가 ***.google.com이고, 이곳에 BetterLog도 등록되어 있다. pip 같은 곳인가??

# 2. 전개

* 찾아보니 .. Library로 배포하는 방법은 [요기](https://stackoverflow.com/a/28995046/9457247)에 자세히 나와있다.
* Google Apps Script의 공식적인 설명은 [이 곳](https://developers.google.com/apps-script/guides/libraries)

## 배포된 라이브러리 소스코드 보는 방법은 ?

* 스택오버플로 질문 : [How can I view the souce of a google apps script Library ?](https://stackoverflow.com/a/31997641/9457247)
* 라이브러리 배포시 project key로 배포하는데 그것만 알면 souce code를 위와 같은 방법으로 볼 수있다.

## 배포된 라이브러리의 auto completion 방법은 ?

* 스택오버플로 질문 : [How do I get autocomplete to work in VSCode for 3rd Party libraries ?](https://stackoverflow.com/q/55015282/9457247)
* clasp으로 로컬에서 개발한다면, 일단 typesciprt , VS Code 환경이 일반적이다 ([공식적으로 지원되는 환경](https://developers.google.com/apps-script/guides/typescript)이므로...) 
* 일단 그냥 되지는 않고.. ".d.ts" 파일을 만들거나, 해당 라이브러리를 복사해와서 쓸수 있는듯.. 
* 해봤는데 잘 안되는듯... 마저 해보고 되는지 안되는지 여기 적을것.

## 기타 정보

* gas와 typescript 사용시 템플릿 ..[github 위치](https://github.com/iansan5653/gas-ts-template)
* [Using TypeScript with Google Apps Script and Google Ads Scripting](https://joshuatz.com/posts/2019/using-typescript-with-google-apps-script-and-google-ads-scripting/)

# 3. 일반 js 라이브러리 사용례

## moment.js 를 Google Apps Script의 라이브러리로 만들기

* [moment.js](https://momentjs.com/) : javascript 빌트인 객체인 [Date](https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Date)는 쓰기 불편한데 쓰기좋게 만들어놓은 js 라이브러리
* [moment.js 깃허브](https://github.com/moment/moment/) : github star가 44.5k(2020-08-06 기준)인 많은 사람이 쓰는 라이브러리임

### 내 구글 드라이브 상에 moment.js 라이브러리 등록방법

* 이 작업으로 내 구글 드라이브 상 어느 프로젝트에서나 moment.js 라이브러리를 불러 쓸수 있다
* 스크립트 ID를 공유할 경우 다른 사람도 쓸 수 있을것 같다. (아직 안해봄)

1. moment.js 홈페이지에서 최신 버전을 다운받는다. ( 될수 있으면 moment-with-locales.js 버전을 다운받는게 좋을듯, 다국어지원을 위해)
2. 다운받은 파일 안에 .js 파일이 있을텐데 ..
3. [Google Apps Script 홈](https://script.google.com/home) 에서 새 프로젝트 (standalone)를 하나 만들고 ..
4. 다운받은 .js 파일 내용을 복사해 넣는다. **확장자는 반드시 .gs 로 해야한다**
5. 새 프로젝트 제목은 아무거나 해도 되는데 moment.js 라이브러리 인것을 알아볼수 있도록 해야한다.
6. 파일 > 버전 관리 ... 로 들어가서 설명을 적고 ( 라이브러리 버전은 적는게 좋을것이다) save 한다.
7. 1번 버전이 생성되었다.
8. 이후 라이브러리가 업데이트 된다면 .gs 파일 내용을 신규 라이브러리로 업데이트 하고 버전만 올리면된다.

### 사용방법

* 일단 clasp으로 로컬에서 typescript 로 개발하는 환경에서 사용방법을 알아본다.
* 현재(2020-08-06) clasp을 이용한 로컬 typescript 개발환경에서는... 
* [module을 못쓰고](https://github.com/google/clasp/blob/master/docs/typescript.md#modules-exports-and-imports) [namespace](https://github.com/google/clasp/blob/master/docs/typescript.md#the-namespace-statement-workaround)로 여러 파일로 코드를 분산하여 개발할수 있다.
* 아래 기술한 것은 하나의 사례일 뿐으로 꼭 그대로 해야한다는 것은 아니며 다른 방법이 있을 수 있다.

1. [Google Script 라이브러리](https://developers.google.com/apps-script/guides/libraries#managing_libraries) 설명대로  위에 등록된 moment.js 라이브러리를 사용하려는 프로젝트에 등록한다.
1. main.ts(entry 포인트?)에 Libaray namespace를 만들고 다음과 같이 작성한다.
   ```js
   // 아래에서 `Moment`는 앞단계에서 라이브러리 등록시 작성했던 식별자로 임의로 정해 사용한다.
   namespace Library {
    export let moment = Moment.moment;
   }
   ```
1. 위에서 `Moment.moment`로 작성한 내용중 .moment는 moment.js 맨 처음에 global로 선언된 녀석으로 추측된다. 라이브러리 만드는 법좀 공부해 봐야겠다. 
   ```js
   // moment-with-locales.gs 극 초반
   ;(function (global, factory) {
       typeof exports === 'object' && typeof module !== 'undefined' ? module.exports = factory() :
       typeof define === 'function' && define.amd ? define(factory) :
       global.moment = factory()  // <--- 이쪽의 .moment를 가져오는걸로 추측
   }(this, (function () { 'use strict';
   ```
1. main.ts 에서 선언한 이후 sheets.ts 나 다른 파일에서 사용하기 위해선 다음과 같이 사용하면된다.
   ```js
   // moment.js의 Format Dates 기능을 사용 (홈페이지에서 첫번째 usage로 나옴)
   let dateInString = Library.moment(targetDate).format("YYYY-MM-DD");
   ```
   
## numeral.js 를 Google Apps Script의 라이브러리로 만들기

* [numeral.js](https://numeraljs.com/) : javascript 빌트인 객체인 [number](https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Number)는 원하는 포맷의 string으로 바꾸거나 앞에 zero padding된 문자를 만들기 위해서는 간단한 목적에 비해 [쓸데없이 길게 코딩](https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat)해야하는데 그부분을 간단하게 해줄수 있는 라이브러리이다
* [numeal.js 깃허브](https://github.com/adamwdraper/Numeral-js) : github star가 8.3k(2020-08-06 기준)인 많은 사람이 쓰는 라이브러리임

### 등록 방법및 사용 방법

* moment 가 numeral로 바뀐것 빼고 위의 moment.js 방법과 거의 99% 동일하다.
* 홈페이지 제일 마지막 부분 `#Acknowlegements`에 `moment.js`에서 많이 베꼈다고 나와있어서 그런듯..
* 근데 locales.js 파일이 분리되어 있다. ( moment.js는 moment-with-locaes.js로 붙여서 배포하는 버전도 있는데...)
* 일단 라이브러리 등록시에 numeral 프로젝트 등록시 locales.js도 별도 파일로 등록은 했는데.. 사용할수 있을지는 써봐야할 듯..
* 나중에 locale도 사용해보고 가능여부 이곳에 적을것...
