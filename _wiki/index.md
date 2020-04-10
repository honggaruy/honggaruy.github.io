---
layout  : wikiindex
title   : wiki
date    : 2017-11-26 21:38:36 +0900
updated : 2020-04-10 17:37:23 +0900
tags    : index
toc     : true
public  : true
comment : false
---

* [[Vim]]
  * [[vimrc-related]]{vimrc 설정 관련}
    * [[vim-folding]]{vimrc 파일 폴딩하기}
* [[wiki-setting]]{개인위키 설정 관련}
  * [[wiki-troubleshooting]]{개인위키 문제점 해결} 


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

