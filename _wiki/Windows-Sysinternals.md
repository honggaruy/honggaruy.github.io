---
layout  : wiki
title   : Sysinternals 도구 
summary : troubleshooting용 도구  
date    : 2020-10-30 12:41:22 +0900
updated : 2022-05-12 14:48:48 +0900
tag     : windows sysinternals
toc     : true
public  : true
parent  : [[Windows-Category]]
latex   : false
---
* TOC
{:toc}

# 1. 발단

* 2020년 10월 26일 오후 5시 38분 사고로 repository 디렉토리 아래의 소스코드가 모두 날아갔다.
![windows-sysinternals-01.png]( /wiki-img/Windows-Sysinternals/windows-sysinternals-01.png)
* 그런데 vim의 un~ 파일은 날아가지 않고 남았다.
* 혹시 un~ 파일에서 복구할수 있는 방법이 있는지 찾아봤고, [답변](https://stackoverflow.com/a/52949587/9457247)을 얻었다
* `strings`는 리눅스 shell 명령어로 보이는데 혹시 windows에도 같은 명령이 있을지 궁금했다.
* 찾긴 했는데 [Strings(SysInternals)](https://ss64.com/nt/strings.html) 빌트인 명령은 아니었다.
  * 그냥 `> strings` 입력하면 모르는 명령어라고 응답한다. 
* 위 명령은 [SysInternals](https://docs.microsoft.com/en-us/sysinternals/)라는 도구 모음의 일부였다.

# 2. 전개

* 일단 strings 도구를 사용해봤다.
  * [이곳](https://docs.microsoft.com/en-gb/sysinternals/downloads/sysinternals-suite)에서 다운받는다.
  * 설치는 별도로 할 필요 없고 아무 폴더에나 푼다음 Path 에 실행경로를 포함시키면 된다.
  * strings 도구는 binary 파일에서 인식가능한 텍스트를 뽑아내는 tool이다.
* 결과는 다음과 같다. ( 원래 파일 내용이 많지 않아 대충 내용을 유추할 수 있었다.)

```sh
❯ strings .\.bootstrap.windows.exclude.ps1.un~

Strings v2.53 - Search for ANSI and Unicode strings in binary images.
Copyright (C) 1999-2016 Mark Russinovich
Sysinternals - www.sysinternals.com
Vim
UnDo
52%3
l#

 : windows symbolic : https://winaero.com/blog/create-symbolic-link-windows-10-powershell/
New-Item -ItemType SymbolicLink
gNew-Item -ItemType SymbolicLinkNew-Item -ItemType SymbolicLink -Path "$($env:HOME)\.vim" -Target ".vim"5
New-Item -ItemType SymbolicLink5
HNew-Item -ItemType SymbolicLink -Path "$($env:HOME)\.vim" -Target ".vim"5
JNew-Item -ItemType SymbolicLink -Path "$($env:HOME)\.vimrc" -Target ".vim"5
(#

 : windows symbolic :
(#


l#

 : windows symbolic : https://winaero.com/blog/create-symbolic-link-windows-10-powershell/5
# 5
HNew-Item -ItemType SymbolicLink -Path "$($env:HOME)\.vim" -Target ".vim"5
NNew-Item -ItemType SymbolicLink -Path "$($env:HOME)\.gitconfig" -Target ".vim"5
TNew-Item -ItemType SymbolicLink -Path "$($env:HOME)\.gitconfig" -Target ".gitconfig"5
l#

 : windows symbolic : https://winaero.com/blog/create-symbolic-link-windows-10-powershell/5
#


 : windows symbolic link

 : https://winaero.com/blog/create-symbolic-link-windows-10-powershell/5
{#

 : windows symbolic link

 : https://winaero.com/blog/create-symbolic-link-windows-10-powershell/5
q# : windows symbolic link

 : https://winaero.com/blog/create-symbolic-link-windows-10-powershell/5
p#  windows symbolic link

 : https://winaero.com/blog/create-symbolic-link-windows-10-powershell/5
```

