---
layout  : wiki
title   : vim 기초 사용법 
summary : 매번 잊어버려서 참고할 장소를 만들었다.
date    : 2021-05-19 14:24:31 +0900
updated : 2021-05-20 00:13:14 +0900
tag     : vim hlghlight unimpared 
toc     : true
public  : true
parent  : [[Vim-Category]] 
latex   : false
---
* TOC
{:toc}

# Tip 1. `hightlight search` 끄기

* #hightlight, #unimpared
 
## 문제 상황

* vim에서 특정 단어 위에서 `*`을 하거나 serach를 하게되면 찾은단어에 highlight 색상이 표기된다.
* 찾은 목적이 완료된 뒤에 highlight가 너무 눈에 튀어 끄고 싶을 때 어떻게 하지?

## 관련 링크

* [Vim clear last search hightlighting - stackoverflow](https://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting)

## plugin이 설치되지 않은 vim에서의 해결책

* 다음번 서치까지 highlight를 끄고자 할 때
  ```
  :noh
  ```
* hightlight 기능을 완전히 끄고 싶을 때
  ```
  set nohlsearch
  ```
* 토글하려면 ( <kbd>F3</kbd> 키에 할당한 예제 )
  ```
  set hlsearch!
  nnoremap <F3> :set hlsearch!<CR>
  ```
  
## plugin이 설치된 상태일때

* 관련 답변 링크: [there are two `must have` plugins for this:](https://stackoverflow.com/a/35982459/9457247)
* 나는 [`unimpared`](https://github.com/tpope/vim-unimpaired)를 설치했기 때문에...
  * `[oh` - `:set hlsearch` 
  * `]oh` - `:set nohlsearch` 
  * `yoh` - `hlsearch` 토글 ( 위 답변에는 `coh`로 되어있지만, 최근 버전에서  댓글과 같이 `yoh`로 변경됨 )
