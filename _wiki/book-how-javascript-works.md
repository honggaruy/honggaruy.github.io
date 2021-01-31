---
layout  : wiki
title   : 자바스크립트는 왜 그 모양일까? 
summary : 더글라스 크락포드가 알려주는 ... 
date    : 2020-12-01 11:27:56 +0900
updated : 2020-12-18 14:23:16 +0900
tag     : br*** book 
toc     : true
public  : false
parent  : [[Books-Category]] 
latex   : false
---
* TOC
{:toc}

# 개요

| ![표지](http://image.kyobobook.co.kr/images/book/xlarge/595/x9788966262595.jpg) | 저자: 더글러스 크락포드 (Douglas Crockford) <br> 책제목 : 자바스크립트는 왜 그 모양일까? (원제 : How JavaScript Works) <br> 부제 : 더글러스 크락포드가 알려주는 <br> 위험한 자바스크립트를 안전하게 사용하는 법 <br> 출판사 : 인사이트 <br> ISBN 한글 : 978-89-6626-259-5 <br> ISBN 영문 : 978-1949815009 <br> <br> 값: 28,000원 |

## 저자 설명

### 더글러스 크락포드

* 더글러스 크락포드는 자바스크립트 구루(Guru)라고 불리지만, 구루보다는 사실 성인(Mahatma)에 가깝다
  * (내생각) 번역한 책을 읽어보면 말하는 스타일이 ... 그런 스타일이라는 걸 알 수 있다.
* JSON 창시자, JSLint, JSMin 도구 개발
* [Douglas Crockford, 영문위키](https://en.wikipedia.org/wiki/Douglas_Crockford)
* [더글러스 크록포드, 한글위키](https://ko.wikipedia.org/wiki/더글라스_크록포드)

# {"number": 0, "chapter": "시작하기 전에"}

* 제가 사용하는 프로그래밍 언어를 다루는 스킬을 향상시키는 가장 효과적인 방법은 다음과 같습니다
  > 이따금 유용하지만 때때로 위험한 기능과 안전하면서 더 나은 다른 기능이 있다면, 항상 더 나은 다른 기능을 사용하라
* (내생각) 현재 Javascript 표준에 대해 대단히 비판적인 관점을 가지고 있다. 
  * 십년 전과 비교했을 때 자바스크립트의 좋은 부분은 점점 더 적어지긴 했지만, 대행히 좋은 부분은 훨씬 더 좋아지고 있습니다.
  * ECMA-Script 표준 개정안은 자바스크립트의 본질적인 문제를 해결하지 않고, 오히려 새로운 문제를 일으키기도 합니다.

## 이단

* 더글라스 크락포드는 공격받는데 익숙하지만 대체로 옳았다고 본인이 생각함 ( Javascirpt를 옹호했을때, JSON을 창시했을 때)
* 이 책의 관점이 이단이라고 공격받을 수 있다는 점을 암시

## 코드

* 코드는 공개되어 있음
* [원서의 정오표](http://howjavascriptworks.com/erratums/) - 2020-12-01 현재 발견된 에러가 없다고 한다....
* [번역서의 정오표](https://bit.ly/33d6t0R) - 2020-12-01 2개 있음

## 다음 세대 언어

* 전 아이들이 미래라고 믿습니다. 아, 물론 로봇도요. ( 로봇 예찬론자인가..)
* 다음 프로그래밍 패러다임은 `분산 비동기 프로그래밍`
  * 기존의 패러다임은 지역적, 불안전하며, 순차적인 패러다임, Javascript도 마찬가지

## 영어 - 이 단락을 읽어보면 이 사람 성격및 고집 정도를 알 수 있다....

* (내생각) 이사람의 코딩 예제 중에 `wun` 혹은 `wunth`로 명명한 이름이 있는데 구글에 물어봐도 의미를 알기어렵다. 이 단락에 설명이 되어있다
* one → wun
  * 숫자 1에 대한 영어 단어인 one은 제가 일부러 다른 철자를 사용하고 있습니다
  * 저는 `wun`이 올바른 철자라고 생각합니다 
    * one의 발음은 그 어떤 영어 발음 방식과도 들어맞지 않습니다
    * (내생각)`원`이라는 발음에 맞춰 본인이 단어를 만든건가??? 
  * 숫자 1을 의미하는 단어가 숫자 0으로 보이는 알파벳으로 시작하는 건 버그처럼 보임
  * wun이 익숙하지 않아 불편하겠지만 불편이 잘못이 아니라는 걸 보여주기 위해 계속 사용할테니 니들이 참으셈..
* through → thru
  * through 철자는 절반이 묵음이며 언어를 배우는 학생에게 불필요한 부담을 주고 있음
  * thru가 더 낫지 않음?
  * 철자를 바꾸는 것은 전통과 이유간의 대립, 가끔 이유가 이기기도 함
  * one → wun 바꾸는 운동에 당신도 동참하길 ... (선동중임)
* 개발자와 비개발자의 차이점
  * 1 to 10?
    * 개발자 : 1 ~ 9 ( 10제외 , 0 부터 시작하는 인덱싱 버릇)
    * 일반인 : 1 ~ 10 ( 10포함 )
  * 더.크가 앞으로 사용할 지침
    * 0 to 3 = 0, 1, 2 포함 (개발자의 to 의미)
    * 0 thru 3 = 0, 1, 2, 3 포함 ( 일반인의 to 의미)

## 예제

* 정규표현식은 공백이 없어 이해하기 힘듬
* 이해를 돕기 위해 정규표현식에 공백을 추가함
* 실제 적용하려면 공백문자를 없애고 사용하셈


# {"number": 1, "chapter": "이름"}

* 모든 이름은 문자로 시작하여 문자로 끝낼것
  * _(밑줄)로 시작하는 이름은 일반적으로 public 속성이나 전역변수
    * 이런 변수는 모두 private으로 할 수 있음.
    * 앞이나 뒤에 밑줄을 쓰는 것 개발자의 무능을 의미
  * $(달러) 기호는 코드 생성기에서 사용할 목적으로 추가됨
    * 당신이 코드 생성기가 아니라면 사용하지 말것
  * 이름에 숫자가 들어가는 경우는 개발자가 이름에 대해 충분히 생각하지 않았다는 증거
    * 순서를 나타내는 서수형 변수 : thing_nr => person_one
    * 크기를 나타내는 기수형 변수 : nr_things => two_persons
  * Javascript가 위의 이름을 허용하는 것은 해서는 안될일
* 이름에 공백이 허용되어야 한다고 생각 ( 내 생각은 지금이 더 좋은듯 한데 ... keyword와 구별이 안될 수 있을듯)
  * 차선으로 단어간 연결을 _(밑줄)로 연결 ( 나중에 공백으로 바뀌면 바꾸기 더 좋기 때문에)
  * (내생각) 나는 CamelCase 파임.
* 모든 이름은 소문자로 시작해야함 - 잘 이해가 안되는 부분..
  * new 연산자 때문
  * 함수 호출문이 new로 시작하면 해당 함수는 생성자로서 호출됨. 아니면 그냥 함수로 호출
  * 생성자와 함수의 기능은 완전히 다르고 잘못 호출할 경우 문제 발생.
  * 더 안좋은 상황은 생성자와 함수는 겉보기가 같아 자동으로 감지하기가 힘듬 (JSLint같은 도구??)
  * 에러를 감지하기 위한 시작적인 표시의 제안
    > 모든 생성자 함수의 이름은 대문자로 시작되어야 하며, 그렇지 않은 모든 경우에는 소문자로 시작되어야 함
* 좀 더 믿을 만한 방법 - 극단적인 방법??
  * 절대 new를 사용하지 말것
  * new를 쓰지 않으면 대문자로 시작할 일이 없음
  * 때문에 모든 이름을 소문자로 쓸 것...

## 예약어

* 예약어는 컴퓨터 메모리가 부족하던 50~60년대의 어쩔수 없는 선택
* 현재는 의미없는 제한된 사고 방식
* 불안정한 예약어 전략은 언어에 새로운 기능을 깔끔하고 직관적으로 추가하기 어렵게 만듬
* 앞으로는 예약어 없는 언어가 개발되길..

# {"number": 2, "chapter": "숫자"}

* 자바스크립트는 숫자형이 number 하나라는 이유로 자주 비판받았습니다
  * 하지만 이는 자바스크립트의 아주 큰 강점중 하나입니다
  * 어떤 숫자형을 사용할 지 고민할 필요가 없어 생산성 증가
  * 타입 변환 오류, int형의 오버플로우 오류에서 자유로움
  * 자바의 정수보다 훨씬 안정적
    ```js
    자바스크립트 : 2147483647 + 1      // 2147483648 정확하게 맞음
    자바         : 2147483647 + 1      // -2147483648 완전히 잘못됨 
    ```
  * 위의 경우 자바는 아무런 경고없이 언제든 잘못될 수 있는 숫자 시스템임 
    * int형은 오류를 방지하지 못하며 오히려 오류를 유발함
* number는 IEEE 754 부동소수점 연산 표준을 따름 
  * IEEE 754 표준 전체가 아니라 일부분중 일부분만 사용 
  * 자바스크립트의 number는 자바의 double과 아주 밀접
    * 64비트 2진 부동소수점 타입

## 영(0)

* 0이 하나만 존재하는 것이 제대로 된 시스템
* 두 개의 0
  * 이상한 현상 : IEEE 754 표준에는 0과 -0 이라는 두 개의 0이 존재
  * 아래의 경우를 제외하면 -0의 존재를 무시해도 됨
    ```js
    (1 / 0) === (1 / -0)    // false
    Object.is(0, -0)        // false
    ```
* 0으로 무언가를 나누거나 Object.is()를 굳이 사용할 필요도 없으니 무시해도 됨

## 숫자 리터럴

* 자바스크립트에는 18437736874454810627개의 불변 숫자 객체가 내장되어 있음
  * 어떤 경우에는 딱 맞는 값이고
  * 또 어떤 경우는 9.979...e+291만큼 차이가 나기도 함
* 정수에 대한 숫자 리터럴은 연속한 10진수 숫자들
* 다음 표현은 2018이라는 숫자에 대한 참조를 생성
  * 2진수: 0b11111100010
  * 8진수: 0o3742
  * 10진수: 2018.00
  * 16진수: 0x7E2
* Infinity는 표현하기에는 너무 큰 모든 숫자
  * [Infinity, MDN](https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Infinity)
  * ∞ 와 Infinity는 같지 않다 - 자세한 내용은 [Number.POSITIVE_INFINITY](https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Number/POSITIVE_INFINITY) 참조
* NaN은 숫자가 아닌 숫자 - 'Not a Number'
  * typeof 연산자가 NaN을 "number"형으로 표시하여 혼동을 줌
  * 문자열을 숫자로 변경하려다 실패하는 경우 반환되기도 함
  * 가장 혼동을 주는 부분
    * NaN과 NaN을 동등연산자로 비교하면 항상 실패함 ( IEEE 754 때문임 )
    * 값이 NaN인지를 테스트 하려면 Number.isNaN(value)를 사용해야함
    * [Number.isFinite(value)](https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/isFinite)는 value = NaN, Infinity, -Infinity인 경우 false를 반환

## Number

* Number : 숫자를 만드는 함수
  * Number에 new를 사용하면 안됨 - 기대하는 결과가 나오지 않음
* number : 수에 대한 typeof 연산자가 반환하는 type
* 몇가지 상수
  * [Number.EPSILON](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/EPSILON)
    * 가장 작은 양수 - 이보다 작으면 0으로 취급 
  * [Number.MAX_SAFE_INTEGER](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MAX_SAFE_INTEGER)
    * 약 9천조의 값, 9007199254740991
    * +,- 로 이 값의 범위에서만 안전한 연산이 가능
    * Number.isSafeInteger(number)로 숫자의 연산안전성 확인가능
  * [Number.MAX_VALUE](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MAX_VALUE), [Number.MIN_VALUE](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MIN_VALUE)
    * 계산 결과로 Safe를 넘는 값은 안전하지 않으므로 주의해야함

## 연산자