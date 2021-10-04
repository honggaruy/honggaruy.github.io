---
layout  : wiki
title   : 구글 캘린더 flair 한글 키워드 목록 
summary : 구글 캘린더 일정 배경 이미지 
date    : 2021-09-28 15:45:32 +0900
updated : 2021-10-03 14:14:03 +0900
tag     : google-calendar
toc     : true
public  : true
parent  : [[Gray-Category]]
latex   : false
---
* TOC
{:toc}

# 1. 배경

## Google Calendar 의 `flair`란 ?

* 구글 캘린더 일정을 등록하다보면 특정 keyword 입력시 배경 이미지가 자동으로 생긴다
* 예를 들어, `커피` 라는 keyword가 인식되면 다음과 같은 그림이 나온다
  * ![커피 타임](https://cdn.clien.net/web/api/file/F01/12044357/158ce52fe87900.png?w=780&h=30000)
* 해당 keyword는 space로 분리 되어 있어야 한다.
  * 분리되지 않으면 아래와 같이 인식되지 않는다
  ![커피타임](https://cdn.clien.net/web/api/file/F01/12044358/158e7d15bb95fc.png?w=780&h=30000)
* [구글링 해보니](https://webapps.stackexchange.com/a/119526)
  * 이 기능은 `Flairs`라고 불리는 기능이다
  * 브라우저에서 사용하는 언어에 따라 반응하는 keyword가 달라진다 (영어 keyword != 한글 keyword)

## 반응하는 `한글` keyword의 목록을 찾을 수 있을까?

* 공식적인 keyword 목록이 있는지 찾아봤는데..
  * [이 답변을 보면 없는 것 같다](https://support.google.com/calendar/thread/1750871/is-there-a-list-of-words-that-trigger-the-background-illustrations?hl=en)
* 영문 목록은 개인이 발굴한 것 처럼 보이는 [목록](https://www.quora.com/What-are-all-the-keywords-for-the-new-Google-Calendar-Android-app-that-will-generate-those-beautiful-images-in-the-agenda-view)이 [몆군데](http://www.internetbestsecrets.com/2019/09/google-calendar-event-images.html)에 [있는 것](https://github.com/mifran/google-calendar-image-keyword) 같은데
  * 목록을 보니 소스가 한 곳인 것처럼 보인다( 서로 크게 다르지 않음) 
* 한글 keyword 목록은 찾지 못하여 일단 내가 영문 목록을 참고하여 만들어 봤다
  * 혹시 틀린 부분이나 추가할 용어가 있다면 알려주시면 고맙겠다 

# 2. 내용

## 주의 사항

* 키워드는 다른 단어와 space로 분리되어야 함
  * 분리된 키워드가 인식된다면 키워드가 아닌 제목의 다른 부분은 어떤 단어든 상관 없음 
* 아래의 카테고리는 Official한 건 아니고 내가 임의로 나눈것임
* 우세한 키워드가 있음
  * 예를 들어, `아침`과 `조깅`은 모두 동작하는 키워드인데 각각 그림이 다르다
  * 일정 제목을 `아침 조깅` `조깅 아침`으로 설정할 경우 모두 `아침` 그림이 나온다
* 아래 표 기호 표기 의미
  * `()` : 추가(insert) 가능, 문장일 경우 단순 설명일수도 있음
  * `[]` : 앞 단어와 대체 가능,
  * `,` 분리자로 여러가지 경우를 넣을수 있음
  * 단어 순서만 맞아도 그림이 나올수 있으나 space도 정확히 지키는 것이 좋음
* 영문 키워드 소스
  * 여기에 적을 것 
    
## 구글 캘린더 flair 한글 키워드 목록 {#flair-korean-keywords}

<style>
.keywordtable td:nth-last-child(3) { color: Teal; background: LightGreen; }
.keywordtable td:nth-last-child(2) { color: FireBrick; background: LightPink; }
</style>

{: .keywordtable}
| 카테고리     | 동작 키워드                                                               | 동작하지 않는 키워드                                                     | 그림 ( 구글 캘린더에서는 그림이 좌우 반전됨 )                                                           |
| :--          | :--                                                                       | :--                                                                      | :--                                                                                                     |
| 기념일, 날짜 | 새해                                                                      | 뉴이어                                                                   | ![새해](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_genericnewyear_1x.jpg)        |
| ^^           | 구정                                                                      | 설날, 중국새해                                                           | ![구정](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_chinesenewyear_1x.jpg)        |
| ^^           | 발렌타인데이, 발렌타인 데이                                               |                                                                          | ![발렌타인](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_valentinesday_1x.jpg)     |
| ^^           | 할로윈                                                                    | 만성절                                                                   | ![할로윈](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_halloween_1x.jpg)           |
| ^^           | 추수감사절                                                                | 추수 감사절, 부활절, 추석                                                | ![추수감사절](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_thanksgiving_1x.jpg)    |
| ^^           | 크리스마스, x[X]마스,x[X]-마스                                            | 성탄, 성탄절, 석가탄신일, 부처님 오신날, X-Mas                           | ![크리스마스](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_xmas_1x.jpg)            |
| ^^           | 크리스마스 브런치                                                         | 크리스마스 아침, ~ 점심, ~ 저녁 (`크리스마스 그림과 동일`)               | ![크리스마스 브런치](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_xmasmeal_1x.jpg) |
| ^^           | 크리스마스 (이브) 파티                                                    | 파티                                                                     | ![크리스마스 파티](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_xmasparty_1x.jpg)  |
| ^^           | 주 계획, 주간 계획, 분기 계획                                             | 계획, 일정, 일[일간,주,주간,월,월간,연,년,연간,휴가] 계획                | ![주 계획](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_planmyday_1x.jpg)          |
| ^^           | 졸업                                                                      | 졸업식                                                                   | ![졸업](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_graduation_1x.jpg)            |
| ^^           | 결혼, 결혼식                                                              | 약혼, 상견례                                                             | ![결혼](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_wedding_1x.jpg)               |
| ^^           | 레즈비언 퍼레이드, 게이 퍼레이드                                          | 퀴어 퍼레이드, 프라이드 퍼레이드, 성소수자 퍼레이드                      | ![레즈비언 퍼레이드](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_pride_1x.jpg)    |
| 일상, 식사   | 커피                                                                      | 커피타임                                                                 | ![커피](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_coffee_1x.jpg)                |
| ^^           | 아침, 브런치                                                              | 아침식사, 식사                                                           | ![아침](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_breakfast_1x.jpg)             |
| ^^           | 점심                                                                      | 런치                                                                     | ![점심](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_lunch_1x.jpg)                 |
| ^^           | 저녁, 가족 식사, 레스토랑                                                 | 디너, 고급식당                                                           | ![저녁](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_dinner_1x.jpg)                |
| ^^           | 바베큐, BBQ                                                               | 비비큐                                                                   | ![바베큐](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_bbq_1x.jpg)                 |
| ^^           | 술, 칵테일                                                                | 와인, 위스키, 샴페인, 소주                                               | ![술](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_drinks_1x.jpg)                  |
| ^^           | 맥주, 비어, 옥토버페스트                                                  | 호프                                                                     | ![맥주](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_beer_1x.jpg)                  |
| ^^           | 요리                                                                      | 쿠킹, 음식, 푸드                                                         | ![요리](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_cooking_1x.jpg)               |
| 일상, 활동   | 정리                                                                      | 청소                                                                     | ![정리](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_clean_1x.jpg)                 |
| ^^           | 연락하기, 편지쓰기, 초대장 보내기                                         | 연락, 편지, 편지 쓰기, 초대장, 초대장보내기                              | ![연락하기](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_reachout_1x.jpg )         |
| ^^           | 독서                                                                      | 책, 도서, 도서관                                                         | ![독서](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_bookclub_1x.jpg)              |
| ^^           | 신문                                                                      | 뉴스, 뉴스페이퍼                                                         | ![신문](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_read_1x.jpg)                  |
| ^^           | 헤어컷                                                                    | 헤어 컷, 헤어 커트, 헤어, 커트, 이발, 이발소, 미장, 미장원, 미용, 미용실 | ![헤어컷](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_haircut_1x.jpg)             |
| ^^           | 네일, 페디큐어                                                            | 손톱, 손톱 관리                                                          | ![네일](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_manicure_1x.jpg)              |
| ^^           | 보드게임, 보드 게임                                                       | 보드, 게임                                                               | ![보드게임](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_gamenight_1x.jpg)         |
| ^^           | 영어 수업, 프랑스어 수업, ... , 영어 연습, ...                            | 영어, 프랑스어, 수업, 연습, 없는어 수업, 아무거나 연습                   | ![영어 수업](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_learnlanguage_1x.jpg)    |
| ^^           | 코딩 시간, 웹 개발, C 코딩 시간                                           | 개발, 코딩, C 코딩,                                                      | ![코딩 시간](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_code_1x.jpg)             |
| ^^           | 컴퓨터 과학, 해커톤                                                       | 과학                                                                     | ![코딩 시간](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_code_1x.jpg)             |
| ^^           | 파이썬 프로그래밍, 자바 프로그래밍, ...                                   | 프로그래밍, C 프로그래밍, 자바스크립트 프로그래밍                        | ![코딩 시간](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_code_1x.jpg)             |
| 일상, 건강   | 치과                                                                      | 양치, 양치질, 치료, 수술, 병원                                           | ![치과](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_dentist_1x.jpg)               |
| ^^           | 마사지                                                                    | 맛사지                                                                   | ![마사지](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_massage_1x.jpg)             |
| 일상, 수리   | 자동차 수리                                                               | 자동차                                                                   | ![자동차 수리](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_carmaintenance_1x.jpg) |
| ^^           | 자동차 서비스, 오일 교환                                                  | 오일, 교환, 자동차서비스                                                 | ![오일 교환](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_oilchange_1x.jpg)        |
| ^^           | diy, DIY, 냉장고 수리, 수리공, 전기 기사, 배관공                          | 수리, 하수도 수리, 기술자, 엔지니어                                      | ![DIY](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_repair_1x.jpg)                 |
| 운동, 맨몸   | 운동, 체육관                                                              | 헬스, 짐                                                                 | ![운동](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_gym_1x.jpg)                   |
| ^^           | 요가                                                                      | 스트레칭                                                                 | ![요가](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_yoga_1x.jpg)                  |
| ^^           | 조깅                                                                      | 달리기                                                                   | ![조깅](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_running_1x.jpg)               |
| ^^           | 걷기                                                                      | 워킹                                                                     | ![걷기](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_walk_1x.jpg)                  |
| ^^           | 수영, 헤엄, 다이빙                                                        | 스위밍, 풀장, 미역                                                       | ![수영](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_swimming_1x.jpg)              |
| ^^           | 댄스, 춤, 발레                                                            | 댄싱, 디스코                                                             | ![댄스](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_dancing_1x.jpg)               |
| 운동, 무술   | 태권도, 유도, 가라데, 무술                                                | 격투기                                                                   | ![태권도](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_karate_1x.jpg)              |
| ^^           | 권투                                                                      | 복싱                                                                     | ![권투](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_boxing_1x.jpg)                |
| ^^           | 레슬링                                                                    | 씨름                                                                     | ![레슬링](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_wrestling_1x.jpg)           |
| ^^           | 펜싱                                                                      | 검도                                                                     | ![펜싱](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_fencing_1x.jpg)               |
| ^^           | 양궁                                                                      | 사격, 활                                                                 | ![양궁](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_archery_1x.jpg)               |
| 운동, 장비   | 등산                                                                      | 산, 등반, 암벽                                                           | ![등산](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_climbing_1x.jpg)              |
| ^^           | 승마, 말타기                                                              | 말달리기                                                                 | ![승마](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_equestrian_1x.jpg)            |
| ^^           | 하이킹                                                                    | 도보여행                                                                 | ![하이킹](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_hiking_1x.jpg)              |
| ^^           | 스키, 스노우보딩                                                          | 스킹, 스노우보드, 스키장                                                 | ![스키](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_skiing2_1x.jpg)               |
| ^^           | 카약, 카누                                                                |                                                                          | ![카약](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_kayaking_1x.jpg)              |
| ^^           | 조정                                                                      |                                                                          | ![조정](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_rowing_1x.jpg)                |
| ^^           | 항해, 세일링                                                              | 선박, 드라이브(빙), 운전                                                 | ![항해](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_sailing_1x.jpg)               |
| ^^           | 사이클링, 바이크, 바이킹, 자전거, 산악자전거                              | 로드, 엠티비, 오토바이, 오토바이크, 모터사이클                           | ![사이클링](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_cycling_1x.jpg)           |
| ^^           | 캠핑                                                                      | 야영                                                                     | ![캠핑](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_camping_1x.jpg)               |
| 운동, 구기   | 축구                                                                      | 사커                                                                     | ![축구](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_soccer_1x.jpg)                |
| ^^           | 풋볼, 미식 축구                                                           | 미식풋볼, 미식축구                                                       | ![풋볼](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_americanfootball_1x.jpg)      |
| ^^           | 럭비                                                                      |                                                                          | ![럭비](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_rugbysevens_1x.jpg)           |
| ^^           | 야구                                                                      | 베이스볼                                                                 | ![야구](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_baseball_1x.jpg)              |
| ^^           | 농구                                                                      | 바스켓볼                                                                 | ![농구](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_basketball_1x.jpg)            |
| ^^           | 배구                                                                      | 발리볼                                                                   | ![배구](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_volleyball_1x.jpg)            |
| ^^           | 핸드볼                                                                    |                                                                          | ![핸드볼](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_handball_1x.jpg)            |
| ^^           | 수구                                                                      |                                                                          | ![수구](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_waterpolo_1x.jpg)             |
| ^^           | 당구                                                                      | 빌리어드                                                                 | ![당구](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_billiard_1x.jpg)              |
| ^^           | 탁구, 핑퐁                                                                |                                                                          | ![탁구](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_pingpong_1x.jpg)              |
| ^^           | 볼링                                                                      |                                                                          | ![볼링](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_bowling_1x.jpg)               |
| ^^           | 골프                                                                      |                                                                          | ![골프](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_golf_1x.jpg)                  |
| ^^           | 테니스                                                                    | 정구                                                                     | ![테니스](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_tennis_1x.jpg)              |
| ^^           | 배드민턴                                                                  | 셔틀콕                                                                   | ![배드민턴](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_badminton_1x.jpg)         |
| ^^           | 필드 하키                                                                 | 필드하키, 아이스 하키                                                    | ![필드 하키](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_fieldhockey_1x.jpg)      |
| 문화, 예술   | 그림, 미술                                                                | 아트, 그리기, 드로잉, 스케치                                             | ![그림](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_art_1x.jpg)                   |
| ^^           | 영화, 시네마                                                              | 무비                                                                     | ![영화](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_cinema_1x.jpg)                |
| ^^           | 노래, 피아노, 트럼펫, 첼로, 코르넷, 콘트라베이스, 오케스트라, 기타 수업   | 음악, 뮤직, 연주, 기타                                                   | ![오케스트라](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_learninstrument_1x.jpg) |
| ^^           | 바이올린                                                                  | 바이얼린, 비올라                                                         | ![바이올린](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_violin2_1x.jpg)           |
| ^^           | 콘서트                                                                    | 음악회                                                                   | ![콘서트](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_concert_1x.jpg)             |
| ^^           | 오페라, 극장                                                              | 뮤지컬                                                                   | ![오페라](https://ssl.gstatic.com/calendar/images/eventillustrations/v1/img_theatreopera_1x.jpg)        |

