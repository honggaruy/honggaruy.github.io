---
layout  : wiki
title   : Rust 입문 
summary : Rust 설치부터 시작 
date    : 2022-02-09 14:58:28 +0900
updated : 2022-07-29 07:06:03 +0900
tag     : rust installation 
toc     : true
public  : true
parent  : [[Rust-Category]] 
latex   : false
---
* TOC
{:toc}

# 설치 방법 (2022-02-09 확인)

* [설치 페이지](https://www.rust-lang.org/tools/install) 접속

## 윈도우에 직접 설치

* Using rustup (Recommended) 아래
  * <kbd style="color: #FFFFFF; background-color: #2E2459">DOWNLOAD RUSTUP-INIT.EXE (64-BIT)</kbd> 클릭하면 `rustup-init.exe` 파일 다운받음
* 실행하면 `cmd` 창이 뜨면서
  * `Cargo` 홈 디렉토리가 `C:\Users\사용자이름\.cargo`로 지정되었으며
  * `CARGO_HOME` 환경변수를 수정하여 바꿀수 있다고 알려줌
  * `cargo`, `rustc`, `rustup` 등의 다른 명령이
    * `Carge`의 `bin` 디렉토리에 추가되었으며
    * `C:\Users\사용자이름\.cargo\bin`에 위치해 있다고 알려줌
  * `HKEY_CURRENT_USER/Environment/PATH` 레지스트리 키를 수정하여
    * 위 경로가 `PATH` 환경변수에 포함되었음을 알려준다
  * `rustup self uninstalll` 명령으로 위의 변경사항은 언제든지 복구될수 있음을 고지
  * 현재 설치 옵션은 :
    * default host triple: x86_64-pc-windows-msvc
    * default toolchain: stable (default)
    * profile: default
    * modify PATH variable: yes
  * 세가지 선택사항을 제시한다
    1. 위 default 사항으로 계속한다
    2. 위 옵션을 변경한다
    3. 설치를 제시한다
  * 위의 선택사항에서 `1`번 옵션을 선택함 (2022-02-09)
  * PATH를 변경했으므로 shell을 재시작해야 반영됨을 알려줌
  * shell을 재시작하고 `>$env:path -split ";"`을 type 한다
    * 경로상에 `C:\Users\사용자이름\.carge\bin`이 추가되었는지 확인한다 

## WSL에 Rust 설치 
 
* 나중에 해보자

# Getting started (2022-02-09 확인)

* 발췌 링크 : [Getting started, Rust](https://www.rust-lang.org/learn/get-started)
* Rust를 설치하지 않고 웹에서 play 해볼수도  있다
  * [<kbd style="color: #FFFFFF; background-color: #A72145">TRY RUST WITHOUT INSTALLING</kbd>](https://play.rust-lang.org/)  **◀ Click!!**
* Rust가 최신 버전인가 ?
  * `rustup update` 명령으로 최신 버전으로 유지한다
* Cargo: Rust 빌드 툴이자 패키지 매니저
  * `rustup`을 설치하면 최신 안정 버전의 rust build tool과 package manager를 얻게된다
  * 이 툴의 이름은 `Cargo`이다
  * Cargo는 많은 일을 한다
    * `cargo build`: rust 프로젝트를 빌드한다
    * `cargo run` : 프로젝트를 실행한다
    * `cargo test` : 프로젝트의 테스트를 실행한다
    * `cargo doc` : 프로젝트의 documentation을 빌드한다
    * `cargo publish` : `crates.io`에 library를 publish한다
    * `cargo --version` : Rust와 Cargo가 설치되어있는지 테스트 한다

## 신규 프로젝트 생성하기

* 신규 프로젝트 생성 명령 : `cargo new hello-rust` , `hello-rust`는 프로젝트 명
* 이 명령은 아래 tree를 생성한다
  ```
  hello-rust
  |- Cargo.toml
  |- src
    |- main.rs
  ```
  * Cargo.toml : Rust 의 manifest 파일. 프로젝트 메타데이터와 dependencies를 관리
  * src/main.rs : application code
* 신규 생성된 `hello-rust` 디렉토리로 가서 `cargo run`을 실행하면 컴파일후 실행이 된다

## 패키지 사용해보기

* `crates.io`에 등록된 패키지 하나를 사용해볼 것이다
* rust 에서는 패키지를 "crates"라고 부른다
 
### Step1. Dependencies 추가하기

* `Cargo.toml` 파일에서 다음을 수정한다
  ```toml
  [dependencies]
  ferris-says = "0.2"
  ```
* `cargo build` 를 실행하면..
  * Cargo가 `ferris-says` 패키지를 설치해준다
  * `Cargo.lock` 파일이 생긴다. 현재 설치된 dependencies의 정확한 버전을 로컬에 기록한다
* 설치된 dependency를 사용하는 법
  * 사용하고자 하는 코드(.rs파일)에 다음을 추가한다
    ```rust
    use ferris_says::say;
    ```
    
### Step2. A small Rust application

* `main.rs`를 다음 코드로 대체한다
  ```rust
  use ferris_says::say;
  use std::io::{stdout, BufWriter};
  
  fn main() {
    let stdout = stdout();
    let message = String::from("Hello fellow Rustaceans!");
    let width = message.chars().count();
    
    let mut writer = BufWriter::new(stdout.lock());
    say(message.as_bytes(), width, &mut writer).unwrap();
  }
  ```
* 저장후 `cargo run`을 실행한다
* ASCII art와 함께 출력되는 메시지를 볼 수 있다

# ⭐⭐현재 최종 개발 환경 (2022-02-24)

* 에디터 : VS Code ( with Rust 확장 )
* 신규 프로젝트 : cmd-line , `cargo new hello-rust`
* 의존성 수정 : 프로젝트 루트에서 `Cargo.toml` 파일 수정
* 빌드 : cmd-line, `cargo build` 
  * 터미널 창으로 이동하는 VS Code 단축키 : <kbd>Ctrl</kbd>+<kbd>`</kbd>
* 실행 : cmd-line, `cargo run`

# Learn Rust

* 발췌 링크: [Learn Rust](https://www.rust-lang.org/learn)
* 환경구축은 끝났고 앞으로 3가지 경로로 갈 수 있다
  * [`READ THE BOOK!`](https://doc.rust-lang.org/book/)
    * 온라인 BOOK인 `The Rust Programming Lanuage` 사이트를 이용한다
    * 책으로 공부하는 방식으로 이론적으로 접근한다
  * [`DO THE RUSTLINGS COURSE!`](https://github.com/rust-lang/rustlings/)
    * Rust toolchain을 다운로드하고 설정해본다
    * Rust syntax를 읽고 쓰는 기본을 가르쳐준다
    * `Rust by Example`을 당신만의 환경에서 실행할 수 있도록 해준다
  * [`CHECK OUT RUST BY EXAMPLE!`](https://doc.rust-lang.org/stable/rust-by-example/)
    * 이론적으로 공부하는 방식이 안맞을때 선택하는 방식이다
    * 말로 많이 설명하기 보다 코드를 보여주고 적게 말한다
    * exercieses도 포함한다
* 재미있는 Rustlings를 실행해 보면서 RBE(Rust By Example) 나 RTB(Read the Book)을 참고 삼아 같이 보는게 좋겠다 

## rustlings 실행하기

### rustlings를 처음 실행할 때 나오는 말 - 번역함 

```ascii-art
❯ rustlings

       welcome to...
                 _   _ _
  _ __ _   _ ___| |_| (_)_ __   __ _ ___
 | '__| | | / __| __| | | '_ \ / _` / __|
 | |  | |_| \__ \ |_| | | | | | (_| \__ \
 |_|   \__,_|___/\__|_|_|_| |_|\__, |___/
                               |___/
```

```
Rustlings을 설치해줘서 고마워!

처음이지? 걱정마 Rustling은 초보자를 위해 만들었어!
우리는 Rust에 대해 많은 것을 가르쳐 줄꺼야
시작하기전에 Rustlings 동작에 대해 몇가지 알아둘 것이 있어

1. Rustings의 주요 컨셉은 exercises를 해결하는 거야.
   이 exercies는 때때로 syntax error를 가지고 있을수도 있고
   compilation에 안되기도 할꺼야. 다른 경우에는 syntax error 대신 logic 에러도
   있을수 있어. 어떤 에러든지, 당신이 모두 해결해야할 문제야!
   당신은 당신이 문제를 해결했는지 알수있게 될꺼야. 문제가 해결된다면
   컴파일에 성공할거고 Rustling이 다음 exercise로 진행될수 있을꺼니깐.
2. Rustling을 watch mode에서 실행한다면 (이 방법 권장!) 
   자동으로 첫번째 exercies를 시작하게 될꺼야.
   Rustlings를 실행하자 마자 튀어나오는 에러 메시지때문에 당황하지마!
   그건 당신이 풀어야할 exercise의 일부야. 그러니까 exercise 파일을 
   에디터로 열고 탐정역할을 시작해!
3. 어떤 exercise를 풀다가 막힌다면, (watch mode 에서) `hint`라고 타이핑해서
   도움을 받을수 있어. 아니면 `rustlings hist myexercies`라고 치든가.
4. 어떤 exercise는 좀 불합리하다고 느낀다면, 자유롭게 Github에 이슈를 제기해
   (https://github.com/rust-lang/rustlings/issues/new). 우리는 모든 이슈를 읽어.
   그리고 때때로 다른 학생이 도와주기도 할꺼야. 서로 자유롭게 도와줄 수 있어!

모두 이해했지? 좋아! 첫번째 exercise를 시작하려면 `rustlings watch`를 실행해.
에디터도 꼭 열어놓고!
```
### 진행 방법

* 터미널 : `cd d:\repository\rustlings`
  * 담에 다시 시작할때 : `rustlings watch` 입력
* VS Code : `code d:\repository\rustlings`
  * 에디터를 열어 각각의 문제를 푼다
* 답이 보이더라도 문제의 의도를 파악하기 위해 `hint`를 입력하여 설명을 읽어보자
* 문제를 고민하면서 `RBE`와 `RTB`도 참고하면서 같이 보자
* 끝낼 때 : `rustlings`이 실행중일때 `quit`을 입력

### 진행현황

* 설치한 루트폴더에서 `rustlings watch`를 실행
  * rust 컴파일이 실행되고 에러메시지가 바로 나옴
  * VS Code로 에러수정하면 다음 exercise로 진행함
  * 다 푼 문제 comment중에 `// I AM NOT DONE` 줄을 지워줄것 !!
    * rustlings이 당신이 푼 문제를 알 수 있도록..
* exercieses/variables/variables1.rs  - 완료
