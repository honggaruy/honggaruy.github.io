---
layout  : wikiindex
title   : wiki
date    : 2017-11-26 21:38:36 +0900
updated : 2020-03-25 14:07:47 +0900
tags    : index
toc     : true
public  : true
comment : false
---

* [[Gradle]]
* [[tools]]
    * [[useful-site]]
        * [[google-search-console-remove-outdated-content]]{구글 웹 도구 - 오래된 콘텐츠 삭제}
* [[programming-language]]{프로그래밍 언어}
    * [[Groovy]]
* [[how-to]]
    * [[mathjax-latex]]
* [[Vim]]
  * [[vimrc-related]]{vimrc 설정 관련}
    * [[vim-folding]]{vimrc 파일 폴딩하기}
* [[YAML]]
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

