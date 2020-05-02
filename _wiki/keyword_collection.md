---
layout  : wiki
title   : 용어 설명 모음 
summary : 아직 안정함  
date    : 2020-04-27 11:15:09 +0900
updated : 2020-04-27 11:43:10 +0900
tag     : keyword 
toc     : true
public  : true
parent  : [[Gray-Category]] 
latex   : false
---
* TOC
{:toc}

# H로 시작

## Hash

### 관련 링크
* [해시와 해시함수가 뭔지 알아보자](https://steemit.com/kr/@twinbraid/4yjj7b): 쉬운 설명 버전
* [해시, 해시넷설명](http://wiki.hash.kr/index.php/%ED%95%B4%EC%8B%9C): 딱딱하지만 정확한 설명 버전

### 실제 사용례

* 이 [답변](https://stackoverflow.com/a/49265306/9457247)은 엑셀파일을 구글시트로 변환하는 과정에서 구현된 코드를 설명하고 있다. 코드 주석중 두번째 문단 첫번째 줄에 다음과 같이 써있다.

> Index the filenames of owned Google Sheets files as object keys (which are **hashed**). This avoids needing to search and do multiple string comparisons. 

  * 위 줄은 다음 코드를 설명하는 글이다
  ```js
  var gsi = dest.getFilesByType(MimeType.GOOGLE_SHEET), gsNames = {};
  ```
  * 구글 드라이브 상에서 파일이름은 `16K05RlmkOiUvo0MPleXWjdpCMsAUOf8` 이런식으로 일정한 길이를 갖지만 알수없는 내용의 `id`코드를 부여받는다. 이 id로 특정파일을 정확하게 지정할 수 있다. 이것을 **hashed** 되었다고 지칭하는 듯??
  * hash 특성으로 검색없이 즉시 저장하거나 찾고자하는 위치를 참조할 수 있다고 하는데 위 인용의 두번째 문장에서 그런 특성을 설명하고 있다.
