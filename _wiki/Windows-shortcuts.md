---
layout  : wiki
title   : 윈도우즈 바로가기 모음 
summary : 설정을 좀 더 빠르게 접근하기 
date    : 2022-01-17 12:30:41 +0900
updated : 2022-09-24 16:56:02 +0900
tag     : windows shortcut environment-variables
toc     : true
public  : true
parent  : [[Windows-Category]]
latex   : false
---
* TOC
{:toc}

# 관련 링크 모음

* [Windows Command Line](https://www.windows-commandline.com/) : 커맨드라인 명령 모음 블로그
* [Legacy Control Panel Commands, microsoft](https://docs.microsoft.com/en-us/windows/win32/shell/executing-control-panel-items#legacy-control-panel-commands)
* [How to Create Shortcuts to Open Control panel Items in Windows 10](https://www.tenforums.com/tutorials/86339-list-commands-open-control-panel-items-windows-10-a.html) 
* [Command Line Commands for Control Panel Applets, Lifewire](https://www.lifewire.com/command-line-commands-for-control-panel-applets-2626060)

# 표기법 

* <kbd>⊞</kbd> : 윈도우 키

## 실행할 준비

* <kbd>⊞</kbd> + <kbd>r</kbd> : 실행 창 띄우기 

아니면

* windows terminal  상태로 대기

# 사용하는 명령 모음

* `winver`: 윈도우 버전 및 빌드 번호를 바로 보고 싶을 때 
  * 최신 기능을 적용할수 있는지 확인할 때 빌드번호를 확인해야 한다
* `control update` : 최신 버전으로 업데이트 해야할 때 업데이트 창으로 이동
* `control /name Microsoft.Language` : 3벌식 , 2벌식을 바꿀수 있는 기본 언어 설정으로 이동
  * 한국어 IME의 옵션을 바꾸고 싶지만 바로가기키를 못찾음. 그나마 제일 가까운 설정으로 이동하는 명령임
* `gpedit.msc` : 로컬 그룹 정책 편집기
* `shell:startup` : 탐색기 Open (사용자 / AppData / Roaming / Microsoft / Windows / 시작메뉴 / 프로그램 / 시작프로그램 )
* `sysdm.cpl ,3` : 시스템 속성에서 `환경변수` 옵션이 있는 `고급`탭을 띄우는 명령 
  - tags: #environment-variables
  - [sysdm.cpl](https://renenyffenegger.ch/notes/Windows/dirs/Windows/System32/sysdm_cpl/)
  - Windows Commander 창에서는 잘되지만 PowerShell 창에서는 에러뜸 
  - PowerShell은 `sysdm.cpl` 까지는 실행이 됨
    - 이와 관련된 article이 레딧에 있음 : [Command LIne Syntax to PowerShell](https://www.reddit.com/r/PowerShell/comments/3v73vv/question_command_line_syntax_to_powershell/)
    - 결론적으로, PowerShell에서 동일 동작을 하려면 ...
      ```posh
      Start-Process control.exe -ArgumentList "sysdm.cpl,,3"
      ```
  
      
