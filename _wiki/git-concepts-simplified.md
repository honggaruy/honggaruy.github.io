---
layout  : wiki
title   : 번역 - 단순화한 git의 개념들
summary : 개념을 먼저 익히자 
date    : 2023-01-15 00:02:34 +0900
updated : 2023-01-27 00:41:08 +0900
tag     : git 
toc     : true
public  : true
parent  : [[Git-Category]] 
latex   : false
fontawe : true
---
* TOC
{:toc}

# 개요

- 원문: [git concepts simplified](https://gitolite.com/gcs.html#(1))
- 저자: Sitaram Chamarty (sitaramc@gmail.com)
  - <i class="fa-brands fa-github fa-xl"></i> : [Sitaram Chamarty github](https://github.com/sitaramc)

# 내용

## 관용 표현

- Please be aware that's only an artifact of ~  : ~의 결과물일뿐임을 알아주시기 바랍니다
  - artifact meaning #2 : a false or inaccurate result or effect that is produced accidntally (의도한 결과가 아닌듯한 뉘앙스)
- with a view to doing : ~할 목적으로, ~을 기대하여
  - a view to a kill : 살인을 목적으로 
- at a ~ point in time : ~ 시점에 
  - at this point in time :  이 시점에서
  - at a later point in time : 나중에, 시간적으로 늦은 시점에
- the usual practice : 일반적인 관습
  - follow the usual practice  : 일반적인 관습을 따르다 
- digression : 여담, 탈선, 주제에서 벗어나기
- prune : 잘라내다, 가지치기하다
  - We have pruned the graph a little for clarity 
- somewhere in there : 그곳 어딘가에 (= in there somewhere )   
  - somewhere in here : 여기 어딘가에
- think back : 생각해 내다, 회상하다
- meanwhile : 그러는 동안
- cherry-pick : 선별하다, 신중하게 고르다
- a bunch of ~ : 한 다발의 ~
- tie up loose ends : 미진한 부분을 처리하다 , 남은 일을 처리하다
- myriad options : 다양한 옵션
- pertain to ~ : ~에 속하다
- in real terms : 실질적으로 ( 여기서 term은 조건의 의미?, 실제 조건에서)
  - terms of trade : 교역 조건 
- be not much of a .. : 대단한 ..은 아니다
  - would not be much of a problem : 대단한 문제는 아니다
  - it will not be too much of a surprise : 크게 놀랄일은 아니다
  - I'm just not much of a crier. : 눈물이 없는 편이다
- shaken up : 충격을 받은
 

## 1. preface
### 1.1 about this slideshow

- 이 문서는 gitolite.com과는 별관련이 없지만 우연하게 이곳에 자리잡았다
- git에 관한 것이라는 점만 관련이 있다

### 1.2 license
### 1.3 viewing This slideshow

- 이 문서는 W3C가 만든 [HTML Slidy](https://www.w3.org/Talks/Tools/Slidy2/Overview.html#(1))를 사용한다

### 1.4 acknowledgements

#### this document

- 이 문서는 [Git for Computer Scientists](https://eagain.net/articles/git-for-computer-scientists) 로부터 애매하게(vaguely) 영감을 받았지만 CS인들만을 위한것은 아니다.
  - 그리고 좀더 많이 detail 하며
  - 활발하게 유지 보수된다. 저자가 feedback에 반응한다는 얘기다 ;-) 

#### this slide show

- 이 slide show는 pandoc's slidy output mode와 약간의 pre-processing tweaks 로 완성되었다 
- Pandoc은 환상적이며 매우 강력하지만 지금 갖게된것이 아쉽다(Dec 2013)
- tweaks의 대부분이 문서내에 [graphviz](https://graphviz.org/) diagram을 내장하는 것과 관련된 것이므로 유지보수할 파일은 하나뿐이다

## 2. basics
### 2.1 what is a SHA

- a commit은 a 160-bit hex value (the 'SHA')에 의해 유일하게 식별된다
  - 이것은 다음에 설명하는 정보의 조각들로부터 계산된다
  - 해당 commit에 존재하는 files와 directories의 SHA
    - SHA가 계산되는 방법에 대한 details는 이곳과 관련이 없다
  - the parent commits(s)의 SHA 
    - the repo 내의 최초의 commit을 제외한 모든 commit이
      - the change가 기초로 하는 one parent commit이 적어도 하나 있다
  - the commit message : commit 할때 작성하는 message
  - the author name/email/timestamp
  - the commiter name/email/timestamp
- 결국은, 내가 말했듯이
  - 그것은 단지 크고, 명백하게 랜덤처럼 보이는, 숫자로
  - 그 숫자는 실제로 암호학적으로 강력한 (a cryptographically-strong) checksum이다
  - 그것은 보통 40개의 hex digits으로 작성된다
- 인간은 이 숫자를 기억하지 못할것으로 예상된다
  - 이 논의의 목적으로, 
    - malloc()으로 반환되는 memory address와 유사한 것으로 생각하라 
- 그것은 또한 GLOBALLY unique 하다!
  - 세계 어느곳에 있든지 모든 repo의 어떤 commit도 똑같은 SHA를 갖지 않는다
  - (이것은 수학적으로 불가능한것이 아니라, 
  - 사실로 받아들일 정도로 일어날것 같지 않다는 말이다.
  - 그것을 받아들이지 못한다면, 그냥 믿으세요).
- An example SHA: <mark style="background-color:pink;">a30236028b7ddd65f01321af42f904479eaff549</mark>

### 2.2 what is a "ref" 

- a ref는 단순히 a SHA의 이름이다
  - Branches나 tags(나중에 설명한다)는 refs이다 
- some special refs(가장 일반적인 것은 <mark style="background-color:pink;">HEAD</mark>)가 있는데, 대개는 symbolic refs들이다
  - (i.e., they는 직접적으로 a SHA를 가리키는 대신에 보통 a ref를 가리킨다) 
- 어쨌든, 지금은
  - 당신이 a SHA에거 준, 사람이 읽을수 있는 이름으로 생각하라 
    
### 2.3 what is a repo

{% figure caption:"a simple chain of commits" %}
![](/wiki-img/2023/23what-is-a-repo.png)
{% endfigure %}

- a repository('repo')는 commits의 a graph 이다
- 이 그림 에서, 편의를 위해 SHAs를 numbers로 표현한다
- 또한, 시간은 위쪽으로 흐르는 것으로 표현한다 (아래에서 위로)

### (Hey, why are the arrows backward in your pictures?)

- 그래서 왜 화살표가 뒷쪽을 가리키고 있지?
  - well... 모든 commits은 어느 것이 그들의 parent commit인지 안다
    - ( 앞쪽의 "what is a SHA" 섹션에서 설명한것 처럼)
  - 하지만 그들의 child commit은 알지못한다(아직 안 만들었기때문에..)
- 그러므로, a repo는 a single linked list와 같다
  - a double linked list와 같을 수는 없다
  - 이것은 내용의 어떤 change라도 the SHA를 변경할 것이기 때문이다

## 3. branches and tags

{% figure caption:"a branch" %}
![](/wiki-img/2023/31branch.png){: style="width:80%;"}
{% endfigure %}{: style="width:10%;"}

### 3.1 branch

- 전통적으로, a linked list의 꼭대기(the top)는 a name을 가진다
- that name이 a BRANCH name 이다
- branch name을 초록색 원에 표시했다

### 3.2 more than one branch

{% figure caption:"three branches" %}
![](/wiki-img/2023/32more-than-one-branch.png)
{% endfigure %}

- (a.k.a "more than one child commit")
-  a repo는 a GRAPH 라고 말한것을 기억하는가?
- 특히, 둘이상의 child node가 동일한 parent node를 가리킬 수 있다
  - 오른쪽 그림에서 parent node = 3, child noes = 4, 7 
  - 오른쪽 그림에서 parent node = 2, child noes = 3, 5 
- 이런 경우, 각 'leaf node'는 a branch 이며, 이름을 가질것이다
- place holder

### 3.3 more than one parent commit

{% figure caption:"a merge commit" %}
![](/wiki-img/2023/33more-than-one-parent-commit.png)
{% endfigure %}{: style="float:inline-start;"}

- 결국 branches를 다시 merge하지않으면 더 많은 branches를 계속 생성할수는 없다
- "feature X"가 the main branch에 merge할 정도로 충분히 테스트 되었다고 하면 
  - `git merge feature_X`를 수행한다
  - 오른쪽 그림이 그 결과이다  
- commit 8이 이제 2 parents를 가진것에 주목하라
  - 이 그림은 commit 8이 a "merge commit"인 것을 보여준다 

{% figure caption:"a deleted feature branch" %}
![](/wiki-img/2023/33more-than-one-parent-commit02.png)
{% endfigure %}{: style="float:left;margin:4em"}

<br><br> 

- 이 지점에서 
  - 특히, 당신이 더이상 "large" 변경을 예상하지 않는다면
  - the feature branch를 지우는 것은 매우 흔한일이다
- 그래서 당신은
  - `git branch -d feature_X`를 수행하면
  - 왼쪽 그림과 같은 결과를 얻는다
{: style="text-indent: 3ch"}

<br><br><br>

{% figure caption:"HEAD" %}
![](/wiki-img/2023/34current-branch.png)
{% endfigure %}{: style="float:inline-start"}

### 3.4 current branch / checked out branch

- a 'currently checked out' branch의 개념이 있다
- HEAD라고 불리는 특별한 ref로 표시된다
- HEAD는
  - a **symbolic** ref 이며
  - 'current branch'를 가리킨다

### 3.5 committing

- a new commit을 만들 때, the current branch가 이동한다
- 기술적으로, HEAD가 어떤 branch를 가리키든지 이동한다 

{% figure caption:"committing" %}
![](/wiki-img/2023/35committing.png)
{% endfigure %}{: style="float:none;width:50%"}

{% figure caption:"non-leat" %}
![](/wiki-img/2023/36naming-non-leaf-nodes.png)
{% endfigure %}{: style="width:30%"}

### 3.6 naming non-leaf nodes

- it은 단지 'leaf' nodes일 뿐만 아니라
  - names을 가질수 있는 inner nodes이다
- 이전에 `feature_X`를 merge한 결과를 다시 기억해봐라
  - ( "more than one parent commit" 섹션을 봐라) 

- 이지점에서,
  - <mark style="background-color:pink;">feature_X</mark> 를 영원히 그대로 둘 수도 있다
  - 아니면 the branch를 지울 수도 있다
    - 이번 section에서 이미 보여준 것처럼
    - 그 경우에는 that label은 단순히 사라질것이다.
    - ( "4"를 가리키는 the commit은 the merge 때문에 <mark style="background-color:pink;">master</mark>로부터 안전하게 도달가능하다
    - 즉(that is), 
      - master로 이어지는 a sequence of commits가 있기 때문에 
      - "lost"된 것이 아니다

{% figure caption:"further feature development" %}
![](/wiki-img/2023/36naming-non-leaf-nodes02.png)
{% endfigure %}{: style="width:40%"}

- 나중에 다시 한 번 merge 할 수 있도록 좀 더 다듬으면서(refining)(분사구문 while 생략?)
  - <mark style="background-color:pink;">feature_X</mark> branch 위에서 개발을 계속할 수 있다
- 이 문서의 주제와는 관계없지만, 이 것은 말해야 겠다
  - 일반적인 관례는
    - 개발을 좀 더 진행하기 전에 
    - 우선 master를 <mark style="background-color:pink;">feature_X</mark>로 다시 병합하는 것이다
    - (그 이유는) master가 이제까지 모아온 모든 other stuff를 it(feature_X)이 확실히 갖도록 (하는것이다)
    - (이것은 옆 그림에서 commit 9에서 보여진다)


### 3.7 tags

- 좀더 일반적으로
  - inner nodes는 TAGS이다
- tag names는 yellow circles로 표시했다

{% figure caption:"a tag" %}
![](/wiki-img/2023/37tags.png)
{% endfigure %}{: style="float:none;width:40%"}

### 3.8 the difference between branches and tags

- a branch 와 a tag의 주요 차이점은
  - branches는 이동하고(move)
  - tags는 그렇지 않다는 것이다
- 현재 checked out 된 the "master" branch에 a commit을 했다면
  - master는 new commit 위치로 이동할 것이다 

{% figure caption:"branch versus tag" %}
![](/wiki-img/2023/38the-difference-between-branches-and-tags.png)
{% endfigure %}{: style="float:none;width:40%"}

## 4 digressions - 1

### 4.1 what is a git URL?

- Git repos는 a URL을 제공하여 access할 수있다
- 전형적인 4 종류의 Git URLs가 있다
  - ssh: <mark style="background-color:pink;">ssh://[user@]host.xz[:port]/path/to/repo.git/</mark>
  - http: <mark style="background-color:pink;">http[s]://host.xz[:port]/path/to/repo.git/</mark>
  - git: <mark style="background-color:pink;">git://host.xz[:port]/path/to/repo.git/</mark>
    - 주목하라 : 이것은 인증받지 않은(unauthenticated) 프로토콜로
      - 오픈 소스나 유사한 소프트웨어의 다운로드를 허용하는데에만 적합하다
  - local file: <mark style="background-color:pink;">file://ful/pathto/reponame</mark>
- (git URLs에 대해 허용된 모든 문법을 보려면 'man git-clone'을 실행하라)

### 4.2 what is a "remote"?

- A remote는 
  - 특정 git repository를 참조하는데 사용되는
  - (an alias와 같은) a short name이다
- 다음과 같이 명령을 호출(saying)하는것 대신
  - <mark style="background-color:pink;">git fetch git://sitaramc/gitolite</mark>
  - that(URL)을 a remote로 추가하고
  - the long URL 대신 that short name을 사용할 수 있다
- 편의성을 위해,
  - 'origin'이라 불리는 a 'remote'가
  - a repo를 clone할 때 자동적으로 생성되며
  - (a 'remote'는) 당신이 clone해온 the repo를 가리킨다

## 5. local and remote repos

{% figure caption:"a remote" %}
![](/wiki-img/2023/51remote-branches.png)
{% endfigure %}{: style="width:40%"}


## 5.1 remote branches

- Git은
  - 분산된(distributed) version control system이다
  - 그래서
    - 누군가의 repo를 clone할 때
    - 그것 안의 모든 branches를 가져온다
  - Remote branches는
    - the remote의 이름을 접두어로 한다
    - 그리고 옆 그림에서 orange로 표시한다

## 5.2 multiple remotes

- 당신은 몇가지 remote를 가질수 있다

{% figure caption:"several remotes" %}
![](/wiki-img/2023/52multiple-remotes.png)
{% endfigure %}{: style="float:none;width:85%"}

## 5.3 fetching and merging from another repo

{% figure caption:"before merge" %}
![](/wiki-img/2023/53fetching-and-merging-from-another-repo.png)
{% endfigure %}{: style="width:60%"}

- 이제 Sita's repo가
  - master로 부터 몇 개의 새로운 commits을 가졌다고 해보자
  - ,그리고 <mark style="background-color:pink;">git fetch sitas-repo</mark>를 수행한다
- (우리는 명확성을 위해 
  - 관련있는 commits만 보이도록 
  - the graph를 좀 가지치기 했다;
  - the commits와 branches의 나머지는
    - 바로 앞 그림과 같은 상태로 존재하는 것으로 가정한다 

{% figure caption:"after merge" %}
![](/wiki-img/2023/53fetching-and-merging-from-another-repo02.png)
{% endfigure %}{: style="width:40%"}

- 이제 
  - Sita's master branch를 
  - 당신것에 merge하길 원한다고 해보자
- Sita's master에 없는 것은 
  - 당신의 master에도 없기 때문에
  - (즉, Sita's master는 당신것의 상위집합이다)
  - <mark style="background-color:pink;">git merge sitas-repo/master</mark>를 
    - 실행하는것은
    - 옆 그림의 결과를 준다

# 6. digressions - 2

## 6.1 the object store

- Git은
  - 모든 data를 
  - repository의 최상위에 위치한 
  - <mark style="background-color:pink;">.git</mark>이라 불리는 특별한 directory에 저장한다
- 그곳 어딘가에
  - 우리가 단순히 the *object store*라고 부르는 것이 있다 
  - ( that phrase가 불편하다면, 일종의 database로 생각해라)
- Git은
  - 당신의 모든 data를
  - this object store에 저장한다
- this store에는 4가지 objects가 있다
  - **blob** - the repo에 추가한 each file은 a blob object로 변환된다
  - **tree** - each directory는 a tree object로 변환된다
    - 분명하게, a tree object는
      - 마치 a directory가 다른 directories와 files를 포함하듯이
      - 다른 tree objects와 blob objects를 포함할 수 있다
  - **commit** - a commit은 
    - it(a commit)이 많은 다른 정보들 또한 갖고있긴 하지만
    - 특정 시점의 working tree의 a snapshot이다
  - **tag** - 주석이달린(annotated) tag는
    - tag이 달린 the commit의 the SHA
    - some other metadata
    - the message
    - 를 가지고 있다
    - a GPG-signed tag은 the GPG signature 또한 가진다
- (원한다면 이 세부사항을 봐라:
  - a blob은 the hierarchy 내에서 최하위이다.
  - 한 개 이상의 blobs and trees가 a tree를 만든다
  - A commit은
    - a tree에
    - parent sommit(s)의 the SHA,
    - the commit message,
    - author/committer names and emails,
    - 와 tiestamps
    - 를 더한것이다
  - 일반적인 사용조건하에서, 이들 모두를 다룰필요는 없다 )

## 6.2 what is a repo (again)

- 앞부분에서, a repo는 commits으로 이루어진 a graph 인것을 봤다
- the file system level에서,
  - 하지만, it(a repo)는 기본적으로
  - 어느정도(somewhat) 아래처럼 보이는
  - <mark style="background-color:pink;">.git</mark>이라 불리는 a directory이다 

  ```sh
  $ ls -al .git
  total 40
  drwxrwxr-x 7 sitaram sitaram 4096 Sep 14 18:54 ./
  drwx------ 3 sitaram sitaram 4096 Sep 14 18:54 ../
  drwxrwxr-x 2 sitaram sitaram 4096 Sep 14 18:54 branches/
  -rw-rw-r-- 1 sitaram sitaram   92 Sep 14 18:54 config
  -rw-rw-r-- 1 sitaram sitaram   73 Sep 14 18:54 description
  -rw-rw-r-- 1 sitaram sitaram   23 Sep 14 18:54 HEAD
  drwxrwxr-x 2 sitaram sitaram 4096 Sep 14 18:54 hooks/
  drwxrwxr-x 2 sitaram sitaram 4096 Sep 14 18:54 info/
  drwxrwxr-x 4 sitaram sitaram 4096 Sep 14 18:54 objects/
  drwxrwxr-x 4 sitaram sitaram 4096 Sep 14 18:54 refs/
  ```
  
## 6.3 objects and branches/tags

- 이해해야하는 정말, 정말 중요한 것은
  - the object store는 아래 내용을 상관하지 않는다는 것이다
    - the commit이 어디로부터 왔는지
    - 혹은 it(a commit)이 the object store에 들어갈때,
      - it(a commit)이 어떤 "branche"의 일부였는지
  - 일단 거기에 있으면, 거기에 있는거다!
- 여기 3개의 diagrams를 다시 돌아보자
  - 첫번째는 당신이 fetch를 하기 전이다

{% figure caption:"before fetch" %}
![](/wiki-img/2023/63objects-and-branches-tags.png)
{% endfigure %}{: style="float:none;width:70%"}

  - 다음 두개의 그림은 각각
    - <mark style="background-color:pink;">git fetch sitas-repo</mark> 실행이후와
    - <mark style="background-color:pink;">git merge sitas-repo/master</mark> 실행이후이다
  
{% figure caption:"after merge" %}
![](/wiki-img/2023/63after-merge.png)
{% endfigure %}{: style="float:inline-start;width:35%"}

{% figure caption:"after fetch" %}
![](/wiki-img/2023/63after-fetch.png)
{% endfigure %}{: style="float:none;width:50%"}

- 하지만, 
  - 단지 they(commits 10 and 11)가 지금 **당신의 local "master" branch**에 있다는 이유로는
  - commits 10 과 11이 어떤식으로도 바뀌지 않았음에 주목하라
- They(commits 10 and 11)는 
  - 계속 같은 SHA values를 가지며
  - the object store는 the command의 결과로 전혀 바뀌지 않는다
- 당신이 한 모든 일은 
  - a pointer를 하나의 node에서 다른곳으로 이동한것 뿐이다

# 7. advanced operations

## 7.1 merging

{% figure caption:"before non-ff merge" %}
![](/wiki-img/2023/71before-non-ff-merge.png)
{% endfigure %}{: style="width:50%"}

- 첫번째로 merging을 하자
- 앞에서 본 the merge는 
  - a "fast-forward" merge 라고 부르는데,
  - mergin하려는 the remote branche에 없는 어떤 commits도 
  - 당신의 local master에 없는 경우를 말한다
- 실제로, 
  - 많은 개발자와 함께 하는 활성화된 프로젝트에서는
  - 이런 경우는 드물다
  - 그래서 that이 어떤지 같이 보자
  - 시작 지점은 이곳이었다:
- 이제,
  - your local master에서 몇가지 변경을 더했다
  - 그러는 동안, sitas-repo는  몇가지 변경을 했었고
    - a fetch를 실행해서 그것들은 가지고 왔다 

{% figure caption:"after-fetch" %}
![](/wiki-img/2023/71after-fetch.png))
{% endfigure %}{: style="float: none;width:50%"}

- merge를 하면, 최종 결과는 아래 그림 처럼 보인다

{% figure caption:"after non-ff merge" %}
![](/wiki-img/2023/71after-non-ff-merge.png)
{% endfigure %}{: style="float:none;width:50%"}


## 7.2 cherry-pick

- a cherry-pick은
  - 매우 일반적으로 수행되는 것은 아니다
  - 잘 설계된 workflows 에서 it(a cherry-pick)은 드물어야 한다

{% figure caption:"before cherry-pick" %}
![](/wiki-img/2023/72before-cherry-pick.png)
{% endfigure %}{: style="width:40%"}

- 하지만, a cherry-pick은
  - git 에서의 중요한 컨셉을 묘사하기 위한 좋은 방법이다
- 앞에서 a commit은
  - files와 directories의 특정 집합(set)을 표현한다고 했다
  - 하지만 대부분의 commits이 한 개의 parent만 가지므로
  - a commit이 일련의 changes 또한 표현한다고 생각할 수 있다
  - (사실상, 대부분의 오래된 VCSs가 이랬다)
- 당신의 동료중 한명(신비에 싸인 "Sita" 재등장!)이 
  - 그의 repo copy에 한 다발의 변경사항을 반영했다고 하자
  - 당신의 이 변경사항의 대부분이 싫지만,
  - 그 중 한개의 변경사항만 당신의 repo에 가져오고 싶다고 하자
  - 시작점은 그림과 같다:
- 여기서, sitas-repo는
  - 그의 마스터위에 3개의 commits(12, 13, and 14)를 가지고,
  - 당신은 그 중 commit 13 에만 관심이 있다고 하자

{% figure caption:"after cherry-pick" %}
![](/wiki-img/2023/72after-cherry-pick.png)
{% endfigure %}{: style="width:40%"}

- <mark style="background-color:pink;">~1</mark>의 의미에 대해서 지금은 걱정하지 마라
  - (추측은 할 수 있어야하긴 하지만!),
  - 하지만, 당신이 실행해볼 수 있는 the command가 있다
  - <mark style="background-color:pink;">git cherry-pick sitas-repo/master~1</mark>
- 위 명령의 결과는 옆 그림의 commit graph와 같다
- the new commit을 "13a"로 부르는 것에 주목하라.
  - 이 것은 다음과 같은 사실을 반영하려는 것이다
  - 반영된 변경사항은 원래의 commit 13과 똑같은 변경사항이지만
  - the SHA는 더 이상 같지 않을것이다 
  - (다른 이유는.. 새로운 부모 commit, 새로운 "tree", 
  - 새로운 commiter name/emial/commit time, 등등 때문이다)  
    
## 7.3 rebasing

{% figure caption:"after fetch" %}
![](/wiki-img/2023/73after-fetch.png)
{% endfigure %}{: style="width:40%"}

- merging 대신, 
  - Sita's commits 위에 
  - 당신의 commits을 rebase하길 원한다고 해보자
- 우선, rebasing이 무엇인가?
  - 그것은 기본적으로
    - the graph의 한 지점으로부터
    - 일련의 변경사항들을
    - 다른 지점으로 이식하는 것이다
- 그래서 만약에
  - a rebase가
  - (원칙적으로) cherry-picks의 연속으로 추측했다면
  - 적어도 개념적인 측면에서는
  - 매우 가까운 추측을 한 것이다
- 그러므로
  - 앞선 merge 예제와 유사한 예제를 사용하자
  - 하지만 sitas-repo 대신에
  - 새로운 commit이 "origin"(이 프로젝트의 "main"server)
  - 에 있다고 하자
- 당신은 당신의 새로운 commits을 가졌고
  - <mark style="background-color:pink;">git fetch origin</mark>명령을 하면
  - "origin"에서 마지막 commits를 가져와서
  - 옆 그림처럼 된다

{% figure caption:"after rebase" %}
![](/wiki-img/2023/73after-rebase.png)
{% endfigure %}{: style="width:50%"}

- 이제, 
  - "origin/master"를 
  - 당신의 local master에 merging하는 것 대신에,
  - "origin/master"위에
  - 당신의 commits를 rebase하길 원한다.
- 즉, 당신은
  - the origin의 commit 13 이후에
  - 당신의 local changes가
  - 반영되는것처럼 보이길 원한다
- 그래서 당신은
  - <mark style="background-color:pink;">git rebase origin/master</mark>명령을 수행하고 
  - 옆 그림과 같은 결과가 된다
- 우리는 여기서
  - command syntax와 뉘앙스를
  - 무시하고 있다는 것을 다시 주목하라
- 이것은 컨셉에 대한 것이다
- 또한 다시,
  - the 2 commits의 the SHAs가 변경된것에 주목하라 
  - 그들은 이제 새로운 parents,tree,etc 를 가지며,
  - 이점을 suffix"a"를 붙여서 표시했다
- 매달린(dangling) commits 10 and 11을 주목하라
  - 아무런 branch도 그들을 가리키지 않기 때문에
  - 그들은 기본적으로 disk 공간 낭비이다
  - (그들은 'reflog'를 사용하여 검사되고 회수될수 있다
  - 또는 그대로 남겨진다면 결국은 garbage collected 될것이다)

- cherry-pick과는 달리,
  - 실제 사용할때 a rebase는 꽤 많이 발생한다
- Rebase에는 좀 다른 형식도 있다
- 이 형식(form)은 하나인데,
  - 개발자가 자신의 local commits을 
  - publishing/pushing 하기 전에
  - 보다 논리적인 순서로 재정렬 하고 싶은 경우가
  - 가장 일반적인 경우이다
   
{% figure caption:"fixup rebased" %}
![](/wiki-img/2023/73fixup-rebased.png)
{% endfigure %}{: style="float:inline-start;width:60%"}

{% figure caption:"fixup commit" %}
![](/wiki-img/2023/73fixup-commit.png)
{% endfigure %}{: style="float:none;width:30%"}

- "fixup commit"을 "fixup rebased"로 변경하는 형태를 많이 작업하는데 
  - "fixup commit"에서 "22delta"는 a minor fixup to "22"이고
  - "git rebase -i"를 사용하여 작업한다
- 다음과 같은 점을 주목하라
  - commit 22은 SHA를 변경하기 때문에
  - 지금은 rebase된 - 모든 그의 child commits은
  - 또한 새로운 SHAs를 가질것이다
  - 이것이 
    - 이미 발행된 branches를
    - (거의) 결코 rebase 하지 말아야 하는 이유이다

## 8 tying up some loose ends

### 8.1 the confusion about checkout versus reset

- 제발 주목하라
  - 이 section은 
    - 이러한 두 명령, 특히 the index 및 the working tree
    - 와 관련된 옵션에서 사용 가능한 
    - 무수한 옵션들을 무시한다
- 우리가 하려는 모든 것은
  - the commands가 
  - the branch와 <mark style="background-color:pink;">HEAD</mark>에 하는 것을
  - 보여주는것 이고, 그 외에는 없다
- 때문에,
  - 이 것은 그 두 commands에 대한 완전한 논의가 아니며
  - 일부 측면일 일뿐이다
- 사실상,
  - 이 둘이 때때로 혼동되는 the major reason은 
  - 사람들이 
  - <mark style="background-color:pink;">git checkout -f</mark>와  <mark style="background-color:pink;">git reset --hard</mark>이
  - 결국 같은일을 한다는 것을 알게되기 때문이며,
  - 이 것을 기초로 다른 options에 대해서도 추론하기 때문이다
- 그냥 아래 내용을 기억해라
  - 아주 다른 두 개의 명령의 특별한 경우들이
  - 우연히 그 지점 에서 만나게 되었을 뿐이다
- 기본적인 차이는 매우 간단한다:
  - "checkout"은 현재 branch의 상태를 변경한다 (즉, HEAD가 가리키는 곳을 변경한다)
  - "reset"은 현재 branch가 어느 commit을 가리키는 가를 변경한다

{% figure caption:"starting point" %}
![](/wiki-img/2023/81starting-point.png)
{% endfigure %}{: style="width:30%"}
   
 
- 여기에
  - 어떤 일이 벌어지고 있는지를 보여주는 그림이 있다.
  - (간단하게 하기위해 commits 6과 7 아래는 생략되었다)
  - 첫 번째 그림은 일반적인 시작지점이다
   
- 다음 두개의 그림은
  - a checkout 과 a reset 효과를 각각 보여준다
  - 각 그림에서 시작 지점과 비교하여
  - 어느 line이 움직이는지 주목하라


{% figure caption:"checkout" %}
![](/wiki-img/2023/81checkout.png)
{% endfigure %}{: style="width:40%"}

- 그림에서 보듯이
  - 시작했을때 현재 branch는 "master" 이다
  - (HEAD 가 가리키는 곳으로 표시된다)
- A "checkout"은
  - 현재 branch가 어느 것인지를 변경한다 
  - "checkout"으로 "devel"로 변경되었다
  - 때문에 지금부터 어떤변경이든지 
  - "master"가 아니라"devel" 위에 쌓이게 된다  

- 반면에, a "reset"은
  - 현재 branch가 어느 commit을 가리키는 지를 변경한다
  - 당신의 branch는 여전히 mater 이지만,

{% figure caption:"reset" %}
![](/wiki-img/2023/81reset.png)
{% endfigure %}{: style="width:40%"}

- 이제는 잠재적으로
  - *완전히* 다른 history가 될수 있는 것을
  - 가리키고 있다

- (다음을 주목하라,
  - the rebase 예제에서와 같이,
  - 어떤 branch도 가리키지 않는 - a dangling commit
  - 이 존재한다
  - 그것은 `reflog`명령으로 접근가능하며,
  - 결국 garbage collect로 처리된다

### 8.2 detached HEAD and all that

{% figure caption:"after commit" %}
![](/wiki-img/2023/82after-commit.png)
{% endfigure %}{: style="float:inline-start;width:40%"}

{% figure caption:"before commit" %}
![](/wiki-img/2023/82before-commit.png)
{% endfigure %}{: style="float:none;width:40%"}

- 지금까지 
  - HEAD가 a branch name을 가리키는 것과
  - the branch 자신이 a commit을 가리키는 것을 봐왔다
- 그렇다면
  - a commit을 만들때,
  - the branch는 the new commit 쪽으로 이동한다
  - (HEAD가 the branch name을 여전히 가리키고 있음에도 불구하고)
- 요약하고 싶다면,
  - 간단한 before/after 표시로 이 주제와 관련된 the tree의 일부분을 살펴봐라

{% figure caption:"after checkout v1.0" %}
![](/wiki-img/2023/82after-checkout-v10.png)
{% endfigure %}{: style="width:40%"}

- 이제 
  - <mark style="background-color:pink;">git checkout v1.0</mark>을 실행할 때
  - 무슨 일이 발생하는지 보자
- 미묘한 차이를 알아챘는가?
  - HEAD는 더 이상 a **symbolic** ref가 아니다
  - (즉, a real branch를 가리키고 있다)
- 그 대신,
  - HEAD는 a commit을
  - 직접 가리키고 있다

- 실제 조건에서,
  - 이것이 문자그대로 일어나는 것이다
  - "master"를 check out 할 때,
  - HEAD의 내용( 단지 .git 폴더 내의 a file 이다)은 단순히 아래 내용이다
    ```
    ref: refs/heads/master
    ```
  - <mark style="background-color:pink;">git checkout devel</mark> 를 실행하면 (devel은 local branch) 아래와 같이 된다
    ```
    ref: refs/heads/devel
    ```
- 하지만, 이전에 말했던 것을 기억하는가?
  - branches만 이동할수 있으며, tags는 이동할수 없다
  - 그래서 <mark style="background-color:pink;">git checkout v1.0</mark>을 실행하면 HEAD는 아래 내용을 포함한다
    ```
    90fed7792746a9a33e24059fb171f6bbb6ffebe6
    ```
  - 아니면 저런 hash를 포함한다.

{% figure caption:"commit on detached HEAD" %}
![](/wiki-img/2023/82commit-on-detached-HEAD.png)
{% endfigure %}{: style="width:50%"}

- local branches에 수행한 (commit 8)작업을 (여기서도)수행했다면,
  - the tag가 이동할 것임을 의미한다. 맞나?
  - 그렇지 않아야한다 - 움직인다면 아무래도 a tag는 아닐것이다
- 그래서 이런 관점에서,
  - a commit을 한다면,
  - HEAD 만 변경되며, 다른 것은 안 바뀐다
  - HEAD가 어떤 local branch name에도
  - 더이상 붙어있지 않기 때문이다

{% figure caption:"unreachable commit" %}
![](/wiki-img/2023/82unreachable-commit.png)
{% endfigure %}{: style="width:40%"}

- 이 사실이 위험하게 생각되는 이유는
  - 이제 <mark style="background-color:pink;">git checkout master</mark> 를 실행하면 
  - 옆 그림 상태가 되기 때문이다
- new commit 8에 어떤 일이 발생했는가?
  - 그냥 매달려있다 (dangling)
  - 즉, 닿을수 없다. (unreachable)
  - ( 물론, 
  - the reflog 명령을 제외하고 말이다,
  - 초보자는 충격을 받을 수도 있다!)

### 8.3 other ways to detach your HEAD

- a detached HEAD 상태가 되는 가장 일반적인 방법은
  - 그 위에 commits 을 하기전에
  - a local copy를 만들 필요가 있다는 것을 깨닫지 못하고
  - a remote branch를 check out 하는 것이다
  - (<mark style="background-color:pink;">git checkout origin/branch</mark> 처럼)
- (Side note:
  - a remote branch에서 가져온 a local branch를 
    - create하거나 checkout 하는 올바른 syntax는
    - <mark style="background-color:pink;">git checkout -t -b branch origin/branch</mark> 였지만
    - modern git 은 <mark style="background-color:pink;">git checkout branch</mark>만 해도 된다
  - 진보에 찬사를!)
- <mark style="background-color:pink;">git checkout origin/branch</mark>가 a detached HEAD 상태를 만드는 이유는
  - remote branches가 이동할 수는 있지만,
  - <mark style="background-color:pink;">git fetch</mark>나 equivalent의 결과로만 그렇게 할 수 있다
  - 결국, they(remote branches)는 
    - the *remote*가 무엇을 가지는지 추적하기 위한것이기에,
    - 그들이 *local* commits을 갖는 것이 합리적이지 않다!
- 아래에 detach HEAD하는 다양한 방법이 있다:
  ```sh
  git checkout origin/master    # (described above)
  git checkout master^          # parent of master 
  git checkout HEAD~2           # grandparent of current HEAD
  git checkout tagname          # since you cant commit to a tag!
  git checkout <SHA>            # hex digits forming a full or partial SHA
  git checkout master^0         # (see note below)
  ```
- 위 명령들은 모두 
  - <mark style="background-color:pink;">HEAD</mark>라 불리는 file이
  - <mark style="background-color:pink;">ref: refs/heads/branch</mark>같은 어떤 string 대신에
  - 대응되는 commit의 the actual (40-hex-digt) SHA를
  - 포함하도록 한다 
- 마지막 명령 (<mark style="background-color:pink;">git checkout master^0</mark>)은 흥미롭다
  - <mark style="background-color:pink;">master^0</mark> notation이
  - "master가 가리키는 the actual commit"을 의미하기 때문에,
  - <mark style="background-color:pink;">git checkout 〈SHA〉</mark>라고 하는 것과 같기 때문이다

### 8.4 re-attaching the HEAD

- 최근의 git은 
  - command line 상태에 있다면
  - a detached HEAD 상태에서
  - commits을 잃게될 것이라고 경고할 것이다
  - 그리고, 어떻게 recover(즉시)하는지 말해줄것이다
- 다른 branch로 전환하기 전에 
  - 당신이 a detached HEAD상태에 있는것 알아차린 다면
  - Recovery는 매우 쉽다
    ```sh
    git checkout -b newbranch
    ```
- 아마도 몇가지 commits을 한 상태로
  - 당신이 이미 전환하고 나서,
  - a detached HEAD 상태로 몇개의 commit을 잃을 것을 알아차린 다면,
  - the lost HAD를 찾기 위해 reflog를 check하고
  - 아래 명령으로 그쪽으로 전환할
  - 필요가 있다
    ```sh
    git branch newbranch HEAD@{1}
    ```
 
### 8.5 the reflog
 
- the reflog는
  - HEAD가 과거에 가졌던 모든 values를
  - 보여줄 수 있다
- 여기에 simulated 예제가 있다
  - 나는 a master branch와 'foo' branch를 가진 a repo를 clone 했다
  - 그다음 <mark style="background-color:pink;">origin/foo</mark>를 check out하고
  - 모든 warnings를 무시하고,
  - 내가 "foo" branch라고 생각했던것에 2개의 commits을 했다
  - 그다음 master로 복귀한 후
  - 내가 2개의 commits을 '잃었다'고 알아차리기 전에
  - 2개의 일반적인 commits을 했다
- 이 시점에서,
  - <mark style="background-color:pink;">git reflog show</mark>를 실행하면 아래내용이 나온다
  - (가장 최근 HEAD values가 first이다)
    ```
    86a8ee0 HEAD@{0}: commit: my second commit on master
    e42c4d0 HEAD@{1}: commit: my first commit on master
    58c1539 HEAD@{2}: checkout: moving from e2558a9d1527e5a76b39ffede1dc5ca9c650de01 to master
    e2558a9 HEAD@{3}: commit: second commit on foo
    1c9dfa0 HEAD@{4}: commit: first commit on foo
    802f184 HEAD@{5}: checkout: moving from master to origin/foo
    58c1539 HEAD@{6}: clone: from /tmp/tmp.lv5IqjK0ZI/b
    ```
- 저 <mark style="background-color:pink;">moving from 〈SHA〉...</mark>는
  - 보통 some commits을 잃었을수도 있다는 신호이다
  - 이런 경우에
    - <mark style="background-color:pink;">git branch newbranch HEAD@{3}</mark>을 실행하거나
    - <mark style="background-color:pink;">git branch newbranch e2558a9</mark>을 실행하여,
    - those commits을 구할수 있다
    - (<mark style="background-color:pink;">HEAD@{3}</mark>의 SHA 값이 
      - 위라인의 <mark style="background-color:pink;">moving from 〈SHA〉...</mark> message에서 언급된 것과 
      - 같다는 것에 주목하라)
 
### 8.6 the end
 
- 이것이 도움이 되었기를 바란다...!



