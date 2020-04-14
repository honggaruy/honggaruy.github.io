---
layout  : wiki
title   : 자주 쓰는 git 명령 
summary : git 명령어 상황별 레시피 
date    : 2020-04-01 13:34:02 +0900
updated : 2020-04-13 23:27:49 +0900
tag     : git 
toc     : true
public  : true
parent  : [[Git-Category]]
latex   : false
---
* TOC
{:toc}

# 제목 어떡하지

* 여기에 레시피를 쭉 넣고 싶은데..
* 레시피 제목은 2단계 제목으로..

## git diff 골라서 하기 

### 잘 사용하던 git difftool로 곤란한 상황을 만났다.
 
git add 하기 전에 보통 git difftool로 수정사항을 확인한다. 사실 git diff로 하면 익숙하지 않은 git 비교표현이 눈에 잘 안들어 온다. difftool을 사용할 경우 익숙한 비교툴로 변경사항을 차례로 로딩해주기 때문에 편하게 사용하고 있다. 

현재 [johngrib님 스켈레톤 사이트](https://github.com/johngrib/johngrib-jekyll-skeleton)에서 그대로 가져와서 개인위키 사이트 만들고 있는데, 이번 commit에서는 기존에 johngrib님이 작성한 내용을 지우는 사항과 변경한 사항이 섞여있었다.

이번 수정사항은 add전 상태에서 git status를 하면 아래와 같이 나온다. (여기서 그림, 그림이 크므로 [이거](https://imyeonn.github.io/blog/blog/206/)한번 적용해봤으면...)

문제는 git difftool만 실행시킬 경우 변경사항이 modified인지 deleted인지 따지지 않고 무조건  difftool로 설정된 tool을 불러온다는 것이다. deleted인 경우 로컬 저장소에서는 이미 파일이 지워졌으므로 파일이 없다는 에러가 연속적으로 나온다. 한 두개면 그냥 넘어갈 수있는데 위와 같이 많을 경우 문제가 된다. ( 아래 움짤에서 왼쪽의 명령줄을 보면  87개를 비교하려고 대기중임...) 
![필터미사용 경우 움짤]( /wiki-img/Git-Category/difftool_withoutfilter.gif )

### 해결과정 ~~과 망한 Yak shaving~~

위 움짤에서 문제는 쓸데없이 지워진 파일까지 비교하려고 한다는 것이다.

git diff 명령에 변경된 파일만 골라서 diff 할수 있는 옵션 명령에 있을것 같아 뒤져봤더니 과연 있었다.

git diff 명령의 옵션으로 [`--diff-filter`](https://git-scm.com/docs/git-diff#Documentation/git-diff.txt---diff-filterACDMRTUXB82308203) 옵션이 있다. 이 옵션으로 modifed 된것만 필터링 할 수 있다. 이 옵션에서 주의할점은 대문자인지 소문자인지에 따라 동작이 달라지는것이다. 대문자는 include로 동작하고 소문자는 exclude로 동작한다. 그리고 `--diff-filter=ad` 처럼 동시에 여러개를 옵션으로 줄수 있다.

그런데.. 여기 보니 옵션이 넘 많다. ( A, C, D, M, R, T, U, X, B ). 각 옵션이 어떤상황인지는 나같은 git 초보로서는 알기가 힘드므로... git status의 명령을 변형하여 git stutus에서 리포팅되는 변경사항을 counting 하여 보여주는 alias를 만들었다. 다시 말하면, git status의 결과가 넘 많아 내가 difftool로 비교해야할 파일이 몇개 정도인지 파악하기 위해 만들었다. 아래는 .gitconfig 파일을 수정한내용이다.

```ini
[alias]
  ...
	sc = "!# status 후 변경 종류별 Count;\n\
		git status -s \
		| sort \
		| sed 's/^\\sA\\s/not_updated /;\
		       s/^M[ MD]\\s/updated_in_index /; \
		       s/^[ MARC]M\\s/work_tree_changed_since_index /; \
		       s/^[ MARC]D\\s/deleted_in_work_tree /; \
		       s/^??\\s/untracked /; \
		       s/^[ D]R\\s/renamed_in_work_tree /' \
		| awk '{print $1}' \
		| uniq -c"
```
이 [링크](https://stackoverflow.com/questions/10552803/how-to-create-a-frequency-list-of-every-word-in-a-file/10552948#10552948)를 보면 종류의 경우가 20가지나 되는데 나머지는 나중에 추가하기로 하고 일단 내가 필요한 5가지 정도 경우만 넣었다.
결과는 대충 이렇게 나온다. git status -s 로 나온 결과를 각각의 경우로 count한 후 보여준다.
```shell
hongg@CMStacker MINGW64 ~/repository/honggaruy.github.io (master)
$ git sc
     78 deleted_in_work_tree
      9 work_tree_changed_since_index
     17 untracked
```
위 결과를 얻기위해 참조한 링크는 다음과 같다.
1. [편리한 git alias 설정하기](https://johngrib.github.io/wiki/git-alias/) : git alias 만들고 활용하는 방법
2. [How to create a frequency list of every word in a file? 답변중 하나](https://stackoverflow.com/questions/10552803/how-to-create-a-frequency-list-of-every-word-in-a-file/10552948#10552948) : 각각 종류별 줄을 count 하는 방법
3. [git status중 short format 섹션](https://stackoverflow.com/questions/10552803/how-to-create-a-frequency-list-of-every-word-in-a-file/10552948#10552948) : git status의 단축 포맷 설명이 나와있다.

이제 git difftool을 실행하기 전에 git sc를 실행하면 87개의 변경사항이 아니라 9개만 비교하면 되겠구나 하는 마음의 평화를 얻게된다....( 사실 만들고 보니 .. 그다지 쓸모는 없지만.... 만든게 아까워 여기에 기록함.)

[왠지](https://m.blog.naver.com/PostView.nhn?blogId=everbeenj&logNo=220032542600&proxyReferer=https%3A%2F%2Fwww.google.com%2F)... [야크털을 깍은](https://parksb.github.io/article/32.html)것 같지만 일단 마무리 했으니 넘어간다. 

### 결론 

* 결론적으로 `--diff-filter` 옵션으로 아래와 같이 Modified된 것만 보여주게 된다. 
```shell
$ git difftool --diff-filter=M
```
![필터미사용 경우 움짤]( /wiki-img/Git-Category/difftool_withfilter.gif )

* M옵션대신 delete된 것만 제외하고자 한다면 `소문자 d` 옵션을 사용한다
```shell
$ git difftool --diff-filter=d
```
* 이것도 명령이 좀 기니까 alias로 만들자. (쓰다보니 대문자 쓰는게 귀찮...) 
```ini
[alias]
   dftd = "!# deleted 제외하고 difftool한다;\n\
          git difftool --diff-filter=d"
```

### 참고

* 위에서 만든 움짤은 [컴퓨터 화면을 캡쳐해서 GIF로 만드는 간단한 방법](https://steemit.com/kr/@youngbinlee/gif)을 참고했다.
* 윈도우에 설치하는 프로그램이며 홈페이지는 [이곳](https://www.screentogif.com/)이다.
* 오픈소스인가? [github](https://github.com/NickeManarin/ScreenToGif)가 있다.
