---
layout  : wiki
title   : Git 설정관련 팁 
summary : Git-bash 관련 설정 쓰다가 시작 
date    : 2022-12-17 12:14:52 +0900
updated : 2022-12-17 14:27:18 +0900
tag     : git linux bash
toc     : true
public  : true
parent  : [[Git-Category]]
latex   : false
fontawe : false
---
* TOC
{:toc}

# Tip 1. Windows Terminal 에서 Git-bash 한글 깨짐 해결

- 참고 링크
  - [Window Terminal 에서 Git-bash 한글 깨짐 해결, 꼬반/티스토리블로그](https://ifmkl.tistory.com/m/408?category=80669)
- 환경 스펙
  - Windows 10, git-for-windows v2.36.0, Windows-Terminal 1.15
- Windows Terminal에 git-bash 탭을 설정하고 사용할 때 
  - 한글로된 파일명이나 폴더명이 깨져서 출력됨
- 원인은
  - git-bash 탭 설정시에 그냥 아래와 같이 설정했었는데
  ```json
  "commandline": "C:/Utils/Git/bin/bash.exe"
  ```
  - `git-bash` 실행시 상단 status bar를 보면  `/usr/bin/bash.exe --login -i`라고 한 1~2초간 찍힘
- 해결책은
  - WT의 git-bash 탭 설정은 다음과 같이 변경해주는 것
  ```json
  "commandline": "C:/Utils/Git/usr/bin/bash.exe --login -i"
  ```
- 추가 연구
  - [Login vs Non-Login Shell, bash-shell/githubIO](https://mug896.github.io/bash-shell/login_non-login.html)
    - 한글깨짐을 해결한 옵션은 두가지로 `--login`과 `-i`이다
    - `-i`는 `interactive-mode`로 bash 명령이 1회성으로 끝나는 것이 아니라 계속 대기상태로 이어지도록 한 것 같고
    - `--login`모드가 설정파일을 읽어들여 한글이 깨지지 않는 옵션이 설정되도록 한것이다
    - 정확히 어떤 파일의 어떤 옵션인지는 추가 연구가 필요함
  - [How can I find out the command line options for git-bash.exe?, superuser/StackExchange](https://superuser.com/q/1104567)
    - command line에서 `git help git-bash`로 `로컬 헬프 문서`를 열람할 수 있다
  - [/bin 디렉토리와 /usr/bin 디렉토리 차이는 무엇일까?, 욱이의IT생존일지/티스토리블로그](https://wookiist.dev/10)
    - 사실 위 명령에서는 `/bin/bash.exe`를 사용하든 `/usr/bin/bash.exe`를 사용하든 차이가 없었다
    - 둘다 동일하게 `--login -i` 옵션이 잘 작동했으며
      - 위 옵션이 없으면 `ls` 명령도 동작하지 않았다
    - 이 링크에 관련자료 링크가 있어 이곳에 기록한다
      - [Filesystem Hierarchy Standard](https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard#cite_note-43)
      - [Diff btw /bin /sbin ... , askUbuntu/StackExch](https://askubuntu.com/q/308045)
      - [/usr/bin vs /usr/local/bin on Linux, Unix&Linux/StackExch](https://unix.stackexchange.com/q/8656)
