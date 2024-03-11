---
layout  : category
title   : Windows 
summary : 카테고리 2단계
date    : 2020-10-30 12:39:18 +0900
updated : 2024-01-30 01:17:49 +0900
tag     : windows sysinternals command-line console
toc     : true
public  : true
parent  : [[Tools-Category]] 
latex   : false
fontawe : true
---
* TOC
{:toc}

# 주요 사이트

## Microsoft 공식 사이트

* [Windows에서 개발 환경 설정, docs.microsoft.com](https://docs.microsoft.com/ko-kr/windows/dev-environment/) : 윈도우환경에서의 개발 환경 설정 모음
* [Window Sysinternals](https://docs.microsoft.com/en-us/sysinternals/) : [Mark Russinovich](#mark-russinovich)가 만든 유틸리티 모음
* [Welcome to WSLg](https://github.com/microsoft/wslg) : Windows Subsystem for Linux GUI
  * WSL에서 Linux GUi 어플을 실행 시킬수 있도록 지원 (2021-09-10 현재 아직 Preview 상태)
* PowerShell
  * Good Starting Points
    * [PowerShell 설명서, Learn / PowerShell ](https://learn.microsoft.com/ko-kr/powershell/?view=powershell-7.2)
    * [PowerShell 설명서를 사용하는 방법, Learn / PowerShell / 스크립팅](https://learn.microsoft.com/ko-kr/powershell/scripting/how-to-use-docs?view=powershell-7.2) : MS 파워쉘 문서를 보는 방법
    * [PowerShell 101 ](https://learn.microsoft.com/ko-kr/powershell/scripting/learn/ps101/00-introduction?view=powershell-7.2) : 튜토리얼 형태로 파워쉘을 배움 
    - [PowerShell github  <i class="fa-brands fa-github fa-xl fa-beat" style="--fa-animation-duration: 2s;"></i>](https://github.com/PowerShell/PowerShell) : Open Source인 최신 PowerShell 버전을 다운로드 받을 수 있음
        - [awesome-powershell, github <i class="fa-brands fa-github fa-xl fa-flip" style="--fa-animation-duration: 3s;"></i>](https://github.com/janikvonrotz/awesome-powershell) : PowerShell github에서 소개된 PowerShell 자료 사이트
* Windows Command-line tool 관련 Reference
  * Docs / Windws Server /
    * [Windows Commands](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands)
    * Reference
      * [takeown.exe](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/takeown) : 파일이나 폴더의 소유권을 변경하고자 할 때 사용
  * Docs / Previous Versions / Windows / Windows Server 2012 R2 and Windows Server 2012 / Management and Tools / Command-Line Reference
    * 이 문서는 2016년 이후 업데이트 안되고 있음
    * Command-Line Reference
      * [takeown](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/cc753024(v=ws.11)) : 예전 버전 설명 

## 기타 주요 사이트

* [The IT Bros.com](https://theitbros.com/) : Microsfot 관련 IT 팁이 많음
* [Planet PowerShell](https://www.planetpowershell.com/authors) : PowerShell 관련 포스팅을 하는 저자들...

<style>
.author-container {display: flex; align-items: center; justify-content: space-around;}
</style>

# 관련 인물

## 유명 인물 

### Jeffrey Snover

<div markdown="1" class="author-container">
{% figure %} ![Jeffrey Snover Photo](https://pbs.twimg.com/profile_images/1390707151614595073/fnKxlLaV_400x400.jpg) {% endfigure %}

* PowerShell Inventor / Microsoft Technical Fellow 
* <i class="fa-solid fa-house fa-lg"></i> : [jsnover.com](http://jsnover.com)
  * [<i class="fa-solid fa-blog fa-lg"></i> 블로그](https://www.jsnover.com/blog/) : 2011.09 ~ 2017.06 (2022년 확인시) 
* <i class="fa-brands fa-square-twitter fa-xl"></i> : [twitter.com/jsnover](https://twitter.com/jsnover)
* <i class="fa-brands fa-youtube fa-lg"></i> : [Jeffrey Snover on Youtube](https://www.youtube.com/results?search_query=Jeffrey+Snover) : 유튜브에 출연하신 영상이 많음, 대부분 PowerShell 관련

</div>

### Mark Russinovich

<div markdown="1" class="author-container">

{% figure %} ![Mark Russinovich Photo](https://pbs.twimg.com/profile_images/1600323888260358144/AIpkSMMZ_400x400.jpg) {% endfigure %}

* Sysinternals web site 소유주 : 1996년부터 advanced system utilities를 만듬
    - [![](https://learn.microsoft.com/en-us/sysinternals/media/index/sysinternals.png){:style="width:1.5em"} Sysinternals Home Page in MS Docs](https://learn.microsoft.com/en-us/sysinternals/)
* CTO of Microsoft Azure (2022?)
* [<i class="fa-solid fa-blog fa-lg"></i> MS에서 호스팅중인 Mark의 블로그](https://docs.microsoft.com/ko-kr/archive/blogs/markrussinovich/) : 더 이상 유지보수는 하지 않음, 2005 ~ 2013년 자료 
* <i class="fa-brands fa-square-twitter fa-xl"></i> : [Mark Russinovich twitter](https://twitter.com/markrussinovich)
* <i class="fa-brands fa-youtube fa-lg"></i> : 개인 Youtube Channel : [Mark Russinovich](https://www.youtube.com/channel/UCcgN7bUYW_RkoEx5EOn8XyQ)

</div>

## 기타 인물 

* [Dustin L. Howett](https://github.com/DHowett-MSFT) : Windows Terminal MS쪽 담당자. github에서 2020년까지 활동하다가 사라짐

### René Nyffenegger

<div markdown="1" class="author-container">

{% figure %} ![Rene Nyffenegger Photo](https://avatars.githubusercontent.com/u/1092660?v=4) {% endfigure %}

- <i class="fa-solid fa-house fa-lg"></i> : [René Nyffenegger](https://renenyffenegger.ch/) : 개인 홈페이지
    - [Windows 관련 서브페이지](https://renenyffenegger.ch/notes/Windows/) : 윈도우 관련 설정 정보가 좀 체계적으로 정리 되어있음
        - [Windows settings 서브페이지](https://renenyffenegger.ch/notes/Windows/settings/index)
        - [Windows control panel 서브페이지](https://renenyffenegger.ch/notes/Windows/control-panel/index)
        - [sysdm.cpl 관련 페이지](https://renenyffenegger.ch/notes/Windows/dirs/Windows/System32/sysdm_cpl/) : 윈도우 시스템 환경변수 설정 메뉴와 연관된 페이지
- <i class="fa-brands fa-github fa-xl"></i> : [Rene Nyffenegger github](https://github.com/ReneNyffenegger)
    - [위 개인 홈페이지의 Github](https://github.com/ReneNyffenegger/notes)
- <i class="fa-brands fa-square-twitter fa-xl"></i>  : [@renenyffenegger](https://twitter.com/renenyffenegger)

</div>

### Prateek Singh

<div markdown="1" class="author-container">

{% figure %} ![Prateek Singh](https://yt3.googleusercontent.com/ytc/AIf8zZSYdgIn4RxyX0XTWWpllh6CYTLLbzO95PxM-OWVwWI=s176-c-k-c0x00ffffff-no-rj) {% endfigure %}

- <i class="fa-solid fa-house fa-lg"></i> : [![](https://ridicurious.com/wp-content/uploads/2018/02/Final-TextSide-e1517732817532.png){:style="background:white;width:20%"}](https://ridicurious.com/) : PowerShell 및 MS 관련 제품 관련 기사 많음
- <i class="fa-brands fa-youtube fa-lg"></i> : [Engineering with Prateek](https://www.youtube.com/c/ridiculouslycurious) : 2021-04-04가 마지막 영상, Powershell 주제가 많음
- <i class="fa-solid fa-book-open fa-lg"></i> : [Learn Windows Subsystem for Linux](https://link.springer.com/book/10.1007/978-1-4842-6038-8)
- <i class="fa-brands fa-square-x-twitter fa-xl"></i> : [twitter.com/SinghPrateik](https://twitter.com/SinghPrateik)
   
</div>

### Steve Friedl

<div markdown="1" class="author-container">

{% figure %} ![Steve Friedl](http://www.unixwiz.net/images/Security360th.jpg) {% endfigure %}
{:style="width:60%"}

- a software and network security consultant in Southern California
- <i class="fa-solid fa-house fa-lg"></i> : [![](http://www.unixwiz.net/images/unixwiz-logo-140x80.gif){:style="width:5em"}](http://www.unixwiz.net) : 개인 테크 홈페이지
    - [TechTips](http://www.unixwiz.net/techtips/)
        - [Security Category - An Illustrated Guide to SSH Agent Forwarding](http://www.unixwiz.net/techtips/ssh-agent-forwarding.html) : 공식 Github docs에서 `SSH agent forwarding`에 대해 설명하면 이 문서의 링크를 걸었다. 출처 : [Using SSH agent forwarding, GitHub Docs](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/using-ssh-agent-forwarding)
    - [CmdLetters](http://www.unixwiz.net/cmdletters/) : Powershell Cmldlet 관련한 기술, 팁, 요령에 대해 기술
- <i class="fa-brands fa-square-x-twitter fa-xl"></i> : [twitter.com/SJFriedl](https://twitter.com/SJFriedl)
   
</div>


# 카테고리 문서
