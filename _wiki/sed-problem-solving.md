---
layout  : wiki
title   : GNU sed의 이상한 정규식 처리 
summary : 제목과 관련된 내용이 15% 정도만 있는 이상한 페이지 
date    : 2020-04-07 17:29:24 +0900
updated : 2020-04-14 08:11:36 +0900
tag     : linux  sed  shell  regex 
toc     : true
public  : true
parent  : [[Linux-Category]]
latex   : false
---
* TOC
{:toc}

# 1. 발단

* 생각의 속도로 위키를 작성하다보니 파일명이 제각각이다.
  * 주로 vim으로 문서 작업을 하고 `nerdtree`를 쓰는데 `_wiki`아래 md파일중에서.. 
    * Category문서와 일반 콘텐츠 문서를 한 눈에 구분하고 싶었다.
  * 카테고리문서는 Camelcase-category.md , 콘텐츠 문서는 소문자로 시작하는 contents-document.md로 하기로 생각
* [johngrib님이 알려주신 방법](https://johngrib.github.io/wiki/my-wiki#파일-이름을-변경한다)대로 :VimwikiRenameLink 를 이용하여 열심히 파일명을 수정하다보니...
  * 갑자기 문서 맨 위쪽에 잘 나오던 `상위 문서`항목이 안보이는 것이다.
  * 이유는 아래와 같다. 
    * `상위 문서` 항목은 각 문서 위쪽 메타데이터의 parent 항목을 참조하는데...
    * :VimwikiRenameLink는 vimwiki상의 링크만 수정하기 때문에 ...
    * vimwiki링크 형식이 아닌 parent 항목은 해당명령과는 상관이 없고 ...
    * 결국 실제 파일명과 parent 항목의 파일명이 틀려져 발생하는 문제였다.

# 2. 전개

## 처음엔 ... git for windows 의 bash 

### 갑작스런 급전개

* johngrib님께 문의를 드렸더니, [답변과 함께 질문을 본문에 넣어주셨다.](https://johngrib.github.io/wiki/my-wiki/#vimwikirenamelink-가-parent-에는-작동하지-않는-문제)
  * Windows 플랫폼을 주로 사용하는 내겐 이제 까마득한 쉘 스크립트의 세계로 다시 발을 들여놓게되었다.

* 답변을 주셨으니 테스트 해봐야 한다.
  * ~~처음엔 git이라는게 참쉽게 배워질거라 그렇게 믿었었는데 그렇게 믿어...~~ 
  * 처음엔 최근 쉘스크립트를 쓰던 환경이 git for windows 에서 제공하는 간단한 bash 쉘뿐이여서 여기서 시작했다.
  * 어디선가 읽은 내용인데 git for windows가 bash 쉘상에서 실행되는 이유는..
    * git이 단일 프로그램이 아닌 여러가지 UNIX 상의 툴이 조합되어 만들어진 시스템이라서 ...
    * windows에서 command line으로 실행하기 위해선 bash 환경을 만들고 그 위에서 지원하는 것이 제일 간단한 방법이라...
    * 이미 그런 환경을 구현한 MSYS2를 채용해 구현했다고 본것 같다. (원본 링크는 잊어서 확인은 불가...)
    
### git for windows의 bash 쉘에서 시작

* 어차피 vim에서 작성하고 서버에 올릴때 bash git으로 올리는 지라 여기서 해결가능하다면 금상첨화
* johngrib님 답변중에 있는 'ag'는 지원되지 않는다. 리눅스상이라면 설치해서 해볼수 있을텐데 
  * sudo install이나 apt-get 명령도 없어서 안됨
* find 와 sed는 지원이 되어 해볼수 있었다. 여러가지 이슈가 발생하여 아래에 기록한다.
  1. **sed 명령중  -i 옵션 뒤에 '' 이 있고 없고의 차이**
    * 그대로 따라했더니 에러나옴, `sed: can't read s,.....: No such file or directory`
    * -i 뒤에 문자열이 두개 있는데 첫번째 문자열이 이상해 지워봤더니 정상동작
    * 이게 typo인줄 알고 johngrib님께 문의해봤는데 그건 아님
    * 알고보니 [GNU sed와 BSD sed의 차이](https://www.grymoire.com/Unix/Sed.html#uh-62h)
      > The GNU version of sed allows you to use "-i" without an argument. The FreeBSD/Mac OS X does not. You must provide an extension for the FreeBSD/Mac OS X version. IF you want to do in-palce editing without creating a backup, you can use
      ```shell
      sed -i '' 's/^/\t/' *.txt
      ```
    * 결론적으로 내가 쓰는 GNU sed는 `-i`만 쓰면 BSD sed의 `-i ''` 와 같은 효과를 가진다.
    * 참고로.. -i 옵션은 `in-place argument`라는 명칭을 가지는데, 여러개의 파일간에 유사한 simple 편집사항을 한방에 편집하는 옵션이다. 때문에 원본손실이 발생할수 있는데 이 -i 옵션에 suffix를 지정해 백업파일을 작성하도록 할수도 있다. (위 차이점 링크에 간단한 예제와 함께 설명이 되어있음) 
  2. **메타 데이터 `parent` 작성시 일관성 문제**
    * 이런 건 `parent : this-category $` 이렇게, 저런건 `parent : that-category$` 저렇게.. ( 잘보면 trailing whitespace 의 차이가 있다. 차이를 부각시키려고 문장끝에 평소에는 안보이는 정규식의 문장끝 표시 `$`를 추가했다.)
    * ..위와 같이 막 쓰다 보니 johngrib님이 제시해주신 정규식으로 category 이름을 정확히 포착하지 못하는 경우가 발생
    * `trailing whtitespace`로 구글링해서 [이 사이트](https://www.regular-expressions.info/examples.html)를 찾음
    * 사이트가 괜찮아보여 정규식 카테고리 만들고 [[regex-category]] 페이지에 등록
    * 해당 페이지 `Trimming Whtitespace` 절에 `trailing whitespace` 처리 방법대로 해봄
      ```sh
      # 현재 \[[ ]] 로 작성했지만 안보이는 상태임..
      find . -name '*.md' | xargs sed -E -i 's,(^parent *: *)([^\[]*)[ \t]+$,\1[[\2]],' 
      ```
    * 여전히 문제 발생
    * 이제는 `category+공백+$`인 녀석들만 바뀌고 `category+$`인 녀석들은 안바뀜
    * 두번에 나눠 작업하면 되긴 하지만 마음에 안듬

### johngrib님의 두번째 답변
  * 기본적으로 trailing whitespace 만으로 처리하려는 것이 잘못된 생각임
  * 정규식에서 category title을 캡춰하는 두번째 캡춰에서 whitespace를 배제하는 것도 생각해야 했음
    ```shell
    # 현재 \[[ ]] 로 작성했지만 안보이는 상태임..
    # johngrib님의 2번째 답변 내용
    find . -name '*.md' | xargs sed -E -i 's,(^parent *: *)([^ \t\[]*) *$, \1\[[\2]],'
    ```
  * 따라 해보니 한방에 잘되긴 한다.
  * 하지만 이것 저것 변형해 보고 싶은게 생겼고, 한계가 명확한 git for windwos의 bash를 떠나 자유를 꿈꾸며 WSL로 가기로 했다.

## WSL (Windows Subsystem for Linux)에 정착하다

### WSL을 처음 사용하기

* 예전에 호기심으로 WSL을 설치해놓긴 했는데, 설치한후 한 번 돌려보고 이제 두번째정도 된다
* WSL 사용해보기 전에는 막연하게 windwos와 linux가 가상환경으로 완전 분리되지 않았을까 생각 했는데..
* 윈도우에서 작성한 파일들을 linux의 강력한 도구들로 다룰수 있다 !!!! 
  * 윈도우와 리눅스는 file system 자체가 틀렸는데 파일 시스템은 윈도우를 쓰면서 linux의 도구를 사용할수 있게 한건가?
  * 이러한 의문들은 일단 [요기](https://webdir.tistory.com/540)를 참고해보자
  * 리눅스로 윈도우에서 작성한 파일들을 손대는것은 되지만 역으로 가능하지는 않은듯하다.
* 일단 현재 사용목적으로는 git for windows의 bash 처럼 linux 도구를 사용하여 윈도우 파일들을 관리하는것으로 충분하다.

### sed의 위험성에 대한 대비

* 필자 말로 Google rating이 상당히 좋고, 역사도 오래된 (1994년~) [이 문서](https://www.grymoire.com/Unix/Sed.html)에 따르면...
  * sed 를 사용하는 대부분의 사용자는 `s` 명령어만 쓰며 `s` 명령어를 익히는데 필요한 90% 노력은 regex(Regular Expression)을 익히는데 든다고 한다
  * 가끔씩 쓸 때마다 다시 배우는 정규식이 주는 위협을 조금이라도 덜기 위해...수정하기전 이전 내용 백업이 필요한데..
  * 위에서 봤던 [이 링크](https://www.grymoire.com/Unix/Sed.html#uh-62h)의 -i 옵션에 딸린 백업 기능을 쓸 필요가 있다.
  * 위 링크에서도 조심하기 위해 -i 옵션에 extension을 지정하기를 권장하고 있다.
* 백업 기능을 추가한 `parent : category ` 요소 변경하기
1. *.md 파일을 수정하고 백업 생성 (각 *.md별로 *.md.origin 생성하여 원본 백업)
```sh
# GUN version sed를 사용한다고 가정함
find . -name '*.md' | xargs sed -E -i.origin 's,(^parent *: *)([^ \t\[]*) *$,\1\[[\2]],'
```
2. *.md 파일과 *.md.origin 파일을 비교후 오류가 있으면 전부 원복 (원복시에 *.md.origin은 제거됨)
```sh
# rename 없으면 for 루프와 mv 명령으로 만들수도 있지만 rename이 훨씬 간단함. 
rename -v -f -e 's/.md.origin/.md/' *.md.origin
```
3. *.md 파일이 모두 정상적으로 변경되었으면 *.md.origin 제거
```sh
rm *.md.origin
```

#### 위 방법을 구글링 하다가 얻어걸린 내용들 정리

* for 루프와 mv 명령 == rename 
  * 누가 원조인지는 잘 모르겠지만 다음과 같이 비슷한 형식으로 linux rename 명령을 소개하는 글이 많다.
    1. 우선 mv로 파일명을 변경 하는 방법 소개
    ```sh
    mv oldfile.txt newfile.txt 
    ```
    2. for와 mv를 써서 여러개의 파일명을 한번에 변경하는 방법 소개
    ```sh
    # 대충 이런식? f와 *.prog는 다를수 있는데 형식은 모두 동일
    for f in *.prog; do mv -- "$f" "${f%.prog}.prg"
    ```
    3. 위의 2번으로 했던 작업을 rename을 써서 간단하게 해결
    ```sh
    # rename 사용법을 간단하게 소개하며 마무으리 
    rename 's/.prog/.prg/' *.prog
    ```
  * 관련 자료들 링크 (핵심 내용은 서로 90% 정도 동일)
    * [How to Use the rename Command on Linux](https://www.howtogeek.com/423214/how-to-use-the-rename-command-on-linux/)
    * [How to Rename Files and Directories in Linux](https://linuxize.com/post/how-to-rename-files-in-linux/)
    * [Rename Files in Linux - MV, RENAME & multiple Files at Once](https://www.webservertalk.com/rename-files-in-linux)
  * rename 사용법은 대충 알겠는데 위에서 tricky한 방법으로 소개된 2번째 방식중...
    * mv 다음에 오는 `--`의 의미를 도저히 알수가 없었다.
    * 알아 내기 위해 mv manual이나 for manual을 뒤졌는데 위와 같은 옵션은 적혀있질 않았다.
    * [shell 확장](https://shoark7.github.io/programming/shell-programming/shell-expansions) 을 보다가...[이곳](https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html)에 가봐도 없고.. 
    * [요기](https://jhnyang.tistory.com/154)서는 "${f%.prog}.prg"의 의미는 알아낼수 있었다.
      * `${f%.prog}` 의 의미는 f로 지정된 파일명의 뒷부분에서 가장 짧게 일치하는 `.prog`를 삭제하고 나머지를 반환..
      * 만약에 f가 `something.prog`였다면 `something`만 남겠네. 바로 뒤에 `.prg`를 붙여서..
      * `something.prog` --> `something.prg`가 되는 기법..
    * [해석방법](http://throughkim.kr/2016/12/22/linux-5/), [핵심요약](https://blog.gaerae.com/2015/01/bash-hello-world.html) 모두 좋은 내용이지만 찾는 내용은 없고...
    * [전반적으로 소개하는 내용](https://wiki.kldp.org/HOWTO/html/Adv-Bash-Scr-HOWTO/index.html) 같아서 많이 뒤져봤는데 역시 못찾고..
    * **아래는 알아내는데 시간이 좀 많이 걸린 `--` 내용을 설명한다.**
      * [BASH Shell Script중 2.Basics 뒷부분 Misc](https://mug896.github.io/bash-shell/basics.html#misc) 에서 **드디어 발견!!!!**
        * `--`를 사용하여 `이 뒤로부터는 옵션이 아니다` 라는 선언임
        * 위 옵션이 필요한 경우는 grep으로 '-n' 표현을 검색하고자 할 때 발생한다.
          * grep -r '-n' 이라고 치면 ''으로 둘러 쌌지만 -n을 옵션으로 인식하여 에러가 발생한다.
          ```sh
          $ grep -r '-n'
          Usage: grep [OPTION]... PATTERN [FILE]...
          Try 'grep --help' for more information.
          ```
          * grep -r -- '-n' 으로 다시치면 '-n'을 검색 대상으로 인식한다.
          ```sh
          $ grep -r -- '-n'
          ...검색결과를 보여줌...
          ```
          * 그러므로, `mv -- "$f" "${f%.prog}.prg"` 는 단순히 `mv oldfile newfile` 인데 파일명에서 옵션으로 오인할 여지를 없앤 내용임.
      * 결국, StackExchange에서도 정확히 이 내용을 문의하는 [질문](https://unix.stackexchange.com/q/11376) 발견 !!
        * 질문의 제목은 `What does "--" (double-dash) mean?`
        * 영어 명칭은 `end of command option` 인듯.
          
## 드디어 제목과 관련된 내용으로 ...
 
### 본래 문제는 풀렸지만 ... 풀리지 않은 의문 하나.
 
* regex101.com 사이트를 보다보니 `\s`가 whitespace를 의미한다고 해서 [ \t]를 [\s]로 바꾸어 보았다.
* 그러니까 find + sed 명령을 다음과 같이 바꿔보았다.
```sh
# 원래는 이랬던 명령어 조합을 ...
find . -name '*.md' | xargs sed -E -i.origin 's,(^parent *: *)([^ \t\[]*) *$,\1[[\2]],'
# 이렇게 변경해 봤다 ... 
find . -name '*.md' | xargs sed -E -i.origin 's,(^parent *: *)([^\s\[]*)\s*$,\1[[\2]],'
```
* 그랬더니 `parent : \[[category ]]` 문제가 다시 발생했다. 아니 더 나빠졌다.
* 어떤문서는 제대로 되고 어떤문서는 인식을 못한다 .. 되고, 안되는 규칙을 발견할 수 없었다.
* 이번에는 johngrib님 에게서도 마땅한 답변을 얻지 못했다.
* 믿을건 .. 언제나 답을 줬던 stack overflow 뿐.. 뒤져봤다
    
# 3. 결론      

갑작스런 결론이지만 johngrib님 댓글창에 적은 답변을 이 페이지의 결론으로 하는게 좋을것 같았다.

## 아래는 댓글 내용이다.

위 내용으로 stack overflow를 뒤지다가 해당 의문사항이 거의 풀려서 공유드립니다.
* **의문사항 : GNU sed 정규식 에서 \s를 인식할때도 있고 인식하지 못할때도 있다. 규칙이 뭔가?**
```shell
# 아래에서 \s가 세군데 사용되었는데 1,2번째는 인식하고 3번째는 인식못함
$ echo 'a : b ' | sed -r 's,(a\s*:\s*)([^\s]*),\1[\2],'
a : [b ]
# 아래에서 3번째 \s를 ' '로 바꿀때 제대로 인식함 
$ echo 'a : b ' | sed -r 's,(a\s*:\s*)([^ ]*),\1[\2],'
a : [b]
```
* 답변 : 
  * GNU sed는 POSIX 사양 호환으로 POSIX BRE(Basic Reqular Expression)을 지원 [참고한 링크](https://superuser.com/a/112837/1150566)
  * [POSIX BRE](https://pubs.opengroup.org/onlinepubs/009695399/basedefs/xbd_chap09.html#tag_09_03)중 *Braket Expression* (9.3.5)절에 [*list*] 일경우 list 내용에 대한 규칙이 나오는데...
    * *list* 중에 있는 '.', '*','[','\' 문자는 특수 의미를 상실하고 literal의 의미만 가지게된다고 합니다.
    * 이 규칙 때문에 bracket 바깥에 있는 \s는 인식하지만 bracke안의 \s는 인식못함 '\\' 's'로 각각인식됩니다.
    * 따라서 bracket 내에서 특수 의미 문자 클래스를 사용하려면 별도의 규칙을 사용합니다.
    * \s 대신 [:space:]를 사용해야하며 braket 내에서 사용할경우 \[\[:space:\]\] 혹은 [^[:space:]] 처럼 사용하게 됩니다.
```shell
# 규칙대로 사용한 의문사항 해결책
$ echo 'a : b ' | sed -r 's,(a\s*:\s*)([^[:space:]]*),\1[\2],'
a : [b]
```
* **2번째 의문사항 : 위의 규칙이 적용되었다면 [^\t]도 인식하지 못해야 하는데 왜 인식하나?**
  :exclamation: 참고로 command line 상에서 \t문자를 입력하기 위해서는 `Ctrl + 대문자 v`를 누르고 `tab`을 누르면 됩니다. [참고링크](https://superuser.com/a/362250/1150566)
  
```shell
# [] 안의 \t 은 잘 인식함
$ echo 'a : b[탭문자]' | sed -E 's,(a\s*:\s*)([^\t]*)(\s*),\1[\2]_(\3),'
a : [b]_(      )
```
* 답변
  * [GNU sed manaul의 5.5절](https://www.gnu.org/software/sed/manual/sed.html#Character-Classes-and-Bracket-Expressions) Character Classes and Bracket Expressions의 맨 마지막 부분에 이런 내용이 있습니다.
  > The characters $, *, ., [, and \ are normally not special within list. For example, [\*] matches either ‘\’ or ‘*’, because the \ is not special here. However, strings like [.ch.], [=a=], and [:space:] are special within list and represent collating symbols, equivalence classes, and character classes, respectively, and [ is therefore special within list when it is followed by ., =, or :. **<U>Also, when not in POSIXLY_CORRECT mode, special escapes like \n and \t are recognized within list. See Escapes.</U>**
  * 편의성을 위해 POSIX 표준을 위반한 부분이 있는데 별도 옵션으로 엄격모드로 하지 않는한 \t는 bracket 내에서도 인식이 된다는 설명입니다.
이상입니다.

## 뭐가 이상한 sed 정규식이냐?

* 문서를 보면 알겠지만, 그냥 결론 내용을 찾다가 알게된 많은 내용을 적고 싶었는데...
* 마땅한 제목을 찾을수 없었다.
* 그래서 그냥 최종적으로 정리한 내용을 제목으로 하기로 하고..
* 어그로성 낚시성 제목을 달았다.  
* 어차피 나 혼자 보는 컨셉이므로 ..
* 나만 잘 기억나면 된다. 
