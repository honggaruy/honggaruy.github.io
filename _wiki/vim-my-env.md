---
layout  : wiki
title   : 나의 vim 환경 
summary : 오래 안쓰면 까먹는 경향이 있음 
date    : 2022-01-14 18:42:03 +0900
updated : 2023-05-30 14:00:10 +0900
tag     : vim vimrc 
toc     : true
public  : true
parent  : [[Vim-Category]] 
latex   : false
---
* TOC
{:toc}

# 개요

* 현재 구축해놓은 vim 환경이 가끔 낯설 때가 있다.
* 내 vim 환경과 내가 좀 더 친해지길 바라며 작성한다

# vim 설정

## vimrc 관련

### vimrc 위치 

* 참고 링크 : [ Location of vimrc, vim.fandom.com](https://vim.fandom.com/wiki/Open_vimrc_file#Location_of_vimrc)
* 보통 Home directory에 위치한다 (windows : `$HOME`, linux : `~` )
* vim 실행후 아래 명령으로 vimrc 위치확인이 가능하다
  ```vim
  :version
  :echo expand('~')
  :echo $HOME
  :echo $VIM
  :echo $VIMRUNTIME
  ```
* 실제 파일 위치는 ...
  * repositoy/dotfiles github 프로젝트로 관리되며 
  * .ps1 파일 실행시 자동으로 $HOME 디렉토리는 Symlink설정된다
  
### vimrc 내의 폴더 설정

* Winodw와 linux 에서 동일한 .vimrc를 사용하기 위해 다음과 같이 설정한다
* .vimrc 내의 `Windows Compatible` 섹션에 다음과 같이 설정되어있다
  ```vim
  if WINDOWS()
      set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
      " set `.vim` directory as pack repo instead of `vimfiles`
      set packpath^=~/.vim
  endif
  ```

## .vim 폴더

### 개념

- 다음과 같은 의문이 있을 수 있다
  > HDD에 `vim72`와 `vimfiles`와 같은 유사한 directories가 있다. 차이가 뭔가? plugin은 어디에 설치하나?
    - 위 질문은 [실제 stack overflow의 질문](https://stackoverflow.com/q/851133/9457247) 이다
- 위 질문의 답변에서 다음 사항을 알 수 있다
  - vim72 는 runtime 이 들어있는 경로이자 vim 배포시 결정되는 `default` 설정이 들어가는 경로
    - vim이 설치될 때 vim의 실행 파일및 default 설정 파일들이 설치되는 경로이다 
    - vim 실행모드에서 `:echo $VIMRUNTIMe` 해보면 이 경로가 출력된다
    - 이 사이트에서 설명이 잘되어있다
      - [What' the Vim Runtime? A Guide with Examples](https://thevaluable.dev/vim-runtime-guide-example/) 
  - vimfiles 는 `custom` 설정이 들어가는 경로
  - `vimfiles`는 윈도우상의 경로 이름이며 리눅스에서는 이름이 다르다. 즉 `.vim`이다

### 윈도우 환경이지만 `~/.vim` vim pack repo를 사용중

* 보통 linux 에서는 vim script 폴더로 `~/.vim`을 쓰고 windows 에서는 `$HOME/vimfiles/`를 사용함
