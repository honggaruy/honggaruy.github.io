---
layout  : wiki
title   : vim에 nerd font 적용하기
summary : how to & troubleshooting
date    : 2022-04-14 19:24:00 +0900
updated : 2022-04-15 01:34:01 +0900
tag     : fonts nerdfonts 
toc     : true
public  : true
parent  : [[Vim-Category]] 
latex   : false
---
* TOC
{:toc}

# 1. 개요

* [VimDevIcons 플러그인](https://github.com/ryanoasis/vim-devicons)은 예전에 설치했었는데 아래와 같은 아이콘은 안나왔었다.
  ![Vim Dev Icons example](https://raw.githubusercontent.com/wiki/ryanoasis/vim-devicons/screenshots/v0.8.x/overall-screenshot.png)
* [D2Coding font, 1.3 latest](https://github.com/naver/d2codingfont)가 Powerline 심볼을 지원하기 때문에 같이 되겠거니 했는데 안되어서 그냥 넘어갔었는데...
* 최근 PowerShell 7을 설치하면서 [oh-my-posh](https://ohmyposh.dev/)를 설치했는데 [Nerd Fonts](https://ohmyposh.dev/docs/config-fonts)를 알게되어 우선 PowerShell에 먼저 적용했다
 ![marcduiker theme 예제](https://ohmyposh.dev/assets/images/marcduiker-17054c19d647396c7e05647c4710c2c7.png)
* 
  
# 2. 전개

## D2Coding 에 Nerd font를 패치한 개조 폰트를 써보다

* [2020년 7월 작업한 폰트, YIRUM.NET 블로그](https://my.yirum.net/nerd-fonts-와-vim-devicons-설치/) : 가끔 한글 글자간 간격이 너무 좁아지는 문제가 나온다 
  * 이 폰트를 사용할 경우 gVim 에서 한글 편집시에 한글 커서간 세로로 반만 나오는 문제가 있다
  * 이와 같이 개인이 Nerd Font 패쳐를 사용하여 작업한 폰트가 아니라 Nerd Font 사이트에서 직접 다운로드 받은 폰트를 사용할 경우에는 한글 커서가 잘리는 문제가 없었다
  * (2022-04-15) 다시 D2Coding Ligature로 테스트 해보니 한글 커서 반 잘리는 문제가 재현되지 않는다...당분간 써보자
* [2022년 3월 작업한 폰트, Dante2K 블로그](https://github.com/kelvinks/D2Coding_Nerd) : font family를 별도로 가져간 것은 좋았다
* ~~결론 : 개인이 작업한 D2Coding에 Nerd Font 패치한 결과물중 내가 사용할만한 것은 없었다~~ (2022-04-15, 한글 커서 반쪽  문제 재현이 안되어 다시 써보기로 함) 
