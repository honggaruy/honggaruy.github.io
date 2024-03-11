---
layout  : wiki
title   : vimrc 에서 dotvim으로 옮기기
summary : 번역, vimrc가 너무 커졌을때 
date    : 2022-12-28 16:34:23 +0900
updated : 2023-01-13 11:36:11 +0900
tag     : vimrc dotvim 
toc     : true
public  : true
parent  : [[Vimrc-Category]]
latex   : false
fontawe : false
---
* TOC
{:toc}

# 1. 개요

- vimrc를 정리할 필요를 느꼈다
 
  > You can't have everything. Where would you put it?
  >
  > ---  Steven Wright  ---
  {: .last_line_author}
  
- 원본링크 : [From .vimrc to vim, vimways.org](https://vimways.org/2018/from-vimrc-to-vim/)

# 2. 내용

## 관용표현

- over time: 오랜 시간을 거쳐, 시간이 지나면서
- ever-shifting: =ever-changing
- be in good company: ~을 못해도 걱정할 필요가 없다 (마찬가지인 사람이 많아서) 
  
> If you find it difficult to cope with your family you are in good company because most people feel the same. 

- the sheer amount of: 엄청난 양의
- come frome : ~의 결과이다
- quick-and-dirty : 간이의, 신속히 대강하는 것
- well over 특정숫자 : 특정숫자를 충분히 넘는
- take a hint from : ~로부터 눈치를 채다. ~로부터 힌트를 얻다
- self-contained : 독립된, 자급 자족의 
- any and all : 어떤 종류이든 상관없이 모든
- thinly-veiled : (직역: 얇게 가려진) = 노골적인, 눈에 보이는
- as an analogue to 명사 : (직역: 명사와 유사품으로서) ~와 유사하게
- trample on ~ : ~를 짓밟다, ~를 밟아 뭉개다
- there are some caveats : 약간의 주의가 필요하다
- like to think of (it) as something : (그것을) something이라고 생각하고 싶다
- fall into a category : ~의 범주에 들어가다
- you may have guessed by now : 지금쯤 짐작하겠지만

## Attack of the 5,000-line vimrc

- Vim은 끊임없이 configurable 하고 확장가능한 에디터이다
  - 또한  `~/.vimrc` 나 `~/vim/vimrc` startup 파일을 공유하는 문화를 가지고 있다
  - 이 파일들은 시간이 지날수록 확장되는 경향이 있다  
  - 초보자들은 
    - 'expandntab' 이나 'wrap' 같은 몇가지 global options를 설정으로 시작으로
    - custom amppings, functions, 파일타입별 로직, 3rd-party 플러그인을 
    - 언제나 변화하는 플러그인 manager의 외벽아래에 추가하게된다
  - vimrc 파일은 크기가 커지는 것이 아니라, 좀더 뒤얽히고 복잡하게 자란다
- 만일 당신이 이런 큰 파일을 가지고 있다면, 다른 사람도 마찬가지니 걱정하지 마라
  - Damian Conway는 Perl 분야의 Vim guru 인데 [1855 lines의 vimrc 파일](https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup/blob/cbe1fb5b5505e17bd7709669168c367903d94cd4/.vimrc)을 배포했다
  - 매우 긴 길이의 vimrc 파일의 문제는 
    - 엄청난 양의 configuration 때문이 아니다
    - 어쨌거나 그들은 모두 존재 목적이 있다
  - 하지만, 당신이 프로그래밍을 경험이 많다면 알겠지만
    - 서로 다른일을 하는 코드들을 한 파일에 집어넣는 일은 피하는 것이 좋다
    - 이 것은 코드를 찾기어렵게, 관리하기 어렵게, 이해하기 어렵게 한다
    - Vim configuration도 예외가 아니다
- 매우 큰 vimrc 파일을 만드는 대신
  - 좀 더 작고, 잘 구성된 파일들로 분리하는 방법이 있다
  - 이 파일들은 `~/.vim` 아래에 위치한다
- 매우 큰 vimrc 파일을 대체하기 위해
  - `~/.vim` 아래 directory hierarchy 를 만드는 것은 
  - 당신의 configurations을 관리가능하도록 유지시킨다
  - 이 것은 코드가 필요할 때만 로딩되도록하여 효율을 개선한다
  - hierarchy상의 파일 위치로 코드의 존재 목적이 명확해진다
  - 다른 사람들이 사용할 수 있도록 쉽게 패키징할 수 있다 

## Your own personal `$VIMRUNTIME`

- 잘 조직된 `~/.vim` directory의 이점은 
  - 어떻게 configuration 파일이 load될지 많은 control을 제공하는
  - Vim의 내장된 동작에 의존한 결과이다
- Vim 자체와 함께 제공된 runtime files의 구조를 살펴보는 것으로 시작하자
  - `$VIMRUNTIME` 변수내에서 이 directory의 path를 발견할 수 있다
    ```vim
    :echo $VIMRUNTIME
    ```
  - 당신의 OS와 함께 배포된 버전의 vim을 사용중이라면
    - 경로는 `/usr/share/vim/vim81`과 같을 가능성이 높다
    - 그 directory의 내용을 한 번 보자
      ```sh
      $ ls /usr/share/vim/vim81
      autoload/     bugreport.vim       colors/     compiler/
      defaults.vim  delmenu.vim         doc/        evim.vim
      filetype.vim  ftoff.vim           ftplugin/   ftplugin.vim
      ftplugof.vim  gvimrc_example.vim  indent/     indent.vim
      indoff.vim    keymap/             lang/       macros/
      menu.vim      mswin.vim           optwin.vim  pack/
      plugin/       print/              rgb.txt     scripts.vim
      spell/        synmenu.vim         syntax/     tools/
      tutor/        vimrc_example.vim  
      ```
    - 쉘에서 대강 count 해보면,
      - 이 directory tree에 1,674 files가 있다는 것을 보여준다
        ```sh
        $ find /usr/share/vim/vim81 -type f | wc -l
        1674
        ```
      - 그 것들중, 1,335 개는 `.vim` files 이다
        ```sh
        $ find /usr/share/vim/vim81 -type f -name \*.vim | wc -l
        1335
        ```
      - 이 모든 파일들은, vimrc 처럼, plain Vim script이다 
      - 이 directory 내의 그들의 location은 언제 그들이 load될지 결정한다
      - 그 들중 몇개만 Vim startup에서 load된다
      - 그 들은 관련이 있을때만 load될 준비가 되어있는 천 개는 충분히 넘는 파일들이다
      - 우리는 그 것에 대해 Bram(Vim 개발자)으로 부터 힌트를 얻어야 한다
      - Vim에서 `runtimepath` option의 값을 살펴보면, 몇 가지 다른 paths를 볼 수 있다.
        ```vim
        :set runtimepath?
          runtimepath=~/.vim,/usr/share/vim/vim81,...,~/.vim/after
        ```
      - `runtimepath`의 맨 첫번째 entry는 `~/.vim`이고
        - 이곳이 `$VIMRUNTIME`의 구조를 모방하는 구조를 build할 수 있는 장소이다
      - 이곳이 당신의 개인적인 Vim runtime directory인 것이다

## Lose the `:source`, Luke

- Vim script로 작업한 경험이 있다면,
  - Vim script를 파일에서 읽어내기 위해 
  - `:source` 명령을 어떻게 사용하는지 알고 있을것이다
- mapping definitions 같은것들이 있는 어떤 분리된 파일을 load하기 위해
  - vimrc 파일에 아래와 같은 line을 가지고 있을 수있다
    ```vim
    source ~/.vim/mappings.vim
    ```
- Vim은 
  - 우리가 방금 확인한 `runtimepath` directories의 file layout과 동작하는
    - files를 load하기위한`:runtime`이라는 또다른 command가 있다
  - "!"표 없이 사용되면, 이 명령은 
    - `runtimepath` directories 내에서 그것을 발견한 첫번째 경로로 부터
    - Vim script commands를 read한다
  - "!"표와 함께 사용되면, 이 명령은 
    - 경로 모두를 read한다
  - 양쪽 경우에서, globs( `*` 과 `?` 문자)로 
    - filename pattern matching을 포함할 수 있다
  ```vim
  runtime syntax/c.vim
  runtime! syntax/c.vim
  runtime! */maps.vim
  runtime! **/maps.vim
  ```
  - 앞쪽의 `~/.vim` 경로는 이런 패턴에 포함시키지 않는 것을 주목하라
- 마지막 example의 [double asterisk](https://vimhelp.org/editing.txt.html?#starstar-wildcard)는
  - directory path elements의 세트를 표현한다
  - elements는 100 levels 깊이까지 표현할 수 있다
  - 이것은 `~/.vim/foo/bar/baz/quux/maps.vim`도 발견하여 load할 수 있다는 것이다
- `:source`와는 다르게, `:runtime`은 
  - 아무 파일도 찾지 못해도 에러를 발생시키지 않는다
  - 이것은 파일의 부재가 에러 조건이 아닌 경우 boilerplate checks?를 피한다
- Vim's sctartup process의 많은 부분은
  - `:runtime` commands의 얇은 wrappers 이다
  - [`:filetype`](https://vimhelp.org/filetype.txt.html?#%3Afiletype) 을 포함하여, its other commands의 일부분도 마찬가지이다
- Vim's bundled runtime code를
  - 비활성화, 대체, 수정, 확장하기 위해
  - Vim's bundled runtime code를 
  - 실행하기 전 , 아니면 그것 대신, 혹은 그 후에
  - 우리의 own code를 실행하는데 
  - 위 사실(바로 전문장)을 활용할 수 있다

## Turn on, `plugin`, drop out

- [제목의 유래, Turn on, Tune In, Drop out](https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=kbs4547&logNo=20181779004)
- vimrc 파일을 나누는 작업은 
  - 간단한 configuration을 넘어서 확장된 코드 블럭을 찾아, 
  - 의미있는 단위로 그룹화하는 것으로 시작할 수 있다 
  - 이 부분을 추출하여 `plugin` 하위 디렉토리 아래의 독립된 파일로 둘수 있다
- 예를 들어, 다른 사람의 vimrc files를 읽어보면
  - 후행 공백을 편리하게 제거하는 문제를 해결하는 approaches를 자주 볼 수 있다  
  - 여기에, [Vim Tips wiki](https://vim.fandom.com/wiki/Remove_unwanted_spaces)로 부터의 한 function안에 담긴, 한가지 approach가 있다
    ```vim
    function StripTrailingWhitespace()
      if !&binary && &filetype != 'diff'
        normal mz
        normal Hmy
        %s/\s\+$//e
        normal 'yz<CR>
        normal `z
      endif
    endfunction
    ```
  - 이런 종류의 function은 보통 그 것을 호출하는 mapping도 따라온다
    ```vim
    nnoremap <Leader>x :<C-U>call StripTrailingWhitespace()<CR>
    ```
  - 이 function은 vimrc가 source될 때마다 load될 필요가 없다
  - 일단 정의되면, 
    - 적당한 때에 호출될 준비가 된 채로 
    - 그 곳에 있기만 하면 된다
  - 사실, Vim은 이 funtion이 있는 vimrc가 reload되면 에러를 던진다
  - 우리는 `function!` 으로 function을 declare함으로써 문제를 고칠수도 있지만
    - 다른 방법도 있다:
    - `~/.vimrc`에 function definition을 넣는 대신,
    - `~/.vim/plugin` 내의 `.vim` 파일 안으로 넣는 방법이다
    - 즉, `~/.vim/plugin/strip_trailing_whitespace.vim`을 사용한다 
  - 일단 이 파일이 생성되면,
    - Vim을 새로 시작해서
    - 우리의 plugin이 load되었는지
    - `:scriptnames`의 출력을 체크하여 확인할 수 있다
      ```vim
      :scriptname
        ...
        10: ~/.vim/plugin/strip_trailing_whitespace.vim
        ...
      ```
    - 호출하는 함수가 정의되기 전에 설정되었음에도 불구하고,
      - vimrc에 남아 있는 <Leader>x mapping이 여전이 작동하는 것에 주목해라

### What's a plugin, anyway?

- 왜 `~/.vim/plugin`에 script를 넣어야 하나?
  - 당신은 우리의 example이 real plugin이 아니라고 이의를 주장할 수도 있다
  - 즉, 그것은 단순히 하나의 function일 뿐이라고
  - 하지만, Vim에게는 그 사실이 의미있는 구분이 아니다
  - startup 때에, Vim은 
    - `runtime`에 있는 각 디렉토리의 `plugin` 하위 디렉토리의 
    - 어떤 형식이든 상관없이 모든 `.vim` files를 souce한다
    - 그 파일들이 무엇을 contain하든지 구분하지 않는다
    - 관계있는 abbreviations ? Custom 명령 ? 
    - 특정 machine이나 OS에 의존하는 Code? 모두 가능하다

### Plugin subdirectories
  
- 마찬가지로, 
  - `*.vim` files가 `plugin` directory 에서 재귀적으로 로드되기 때문에
  - 원한다면 그 파일들을 하위 디렉토리들에 organize 할 수 있다
    ```sh
    ~/.vim/plugin/insert/cancel.vim
    ~/.vim/plugin/insert/suspend.vim
    ~/.vim/plugin/visual/region.vim
    ~/.vim/plugin/whitespace/squeeze.vim
    ~/.vim/plugin/whitespace/trim.vim
    ```
  - subdirectories의 이름은 중요하지 않다; Vim은 그냥 다 뒤질것이다
  - Vim의 얇게 가려진 `:runtime` wrappers를 언급한 것을 기억하는가?
  - 이것이 그것들중 하나다
  - 이곳에서 단서는
    - Vim이 이 단계에서 내부적으로 수행하는 것과 유사하게
    - [`:hep load-plugins`](https://vimhelp.org/starting.txt.html?#load-plugins)가 제안하는 command에 있다
      ```vim
      :runtime! plugin/**/*.vim
      ```

### Local script scope

- `~/.vim/plugin/`내의 구별되는 파일내에 
  - 이런 코드 블럭을 집어넣는 것은 또 다른 이점이 있다
  - 이런 이점중 하나는 그 스크립트 내에서만 필요한 functions와 variables를 scoping하는 Vim의 [script-variable](https://vimhelp.org/eval.txt.html?#script-variable) 이다 
    ```vim
    let s:myvar = 'value'
    function s:Myfunc()
      ...
    endfunction
    ```
    - 이 것은 file이 source되는 시점에 모든 function names과 variable names와 구별되는 접두사를 적용한다
    - 이 것이 의미하는 것은 당신의 configuration중 어딘가 다른 곳에 정의된 variable을 무시할지도 모른다는 걱정을 할 필요가 없다는 것이다 
    - mappings를 정의할 때 주의할 점이 있다; [〈SiD〉prefixes](https://vimhelp.org/map.txt.html?#%3CSID%3E)를 어떻게 사용하는지 확실히 이해하도록 `:help script-variable`를 주의깊게 읽어봐라

### Short-circuiting and load guards

- 분리된 script files의 또하나의 advantage는 script를 short-circuit하는 ability 이다
  - , 분리하는 이유는 적당치 않은경우 loading 되지 않도록 하기 위함이다
  - 이 작업은 script의 시작부분에서 나머지 부분이 load되어야 하는지 checking 하는 것으로 수행된다
  - ,그리고 로딩되지 않아야한다면 `:finish`명령으로 skipping한다
- 이 기능은 다음과 같은 options를 체크하는데 사용할 수 있다
  - `compatible`, Vim version number, 어떤 feature의 availabilty, 혹은 plugin이 이미 load되었는지 여부
    ```vim
    if &compatible
        \ || v:versiion < 700
        \ || !has('folding') 
        \ || exists('g:loaded_myplugin')
      finish
    endif
    let g:loaded_myplugin = 1
    ```
- 이런 방법으로,
  - 당신의 모든 feature-dependent한 코드를 
  - 투박한(clumsy) `:if` 블럭으로 감싸지 않아도 된다

### The question of mappings

- plugin 자체에서 정의된 function을 사용하는 mapping을 include 해야 하는가?
- 당신이 정하는 것이지만, plugin author는 
  - vimrc files를 user-level preferences가 가야할 곳으로 생각하고 싶어하고
  - plugins를 그들이 호출하는 code가 가야할 곳으로 생각하고 싶어한다
  - Mapping choices는 개인적인 기호이며, former 범주에 들어간다
- plugin이 수행하는 작업과 plugin이 호출 방법 사이에서 
  - some abstraction을 유지하고 싶다면,
  - plugin file로부터 interface를 노출하기 위해 `<plug> prefix` mappings를 사용할 수 있다
    ```vim
    function s:StripTrailngWhitespace()
      ...
    endfunction
    nnoremap <Plug>StripTrailingWhitespace
        \ :<C-U>call <SID>StripTrailingWhitespace()<CR>
    ```
  - 그 다음에 vimrc에서 that target에 대한 당신의 mapping 선택을 넣을수 있다
    ```vim
    nmap <Leader>x <Plug>StripTrailingWhitespace
    ```
  - 만약에 누군가 다른이가 당신의 plugin을 사용하고 싶다면, 
    - this는 it에 대해 그들 자신의 mappings를 선택하도록 만든다
    - 좀더 직접적으로 (more straightforward)
  - 충분히 발전된 plugin files를 작성할때의 good mapping practices에 대한 
    - 좀 더 일반적인 조언이 `:help write-plugin`에 있다

## Not really my `:filetype`

- big vimrc files에서의 또 다른 pattern은
  - a certain filetype의 buffers에 대해서만 options를 설정하는 것이다
- 예를 들면, 이 코드는
  ```vim
  autocmd FileType mail setlocal spell
  ```
  - 텍스트에서 철자 오류 후보들을 highlight하려고
  - 'spell' option을, mail filetype buffers에서만 동작하게 하려고 한다
- 여기서 주목할 첫번째 thing은
  - it을 reloading 해도 같은 hook이 여러번 정의되지 않도록
  - this는 self-clearing `augroup`안에 둘러쌓여져야 한다 
  ```vim
  augroup ftmail
    autocmd!
    autocmd FileType mail setlocal spell
  augroup END
  ```
  - 이것은 좀 성가시다, 하지만 이런 boilerplate를 피할 방법이 있다
- 우리의 `autocmd`에 대해 주목할 두번째 thing은
  - 그 sesstion에서 a mail file이 실제로 편집되었는지에 관계없이, 
  - it이 vimrc가 load될 때마다 set 된다는 점이다
  - 그러므로 
    - it이 관련이 있을때만 load되도록,
    - this를 a filetype plugin이나 ftplugin에 집어 넣는것은 합리적이다
- a buffer의 filetype을 set하는 `autocmd` hooks는 
  - `$VIMRUNTIME/filetype.vim`에 정의되어 있다
  - 그 hooks는 추측하는데 heuristics를 적용하고 나서
    - a buffer의 type을 설정한다
    - 그리고나서 Vim은 그 후에 any appropriate filetype plugins를 수행한다
    - :`ftplugin/FILETYPE.vim`으로 이름지어진 `runtimepaht` directories에 있는 files
  - this는, 
    - 우리의 `spell` setting 주위의 `autocmd` hooks가 
    - 있을 필요가 없다는 것을 의미한다 
  - 우리는 
    - 이미 우리에게 허용된 filetype 변경을 위한 hooks를 가지고 있고,
    - them을 사용하기 위해 `~/.vim/ftplugin/mail.vim`에 아래의 한 줄을 넣기만하면 된다
      ```vim
      setlocal spell
      ```
    - 위 작업이 수행된 채로,
      - 새로운 `mail` buffer를 편집하는 경우,
      - 우리는 filetype이 선택될 때 우리의 filetype plugin이 load된다는 것을
      - `:scriptnames 를 사용하여 확인할수 있다
        ```vim
        :set filetype=mail
        :scriptnames
          ...
          20: ~/.vim/ftplugin/mail.vim
          ...
        :set spell?
         spell
        ```
      - 이 방법이 좋긴하지만 좀더 개선할 수 있다

### Loading filetype configuration afterwards

- 우리의 `spell` seting을 
  - `~/.vim/ftplugin/mail.vim` 안에 집어넣기 보다는,
  - `~/.vim/after/ftplugin/mail.vim` 에 넣을 수 있다
  - `after`로 이름붙은 추가된 경로에 주목하라
- `after` runtime directory안에 있는 files는 
  - Vim에 포함된 the analoguous runtime files 다음에(after) load된다
  - 이 경로를 이용하여, 우리는 
    - `$VIMRUNTIME/ftplugin/mail.vim`안에 있는 `mail` filetype plugin이 source 된 다음에(after)
    - 우리의 option이 설정되는 것을 보장할 수 있다
    - 이방법으로 filetype plugin이 한 작업을 당신이 싫어할 경우 덮어쓸(override) 수 있다

### Breaking up filetype plugins

- 좀 더 자잘하게 나눌 필요가 있다면,
  - files를 filetype 이름이 붙은 subdirectories로 집어넣어도 된다
  ```vim
  ~/.vim/after/ftplugin/mail/spell.vim
  ~/.vim/after/ftplugin/mail/quote.vim
  ```
  - `filetype_스크립트이름` 형태도 똑같이 작동한다 
  ```vim
  ~/.vim/after/ftplugin/mail_spell.vim
  ~/.vim/after/ftplugin/mail_quote.vim
  ```
  - 지금쯤 짐작하겠지만, filetype switching은 또 하나의 `:runtime` wrapper이다
  - `mail` filetype으로의 switching은 아래 command를 효과적으로 실행한다
  ```vim
  :runtime! ftplugin/mail.vim ftplugin/mail_*.vim
  ```

### Undoing filetype settings

- a buffer의 filetype이 변경된다면,
  - 우리가 적용한 어떤 local cinfiguration라도 reverse해야한다
  - 우리는 이 작업을 `b:undo_ftplugin` 변수로 할수 있는데,
    - 이 변수는 (|)로 구분된 commands의 목록을 포함한다
- a buffer의 filetype이 바뀌면,
  - the commands는 이전 fieltype에 대한 buffer-specific settings를 undo하며,
  - 새로운 filetype의 plugins이 load되도록 준비된다.
- 각 filetype plugin 설정 후에,
  - that change를 `b:undo_ftplugin`으로 되돌리도록,
  - 해당 commands를 추가해야 한다.
- 우리의 `spell` 예제에서, 이렇게 할것이다:
  ```vim
  setlocal spell
  let b:undo_ftplugin .= '|setlocal spell<'
  ```
  - 여기에 사용된 `spell<` 문법은,
    - left angle 꺽쇠가 뒤따라 붙었는데,
    - `mail` filetype이 unload될 때
    - 'spell'의 local value가 'spell'의 global value와 match 되도록 
    - 복구되어야 한다는 것을 지정한다(specify)
  - a filetype을 setting한 이후,
    - `:let` 명령으로 `b:undo_ftplugin` 변수의 값을 check할수 있다
    ```vim
    :set filetype=mail
    :let b:undo_ftplugin
      b:undo_ftplugin     setl modeline< tw< fo< comments<|setlocal spell<
    ```

### The difference with indent

- indentation에 관계된 Filetype-specific code는
  - `~/.vim/indent/FILETYPE.vim` 이나
  - `~/.vim/after/indent/FILETYPE.vim` 같은
  - 다른 location으로 다시 들어간다
- 당신의 vimrc의 `:filetype` 호출에 `indent` 단어를 가지고 있다면 
  - those files는 source된다
  - 예를 들면, 
    - 'autoindent'나 'indentexpr' settings를 변경하는 files에 대해
    - 이 layout을 사용해야 한다
- 원한다면 indent settings를 filetype plugin에 넣을수 있지만,
  - 우리는 things에 알맞는 자리를 찾아주려고 한다
- it을 이런 방식으로 하는 것이 
  - indentation settings를 모든 다른 filetype-specific settings로 부터
  - 분리되도록 만든다
- this는 
  - 사용자들의 vimrc's `:filetype` 호출에 적절한 arguments를 사용하여,
  - 그들이 원하는 것만 load하는 쉬운 방법을 제공한다.

### Detecting filetypes

- filetype-dependent logic에 대한 마지막 note로,
  - its filename이나 contents에 기초한, 첫번째 장소에 
  - a buffer's filetype을 설정할 어떤 hooks라도 가지고 있다면,
  - those는 `ftdetect` directory에 들어간다
  - this를 `~/.vim/ftdetect/irssilog`에 넣을것이다,예를 들면:
    ```vim
    autocmd BufNewFile,BufRead */irc/*.log setfiletype irssilog
    ```
- `~/.vim/ftdetect`에 hooks를 넣는것은 
  - `filetype.vim`에 정의된 `filetypedetect augroup`의 일부로서
  - they가 source됨을 의미한다
- this는
  - it이 이미 완료되었기 때문에 
  - `autocmd` definitions을 a self-clearing `augroup`으로 둘러쌀 필요가 없는 
  - another context 이다  

## Be water, my friend

- 위에 설명한 모든것은 단지 시작일 뿐이다.
  - 우리는 
    - `~/.vim/autoload`에 정의된, 속도를 위한 lazy-loading functions과
    - `~/.vim/compiler`에 있는, 'makeprg'과 'errorformat'의 설정을 위한 
      - custome `:compiler` 정의조차
    - 다루지 않았다
  - 이들은
    - `:runtime` loading을 둘러싼,
    - vim functionality의 한층 더 나아간 사례들이다
- Vim이 configuration과 customizing에 상당한 flexibility를 주는 반면에,
  - 관련 configuration을 적시에 로딩하기위한 `Way of Vim`은 분명히 있으며,
  - 그것이 어떻게 동작하는지 조금 배우기만 한다면,
  - 그만큼 당신의 editor와는 덜 다투게 될것이다.
  - 이것이 당신에게 까다로워 보인다면,
    - 당신이 Vim을 처음 배웠을때를 돌아보라
  - HJKL 키로 편집기내에서 이동하는 것이, 
    - 합리적으로 보이기 전까지, 얼마나 이상해보였는지 기억하는가?
  - normal mode가 합리적으로 보이기 전까지,
    - insert mode에 머물러 있기를 얼마나 원했는지 기억하는가? 
- it을 무시하거나 it과 싸우는 대신에,
  - Vim runtime file 구조내의 일하는 것은
  - 당신의 `~/.vim` directory를 
  - 모든것이 구비된 장소이자 모든것이 제자리에 있는,
  - 정교한 도구상자로 만들어 준다
  - 이것을 노력을 들일만한 일이다
- 
