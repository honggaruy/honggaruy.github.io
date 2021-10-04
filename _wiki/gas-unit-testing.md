---
layout  : wiki
title   : Google Apps Script에서 Unit Testing 하기 
summary : QUnitGS2, GatT 등등... 
date    : 2021-09-03 14:13:10 +0900
updated : 2021-09-06 14:30:45 +0900
tag     : google-apps-script unit-testing qunit tap  
toc     : true
public  : true
parent  : [[GoogleAppsScript-Category]] 
latex   : false
---
* TOC
{:toc}

# 1. 개요

* [책을](https://www.hanbit.co.kr/store/books/look.php?p_code=B6952616555) [좀](https://www.obeythetestinggoat.com/) [읽다보니](https://m.hanbit.co.kr/store/books/book_view.html?p_code=B9529701010), 내가 개발하는 모든 프로젝트에 유닛 테스팅 환경이 필요하다는 생각이 든다
* 요즘 주로 사용하는 언어인 Python, Javascript는 완벽한 환경이 준비되어 있다
  * Python : 
    * [PyScaffold 에서 `pytest`와 `pytest-cov`](https://pyscaffold.org/en/latest/features.html?highlight=pytest#automation-tests-coverage) 를 같이 써본 적이 있다
    * 그 외에도 많은 것 같다
      * [Top 6 BEST Python Testing Frameworks [Updated 2021 List]](https://www.softwaretestinghelp.com/python-testing-frameworks/#List_Of_Python_Testing_Frameworks) 
  * Javascript :
    * Refactorng 2nd 공부할 때 Mocha + chai 환경을 써본 적이 있다
    * 역시 경쟁제품이 많다
      * [11 Best JavaScript Unit Testing Framework and Tools, 2021-03-26](https://geekflare.com/javascript-unit-testing/) 
* Google Apps Script 는 위와 같은 단일 개발환경이 아닌 특이한 개발환경이다.
  * Google Apps Script는 여러가지 방법으로 개발할 수 있지만,
  * 현재 나는 아래 환경으로 개발중이다. 
    * `clasp(로컬,개발)` + `Typescript(로컬,개발)` + `GAS Online(온라인,실행)`
  * 어차피 Google Drive의 온라인 서비스를 이용하기 위해 GAS를 사용하는 것이므로
    * 이중 `GAS Online`은 필수이다 
* GAS는 Javascript base 이지만 위의 수많은 제품들이 
  * 터미널 실행환경인  `node.js` 기반으로 하므로 그대로 적용하기는 어렵다
* 별도의 방법을 찾아야 한다

# 2. 전개

* 제목의 미션에는 다음과 같은 challenge들이 있다
  * `node.js`를 사용하지 않고 `GAS` 환경으로 unit-testing framework을 가져올 수 있는가 ?
  * `GAS Online` 환경에서, 테스트를 어떻게 실행하고, 실행 결과를 어떻게 표현할 것인가 ?
  * 지원하는 테스트가 `GAS Online` 환경에서 테스트 용도로 사용하기 적합한가 ? 

## GasT

* 관련링크
  * Original : [GasT - Google Apps Script Testing-framework, github](https://github.com/huan/gast)
  * Typescript Conversion : [GasT - Google Apps Script Testing-framework in TypeScript, github](https://github.com/kevincar/gast) - 현재 내가 쓰는 툴
* 이름부터 Google Apps Script를 대상으로 개발된 것이라는 것을 알 수 있다

### 테스트 프레임웍 모듈 가져오기 

* 테스트 프레임웍은 GAS의 [URL Fetch Service](https://developers.google.com/apps-script/reference/url-fetch?hl=en) 를 이용하여 바로 가져온다.
  * 이 feature는 node.js를 보완해서 나온 [deno](https://deno.land/manual#comparison-to-nodejs) 와 비슷하다
    * 디노도 `npm`에서 다운로드 하는 대신 URL을 직접 참조한다는 것이 첫번째 feature 이다
* Test 모듈을 별도 파일로 구성할 수 있다
  * 위의 `URL Fetch` 명령만 파일 상단에서 호출하면 된다 

### 테스트 실행및 결과 표현

* 테스트를 하고자 할 경우 위에서 별도 파일로 구성한 테스트 모듈로 이동후 테스트 함수를 실행한다
* `GAS Online` 실행환경에서 `실행로그`에 텍스트로 결과를 뿌린다

### 테스트 작성 프로토콜

* 테스트 작성 프로토콜은 [TAP](http://testanything.org/)를 사용한다
  * [TAP의 역사](http://testanything.org/history.html)를 보면 알겠지만 IT계의 짧은 수명을 극복하고 오랫동안 살아남았다 
  * 살아있다는 증거 : [이 링크](https://en.wikipedia.org/wiki/List_of_unit_testing_frameworks#JavaScript) 는 JavaScript용 테스트 프레임워크 목록인데 `TAP`의 지원 여부 항목이 있으며, 꽤많은 프레임웍이 지원중이다 ( 아직 살아있네..)
* 테스트 작성 프로토콜이 아무래도 빈약한 것 같다
  * [hook](https://mochajs.org/#hooks) 비슷한 것이 있는지 찾아봤는데 안보인다 
    
### 적용사례

* [clasp_bankbook에 적용한 commit](https://github.com/honggaruy/clasp_bankbook/commit/513b3b2f15eca07855d29a30abe05ef52d62c365)
* 실행방법 : 
  * [통장모음 Apps Script](https://script.google.com/home/projects/1TqB5E0mnnRHTUTwhtv348HhfBkHV1PazjooPgLwE-gvLz1DCh3jf-1Mz/edit)  에 진입해서
  * tests.gs로 이동후
  * `gastTestRunner()`를 실행한다

## QUnitGS2

* 관련링크
  * [QUnitGS2 homepage](http://qunitgs2.com/)
  * [QunitGS2 github](https://github.com/artofthesmart/QUnitGS2) : 2020년 8월 1일까지 마지막 업데이트 ( 2020-09-03일 확인)

### 테스트 프레임웍 모듈 가져오기

* 두가지 방법이 있다
  1. github에 등록된 QunitGS2 는 그대로 `GAS Project`이다
    * 즉, 그대로 내 Apps Script 코드의 일부로 복사하면 사용할수 있다
  2. 아니면 라이브러리로 등록하는 방법이 있다.
    * 저자가 공개 GAS 프로젝트로 등록한 ID로 등록할수도 있고
    * 아니면 Github에서 다운로드받아 내 Apps Script 계정에 ...
      * 별도 프로젝트로 등록한 후 라이브러리로 만들어도 된다.
* 테스트 작성 모듈만 별도로 분리 가능한 것을 확인했다

### 테스트 실행및 결과 표현

* 테스트 실행 방법이 다소 복잡하다
  1. 일단 유닛 테스트를 적용하려는 프로젝트를 `Web Apps`로 만든다
    * [Web Apps으로 만드는 방법](https://developers.google.com/apps-script/guides/web) 을 보면 `doGet(e)`함수를 추가하라고 나온다
    * 해당 함수는 `HtmlOutput` 객체를 반환해야 한다
  1. `doGet()` 함수 추가후 `배포`를 해야 한다
    * [Step-by-Step 매뉴얼](http://qunitgs2.com/examples/step-by-step-tutorial)에서는 테스트 코드로 배포하라고 나오지만 ... 현재 테스트 코드로는 제대로 안된다 ( 내가 뭔가 잘못했을지도..?)
    * 정식 배포를 하면 잘 나온다
  1. 웹앱 배포 주소로 접속하면 아래와 유사하게 나온다
    ![Qunit 결과](http://qunitgs2.com/user/pages/02.examples/03.step-by-step-tutorial/qunit-in-apps-script-tests-passing.png)
* [Qunit 홈페이지](https://qunitjs.com/) 에 가보면 `Browser Result`와 `CLI Result`가 있는데 ..
  * `QUnitGS2`는 그 중 `Browser Result`를 활용하여 결과를 보여주는 프로젝트이다 

### 테스트 작성 프로토콜

* 요즘은 [다른 도구들(Jest, Mocha)에 밀려 인기가 주춤하지만](https://bestofjs.org/projects?tags=test-framework)  Qunit 도 한 때는 잘나가는 도구였다 (한 때 날렸던 JQuery의 일부 였음)
  * [qunit의 health score, snykAdvisor](https://snyk.io/advisor/npm-package/qunit) : 2021-09-04 현재 98/100 점 이다. 아직 잘 유지보수중이다
* [테스트 작성 방법은 문서화가 잘되어 있다](https://api.qunitjs.com/QUnit/module/#example-organizing-tests)
* GasT에서는 안보이던 [hook](https://api.qunitjs.com/QUnit/module/#options-object)도 보인다
* [Qunit bdd로 검색하면](https://www.google.com/search?q=qunit+bdd) 작성법 관련하여 읽어볼만한 글들이 있는데 읽어보고 뭔가 더 정리해보자  

### 적용사례

* [clasp_bankbook에 적용한 commit](https://github.com/honggaruy/clasp_bankbook/commit/513b3b2f15eca07855d29a30abe05ef52d62c365)
* 실행방법 : 
  * 테스트관련해서 수정을 했으면
  * [통장모음 Apps Script](https://script.google.com/home/projects/1TqB5E0mnnRHTUTwhtv348HhfBkHV1PazjooPgLwE-gvLz1DCh3jf-1Mz/edit)  에 진입해서
  * 새로 `배포관리` 를 업데이트 하고 
  * 새로운 `배포버전` web app에 접속한다

## gas-local



# 해당 주제와 관련된 글

* [Unit Testing GAS ,시리즈글 5개, ohhey](https://blog.ohheybrian.com/2019/11/unit-testing-gas-part-1-qunit-setup/)
* [Taking Away the Pain From Unit Testing in Google Apps Script, medium](https://medium.com/geekculture/taking-away-the-pain-from-unit-testing-in-google-apps-script-98f2feee281d) :  21년 35주차 블로그에 [번역하다 중단한 글](/blog/2021/08/30/week-35th/#taking-away)이 있음
* [Unit Testing with Google appsScrips](https://classroomtechtools.github.io/Utgs/#/)
  * [github](https://github.com/classroomtechtools/Utgs)
