---
layout  : wiki
title   : JavaScript/TypeScript Unit Testing 하기 
summary : 우선 mocha & chai로 .. 
date    : 2021-09-06 14:35:20 +0900
updated : 2022-03-25 02:41:59 +0900
tag     : unit-testing typescript mocha 
toc     : true
public  : true
parent  : [[Web-Category]] 
latex   : false
---
* TOC
{:toc}

# Mocha

## Mocha 기본

### Mocha로 Typescript 테스트하기

* 참조링크
  * [Nodejs 에서 타입스크립트 사용하기, Cosmic Latte.](http://cosmiclatte.co.kr/nodejs-에서-타입스크립트typescript-사용하기/)
  * [타입스크립트 테스트하기 with Mocha, Cosmic Latte.](http://cosmiclatte.co.kr/타입스크립트typescript-테스트하기-with-mocha/)
* mocha는 javscript는 바로 테스트 할 수 있지만 typescript는 바로는 안된다
  * 약간의 환경 설정이 필요하다
* 우선 [`ts-node`](https://github.com/TypeStrong/ts-node)가 필요하다
  * `ts-node` 란?
    * TypeScript 실행과 REPL 환경을 제공한다. 메모리상에서 js ▶ ts 트랜스파일을 해서 실행한다고 한다 

### Mocha 에서 `test/` 디렉토리란? (번역)

* 참조링크 : [The test/ directory, mochajs.org](https://mochajs.org/#the-test-directory)
* 기본적으로, `mocha`는 glob `"./test/*.{js,cjs,mjs}"`를 찾기 때문에
  * 당신은 테스트를 `test/` folder에 넣기를 원할 것이다
  * (잠깐만) glob 란? : [glob, ZVON.org](http://zvon.org/comp/r/ref-Jargon_file.html#Terms~glob)
    * 간단하게, wildcard 특수문자를 사용하여 만든 확장가능한 문자열, Unix Convention의 일종 
* 만약 subdirectory들 까지 테스트하려고 한다면,
  * `--recursive` option 을 추가한다
* `mocha`가 테스트 찾는 위치를 설정하려고 한다면, 당신만의 glob을 넘겨줘도 된다
  ```sh
  $ mocha --recursive "./spec/*.js"
  ```
* 어떤 shell 들은 globstar(`**`) wildcard 를 이용하여 반복되는 matching을 제공한다
  * Bash >=4.3 은 [`globstar` option](https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html) 옵션을 제공하는데, .. 
    * (잠깐만) globstar 옵션 번역 (위 링크에서  `globstar` 옵션 위치를 찾아야 함)
      * 설정되면, `**` 패턴이 filename expansion context에서 사용되어 모든 파일에 매칭되며,
      * zero 개 이상의 directory와 subdirectories 에도 매칭된다.
      * 패턴에 `/`이 따라 붙게되면,
        * (파일은 제외하고) directories와 subdirectories에만 매칭된다 
    * (해당 옵션은) `--recursive` 옵션을 설정한 것과 같은 결과를 내기 위해서 [반드시 enable되어야 한다](https://github.com/mochajs/mocha/pull/3348#issuecomment-383937247) ( [ZSH](https://zsh.sourceforge.io/Doc/Release/Expansion.html#Recursive-Globbing) 와 [Fish](https://fishshell.com/docs/current/#expand-wildcard) 은 이것을 기본적으로 지원한다)
    * recusive matching이 enable 된 상태에서, 아래 실행 결과는`--recursive` 결과와 동일하다
      ```sh
      $ mocha "./spec/**/*.js"
      ```
* [npm script에서는 glob에 항상 따옴표를 붙여야 한다](https://medium.com/@jakubsynowiec/you-should-always-quote-your-globs-in-npm-scripts-621887a2a784)
  * 이중 따옴표 (doubel quotes)을 사용한다면, UNIX shell이 glob의 확장을 수행할 것이다
  * 단일 따옴표 (single quotes)을 사용한다면, [`node-glob`](https://www.npmjs.com/package/glob) module이 확장을 수행할 것이다
* glob을 사용할 때, 이 [tutorial](https://gist.github.com/reggi/475793ea1846affbcfe8)을 봐라 
