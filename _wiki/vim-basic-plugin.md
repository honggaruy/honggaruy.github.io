---
layout  : wiki
title   : vim 필수 플러그인 사용법 
summary : 자주 잊어버리는 플러그인 사용법 
date    : 2021-08-31 14:37:57 +0900
updated : 2023-06-10 09:53:07 +0900
tag     : vim surround plugin-vim-surround nerdtree
toc     : true
public  : true
parent  : [[Vim-Category]] 
latex   : false
fontaw  : false
---
* TOC
{:toc}

# Tip 1. `surround.vim` 사용법
- 만든이 : Tim Pope
- 용도 : 예를들면, (Hello world!) 라는 표현식에서 [Hello world!] 라고 바꾸고 싶을때 사용한다
    - 즉, 어떤 `문장`을 둘러싸는 `기호`를 한 방에 바꾸고 싶을 때 사용 
- 지원 버전 : vim 7 이상
    - 이 플러그인의 몇가지 feature는 옛날 버전에도 동작 할 수 있다
    - full fuctionality를 위해서는 vim 7 이상을 권장한다  

## 다른 사람이 작성한 사용법
- [surround.vim 공식 help, Tim Pope](https://github.com/tpope/vim-surround/blob/master/doc/surround.txt)
- [VIM │ SURROUND.VIM 사용하기, 부들잎블로그](https://forteleaf.tistory.com/entry/VIM-Surroundvim-사용하기)
- [surround vim 사용법 정리, 뷰티플 프로그래밍](https://krksap.tistory.com/1775)

## 사용법 기본
- vim에서 `text-objects` 라고 말하는 Object를 기준으로 적용된다
    - 즉, 커서는 적용하려는 `text-objects`내에 위치하고 있어야 한다
- `text-objects`를 둘러싸는 `surroundings`에는
    - parentheses, quotes, HTML tags 등이 포함된다
  
### 3가지 기본 동작
- 감싸기(surround) - 'ys'
- 삭제(delete) - 'ds'
- ~바~꾸기(change) - 'cs'

### 사용법 응용

### `USD 2.55` 문장을 `--USD $2.55--` 와 같이 double dash로 감싸고 싶다
- 원래 `-`(dash)가 아닌 *(asterisk)로 하고 싶었는데 편집상의 문제가 많아 `-`로 변경함 

| 키 입력 | : 버퍼 내용 : |
| :--     | :--           |
| {시작}  | USD $2.5{줄끝}  \
|   | 커서는 U 자에 위치 |
| ys$     | USD $2.5      \
|   | ys:감싸기, $: 커서위치부터 줄끝까지 선택 \
|   | 이때 커서는 맨 아래 status line으로 가서 입력 대기 \
|   | 태그 입력시 여러문자를 입력받고 그 외에는 한문자로 끝 |
| - | `-USD $2.55-`                                         |
| . | `--USD $2.55--`                           \
|   | dot 명령으로 마지막 action 을 한번 더 함 |

# Tip 2. NerdTree 사용법

## Changing drive letter in NERDtree
- #nerdtree
- [Changing drive letter in NERDtree](https://stackoverflow.com/q/1467447/9457247)
- `:NERDTree D:\ ` will work

## 테스트
