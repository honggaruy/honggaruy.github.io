---
layout  : wiki
title   : 윈도우 관련 문제 해결 
summary : 자잘한 팁 모음 
date    : 2022-02-03 12:31:02 +0900
updated : 2022-09-25 03:45:21 +0900
tag     : windows troubleshooting 
toc     : true
public  : true
parent  : [[Windows-Category]] 
latex   : false
---
* TOC
{:toc}

# 개요

* 잡다한 windows 문제 해결 관련 모음

# 내용

## Powertoys 가 인스톨 / 인인스톨이 모두 안됨

### 문제 상황

![PowerToys 인스톨 안됨 그림](https://user-images.githubusercontent.com/15467574/114306021-c2ff6e80-9ada-11eb-8c75-18dfd66a8634.png)

* 위와 같은 그림이 나오면서 인스톨 / 언인스톨이 모두 안됨
* 2022-01-31 문제 발생

### 해결책

* 해결책 찾은 링크 : [Running as user causes installer to ask for the .msi, Powertoys github](https://github.com/microsoft/PowerToys/issues/9720)
* 방법 1 : .exe 파일에서 .msi 파일 추출하기
  * [해결책 링크](https://github.com/microsoft/PowerToys/issues/9720#issuecomment-870283042) 
  * PowerToys 0.55.0 버전을 설치하려 했으나 기존에 깔려있던 0.51.0 버전에서 위 그림의 문제가 생김
  * PowerToys 0.51.0 버전 인스톨러(.exe 파일)을 다시 다운로드 받았고
  * 이 파일에서 아래 명령으로 .msi 파일을 추출함
    ```sh
    > .\PowerToysSetup-0.51.0-x64.exe --extract_msi
    ```
  * 다시 0.55.0 버전 인스톨러를 실행시키고 위와 같은 문제 발생시 0.51.0 버전 .msi 파일 추출한 source 경로를 지정해줌
  * 해결
* 참고 2 : **Microsoft uninstall trouble shooter** 라는게 있음
  * 이걸로 해결되는지 확인은 못해봤으나 참고삼아 기록
  * 설명 링크 : [Fix problems that block progrmas from being installed or removed, Microsoft Support](https://support.microsoft.com/en-us/topic/fix-problems-that-block-programs-from-being-installed-or-removed-cca7d1b6-65a9-3d98-426b-e9f927e1eb4d)
  * [Microsfot uninstall trouble shooter 다운로드 링크](https://download.microsoft.com/download/7/E/9/7E9188C0-2511-4B01-8B4E-0A641EC2F600/MicrosoftProgram_Install_and_Uninstall.meta.diagcab)

## Windows 11에서 시작 메뉴의 Live Tile을 되살리고 싶다..

- 관련 링크 :
  - [How do I get back Start Menu Tiles on Windows 11](https://www.howtoedge.com/start-menu-tiles-on-windows-11/) : 기사날짜 2022-07-24
  - [How to Get Back Start Menu Tiles on Windows 11, 2022 Guide](https://10scopes.com/get-back-start-menu-tiles-on-windows-11/) : 정확한 기사날짜는 없는데 2022년에 다시 수정한 듯
- 이 것때문에 Windows 11로 갔다가 다시 Windows 10으로 복귀했는데... 과연 될까 싶어 아직 안 해봄  
