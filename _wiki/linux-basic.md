---
layout  : wiki
title   : 리눅스 기초 
summary : 리눅스 사용할 때 필요한 기본지식 
date    : 2022-02-18 13:30:55 +0900
updated : 2022-02-18 18:33:21 +0900
tag     : linux 
toc     : true
public  : true
parent  : [[Linux-Category]] 
latex   : false
---
* TOC
{:toc}

<style>
.envvar { color:#d50000; background:#fce8e6; }
.command { color:#01579b; background:#e1f5fe; }
</style>

# Tip 1. 리눅스 환경변수 다루기

* 발췌 원본 : [How to Set and List Environment Variables in Linux, linuxize.com](https://linuxize.com/post/how-to-set-and-list-environment-variables-in-linux/)

## Enviroment Variables and Shell Variables

* Variables는 다음과 같은 형식을 갖는다
  ```shell
  KEY=value
  KEY="Some other value"
  KEY=value1:value2
  ```
  * variables의 이름은 대소문자를 구분한다.
    * 관습적으로, 환경변수는 대문자 이름을 갖는다
  * 다중 값을 할당할때 colon(`:`)으로 구분한다
  * equal symbol (`=`) 주변에는 공백을 제거한다
* Variables 는 두 개의 메인 카테고리로 구분된다
  * **Environment variables**
    * system-wide하게 적용되는 variable
    * 모든 파생된(spawned) child process와 shell에 상속(inherited)된다
  * **Shell variables**
    * 현재 shell instance에만 적용된다
    * `zsh`나 `bash` 같은 shell은 자신만의 내부 shell variables set을 갖는다
* Linux에서 환경변수를 다루는 몇가지 commands가 있다
  * `env`{: .command}
    * 현재 환경을 바꾸지 않고 custom environment에서 다른 프로그램을 실행할수 있도록 해준다
    * argument 없이 실행하면 현재 환경 변수 목록을 print한다 
  * `printenv`{: .command} - 모든 지정된 환경변수를 프린트한다 
  * `set`{: .command}
    * shell 변수를 set하거나 unset한다 
    * argument 없이 사용된다면
      * 모든 변수의 목록을 print 한다
      * 모든 변수에는 environment 변수, shell 변수, shell functions까지 포함된다
  * `unset`{: .command} - shell 변수와 Environment 변수를 제거한다
  * `export`{: .command} - 환경변수를 설정한다

## List Environment Variables

* 환경 변수를 보는데 가장 많이 쓰이는 명령은 `printenv`{: .command} 이다
  * 변수이름을 argument로 넘기면 그 변수만 볼수있다
  * argument가 지정되지 않으면 모든 변수가 한 줄에 한 개씩 print된다
  * 사용례
    ```sh
    $ printenv HOME
    /home/linuxise
    $ printenv LANG HOME
    en_US
    /home/linuxise
    ```

* 가장 흔한 환경 변수들 목록 
  * `USER`{: .envvar} - 현재 로그인한 사용자
  * `HOME`{: .envvar} - 현재 사용자의 home directory
  * `EDITOR`{: .envvar} - 기본 편집기. terminal에서 `edit`{: .command}을 치면 실행될 편집기이다
  * `SHELL`{: .envvar} - 현재 사용자의 shell 경로. 보통 bash나 zsh  
  * `LOGNAME`{: .envvar} - 현재 사용자의 이름 
  * `PATH`{: .envvar} - 실행 명령이 탐색될 directory들의 목록
    * 명령을 치면 이 목록에 저장된 순서 명령을 탐색하여 가장먼저 찾은 실행파일을 실행한다 
  * `LANG`{: .envvar} - 현재 locales 설정 
  * `TERM`{: .envvar} - 현재 terminal emulation 
  * `MAIL`{: .envvar} - 현재 사용자의 메일이 저장되는 장소 
    
* `printenv`{: .command}와 `env`{: .command} 명령은 환경변수만 print 한다
* Environment,shell 변수를 포함한 모든 변수와, [shell functions](https://linuxize.com/post/bash-functions/) 목록까지 보고싶다면
  * `set`{: .command} 명령이 있다
  * 이 명령은 매우 많은 량의 목록을 보여주기 때문에 요약판을 보고 싶을 경우 출력을 [`less`{: .command}](https://linuxize.com/post/less-command-in-linux/) 명령으로 pipe한다
    ```shell
    $ set | less
    ```
* [`echo`{: .command} 명령](https://linuxize.com/post/echo-command-in-linux-with-examples/)도 shell 변수값을 print하는데 사용한다
  ```shell
  $ echo $BASH_VERSION
  5.0.17(1)-release
  ```
  
## Setting Environment Variables

* 

## Persistent Environment Variables

* Environment 변수를 계속 유지하기 위해서는 bash configuration 파일에 정의해야 한다

## Conclusion

* enviroment 변수와 shell 변수를 설정하고 list 하는 방법을 설명했다
