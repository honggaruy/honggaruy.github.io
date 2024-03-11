---
layout  : wiki
title   : Windows Terminal 설정하기 
summary : 
date    : 2020-11-06 16:43:24 +0900
updated : 2022-03-29 03:26:41 +0900
tag     : windows-terminal dotfile GUID powershell 
toc     : true
public  : true
parent  : [[Windows-Category]] 
latex   : false
---
* TOC
{:toc}

# 설정 관련 참고 링크

* [Microsoft Windows Terminal 공식홈](https://docs.microsoft.com/en-us/windows/terminal/)
  * [Customize settings / startup](https://docs.microsoft.com/en-us/windows/terminal/customize-settings/startup)
* [Terminal Splash](https://terminalsplash.com/) - 컬러스킴 관련 설정모음
* [Powerlevel 10k](https://github.com/romkatv/powerlevel10k) - WSL 창에서 zsh 설치한 이후 사용하는 리눅스 테마
* [PowerShell 용어집](https://docs.microsoft.com/ko-kr/powershell/scripting/learn/glossary?view=powershell-7.2)

# GUID는 어떻게 설정해야 하나?

* 잘 설명된 글 : [Windows Terminal: Generating GUIDs For Your Profiles](https://traviscolbert.net/blog/windows-terminal-generating-guids-for-your-profiles/)
* GUID는 단지 구별을 위한것 (There's nothing **magical** about them.)
  * [Windows Registry에서 지원하는 구분자 포맷을 맞추면 된다.](https://docs.microsoft.com/ko-kr/windows/terminal/customize-settings/profile-advanced#unique-identifier)
  * 임의로 만들어도 되지만...
    * Powershell 도구를 사용하면 더 쉽게 만들수 있다.
      ```sh
      > [guid]::NewGuid()
      Guid
      ----
      16f7d5ae-b0b1-466c-8a09-de6890669e30
      ```
    * 레지스트리 아이템을 구별하는 용도로 쓰는 것이라면 중복되지 않게 설정하는 것이 필요한데 임의로 만드는 것보단 위의 도구를 사용하는 것이 좋을듯하다. 
    * ⭐⭐사실은 숨겨진 **magical** thing이 있다
      * 이 링크를 보면 ... [Windows Terminal 의 Default Icon 관련 GUID, windows terminal github](https://github.com/microsoft/terminal/issues/1918#issuecomment-518990533)
        * 위 링크를 보면  
      * 이 [아이콘 repository](https://github.com/microsoft/terminal/tree/main/src/cascadia/CascadiaPackage/ProfileIcons)가 나오는데 ...
      * PowerShell Default 탭의 GUID가 아마 `{61c54bbd-c2c6-5271-96e7-009a87ff44bf}`일텐데 이 곳에 같은 번호를 가진 이미지가 있다. 이미지를 확인해보면 
      *  
* 임의로 만드는 것이라면 빼도 되지 않을까? 어디에 쓸까?
  * Windwos Terminal 실행시 제일 처음에 뜨는 default profile을 GUID로 선택한다.

## 같은 GUID에 설정만 다르게 하고 싶으면..

* 첫번째 설정에만 guid 옵션을 설정하고 두번째 설정은 guid를 빼면 된다
* 관련 링크
  * [Add support for inheriting and overriding another profile's settings](https://github.com/microsoft/terminal/issues/3818) : 원 질문자에 MS측 Windows-Terminal 담당자인 DHowett-MSFT가 답변을 단 내용
    * 질문 내용: 같은 GUID에 대해 설정은 다르게 해서 등록하고 싶은데 두번째 설정은 첫번째 설정을 상속하도록 해서 달라지는 설정만 setting 하도록 할 수 있을까? 
  * [해당내용 공식 문서 링크가 있던 자리..지금은 없음](https://github.com/microsoft/terminal/blob/main/doc/cascadia/SettingsSchema.md)
  * [DHowett이 다시 링크를 건 곳인데.. 어디있는지..](https://docs.microsoft.com/ko-kr/windows/terminal/customize-settings/global-settings)

# WT 설정파일을 dotfile에 포함 가능한가?

## 관련 링크 
* [Feature Request: Option to change location of profiles.json](https://github.com/microsoft/terminal/issues/1455)
* [dotfile 이란 ?]( /wiki/dotfiles/)

## `settings.json` 경로에 `8wekyb3d8bbwe`는 뭔가? 

* settings.json의 경로는 현재 이렇게 되어 있음 : `%HOME%/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json`
* 그게 변할수 있는 건가? dotfiles repo에서 Symbolic 링크를 걸 경우 미래에 안될수 있나?
* [DHowett-MSFT 답변](https://github.com/microsoft/terminal/issues/1455#issuecomment-506521700) : `8weky...`는 MS Store에서 Microsoft가 작성한 제품에 붙는 ID 같은것임. 따라서 변하지 않을것이고 Symbolic link 걸어도 안전함.
  * 진짜 그런가 확인하는 법 : 실제로 `%HOME%/AppData/Local/Packages/`밑에 `Mircrosft.~`로 시작하는 제품은 모두 `8wekyb3d~`로 끝남.

## `settings.json`을 링크 걸면 편집해도 바로 반영 안된다?

* symlink를 사용하지 않고 일반 파일로 설정된 settings.json은 WT를 다시 시작하지 않아도 편집하면 즉시 변경사항이 반영된다.
* 하지만 symlink를 걸어서 사용할 경우 편집내용이 즉시 반영되지 않는다는 말이 있다.
* 해결책 : `settings.json`에 symlink를 걸지말고 바로 위의 디렉토리인 `Localstate`에 링크를 걸면 일반 파일과 동일하게 즉시 반영된다고 함. [답변 링크](https://github.com/microsoft/terminal/issues/1455#issuecomment-691470907)

# Window Terminal + PowerShell 프롬프트 이쁘게 설정하기 (2022-03-27)

* #windows-terminal #powershell
* Windows PowerShell 5.1을 사용하다가 PowerShell 7.x를 설치했는데 ..
* PS5.1에서 쓰던 설정을 7에도 사용하고 싶다
* 처음 Windows Terminal + PowerShell5.1 쓰던 때와 상황이 달라져서 정리한다 

## PowerShell 7 설치

* 주요 소스: 
  * [Windows에 PowerShell 설치](https://docs.microsoft.com/ko-KR/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.2)
  * [Windows PowerShell 5.1에서 PowerShell 7로 마이그레이션](https://docs.microsoft.com/ko-kr/powershell/scripting/whats-new/migrating-from-windows-powershell-51-to-powershell-7?view=powershell-7.2)
* 정식 명칭
  * Posh 5.1 : Windows PowerShell 5.1
  * Posh 7.x : PowerShell 7.x
* 위 링크 페이지에 Posh 7.x 최신 버전 설치용 .msi 파일 링크가 있다
* Posh 5.1 은 Posh 7.x 와 경로가 다르기 때문에 나란히 실행됨
  * [별도의 PowerShell 설치 위치](https://docs.microsoft.com/ko-kr/powershell/scripting/whats-new/migrating-from-windows-powershell-51-to-powershell-7?view=powershell-7.2#separate-installation-path-and-executable-name)
    * Posh 5.1 : `$env:WINDIR\System32\WindwosPowerShell\v1.0` 
    * Posh 7.x : `$env:ProgramFiles\PowerShell\7` 
  * [별도의 PSModulePath](https://docs.microsoft.com/ko-kr/powershell/scripting/whats-new/migrating-from-windows-powershell-51-to-powershell-7?view=powershell-7.2#separate-psmodulepath)
    * 파워쉘 프롬프트를 꾸미기 위한 두가지 모듈을 설치할 것임
      * 파워쉘 버전별로 모듈들이 별도의 경로로 설치됨을 알아야 한다 
    * Posh 5.1
      * PowerShell 모듈 : `$env:WINDIR\system32\WindowsPowerShell\v1.0\Modules` 
      * 사용자 설치 AllUsers 범위 : `$env:ProgramFiles\WindowsPowerShell\Modules` 
      * 사용자 설치 CurrentUsers 범위 : `$HOME\Documents\WindowsPowerShell\Modules` 
    * Posh 7.x
      * PowerShell 모듈 : `$PSHOME\Modules` 
      * 사용자 설치 AllUsers 범위 : `$env:ProgramFiles\PowerShell\Modules` 
      * 사용자 설치 CurrentUsers 범위 : `$HOME\Documents\PowerShell\Modules`
    * 처음 사용법
      * 일단 일반적인 용도로 처음 쓸 때에는 **CurrentUsers** 범위로 설치하면 될 것 같다
      * 현재 설정된 `$Env:PSModulePath`확인하는 명령 
        * 두 버전 모두 동일하게 `$env:PSModulePath -split ';'`
    * 추가 참조 링크
      * [about_PSModulePath](https://docs.microsoft.com/ko-kr/powershell/module/microsoft.powershell.core/about/about_psmodulepath?view=powershell-7.2&preserve-view=true) 
      * [about_Modules](https://docs.microsoft.com/ko-kr/powershell/module/Microsoft.PowerShell.Core/About/about_Modules?view=powershell-7.2) 

## 현재 상황 이해

* [PROFILE 저장 위치](https://docs.microsoft.com/ko-kr/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7.2#the-profile-files)
  * PowerShell이 처음에 기동될 때 프롬프트를 원하는 설정으로 표현하고 싶다면 **프로파일 파일**에 설정을 해줘야 한다
    * 예를 들면, vim에서 vimrc 파일의 역할, bash에서 `.bash_profile`의 역할 
  * 일단은 위 링크의 `프로필 파일`표에서 `현재 사용자, 현재 호스트` 설정으로 사용중임
  * 당연히 버전별로 프로파일 파일의 위치가 다르다
    * 각 버전의 Posh에서 `code $PROFIlE` 명령을 실행하면 각각의 프로파일 파일을 열 수 있다 
    * 그러므로 5.1 프로파일을 단순히 7.x 프로파일 위치에 복사만 해주면 Module을 찾을 수 없다는 에러 발생함
* [파워셀에서 호스트의 의미](https://docs.microsoft.com/ko-kr/powershell/scripting/learn/glossary?view=powershell-7.2) : 이 링크에서 **호스트**의 의미를 몰라서 찾아봤다
  > 호스트 : PowerShell엔진이 사용자와 통신하는데 사용하는 인터페이스입니다. 예를 들어 호스트는 PowerShell과 사용자 간의 프롬프트 처리 방법을 지정합니다
  >
  > 호스트 애플리케이션 : PowerShell 엔진을 해당 프로세스에 로드하고 작업을 수행하는데 사용하는 프로그램입니다.
  * 위의 용어 설명만 가지고는 감이 잘 안온다
  * 다시 `PROFILE 저장 위치` 링크에서 문맥으로 호스트의 의미를 파악해보면 ...
    * PowerShell 인터페이스를 출력해주는 몇몇 프로그램이 있는데 (Windows Terminal, VS Code에서 터미널 기능,..) 
    * 이들을 호스트라고 하는 것 같다. 
      * 즉, **호스트 프로그램내** 에서 PowerShell 인터페이스를 제공**(호스팅)**한다는 의미이다
      * *호스트 애플리케이션*이 구체적이고  좀 더 이해하기 쉬운 표현인것 같다 
    * 추가적인 예제에서 보듯이 `...VSCode_profiles.ps1` 이라는 이름으로 VSCode 호스트만 별도의 프로파일을 설정할 수 있다

## 프롬프트 꾸미기 모듈 설치

* 주요 소스:
  * [자습서: Oh My Posh를 사용하여 .. 프롬프트 설정](https://docs.microsoft.com/ko-kr/windows/terminal/tutorials/custom-prompt-setup)
* 프롬프트를 꾸미기 위해서는 몇가지 모듈이 필요하다
    * [Oh My Posh](https://ohmyposh.dev/) : 프롬프트 Theme을 설정할 수 있다 
    * [Terminal-Icons](https://github.com/devblackops/Terminal-Icons) : Terminal 에서 파일 종류별로 아이콘이 표시되도록 해준다
    * [posh-git](https://github.com/dahlbyk/posh-git#overview) : git 프로젝트 폴더일 경우 **git status**를 아이콘 형식으로 바로 보여준다
      * [posh-git doc](http://dahlbyk.github.io/posh-git/) : 표시되는 아이콘의 의미를 알수 있다
      * 그 외 : git 명령의 tab completion을 제공 등등..
