---
layout  : wiki
title   : 개발자의 글쓰기 
summary : 변수 네이밍부터 릴리스노트, ... 
date    : 2020-11-26 09:25:18 +0900
updated : 2020-11-27 20:07:01 +0900
tag     : br*** book 
toc     : true
public  : false
parent  : [[Books-Category]] 
latex   : false
---
* TOC
{:toc}

# 개요

| ![개발자의 글쓰기 표지](http://image.kyobobook.co.kr/images/book/xlarge/744/x9791158391744.jpg) | 지은이: 김철수<br> 책제목: 개발자의 글쓰기 <br> 부제: 변수 네이밍부터 릴리스 노트, 장애 보고서, 기술 블로그까지 프로그래머의 글쓰기 고민 끝! <br><br> 펴낸곳: 위키북스 <br> 초판발행: 2019년 10월 04일 <br> ISBN: 979-11-5839-174-4 (13000)<br> 값: 18,000원 |

# 프롤로그 : 개발자의 글쓰기는 달라야 한다

### 개발자 글쓰기의 특징: 정확성, 간결성, 가독성

* 개발자 글쓰기의 3원칙 : 정확성, 간결성, 가독성
* 3가지 원칙이 서로 대치(반비례?) 관계에 있다는 것이 문제
  * 예) 정확성을 높이면 간결성과 가독성이 낮아짐

### 개발자의 글쓰기

* 적당한 정도의 정확성, 간결성, 가독성을 유지하는 방법을 배워야 함
* 이것이 저자가 책을 쓴 이유임

# 1장 : 개발자가 알아야 할 글쓰기 기본

## 01_ 문장과 단락을 구조화하는 법

### 문장을 구조화하는 법

* 시간과 수고가 많이드는 문장
  > 색상 RGB 값을 각각 사용하기 때문에 입력 데이터는 3차원 벡터다.
* 주어("입력 데이터")를 문장 처음으로..
  > 입력 데이터는 색상 RGB 값을 각각 사용하기 때문에 3차원 벡터다.
* 인과관계의 복문이므로 두문장으로 나누면.. 
  > 입력 데이터는 색상 RGB 값을 각각 사용한다. 그래서 입력 데이터는 3차원 벡터다. 
* 본인이 잘아는 내용(혹은 말하고자 하는 결론) 먼저쓰고 .. 
  > 입력 데이터는 3차원 벡터다. 
* .. 부가 설명을 붙인다.
  > [입력 데이터] <br>
  > 입력 데이터는 3차원 벡터다. 색상 RGB 값을 각각 사용하기 때문이다.
* 문장을 쉽게 쓰려면...
  * 간단한 문장 구조로 핵심만 말한 뒤,
  * 필요에 따라 부가 설명을 한다.
* 위 작업의 성과  
  * 첫문장과 비교하여 `가독성`을 확보했다.
  * 첫문장의 주어를 소제목으로 만들어 자연스럽게 문단을 구성했다.

### 서술식, 개조식, 도식의 차이

* 세가지 방법
  1. 서술식
    * '~다'로 끝나는 완전한 문장
    * 설명문이나 논증, 소설, 신문, 개발 가이드 문서에서 주로 쓰임
    * 줄거리가 있는 설명, 이야기에 어울림
  2. 개조식
    * 종결어미 '~다' 대신 명사 혹은 용언의 명사항 '~했음'으로 끝남 
    * 신문의 헤드라인, 릴리스 문서, 장애 보고서
    * 항목과 내용이 반복될 때 
  3. 도식
    * 그림이나 서식을 사용
    * 행, 열로 이뤄진 표도 도식에 포함됨
    * 각 항목이나 사항의 관계를 명확히 규정

* (내 생각) 본 위키를 보면 알겠지만 개조식으로 모두 커버할 수 있다고 본다.
  * 개조식은 가독성 측면에서 원탑임
  * 설명문도 개조식을 잘만쓰면 훨씬 낫고..
  * 도식이 가독성이 좋은 경우도 있지만 번거로움.. 정말 필요할 때 가끔씩 써 준다.
  
### 개조식 서술 방식과 글머리 기호 - 읽음 
### 단락을 구조화하는 위계 - 읽음

* 개발자들은 제발 일반 문서에서 space로 들여쓰기 하지마라 ... 이건 코드가 아님

## 02_ 쉽게 쓰는 띄어쓰기와 문장 부호

### 가장 쉬운 띄어쓰기 원칙

* 다음 한 문장의 법칙만 지키면 된다
  > 조사, 순서, 숫자, 하다, 기호만 붙이고 나머지는 띄어 쓴다.
  
* 함수를 선언할 때 함수 이름 끝에 괄호를 쓰고 그안에 인수를 쓰는데, 이때도 붙여 쓴다.
  ```js
  // bad example
  wordSpacing( arg1, arg2 )
  // good example
  wordSpacing(arg1, arg2)
  ```
* (내 생각) 근데 for 문에서 `for(i=0; ...)` 이런식으로 붙여 쓰면 답답하던디...
  * 아직 책을 다 안 읽었으니 섯불리 판단하지 말자
  
### 오해하기 쉬운 문장 부호(큰따옴표, 작은따옴표)

* C에서 작은따옴표는 단일 문자에, 큰따옴표는 문자열에 사용
* SQL은 쿼리문 안에서 작은따옴표를 사용
  * 다른 언어에서 쿼리문 인용하는 경우가 많은데 따옴표 중복을 막기 위함
* Javascript도 주로 작은따옴표 사용
  * HTML이 주로 큰따옴표를 사용하여 중복을 막기 위함
  * 실제로는 번갈아 씀
* 한글의 규정도 있고..
* 비즈니스 문서에는 또다른 규칙이 있음


## 03_ 영어 단어 선택과 외래어 표기법

### <span style='color:red'>**비슷한 듯 다른 듯, 단어 선택**</span>

* 개발 네이밍시 반대 단어를 써야할 때
  * 예를 들면 HTML에서 show 했으면 hide 도 해야 한다
  * 이 때 hide 대신 invisible을 쓰면 안됨
  * invisible의 반대말은 visible이기 때문 (사용자가 예상할 수 있어야 함)
* 반대말 예제
  * head의 반대말?  tail, toe, foot , but HTML에서는 `footer`
  * 미만은 under, 초과는 over
  * 이하는 or under, 이상은 and over
  * before ↔ after, open ⇔ cloase, input ⇔ output, import ⇔ export
* `중단` 의미 영단어 (유의어 예제)
  * stop, finish, pause, suspend, hold
  * stop, pause는 잠시 중단, 언제든 다시 시작할 수 있을 때 ( 중단 강도: stop > pause )
  * end, finish는 완전히 중단되어 재시작할 가능성이 없을 때 ( 중단 강도:  end < finish )
  * suspend는 다음 단계의 시작을 중단한 것, hold는 어떤 의도가 있어 중단한 것
    ```js
    stopUserRegister(); // 사용자 등록은 잠시 중단한다. 
    // 재개하려면 startuserRegister()나 restartuserRegister()를 사용
    ```
* 동사 get은 어떤 값을 돌려받아 반환하는 함수에 사용
  * 비슷한 의미인 return은 함수 이름에 잘 쓰지 않음 - 함수내에서 제어에 필요한 keyword라서..
  * 또한, return의 주체는 객체
    * 함수 이름에 return을 쓴다면 자기가 자기에게 돌려준다는 이상한 의미..
  * get의 유의어 사용방법
    * retrieve( 개 종류 리트리버의 그것..) -  retrieve는 검색해서 가져온다는 뜻 ( 검색에 비중이 있을 때 쓰면 좋음)
    * aquire는 독점한다는 뜻 - 다른 함수가 결과를 가져가지 못하게 독점하고자 할 때는 acquire
    * fetch는 현재 값을 가리키는 포인터가 다음 값으로 이동한 것을 가져온다는 뜻

* set 은 값을 변경하거나 설정하는 함수
  * (내생각) get과 set은 세트로 많이 씀
  * register는 이미 정해진 틀에 값을 집어넣는 것
  * create는 정해진 틀이 없을때 틀을 만드는 작업
* 수정을 나타내는 change, modify, revise는 서로 의도가 다른말
  * change는 내용을 단순히 바꾸는 것
  * modify는 잘못된 것을 바로잡을 때
  * revise는 기존에 없던 새로운 정보나 아이디어를 덧붙여 보강할 때
* parameter는 매개변수, 함수에 정의한 변수
  * argument는 전달 인자로, 함수를 호출할 때 전달되는 값
* attribute는 HTML에서 태그 안에 속성을 넣을 때 사용되는 요소
  * 하지만 이 요소를 HTML DOM에서 가리킬 때는 property라고 함
  * attribute와 property는 언어마다 조금씩 다르게 해석함
* must와 should는 `~해야 한다`로 똑같이 번역하지만, 스펙, 요구사항에서 전혀 다른 뜻으로 사용됨
  * must는 필수 요구 사항, must not은 일어나서는 안되는 일
  * should는 권고 또는 권장 사항, should not은 하지않는 것이 더 좋다는 정도
* 정확한 단어를 쓰는 것도 좋지만, 일관성과 개연성이 더 중요함.

### 외산 제품 표기와 외래어 표기법

* widows 표기 사례
  * MS가 첨에 `윈도우95`로 표기
  * 1995년 9월 5일(?)에 국립 국어원이  Windows 95를 심의할 때..
    * [`윈도95`로 표기해야 한다고 결정](https://www.korean.go.kr/front/onlineQna/onlineQnaView.do?mn_id=216&qna_seq=63425)
    * 그 후 언론사들이 윈도95로 표기하면서 혼란이 시작
  * 표준과 실제의 차이
    * 표준 : 외래어 표기법 ~ ow[ou] 발음은 '오'로 적는다
    * 실제 : [구글 트렌드로 '윈도10'과 '윈도우10'의 검색 수 비교](https://trends.google.co.kr/trends/explore?geo=KR&q=윈도10,윈도우10)
    * [위키백과도 윈도우10으로 표기](https://ko.wikipedia.org/wiki/윈도우_10)
* release note에서 표기법에 따라 '릴리스'로 써야 함
  * [위키백과도 릴리스 노트로 표기](https://ko.wikipedia.org/wiki/릴리스_노트)
  * 하지만, 개발자들이 대화할 때는 대부분 릴리즈로 발음
  * 비슷한 예, basic을 '베이식'이라고 안하고 '베이직'이라고 함
  * (내생각) `ㅅ+ 모음`은 왠지 바람빠지는 기분으로 입에 찰지게 붙지 않음. `ㅈ+모음`이 입에 짝짝 붙는 기분..
* 외래어 표기법 제1조 제5항
  > 이미 굳어진 외래어는 관용을 존중하되, 그 범위와 용례는 따로 정한다
  * 외래어 표기법은 표준보다 일관성이 중요
  * [한국에서 파이썬이 파이썬이 된 사연, 장혜식님 블로그](http://openlook.org/wp/why-python-is-called-python-in-korea/)
  * [국립국어원 외래어 표기 용례 찾기](https://kornorms.korean.go.kr/example/exampleList.do)
  * [한글라이즈, 무료 외래어 변환 사이트](https://hangulize.org/)

# 2장 : 개발 시간을 줄여주는 이름 짓기와 주석 쓰기

## 01_ 네이밍 컨벤션, 이유를 알고 쓰자

### 개발자의 가장 큰 고민은 이름 짓기
### 이름 짓기는 창조가 아니라 조합

* 이름 짓기의 착각 : 무에서 유를 창조하는 것? 그건 아님
  * 라이브러리 가져다 쓰듯이 .. 기존것을 차용하고 달라지는 부분만 만들면 됨.
  * 한국이름의 예: 라이브러리: 성씨, 돌림자  만드는 것: 나머지 한자 
* [오픈소스의 네이밍 특징들, Java 언어 사례](https://brunch.co.kr/@goodvc78/12)
  * 자바 네이밍 컨벤션을 철저하게 준수
  * 네이밍은 보통 16글자, 3단어의 조합
  * 품사는 주로 명사, 동사, 형용사의 조합

## 02_ 변수 이름을 잘 짓는 법

### 코드의 네이밍 컨벤션은 영어 표기법을 상속받았다

* 네이밍 컨벤션은 기본적으로 영어 표기법을 준수
* 파스칼 표기법, 카멜 표기법은 [영어의 대문자 표기 원칙, Capitalization](https://en.wikipedia.org/wiki/Capitalization)을 상속 받은 것
  * 위키피디아 에서는 [Camel case](https://en.wikipedia.org/wiki/Camel_case)가 표준, pascal case도 이쪽으로 redirect 됨
* 영어 대문자 표기 원칙의 특성 
  1. 중요, 큰 것, 특정한 것, 제목 명사는 첫 글자를 대문자로
  2. 그런 명사들이 이어질 때 모두 첫 글자를 대문자로
  3. 명사, 관사가 아닌 동사, 형용사는 소문자로

### 파스칼 표기법으로 클래스 이름 짓기

* 모든 단어에서 첫글자를 대문자 쓴다
  * 주로 클래스 이름 - 클래스가 프로그램에서 가장 높은 위치
  * 클래스 이름으로 명사 여러 개를 붙여 쓰는 경우 - 각 명사를 모두 대문자로 씀 
    ```js
    interface Menu
    class CoffeeMenu implements Menu
    ```
    
### 카멜 표기법으로 함수◦변수의 이름 짓기

* 카멜 표기법은 첫 단어를 빼고 나머지 단어의 첫 번째 글자만 대문자로 쓴다
  * 주로 함수나 변수에 사용
  * 함수는 동작에 관계되므로 첫 단어가 주로 동사
  * 변수는 형용사로 시작되는 경우도 많음
  * 영어 표기법과 연결시켜보면 당연

### 상수는 모두 대문자로 쓴다 (내생각 - 꼭 그럴 필요가 있을까?)

* 이부분은 영어 표기 원칙과는 다름
  * 원주율 파이 : Pi
  * 그리스어 알파벳 : 𝝅  (대문자: 𝜫, 대문자는 상수표기로 사용하지 않음)
* 변수와 구분하기 위해 모두 대문자를 쓰고 _(언더스코어)로 연결한다
* **요즘 통합개발환경의 발달로 굳이 구분을 위해 대문자로 써야할지 필요성에 의문**
* (내생각) 클래스로 다음과 같이 지정하고 사용하는 것이 좋음. 카테고리화 하기도 좋고..
  ```js
  class Values {
    this.maxRange = 10
    this.minRange = 1
  }
  ```
  
### 패키지와 모듈은 모두 소문자로 쓴다

* 이 부분도 영어 표기 원칙과 다름
  * 패키지와 모듈의 지위 > 클래스의 지위 지만 모두 소문자만 사용
  * 패키지와 모듈은 컨테이너(포장지)의 의미라 포장지보단 내용물이 중요하기 때문
  * 혼동을 방지하는 차원의 실용적인 이유도 있음

### BEM 표기법

* CSS에서 사용하는 [BEM 표기법](https://nykim.work/15)은 '대상--요소__상태'를 의미 
* 'Block--Element__Modifier'
* 대상의 요소나 부분을 의미할 때는 언더스코어 두개 (__)로 연결
* 대상이나 요소의 상태나 속성을 의미할 때는 하이픈 두개 (--)로 연결
  ```css
  .form { }
  .form__button { }
  .form__button--disabled { }
  ```
  
### 가독성과 소통이 먼저다

### i는 변수 이름이지만 d는 아니다

* 가장 많이 쓰는 변수 이름 ?
  * i, LOG, result  ( "오픈소스의 네이밍 특징들" 자료)
  * i : 정수의 integer 혹은 index의 i
  * index 변수로 2차원, 3차원으로 확장시 j, k도 많이 쓰임
  * x, y : 역시 좌표값을 의미, 수학에서 많이 쓰는 변수들
* a, d 같은 의미 없는 이름은 곤란함
  * d는 day? date? double? 고정된 의미를 유추하기 힘듬
* 의미를 유추할 수 있는 좋은이름
  ```js
  int daysSinceCreated
  int monthSinceUpdated
  int yearsSinceRegistered
  ```
  
### 긴 이름? 짧은 이름? 검색 잘 되는 이름!

* 자동 완성 기능
  * 초창기 코딩 환경: 자동 완성이 어려웠던 시절
    * numberOfTotalVeryImportantPersons 대신 VIPs
    * maxSizeOfWindow 대신 ms
    * 그리고 용어사전에 설명으로 등록
    * 긴 변수 이름은 오탈자 나기 쉬웠던 환경
  * 최신 환경에서는 긴 이름 때문에 오탈자 나기 쉽다고 할 수 없음
* 접두어 - 헝가리안 표기법
  * 멤버 변수의 접두어는 m
  * 변수 타입에 따라 i, is를 붙이기도 함
  * UI 구성 요소의 btn, img도 있음
  * 요즘 에디터는 변수 타입이 자동으로 표기되며, 정적분석을 통해 문제가 있을 경우 알려주기도 함
  * 위의 표기법은 레거시(유적)가 되었다고 볼 수 있음

### 복수형을 나타내는 s를 붙일까 말까?

* 복수형을 나타내는 -s 접미사는 간단한 변수명에서는 눈에 띄지만..
* 다음과 같이 함수명 중간에서는 잘 안보인다.
  ```js
  checkUserNamesUnder2Characters()
  checkUserNamesExistsInDB()
  ```
* 다음과 같이 바꾸는 것이 나을 수도 있다 (-Array, ListOf- 로)
  ```js
  checkUserNameArrayUnder2Characters()
  checkListOfUserNameExistsInDB()
  ```

## 03_ 좋은 이름의 기준, SMART

## 04_ 좋은 코드에는 주석이 없다?

## 05_ 다른 개발자를 배려하는 주석 쓰기

# 3장 : 사용자와 소통하는 에러 메시지 쓰기

## 01_ 에러 메시지를 쓰기 전에 에러부터 없애자

## 02_ 사용자 에러 메시지를 제대로 쓰는 법

## 03_ 사용자의 에러를 줄이는 메시지 구조화

## 04_ 에러 메시지 대신 예방 메시지를 쓰자

# 4장 : 독자 관점에서 릴리스 문서와 장애 보고서 쓰기

## 01_ 체인지 로그를 분류, 요약, 종합하는 법

## 02_ 고객에게 유용한 정보를 쓰자

## 03_ 릴리스 문서는 문제 해결 보고서처럼 쓰자

## 04_ 비즈니스를 이해하는 장애 보고서 쓰기

# 5장 : 설명, 묘사, 논증, 서사로 개발 가이드 쓰기

## 01_ 서비스 개념을 범주, 용도, 특징으로 설명하기

## 02_ 정확히 이해하도록 그림과 글로 묘사하기

## 03_ 논증으로 유용한 정보를 제공하자

## 04_ 서사를 활용해 목차를 만들자

# 6장 : 수주를 돕는 SI 제안서 쓰기

## 01_ 개발자가 알아야 할 제안서 작성 원칙

## 02_ 고객의 문제 인식과 제안사의 문제 해결 능력

## 03_ 고객의 요구사항은 변할 수밖에 없다

## 04_ 고객의 총 만족도를 높이자

# 7장 : 기술 블로그 쉽게 쓰고 운영하기

## 01_ 기술 블로그를 쉽게 쓰는 방법 3가지

## 02_ 글의 종류별로 목차 잡는 법 I - 저술

## 03_ 글의 종류별로 목차 잡는 법 II - 편집

## 04_ 기업의 기술 블로그 운영 팁

# 에필로그 : 회사가 개발자 글쓰기 교육을 하자

* 회사에서 개발자 글쓰기 교육을 할 수있는 여러가지 코스를 제안함
* 문의 사항은 저자 이메일로 `vitaminq42@gmail.com`