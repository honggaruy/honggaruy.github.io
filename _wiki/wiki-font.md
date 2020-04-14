---
layout  : wiki
title   : 위키 폰트 변경  
summary :  
date    : 2020-03-30 00:43:33 +0900
updated : 2020-04-14 08:43:59 +0900
tag     : font 
toc     : true
public  : true
parent  : [[Wiki-Setting-Category]]
latex   : false
---
* TOC
{:toc}

# 1. 발단

* 위키 제목으로 쓸 아스키 아트를 만들어 봤다. 
  * 의외로 한글을 아스키 아트로 만들어주는 곳을 찾지 못해서 직접 만들어야 했다.

{% raw %}
```ascii-art
    _      _   _       _________    _     ________     _
   | |____| | | |_    |______   |  | |   |______  |,--' |
   | ,----, | | ,-'        _/ _/ ,-' |         / / '--. |
   | '----' | | |      _,-' _ \_ '-. |     ___/ / ,---' | 
   '--------' '-'     |__,-' \__|  |_|    |__,-'  '---,_|
      .---------.         .--.               ,---------┐ 
      }=======  |         |  |______         }=======  |
      |  ======={         \_________|        |  ======={  
      '---------'  단                 개     '---------' 론 
```
{% endraw %}

* 아스키 아트는 폰트의 영향을 많이 받기 때문에 폰트를 수정하는 방법을 찾아봤다.
* 폰트 수정 방법 [링크](https://frhyme.github.io/others/jekyll_korea_font_change/)
* D2Coding 웹폰트 만들어 주신 고마운분 [링크](https://wani.kr/posts/2019/05/25/d2coding-webfont/)
* 현재 폰트가 뭐지? 통화표시 W 가 안나오고 /\ 가 잘나오지만 monotype은 아닌듯..
* code block을 쓰지 않으면 깨지는 문제가 있음. 일부 문자를 markdown 표기로 인식
  * 줄간격도 좀 줄였으면 좋겠음. 
* 아스키 아트를 vimwiki 파일에서 직접 편집하면 \| 문자가 연속될 경우 표를 만드는 걸로 인식함.
  * 표 만드는 걸로 인식하면 자간이 전부 틀어짐.
  * txt 확장자에서 편집하여 그대로 복사하는 방식으로 편집중.. 

