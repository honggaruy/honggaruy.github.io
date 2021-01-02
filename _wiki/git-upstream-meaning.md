---
layout  : wiki
title   : Git에서 upstream의 의미  
summary : 매뉴얼 원본 해석에 중요함 
date    : 2020-12-26 09:33:38 +0900
updated : 2020-12-26 11:29:49 +0900
tag     : git upstream 
toc     : true
public  : true
parent  : [[Git-Category]] 
latex   : false
---
* TOC
{:toc}

# 1. 발단

* github에서 처음 리포지토리를 만들 때 다음과 같이 명령어를 추천한다
  ```sh
  > git remote add origin <github 프로젝트 url>
  > git branch -M main
  > git push -u origin main
  ```
* 세번째 push 할 때 `-u` 옵션을 붙이는 것은 이후 명령어 수행시 보통 인자를 생략하기 위함으로 설명한다
  * [git push 사용법팁 > 인자 생략하기 1](https://www.daleseo.com/git-push/#인자-생략-하기-1)
* 좀 더 자세히 설명한 내용도 있지만 ...
  * [git push -u 옵션 사용 이유](https://wotres.tistory.com/entry/git-push-u-옵션-사용-이유)
* 확실히 알아보기 위해 원본 매뉴얼을 찾아봤다
  * [git push doc, git-scm.com](https://git-scm.com/docs/git-push#Documentation/git-push.txt--u)
    > -u <br> --set-**upstream**<br> For every branch that is up to date or successfully pushed, add **upstream** (tracking) reference, used by argument-less git-pull[1]and other commands. For more information, see branch.<name>.merge in git-config[1].
* ... **upstream** 의 의미가 생소해 해석이 잘 안된다. 좀더 알아보자
    
# 2. 전개

## stackoverflow 질문/답변 분석

* [Definition of "downstream" and "upstrea", stackoveflow](https://stackoverflow.com/q/2739376/9457247) - 10년 8개월전에 물어본 질문이 있다. 정확히 내가 가려운 부분을 질문했다.

### 질문자가 고른 답변 , 734 star

* source control 분야에서 "downstream"
  * repository로 부터 `copy`를 할 때, 즉 clone, checkout 등등을 할 때를 의미
  * information이 "downstream"(하류 방향으로, 즉 나에게로) 흐른다는 의미
* 당신이 소스코드를 변경한 후에는 "**upstream**"으로 다시 보낸다
  * 다른 사람도 upstream으로 부터 당신의 변경사항을 받을 수 있도록..
* 개발 업계에서 배포 담당자가 "upstream"으로 변경사항을 제출하라고 하는 것을 종종 들을 수 있다
* 답변자의 댓글중에 `porcelain`이란 단어가 나온다. 사전상으로는 `도자기`로 번역되는데..`jargon`(은어)였다
  * [What does the term "porcelain" mean in Git 답변](https://stackoverflow.com/a/6976506/9457247)
    * 욕실에는 `porcealain`(자기로 만든것, 세면대, 변기)과 `plumbing` 배관시설이 있다.
    * 사실 실제로 꼭 필요한 역할을 하는것은 배관이며 
    * porcelain은 단지 사용자가 이용하기 편하게 해주는 인터페이스이다
    * 즉, 배관시설은 꼭 있어야할 필수적인 요소이지만 ...
      * `porcelain`은 없더라도 배관시설로 잘 골인 시킬수 있게 기술?이 좋던지 다른 도구를 쓰든지 하면되는것이다
    * 추가적으로 이것까지 보면 이해가 갈것이다. [Porcelain in "deserve to be called porcelain"](https://ell.stackexchange.com/questions/212110/procelain-in-deserve-to-be-called-porcelains?newreg=880279904cdd4f72bfd4630917d24aef)
    * git은 일반적인 사용자가 직접사용할 필요가 없는 [`plumbing`에 해당하는 low-level 명령](http://schacon.github.io/git/git.html#_low_level_commands_plumbing)과 ..
      * 거의 변경되지 않고 안정적이라 scipting에 주로 사용되며
    * 일반적인 사용자가 주로 사용하는 [`porcelain`에 해당하는 high-level 명령](http://schacon.github.io/git/git.html#_high_level_commands_porcelain)이 있다
      * 버전업에 따로 종종 변경되기 때문에 scripting 에 사용하기에 위험하다
    * git의 명령어는 묘하게 화장실이 연상이 되는게 많다..(git flush, git push,... ). 위 질문 댓글로도 그렇게 연상하는 사람이 많은듯 하다..
