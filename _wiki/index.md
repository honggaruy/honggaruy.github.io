---
layout  : wikiindex
title   : wiki
date    : 2017-11-26 21:38:36 +0900
updated : 2020-04-12 16:27:14 +0900
tag     : index
toc     : true
public  : true
comment : false
---

## [[Vim-Category]]{Vim 관련 Category}

### [[Vimrc-Category]]{vimrc 설정 관련 Category}

* [[vim-folding]]{vimrc 파일 폴딩하기}

##  [[Wiki-Setting-Category]]{위키 설정 관련 Category}

* [[wiki-troubleshooting]]{위키 문제점 해결} 


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

