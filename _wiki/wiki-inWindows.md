---
layout  : wiki
title   : 윈도우즈에서 V+J+G 따라하기
summary :  
date    : 2020-04-13 21:02:43 +0900
updated : 2020-04-13 22:32:10 +0900
tag     :  
toc     : true
public  : true
parent  : [[Wiki-Setting-Category]]  
latex   : false
---
* TOC
{:toc}

# 1. 개요

* 이 사이트는 **기계인간 John Grib** 님의 포스팅을 보고 거의 그대로 따라한 사이트이다.
  * 포스팅링크 : [Vimwiki + Jekyll + Github.io로 나만의 위키를 만들자](https://johngrib.github.io/wiki/my-wiki/)
* 다만, johngrib님이 windows를 사용하지 않고 있어 windows에서 따라 했던 내가 겪은 경험을 남기고자 한다.
* 생각나는 대로 적어 순서가 뒤죽박죽이다. 쓰다보면 정리될 것 같다.
* 제목대로 윈도우즈로 할때 달라지는 점만 적을 예정이다.

# 2. 전개

## 위키 작성 환경 관련

* 로컬에 필수적으로 설치해야 하는 도구들
  * git for windows
  * jekyll을 설치하기 위해 설치 해야하는 것들
    * 로컬에서 확인하지 않고 올렸다가 github에서 에러나는 경우가 있다. 로컬 jekyll 환경은 필수다.
  
### git 

* windows에서 git을 쓴다면 git for windows를 쓸거라고 생각한다.
* git for windows는 bash를 지원하기 때문에 가끔 사용되는 linux 명령어들에 막히지 않을수 있다. 

* git mergetool로 diffmerge를 사용중인데 merge할 때 특정 경우 돌발행동을 한다.
* merge conflict가 발생할때 deleted, created, modified로 나뉜다.
  * modified conflict일 경우 원래 utf8이면, 수동 merge가 끝나고 그대로 utf8로 저장이 된다.
  * 문제는 created conflict일 경우인데.. 
    * 현재 파일이 있는데도 왜 created로 confilct가 나는지 모르겠지만..
    * git merge 표기가 기록된 파일이 utf8인데.. Diffmerge로 수동 머지 되면서.. 
    * utf8 이었던 문서가 저장되며 cp949로 변경되는 문제가 있다.
* 이때 jekyll에서 어디선가 지정되어서 그렇겠지만 해당 파일을 UTF-8로 생각하다가 갑자기 cp949를 얻어맞고 에러가 날때가 있다
![파일인코딩에러]( /wiki-img/wiki-inWindows/error_encoding.png )
* diffmerge의 문제가 맞긴한데 해당 문제를 해결할 수 있는 diffmerge 설정은 아직 못 찾았다.
* 어찌할 방법이 없어서 파일 인코딩을 변경하여 저장할수 있는 gvim 명령어를 알아두는 것이 좋다. [링크](https://kldp.org/node/32987)
```vim
:set fileencoding=utf8
```

