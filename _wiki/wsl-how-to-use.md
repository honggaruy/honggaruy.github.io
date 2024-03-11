---
layout  : wiki
title   : WSL 사용하기 
summary : WSL을 오래간만에 사용할 때 보기 
date    : 2022-01-17 12:18:09 +0900
updated : 2023-11-01 00:42:23 +0900
tag     : linux wsl wsl2 
toc     : true
public  : true
parent  : [[Linux-Category]] 
latex   : false
fontawe : true
---
* TOC
{:toc}

# 개요

## 관련 링크

* [WSL 마소 공식문서 홈](https://docs.microsoft.com/en-us/windows/wsl/)
  * [Set up a WSL development environment](https://docs.microsoft.com/en-us/windows/wsl/setup/environment) : 중요문서 
    
# 기본

## Distro 목록 보기

* `distro`의 뜻 : [리눅스 배포판, 위키백과](https://ko.wikipedia.org/wiki/리눅스_배포판)
* 관련 링크 : [List Available WSL Linux Distors in Windows 10](https://winaero.com/list-available-wsl-linux-distros-windows-10/)
* 모든 Distro 목록 보기
  > wsl --list --all
  > 혹은 wsl -l --all
* 현재 실행중인 distro 목록 보기
  > wsl --list --running (혹은 wsl -l --running)
  
* 2022-01-17 현재 running 중인 my distro name
  * `Ubuntu-20.04`

## 기본 명령

* Ubuntu package 목록을 업데이트 하라
  * 업데이트 명령 
    ```sh
    > sudo apt-get update
    ```
  * 업데이트 안 된 distro 은 새로운 패키지를 설치하려할 때 문제가 생길수 있으므로 처음에, 또는 수시로 업데이트 한다
    
# 설정

## WSL의 고급 설정 구성

* 관련 링크 : [WSL의 고급 설정 구성](https://docs.microsoft.com/ko-kr/windows/wsl/wsl-config)
* wsl.conf 설정하는 법

## WSL2 에서 C++ 환경설정 하기

### 관련 링크

* ⭐⭐[Using C++ and WSL in VS Code, visual Studio Code Doc](https://code.visualstudio.com/docs/cpp/config-wsl)
* [VS Code에서 WSL2와 C++ 환경설정 하기, 개인블로그](https://skyqnaqna.tistory.com/entry/VS-Code에서-WSL-2와-C-사용하기)
* [gcc/g++ 설치하기, woowaa.net](https://woowaa.net/102)
* [gcc 배포 이력, gcc.gnu.org](https://gcc.gnu.org/) : 2022-01-17 현재 최종 버전은 GCC 11.2 ( 내가 쓰는 WSL2 최종 버전은  gcc 9.3 )

### 현재 환경

* 모든 소스코드와 compiler는 WSL내에서 hosting하지만
* windows상의 VS Code 와 그의 확장들 ( Remote - WSL, 디버거 등등)을 사용함
* 결론 -  VS Code x WSL2 환경, VS Code 확장으로 intellisense, 빌드및 디버깅 모두 가능함
* 이 환경에 대한 자세한 설명은 [VS Code Remote Development](https://code.visualstudio.com/docs/remote/remote-overview) 를 참조

### 최신 버전 업데이트

* [Install GCC on Ubuntu 20.04](https://linuxize.com/post/how-to-install-gcc-on-ubuntu-20-04/#installing-gcc-on-ubuntu-2004)
  * 명령
    ```sh
    > sudo apt update
    > sudo apt install build-essential gdb
    ```
  * 위 명령은 `gcc`,`g++`, `make`등 많은 패키지를 한 번에 설치한다
  * 2022-01-17 현재 최신버전은 다음과 같다
    * build-essential - `12.8ubuntu1.1`
    * gdb - `9.2-0ubuntu1~20.04`

### [Run VS Code in WSL](https://code.visualstudio.com/docs/cpp/config-wsl#_run-vs-code-in-wsl)

* WSL 상의 cpp project 폴더에서 `code .` 명령을 수행한다
  * **"installing VS Code Server"** 메시지가 보인다 
    * VS Code가 Linux side에서 작은 서버를 다운로드해서 설치하고 데스크탑 side의 VS Code가 대화하기 시작한다
    * VS Code는 해당 cpp project 폴더를 열고 
      * VS Code 상의 `File Explorer`는 VS Code가 `WSL context`상에서 실행된다는 표시를 보여준다
        * title bar 에서 `[WSL: Ubuntu-20.04]`를 볼 수 있다
      * VS Code 상의 `status bar`에서도 `[WSL: Ubuntu-20.04]`표시를 볼 수 있다
* 제목의 링크에서 알려주는 필수 VS Code 확장을 깔고 튜토리얼을 따라해보면 `.vscode`폴더내에 다음의 파일이 자동으로 생성된다
  * `c_cpp_properties.json` : compiler 경로와 IntelliSense 설정
  * `tasks.json` : build instructions (make 파일과 비슷)
  * `launch.json` : 디버거 설정

<style>
.reddish { color:#d50000; background:#fce8e6;}
.bluish { color:#01579b; background:#e1f5fe;}
</style>

* `tasks.json` 파일의 구성
  * VS Code에서 `Terminal > Configure Default Build Task` 명령을 줄때 자동으로 생성
  * 내용
   
    ```json
    {
      "version": "2.0.0",
      "tasks": [
        {
          "type": "shell",
          "label": "g++ build active file",
          "command": "/usr/bin/g++",
          "args": ["-g", "${file}", "-o", "${fileDirname}/${fileBasenameNoExtension}"],
          "options": {
            "cwd": "/usr/bin"
            },
          "problemMatcher": ["$gcc"],
          "group": {
            "kind": "build",
            "isDefault": true
            }
        }
      ]
    }
    ```


    * `command`{: .reddish} 설정 : 실행할 프로그램을 지정. 이 경우 `g++`
    *  `args`{: .reddish} 배열 : g++에 전달할 command-line arguments를 지정함
      * 이 arguments는 컴파일러가 기대하는 순서로 지정되어야 한다
    * 이 task는 g++ 에게 다음과 같이 지시한다 
      * active file (`${file}`{: .reddish})을 가지고, 컴파일 해서,
        * 여기서 active file 이라는 것은 
          * VS Code에서 `Terminal > Configure Default Build Task` 명령을 줄때
          * 현재 VS Code Editor 상에서 보고있던 `.cpp` 파일을 말함 (즉 현재 활성화된 파일)
      * 현재 디렉토리(`$(fileDirname}`{: .reddish})에 
      * active file 이름과 같은 실행파일을 만들지만
      * 확장자는 가지지 않도록(`${fileBasenameNoExtenstion}`{: .reddish})
    * 결과적으로 `helloworld`{: .reddish}라고 실행파일이 만들어진다 ( 소스코드 이름이 `helloworld.cpp`{: .reddish} 일때)
    * 이 링크([variables reference](https://code.visualstudio.com/docs/editor/variables-reference))를 통해 `task.json`의 variables에 대해 자세히 알수 있다
    * `label`{: .reddish} 값 : tasks 목록에서 보게될 제목이다. 아무렇게나 이름지어도 된다
    * `group`{: .reddish} object의 `"isDefault": true`{: .reddish} 값 : `Ctrl+Shift+B`{: .bluish}(Build 명령)를 눌렀을때 이 task가 실행될 것이라는 것을 설정함
      * 이 property는 편의적인 목적만 있음
      * 이 설정을 false로 두더라도 Terminal Menu의 **Tasks: Run Build Task**로 실행할 수 있다

* Build한 것 실행하기
  ```sh
  > ls
  helloworld helloworld.cpp
  > ./helloworld
  ```
* tasks.json 수정하기
  * `tasks.json`{: .reddish}를 수정하여 여러개의 C++ files 

### 필수 VSCode 확장

* [Remote - WSL](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl) : Windows 상의 VS Code를 이용하여 linux application을 `개발`하도록 지원. 
  * Windows 환경의 생산성 그대로 linux에서 사용가능하다

## WSL2 Ubuntu에 ZSH 설치해서 터미널 꾸미기

- 원본 링크: [WSL2 Ubuntu에 ZSH 설치해서 터미널 꾸미기, YUNHA INDUSTRIES 블로그](https://llighter.github.io/install_zsh_in_wsl2/)

### zsh 설치

- `sudo apt install zsh` 로 설치
    ![](https://llighter.github.io/install_zsh_in_wsl2/1.png)
- 기본 쉘을 zsh로 변경
    - 현재 설정된 기본 쉘 확인
        ```sh
        $ echo $SHELL
        /bin/bash             <-- 현재 bash가 기본 쉘임
        ```
    - 기본 쉘 변경 명령 
        ```sh
        $ chsh -s $(which zsh)
        ```
        - `which zsh`에서 `which`는 `zsh`의 경로와 파일명을 찾아서 반환한다
        - 바로 변경되지는 않고 탭을 닫았다가 다시 로그인 해야 변경된 기본 쉘이 반영된다
            - 참고: [Why am I not able to change the shell ... from <i class="fa-brands fa-stack-overflow fa-xl"></i>](https://unix.stackexchange.com/q/362894) 
- oh my zsh 설치
    - [oh my zsh](https://github.com/ohmyzsh/ohmyzsh) 의 설치는 링크에 자세히 나와 있다
        - `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`  
    - 위 명령으로 설치를 하는데..
        - 일단 `sh -c` 명령에 대한 설명은 다음 링크를 참고하자 : [링크](https://askubuntu.com/a/831850)
        - `sh -c` 명령을 다음에 오는 명령줄 문자열을 인터프리터식으로 실행하는 명령이다
        - `sh`이 어떤 쉘로 연결되어 있는지는 `readlink -e $(which sh)`을 실행하면 알수있는데 내 경우는 `/usr/bin/dash`와 연결되어 있었고 일반적으로 `dash`에 연결되어 있는듯하다
        - 왜 바로 `curl` 명령을 호출하지 않고 이런식으로 `dash`로 실행하는지는 잘 모르겠다
    - 아래 그림과 같이 설치가 된다
        ![](https://llighter.github.io/install_zsh_in_wsl2/4.png)
        
- 하나씩 zsh 플러그인들을 설치하고 있는데 crlf 에러가 난다
    - 윈도우에서 설정한 ~/.gitconfig을 wsl2에서도 같이 사용하고 있는데 autocrlf를 true로 설정하여 나는 에러이다
    - 늦은 시간이라 자야하므로 다음 링크를 이어서 읽어보자
        - [ 링크1](https://stackoverflow.com/q/2517190/9457247)
        - [ 링크2](https://stackoverflow.com/q/2332349/9457247)
        
## WSL2에서 20.04 버전을 22.04 LTS 버전으로 업그레이드 하기
- 참고링크 : [Upgrade ubuntu in WSL2 from 2004 to 22.04 의 선택된 답변, from ![](https://cdn.sstatic.net/Sites/askubuntu/Img/logo.svg?v=7d56bc852bef){:height="24px" style="background-color:#dc4616; padding:2px"}](https://askubuntu.com/a/1428481) 
- TL;DR
    ```sh
    > sudo apt update && sudo apt full-upgrade
    # Window logout & login
    > sudo do-relese-upgrade
    ```
    

# troubleshooting

## Case 1 : 인터넷 관련 명령중 `unable to resolve ...` 문제 

### 증상

* WSL 소스 코드 디렉토리에서 `code .` 누르면 VS Code Server에 접속하여 뭔가 download받는등 인터넷 접속을 하는데 안됨
* ping 도 안됨

### 관련 링크

* [wget unable to resolve host address 문제 해결, 지식이 홀쑥](https://thinmug.tistory.com/50)
* [WSL2 DNS issues 답변, github/WSL](https://github.com/microsoft/WSL/issues/5256#issuecomment-666545999)
* [WSL - Could not resolve hostname, 테크블로그  ~/xo.dev](https://xo.dev/wsl-could-not-resolve-hostname/)

### 설명

* wsl.conf가 없으면 대신 resolv.conf 가 자동 생성되어 사용되는데 재부팅이후 잘 동작하지 않게됨
* wsl.conf를 명시적으로 생성하여 제대로 설정하면 됨
* 이후 /etc/resolv.conf 파일을 수정하여 DNS 설정을 변경
  ```conf
  nameserver 8.8.8.8
  ```
* 마지막으로 윈도우 터미널에서 `wsl --shutdown` 명령어를 사용하여 wsl 인스턴스 종료후 다시 시작

## Case 2 : `sudo systemctl start nginx` 명령을 주면 다음 에러가 뜬다

```sh
honggaruy@3950X-P600S:~$ sudo systemctl start nginx
System has not been booted with systemd as init system (PID 1). Can't operate.
Failed to connect to bus: Host is down
```
- [StackExchange / ask ubuntu 그룹의 질문](https://askubuntu.com/q/1379425)
- 답변요약 - 참고로 아래 두 답변의 답변자는 한 사람이다!
  - [선택된 답변 ( 2021.12.6 ) - 매우 길다](https://askubuntu.com/a/1379567)
    -  Windows 에서는 `systemctl` 명령이 동작하지 않음
    - Short Answer
      - `systemctl`의 흔한 사용처는 service를 시작시키는 것이다. 
      - `Ubuntu in WSL`에서는 아래와 같이 대체할 수 있다
        ```sh
        $ sudo service <service name> start
        ```
  - [신규 WSL의 경우 ( 2022.09.22 )](https://askubuntu.com/q/1379425)
    - MS 공식 발표: [Systemd support is now available in WSL!](https://devblogs.microsoft.com/commandline/systemd-support-is-now-available-in-wsl/)
    - 의미: 일반적으로 `Ubuntu in WSL`에서는 `Systemd`가 필요하지 않지만, 이제는 선택할수 있는 옵션중 하나가 되었다 
      
      
## Case 3 : 
