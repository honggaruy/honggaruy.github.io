---
layout  : wiki
title   : Powershell 기초적인 명령 
summary : 파워쉘 사용하다가 자주 까먹는 기본 명령 
date    : 2022-02-09 16:11:46 +0900
updated : 2023-11-25 18:29:16 +0900
tag     : powershell dr_scripto profile 
toc     : true
public  : true
parent  : [[Windows-Category]] 
latex   : false
---
* TOC
{:toc}

# 도움을 주는 이들...

[![Dr Scripto](https://devblogs.microsoft.com/scripting/wp-content/uploads/sites/29/2018/09/dr_scripto-102x150.gif)](https://devblogs.microsoft.com/search?query=Dr+Scripto&blog=%2Fscripting%2F)
[![Kory Thacher](https://secure.gravatar.com/avatar/ca7ac7ab5a0d4579bea2a0904165c1cc?s=58&d=wp_user_avatar&r=g)](https://devblogs.microsoft.com/search?query=Kory+Thacher)
[![Kory Thacher](https://secure.gravatar.com/avatar/0ac76ca825380de54163d628b1c9b1f3?s=58&d=mm&r=g)](https://devblogs.microsoft.com/powershell-community/author/tflpsp-co-uk/)

## 관련 블로그 이력 

* [Scripting Blog, ~2021](https://devblogs.microsoft.com/scripting/) : Old Blog
  * [All good things must come to an end, Feb 16th 2021](https://devblogs.microsoft.com/scripting/all-good-things-must-come-to-an-end/) : Old Blog의 거의? 마지막 포스트 
* [PowerShell Community, 2021 ~](https://devblogs.microsoft.com/powershell-community/) : New Blog
  * [Announcing the PowerShell Community Blog, by Doctor Scripto, Feb 16th 2021](https://devblogs.microsoft.com/powershell-community/announcing-the-powershell-community-blog/) : 새로운 블로그의 첫번째 포스트

## Other Resources

* [doctorscripto github, Sean Kearney](https://github.com/doctorscripto)

# Tip1 : Path 환경 변수 내용 보기 (+이쁘게) 

* #dr_scripto
* 발췌 링크 : [PowerTip: Use PowerShell to Display Windows Path, microsoft devblog](https://devblogs.microsoft.com/scripting/powertip-use-powershell-to-display-windows-path/)
* 간단한 명령은 `>$Env:PATH`를 치면 되지만 너무 뭉텅이로 나와 보기 어렵다
* 다음과 같이 간단한 옵션을 주어 좀 더 보기 쉽게 만들어 보자
  ```sh
  >$Env:PATH -split ";"
  ```

## 유사 내용 :  모든 환경 변수 보기

* 발췌 링크: [PowerTip: Use Windows PowerShell to display all Environment variables](https://devblogs.microsoft.com/scripting/powertip-use-windows-powershell-to-display-all-environment-variables/)
* DOS에서 `SET` 명령처럼 모든 환경 변수를 보는 명령이 Powershell에도 있을까?
* 다음 명령을 실행해봐라
  ```sh
  >dir env:
  ```
  
# Tip2 : PowerShell 버전 보기

* 발췌 링크 : [PowerTip: Checking your PowerShell version, microsoft devblog](https://devblogs.microsoft.com/scripting/powershell-powertip-checking-your-powershell-version/)
* 다음 명령을 친다. `$psv`를 치고 <kbd>Tab</kbd>만 쳐도 자동완성된다. 뒤에있는 `PSVersion`도 다 치지 말고 tab 자동완성을 사용하자
  ```sh
  >$psversiontable.PSVersion
  ```
  
# Tip3 : PowerShell 에서 `rm -rf temp` 와 같은 명령을 어떻게 하지? 

* 발췌 링크 : [PowerTip: Use PowerShell to Clean Up Temp Files, microsoft devblog](https://devblogs.microsoft.com/scripting/powertip-use-powershell-to-clean-up-temp-files/)
* 다음 명령을 친다. `Remove-Item` 대신 `dir`을 쳐도 된다
  ```sh
  >Remove-Item temp -Recurse | Remove-Item -Force -Recurse
  ```
  
# Tip4 : Windows에 PowerShell 설치

* [Winodws PowerShell 5.1에서 PowerShell 7으로 마이그레이션](https://docs.microsoft.com/ko-kr/powershell/scripting/whats-new/migrating-from-windows-powershell-51-to-powershell-7?view=powershell-7.2) : 5.1 과 7.x는 Path가 다르므로 같이 설치해서 사용가능함
* [Windows에 PowerShell 설치](https://docs.microsoft.com/ko-kr/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.2#msi) : MSI 패키지 설치용 파일 링크 있음

## Setting1 : Execution Policy 설정하기

* PowerShell script를 마음대로 실행하려면 Execution Policy가 제대로 설정되어 있어야 함
  > Execution Policy is designed to prevent a user from unkonwingly running a script 
* [Execution Policy 설정하는법, ms pwsh docs](https://docs.microsoft.com/en-us/powershell/scripting/learn/ps101/01-getting-started?view=powershell-7.2#execution-policy)
* 현재 설정된 Execution Policy를 보는 법
  * `Get-ExecutionPolicy` : `Restricted`면 아직 미허용, `Remote Signed`면 허용된 상태
* Execution Policy 변경하는 법 : `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -scope CurrentUser`
  * mis-typing을 피하기 위해 tab completion을 이용할 것 
    
## Setting2 : PowerShell Profile 설정하기

* #profile
* 내용 발췌 소스
  * [Separate profiles, ms posh docs](https://docs.microsoft.com/en-us/powershell/scripting/whats-new/migrating-from-windows-powershell-51-to-powershell-7?view=powershell-7.2#separate-profiles) 
* profile 이란?
  * 보통 sessoin 이 시작할 때 편의적인 기능을 자동적으로 미리 로딩하기 위해 profile 파일을 작성한다.
  * powershell도 마찬가지 (예를 들면, linux bash도 `.profile` 파일에 저장)
* 실행시 잘 읽어오기 위해 저장된 위치가 중요한데.. 
  * Posh5.1 과 Posh7이 다르게 설정되어 동시에 사용가능하다
  * Posh5.1 : `$HOME/Documents/WindowsPowerShell`
  * Posh7.x : `$HOME/Documents/PowerShell`
* 이 명령으로 7.x 버전에서 달라진 profile 파일명을 볼수 있다
  ```sh
  PS> $PROFILE | Select-Object *Host* | Format-List

  AllUsersAllHosts       : C:/Program Files/PowerShell/7/profile.ps1
  AllUsersCurrentHost    : C:/Program Files/PowerShell/7/Microsoft.PowerShell_profile.ps1
  CurrentUserAllHosts    : C:/Users/<user>/Documents/PowerShell/profile.ps1
  CurrentUserCurrentHost : C:/Users/<user>/Documents/PowerShell/Microsoft.PowerShell_profile.ps1
  ```

# Tip5 : PowerShell 업데이트 하기 {#tip5} - 7.3.3 이후 winget 업데이트 안됨

* 아래와 같이 업데이트 메시지가 뜨는 경우 어떻게 업데이트할까?

  ```sh
  PowerShell 7.2.2
  Copyright (c) Microsoft Corporation.

  https://aka.ms/powershell
  Type 'help' to get help.

     A new PowerShell stable release is available: v7.2.3
     Upgrade now, or check out the release page at:
       https://aka.ms/PowerShell-Release?tag=v7.2.3

  Loading personal and system profiles took 3826ms.

  >
  ```
  
* 간단히 `winget upgrade -h --id Microsoft.PowerShell`로 최신버전으로 업데이트 할 수 있다
* 자세한 설명은 아래 링크를 참조한다
  * [Update an app on Windows 11 using winget command](https://pureinfotech.com/update-apps-winget-windows-11/)

## 2023-03-02 업데이트시 달라진 점 (2023-10-29 보완)

 ```sh
  PowerShell 7.3.2

     A new PowerShell stable release is available: v7.3.3
     Upgrade now, or check out the release page at:
       https://aka.ms/PowerShell-Release?tag=v7.3.3

  Loading personal and system profiles took 2357ms.

  > winget upgrade -h --id Microsoft.PowerShell
  A newer version was found, but the install technology is different from the current version installed. 
  Please uninstall the package and install the newer version.
  (혹은 => 최신 버전을 찾았지만 설치 기술이 현재 설치된 버전과 다릅니다. 패키지를 제거하고 최신 버전을 설치하세요.)
  
  >
 ```
- 7.3.3 버전에서 `winget` 업데이트가 바로안됨
- [Github 배포 사이트](https://github.com/PowerShell/PowerShell/releases/tag/v7.3.3) 에서 `PowerShell-7.3.3-win-x64.msi` 다운받아서 실행함
- Optional Actions : 설치과정 중 선택사항
    - Add PowerShell to Path Envronment Variable (체크)
        - 어떤 경로에서든 PowerShell을 실행할 수 있도록 함 
    - Register Windows Event Logging Manifest (체크)
        - [PowerShell Remoting](https://learn.microsoft.com/en-us/powershell/scripting/learn/remoting/running-remote-commands?view=powershell-7.3)(원격명령) 이 작동하도록 함
        - 다양한 advanced logging techniques 또한 enable 함
    - Enable PowerShell remoting (선택 안함)
        - 관련 cmdlet : [Enable-PSRemoting](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/enable-psremoting?view=powershell-7.3)
        - 원격 PowerShell 명령을 수신하도록 컴퓨터를 구성하는 것으로 Window Sever 플랫폼에서는 기본 활성화함
        - 개인 컴퓨터에서는 활성화 불필요할 듯
    - 나머지 두개는 Explorer에 편의성관련 context 메뉴 추가 하는 내용. 별로 중요하지 않음 
- Use Microsoft Update to help keep your computer secure and up tp date
-   - Enable updating PowerShell through Microsoft Update or WSUS (recommended)
-   - Use Microsoft Update when I check for updates (recommended)
    - 업데이트 정책 설정 (둘 다 체크함) 
      
## 2023-11-25 아래명령 다시 먹음

- 이 명령... 
    ```sh
    > winget upgrade -h --id Microsoft.PowerShell --source winget
    ```



