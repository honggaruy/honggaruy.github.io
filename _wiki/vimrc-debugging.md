---
layout  : wiki
title   : vimrc 디버깅하기 
summary : vimrc가 생각대로 동작안할때..
date    : 2022-12-28 15:38:19 +0900
updated : 2022-12-28 16:33:29 +0900
tag     : vimrc
toc     : true
public  : true
parent  : [[Vimrc-Category]]
latex   : false
fontawe : false
---
* TOC
{:toc}

# 1. 개요

- 다른 컴퓨터에서 dotfiles에 포함된 vimrc가 동작하지 않는다
- 찾아보니 아래와 같은 좋은 글이 있어 번역정리했다
- 링크 : [Debugging your vim config, vimways.org](https://vimways.org/2018/debugging-your-vim-config/)

# 2. 내용

## 번역중 발견한 관용 표현

- Turing complete : 튜링 완전
- in itself : 그 자체
- result in ~ : ~의 결과를 내다, 결과적으로 ~이 되다
- when it comes to : ~에 관해서라면, as for~ 와 비슷?
- accordingly : ~에 대응하여
  - Read the instructions and act accordingly.
- run from ~ : ~에서 부터 계속하다
- make the most of ~ :  ~을 최대한 활용하다
- digress for a moment : 잠시 딴 길로 새다

## 개요

- 일반적으로 많은 plugin과 스크립트가 같이 사용되면서 충돌이 날경우 디버깅을 해야한다
- 이 문서는 working config을 유지보수하면서 얻은 지식을 cover하지만
  - vim 자체를 디버깅하거나 디버깅 모드를 사용하는것은 cover하지 않는다

## Understand the startup process

- Vim이 시작될 때 어떤 스크립트가 어떤 순서로 실행되는지 파악하는 것이 중요하다
- 가장 좋은 자료는 `:h startup` 하면 나오는 자료다
- 예를 들면, 플러그인에 정의된 function은 '~/.vimrc'에서 실행할수 없다
  - 이유는 어떤 플러그인이건 실행하기전에 '~/.vimrc'를 먼저 실행하기 때문이다
  - 하지만 function 호출을 'after' directory에 넣으면 실행할수 있는데,
    - normal plugin script들이 실행된후에 sourcing 되는 곳이기 때문이다
- Vim이 시작된 뒤 어떤 스크립트들이 실행되는지 알고 싶다면
  - `:scriptnames` 명령을 실행시키면 목록이 나온다

## Clean code!

- 이 작업이 코드 품질 표준이 필요한 정도는 아니지만 
  - vimscript를 깔끔하게 유지하는 것은 큰 도움이 된다
- vim의 runtime directories 구조를 최대한 활용하라
  - 이 내용은 [From .vimrc to .vim](https://vimways.org/2018/from-vimrc-to-vim/)에 잘 정리되어 있다
- 특정 플러그인에 specific한 코드는 include guard를 가진 분리된 파일들에 넣어라
  - 예를 들면, 나는 [fzf.vim](https://github.com/junegunn/fzf.vim)을 위한 아래 코드를 `~/.vim/after/plugin/config/fzf.vim`에 넣는다
    ```vim
    " include guard: quit if fzf isn't loaded
    if ! exists(':FZF')
      finish
    endif
    
    map <silent> <c-space> :Files<cr>
    map <silent> <leader>t :Tags<cr>
    map <silent> <leader>m : Marks<cr>
    let g:fzf_layout = { 'down': '~20%' }
    ```
  - 위 코드를 'after' directory에 넣는다는 것은
    - 이 코드는 모든 다른 non-after 플러그인이 로딩된이후에만 source 될것이며
    - 그래서 키 매핑을 하기전에 fzf 가 로딩되었는지 체크할 수 있다는 것을 의미한다
  - 모든 플러그인 전용 config 이 load guard를 가진다면.
    - 이슈의 발생범위를 좁히기 위해
    - 어떤 플러그인 무리라도 disable 하는 것이 매우 쉬워진다
- 마지막으로, 어떤 플러그인 들은 유효하게 동작하기 위해 
  - 지들이 로딩되기전에 some global options를 세팅할 것을 요구한다
  - 예를 들면, 'Deoplete' 플러그인용으로, `~/.vim/plugin/` 밑에 아래 코드를 가지고있다
    ```vim
    let g:deoplete#enable_at_startup = 1
    ```
  - 그리고 'Deoplete'이 로딩될때에만 실행될 추가적인 config이 `~/.vim/after/plugin/`아래에 있다
- 보아라. Vim's startup 순서를 이해하는 것은 매우 유용하다

### VCS

- version control system에 config을 저장하는 것이 좋다
- 이 작업은 최소한 시간좌표가 찍힌 checkpoint를 제공하며
  - 최근 발생한 버그의 source를 좁히는데 도움을 준다.
- 미래엔 니가 영원히 감사할 것이다

## Why is Vim's startup slow ?

- 많은 플러그인이 설치되었을때 Vim이 시작하는데 오래 걸릴수 있다
- 누가 많은 시간을 잡아먹는지 파악할수 있다
- `--startuptime <fname>` argument로 vim을 시작해라
  - startup process를 profiling 할 수 있다
  - 아래와 같은 lines를 생성할 것이다
    ```
    069.228 004.840 004.646: sourcing /home/samuel/.vim/pack/bundle/opt/vimwiki
    070.164 000.018 000.018: sourcing /usr/share/nvim/runtime/autoload/provider
    317.745 247.930 247.912: sourcing /home/samuel/.vim/pack/bundle/opt/taskwiki
    331.351 012.951 012.951: sourcing /home/samuel/.config/nvim/after/ftplugin/
    ```
  - Hmm, taskwiki가 로딩하는데 200ms 걸리고 있다
- Vim은 각각의 스크립트를 profile하는 도구를 지원하고 있다
  - `:h profile`을 참고해라

## Verbose

- `:verbose`는 너의 친구다
- ['verbose'] option을 1 로 세팅하면, 이 command는 그것의 arguments를 command로 실행한다
- 이것은 다음에 오는 내용에 도움이 된다

## Where did that option/mapping/command come from??

- 때때로, 이런것이 궁금할때가 있다
  - 도대체 어떤 스크립트가 특정 옵션, mapping, command 를 마지막으로 설정하는지 ?

### options

- Vim은 300개나 넘는 option을 설정할 수 있다. ([`:h option-list`](https://vimhelp.org/quickref.txt.html?#option-list))
- 이와 관련한 일반적인 이슈는 
  - 특정 option이 어떤 plugin 때문에 설정되었는데
  - 어떤 플러그인이 왜 설정했는지 알고싶다는 것이다
  - 예를 들면 누가  `expandtab` 옵션을 껐는가?
- 사례를 보자. `:verbose`명령과 `?` modifier 를 `:set` 명령과 함께 쓸 수 있다
  ```vim
  :verbose set siftwidth?
  ```
- 위 명령의 결과는 대충 이런식이다
  ```vim
  siftwidth=2
    Last set from ~/.vim/pack/bundle/start/vim-sleuth/plugin/sleuth.vim
  ```
- 해석하면 "`shiftwidth` option은 sleuth 플러그인에 의해 2 로 설정되었다"
- 한가지 주의할 것은
  - 그 option이 function, command, autocm로 설정된 것이 아니라
  - 수동으로 설정되었다면 언제 마지막으로 설정되었는지 보여주지 않는다
- 그외에 다른 많은 옵션들도 설정원인을 목록화하고 추적할수 있다 

### mappings

- 예제 명령과 결과:
  ```vim
  :verbose map <c-a>
    x <C-A>         <Plug>SpeedDtingUp
          Last set from ~/.vim/pack/bundle/opt/vim-speeddating/plugin/speeddati
    n <C-A>         <Plug>SpeedDtingUp
          Last set from ~/.vim/pack/bundle/opt/vim-speeddating/plugin/speeddati
  ```
- 또한 주목해라
  - `:map`은 주어진 key sequence로 시작하는 모든 mappings를 목록화한다
  - 이 명령은 "그 leader key로 시작하는 모든 insert mode mappings를 목록화" 같은 작업에 도움이 된다 
    ```vim
    :verbose imap <leader>
    ```
### Abbreviations

```vim
:verbose ab teh
  i   teh       the
          Last set from ~/.vim/autoload/functions.vim
```

### Highlight groups

```vim
:verbose highlight Visual
  Visual        xxx cterm=reverse ctermfg=10 ctermbg=8 gui=reverse guifg=#586e
          Last set from ~/.vim/pack/opt/flattened/colors/flattened_dark.
```

#### scriptease.vim

- 한 가지 유용한 플러그인을 소개하기 위해 잠시 딴 길로 새겠다
- [scriptease.vim](https://github.com/tpope/vim-scriptease)은 Tim Pope과 만든 유용한 플러그인이다
  - 스크립트를 debugging에 도움을 주는 commands 와 mappings를 제공한다
  - 어떤 명령들은 이 문서의 범위를 벗어나는 vimscript를 디버깅하는데 관련이 있지만
  - 다른 명령들은 좀 더 관련이 있다.
  - `:Scriptnames`와 `:Messages`같은 명령들은 다음과 native Vim counterparts들의 wrappers 이다
    - 나중에 이용하기위해 출력물을 quickfix 목록에 저장한다
- 어쨌든, `zS`는 scriptease.vim 에서 제공하는 mapping인데
  - cursor 아래 있는 syntax highlighting groups을 echo한다
  - 당신이 원하는 highlight group 알지 못한다면 highlight group의 details를 보여줄수 없다 ??

### Commands

```vim
:verbose command Sedit
      Name        Args        Address   Complete Definition 
      Sedit       *                                 call local#scrtch#edit('e
          Last set from ~/.vim/init.vim
```

### Functions

```vim
:verbose function local#scratch#edit
    function local#scratch#edit(cmd, options)
        Last set from ~/.vim/autoload/local/scratch.vim
  1   " use a system provided temporary file
  <snip> (the whole function body is listed)
```
## It's more complicated than a single option/mapping/something

- 때때로, 특정 behaviour가 발생하는지 여부를 보고 싶을 때
  - 최소한의 설정만 세팅된 vanilla Vim 이나 한 개의 플러그인만 설치된 환경에서
  - vim을 실행하는 것이 도움이 될 때가 있다
- command line arguments의 조합은 아래와 같이 사용될 수 있다 (`:h --noplugin`에서 가져온 테이블)

  | argument     | load vimrc files | load plugins |
  | :--          | :--:             | :--:         |
  | (nothing)    | yes              | yes          |
  | `-u NONE`    | no               | no           |
  | `-u NORC`    | no               | yes          |
  | `--noplugin` | yes              | no           |

- `-u` 는 또한 대체용 vimrc file을 지정 하는데 사용될 수 있다 
  - 하지만 주의해라!
  - `vim -u my-vimrc`는 평소와 같이 `~/.vim/` 아래의 다른 스크립트도 여전히 load할 것이다
  - `vim -u my-vimrc --noplugin`은

