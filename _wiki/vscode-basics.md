---
layout  : wiki
title   : Visual Studio Code 기초 
summary : VS Code를 사용하는데 필요한 기초적인 정보 
date    : 2022-05-26 11:20:50 +0900
updated : 2024-02-21 09:48:54 +0900
tag     : visual-studio-code vscode-settings
toc     : true
public  : true
parent  : [[VS-Category]] 
latex   : false
---
* TOC
{:toc}

# 편집 방법

## 유용한 단축키

- 왼쪽 사이드 패널 Explorer 옵션으로 열기 : <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>e</kbd>
- 왼쪽 사이드 패널 닫기 : <kbd>Ctrl</kbd>+<kbd>b</kbd>
- 아래쪽 내장 터미널 열기/닫기 :  <kbd>Ctrl</kbd>+<kbd>`</kbd>
- 에디터 그룹 이동하기 (3그룹까지만 됨):  <kbd>Ctrl</kbd>+<kbd>1 / 2 / 3</kbd>

# 환경 설정

* 공식 매뉴얼중 관련 문서 : [docs / GET STARTED / Settings](https://code.visualstudio.com/docs/getstarted/settings)
* 두 가지 Settings (설정이 적용되는 Scope의 차이)
  * User Settings - 글로벌 설정
  * Workspace Settings - 프로젝트별 로컬 설정

## 두 가지 Settings 편집 방법 {#two-settings-types}

* Settings 편집기 이용하기 - UI에서 설정하는 방법
  * 참고 : Command Palette 열기 - Command Palette ( <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>p</kbd> )
  * Settings 편집기 open하는 3가지 방법
    * File > Preferences > Settings
    * Command Palette 열기 > 
      * User Settings 편집창 : `Preferences: Open Settings (UI)` 선택
      * Workspace Settings 편집창 : `Preferences: Open Workspece Settings` 선택
    * keybaoard shortcut : <kbd>Ctrl</kbd> + <kbd>,</kbd>
* JSON 직접 편집하기 - editor창에서 수정하는 방법
  * 관련 섹션 : [settings.json](https://code.visualstudio.com/docs/getstarted/settings) 
  * 직접 `settings.json` 편집하는 방법
    * Command Palette 열기 > 
      * User Settings 수정하기
        * `Preferences: Open Settings (JSON)` 선택
        * 참고로 `Preferences: Open Default Settings (JSON)`은 설정기본값을 볼수있음 
      * Workspace Settings 수정하기 : `Preferences: Open Workspece Settings (JSON)` 선택
      * keybaoard shortcut : 오른쪽 `Gear` icon을 눌러 단축키를 직접 설정할 수 있다 
    * 항상 `settings.json`으로 편집하도록 설정하는 방법
      * `"workbench.settings.editor": "json"`으로 설정한다

## Workspace settings

* 공식 매뉴얼중 관련 부분 : [Workspace settings](https://code.visualstudio.com/docs/getstarted/settings#_workspace-settings)
* Workspace Settings은 User Settings을 Override 한다
* Workspace Settings은 application-wide setting을 Override 할 수 없다 (e.g. 업데이트나 보안 설정)
* 위치는 각 프로젝트 root의 `.vscode` 폴더에 있다

## Language-specific editor settings

* 공식 매뉴얼중 관련 부분 : [Language-specific eitor settings](https://code.visualstudio.com/docs/getstarted/settings#_languagespecific-editor-settings)

# 내장 터미널 

* 공식 매뉴얼중 관련 부분 : [docs / USER GUIDE / Integrated Terminal](https://code.visualstudio.com/docs/editor/integrated-terminal)
* vs code는 workspace의 root에서 시작하는 fully-featured 내장 터미널 지원
* Open 방법
  * keyboard shortcut: <kbd>Ctrl</kbd> + <kbd>`</kbd> 
  * Menu: `View > Terminal`
  * Cmd Palette: `View: Toggle Terminal`
  * create a new terminal: in `Terminal` menu `Terminal > New Terminal`
* Terminal profiles
  * profile 설정하기
    * `path` or `source` ?
      * source:
        * Windows에서만 사용할수 있음
        * VS Code가 `PowerShell` 이나 `Git Bash`의 설치를 탐지하도록 한다
      * path:
        * shell executable을 직접 가리키는 옵션

# 변수 Reference

* 공식 매뉴얼중 관련 부분 : [docs / USER GUIDE / 사이드 메뉴에 없음](https://code.visualstudio.com/docs/editor/variables-reference)
* VS Code는 `Debugging` 과 `Task` Configuration file 등에서 variable substitution을 지원한다

# 설정 Recipes

## Tip 1. VS Code에서 내장 터미널에 자동으로 conda 환경 실행시키기

* 발췌 링크: [Automatically activate conda environment in Powershell for VSCode, Krishan's Tech Blog](https://krishansubudhi.github.io/vscode/2020/09/17/vscod-conda-powershell.html)
* 문제 : 
  * Integrated Terminal로 **CMD가 아닌** PowerShell을 사용하고 싶은데 자동으로는 설정되지 않아서 manual로 설정해야함
  * Integrated Terminal로 PowerShell을 열고 `conda activate <env name>`을 실행하면 다음과 같은 에러가 나온다
    ![Integrated Terminal conda error Image](https://krishansubudhi.github.io/assets/anaconda_powershell_vscode/terminal_before.jpg) 
* 부가 해결 조건 :
  * 특정 프로젝트마다 맞는 Conda Env. 가 있으므로 VS Code User Settings가 아닌 Workspace Settings로 설정하고 싶다
* 해결 :
  * Anaconda가 설치 될 때 생성된, 다음 그림과 같은 Prompt를 찾는다
    ![Anaconda PowerShell Prompt Img](https://krishansubudhi.github.io/assets/anaconda_powershell_vscode/anaconda_powershel_shortcut.jpg) 
  * `파일 위치 열기`로 폴더로 이동후, 해당 바로가기 우클릭 후, 속성창을 열고 `대상(T):`를 보면 다음과 같은 초기명령 목록이 있다
    ```
    %windir%\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy ByPass -NoExit -Command "& 'D:\App\Anaconda3\shell\condabin\conda-hook.ps1' ; conda activate 'D:\App\Anaconda3' "
    ```
  * VS Code로 원하는 프로젝트를 연 뒤에, [위의 방법](#two-settings-types)으로 `Workspace Settings (JSON)`을 연다
  * 다음과 같이 `settings.json`을 설정한다
    ```json
    {
      "python.terminal.activateEnvInCurrentTerminal": true, <-- 이 줄은 삭제 가능
      "terminal.integrated.defaultProfile.windows": "PowerShell with Conda",
      "terminal.integrated.profiles.windows": {
          "PowerShell with Conda":{
            "path": "${env:windir}/System32/WindowsPowerShell/v1.0/powershell.exe",
            "args": [
              "-ExecutionPolicy",
              "ByPass",
              "-NoExit",
              "-Command",
              "& D:/App/Anaconda3/shell/condabin/conda-hook.ps1",
              "; conda activate base",
              ]
          }
        },
    }
    ```
    * 명령어중에 포함된 `conda-hook.ps1` 파일 내에서 사용되는 `Import-Module` 명령이 보안문제로 `Posh7.x` 에서는 deprecated 되었기 때문에 `Posh5.1`에서만 가능하다
    * 위에서 "python.terminal.activateEnvInCurrentTerminal" 과 "conda activate base" 명령이 같은 의미 이므로 한 곳은 삭제 가능하다 
