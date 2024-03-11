---
layout  : wiki
title   : vim 기초 사용법 
summary : 될 수 있으면 vanilla vim에서도 되는 것들로 채운다 
date    : 2021-05-19 14:24:31 +0900
updated : 2024-03-11 22:43:01 +0900
tag     : vim hlghlight unimpared 
toc     : true
public  : true
parent  : [[Vim-Category]] 
latex   : false
---
* TOC
{:toc}

- 매번 잊어버려서 참고할 장소를 만들었다

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

# Tip 2. Blank line (빈 줄)간에 이동하고 싶을 때는 어떻게 ?

## 문제 상황

* 여러 Paragraph로 나뉜 함수 바디를 한덩이로 뭉쳐 선택해서 옮기고 싶다.
  * 그러러면, 함수 바디 내에서 blank line 사이를 뛰어 다니며 제거 해야 하는데..
  * 빈 줄에서 빈 줄로 뛰는 vim 명령은?
* 한덩이로 뭉쳐있으면 `vip` 명령으로 쉽게 선택하고 마음대로 할 수 있는데..

## 관련 링크

* [Vim - navigate between paragraphs by blank lines, stackexchange / Unix & Linux](https://unix.stackexchange.com/a/232093)
* [cursor motions or navigation, vimhelp.org](https://vimhelp.org/motion.txt.html#navigation)
  * [5. Text object motions, vimhelp.org](https://vimhelp.org/motion.txt.html#object-motions)

## 해결책

* `{` : paragraphs backward
* `}` : paragraphs forward

# Tip 3. vim help 사용방법

## 문제 상황

* vim help안에서 navigation 하는 방법을 많이 까먹는다

## 관련 링크

* [Learn to use help, Vim Tips Wiki](https://vim.fandom.com/wiki/Learn_to_use_help)

## 해결책

### help 진입및 탈출 방법

* 명령줄에서 `:help`를 입력
  * 별도 창이 `horizontal`로 열리면서 커서 이동
  * `:q` 명령으로 창도 닫고 원래 편집점으로 이동
  * `:help` 대신 `:h`으로 해도 동작한다
* 명령줄에서 `:help pattern`으로 특정 토픽으로 이동
  * 플러그인 설명을 보고 싶으면 pattern에 플러그인 이름을 넣는다 
  * `:help pattern` 대신 `:h pattern`으로 해도 동작한다

### Link 이동

* `/quick`을 type 하면 "quickref" 링크를 search한다 
* 해당 링크위에서 <kbd>Ctrl</kbd> + <kbd>]</kbd>를 클릭하면 **quickref** 토픽으로 이동한다
* 해당 토픽을 모두 리뷰한 뒤, <kbd>Ctrl</kbd> + <kbd>t</kbd>를 클릭하면 이전 토픽으로 복귀한다
* <kbd>Ctrl</kbd> + <kbd>o</kbd>를 눌러서 help history 상의 older location으로..
* <kbd>Ctrl</kbd> + <kbd>i</kbd>를 눌러서 help history 상의 newer location으로 이동할 수 있다

###  help 검색

* 기본적인 검색은  `/` 명령으로 일반 파일에서 검색하듯이 검색하면 된다
* `:helpgrep` 명령으로 모든 help 파일을 검색할수 있다
  * 예를 들면
    ```vimscript
    :helpgrep \csearch.\{,12}file
    ```
    * `\c` 는 pattern에 대해 case insensitvie 옵션을 선택함을 의미한다
    * 위 패턴은 "search"를 찾은 후 12 문자 이내에 "file"이 따라오는 패턴을 찾는것이다
  * 결과가 나온 이후에 다음 명령으로 결과간 navigation이 가능하다
    * `:cnext`  : 다음 매칭 결과 
    * `:cprev`  : 이전 매칭 결과
    * `:cnfile` : 다음 파일의 매칭 결과  
    * `:cpfile` : 이전 파일의 매칭 결과 
    * `:cfirst` : 첫번째 매칭 결과 
    * `:clast`  : 마지막 매칭 결과
    * `:cc`  : 헬프파일 브라우징중에 현재 매칭 결과 링크로 복귀
    * `:copen`  : 모든 매칭 결과의 링크를 별도 창으로 띄움 ( 해당 창을 네이비게이션 하면서 링크에서 엔터하면 별도 헬프창을 띄움) 

### Context

* 찾고 싶은 토픽별로 사용하는 기호가 있다
 
  | prefix | Example       | Context                                          |
  | :--    | :--           | :--                                              |
  | `∶`    | `∶h ∶r`       | ex 명령[^excommand] 에 대한 help를 찾고 싶을 때  |
  | none   | `∶h r`        | normal mode                                      |
  | `v_`   | `∶h v_r`      | visula mode 관련 토픽                            |
  | `i_`   | `∶h i_ctrl-w` | insert mode 관련 토픽                            |
  | `c_`   | `∶h c_ctrl-r` | ex 명령줄 관련 토픽                              |
  | `/`    | `∶h /\r`      | 찾는 패턴 (이 경우엔 `∶h \r` 또한 동작함)        |
  | `'`    | `∶h 'ro'`     | option 관련 토픽                                 |
  | `-`    | `∶h -r`       | (Vim 을 시작할때) Vim argument 관련 토픽         |

* 가끔 특정 control key가 Vim에서 어떤 의미를 가지는지 알고 싶을 때가 있다
  * 예를 들면, "ctrl-r"을 포함하는 모든 help 토픽을 보려고 할 때
  * `:h ctrl-r`을 type하고 <kbd>Ctrl</kbd> + <kbd>d</kbd>를 누른다
  * 아래 표는 서로 다른 context에서 다양한 key를 누를때의 help를 보여준다
   
    | Example       | Help for key           |
    | :--           | :--                    |
    | `∶h ctrl-r`   | Ctrl-R in normal mode  |
    | `∶h i_ctrl-r` | Ctrl-R in insert mode  |
    | `∶h c_ctrl-r` | Ctrl-R in command mode |
    | `∶h v_ctrl-v` | Ctrl-V in visual mode  |
  

# Tip 4. 여러줄 앞에 동일한 문구를 넣고 싶을 때

- 관련링크 : [Insert the same chars across multiple lines, SO](https://stackoverflow.com/a/9549765/9457247)

![vim multi cursor](https://i.stack.imgur.com/T1WBi.gif)

> 1. 커서를 맨 첫번째 줄 첫번째 컬럼에 둔다
> 1. visula block mode로 들어간다 ( <kbd>ctrl</kbd>+<kbd>v</kbd>)
> 1. Relative Line number를 이용하여 커서를 목표지점까지 내린다 ( <kbd>3</kbd><kbd>j</kbd>)
> 1. 대문자 <kbd>I</kbd>를 누른다
> 1. 넣고싶은 문구를 넣는다. ( 화면에서는 첫줄만 바뀌지만 다음단계에서 'Esc'를 누르면 전체 반영된다)
> 1. <kbd>Esc</kbd>를 누른다 
>

# Tip 5. gVim에서 menu & toolbar를 숨기고 싶을 때 

![vim menu toolbar](https://i.stack.imgur.com/ImpLH.png)

- 관련링크 
  - [How to hide the menu/tool bar of gvim, SO](https://i.stack.imgur.com/ImpLH.png)
  - [Hide toolbar ro menus to see more text, VTW](https://vim.fandom.com/wiki/Hide_toolbar_or_menus_to_see_more_text)

```vim
:set go-=m  "menu bar 
:set go-=T  "toolbar 
:set go-=r  "scrollbar 
```
- 'go'는 'guioptions' 의 abbreviation이다
- 다시 보이고 싶으면 '-='를 '+='로 변경한다 

# Tip 6. 문서에서 공백문자를 보고 싶을 때

- 공백이 tab문자인지, space인지 알고 싶을때 사용
- 관련링크
    - [Vim 공백 문자 조작 설정, johngrib.github.io](https://johngrib.github.io/wiki/vim/set-empty-chars/)
    - [Highlight unwanted spaces, vim.fandom.com](https://vim.fandom.com/wiki/Highlight_unwanted_spaces)
- 주요명령은 `set list`, `set nolist`인데 

---

[^excommand]: colon으로 시작하는 명령
