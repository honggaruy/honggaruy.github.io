---
layout  : wikiindex
title   : wiki
date    : 2017-11-26 21:38:36 +0900
updated : 2020-04-14 08:45:44 +0900
tag     : index
toc     : true
public  : true
comment : false
---

## [[Gray-Category]]{어디에 둘 지 모를때 Category}

## [[Language-Category]]{Language 관련 Category}

### [[CSS-Category]]{CSS 관련 Category}

* [[css-meaning]]{갑자기 깨달은 CSS 단어 의미}

## [[Tools-Category]]{프로그래밍 도구 관련 Category}

### [[Vim-Category]]{Vim 관련 Category}

#### [[Vimrc-Category]]{vimrc 설정 관련 Category}

* [[vim-folding]]{vimrc 파일 폴딩하기}

### [[Git-Category]]{Git 관련 Category}

* [[git-commands]]{자주 쓰는 git 명령}

### [[Linux-Category]]{Linux 도구 관련 Category}

* [[sed-problem-solving]]{GNU sed의 이상한 정규식 처리}

##  [[Wiki-Setting-Category]]{위키 설정 관련 Category}

* [[wiki-troubleshooting]]{위키 문제점 해결} 
* [[wiki-inWindows]]{윈도우즈에서 V+J+G 따라하기}
* [[wiki-toc2side]]{위키페이지에서 toc 위치 조정}
* [[wiki-font]]{위키페이지 폰트 변경} 


---

# blog
<div>
    <ul>
{% for post in site.posts %}
    {% if post.public != false %}
        <li>
            <a class="post-link" href="{{ post.url | prepend: site.baseurl }}">
                {{ post.title }}
            </a>
        </li>
    {% endif %}
{% endfor %}
    </ul>
</div>

