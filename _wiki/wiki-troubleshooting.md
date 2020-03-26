---
layout  : wiki
title   : 개인위키 문제점 해결
summary : 개인 위키 운영하면서 생기는 문제 정리 
date    : 2020-03-16 16:16:06 +0900
updated : 2020-03-26 10:21:07 +0900
tag     : vimwiki 
toc     : true
public  : true
parent  : wiki-setting 
latex   : false
---
* TOC
{:toc}

{% raw %}
# curly braces 에러 
## 문제 내용 분석
* vim-folding.md 포스트 작성 하면서 내용상에 triple curly braces( {{{ )를 적었는데 [jekyll build 에러](https://help.github.com/en/github/working-with-github-pages/troubleshooting-jekyll-build-errors-for-github-pages-sites#tag-not-properly-terminated)가 발생했다.
    * 이 페이지에서 맨 아랫쪽 **Tag not properly terminated** 에러 임. 
  ![이미지](https://user-images.githubusercontent.com/24635919/77517651-dc2d8100-6ebf-11ea-951a-e361f000c164.png)
  * 문제점 문구
```
Your site is having problems building: The variable {{ on line 50 in _wiki/vim-folding.md 
was not properly closed with }}. For more information, see 
https://help.github.com/en/github/working-with-github-pages/troubleshooting-jekyll-build-errors-for-github-pages-sites#tag-not-properly-terminated.
```
* jekyll에서 채용한 [liquid 템플릿 언어](https://shopify.dev/docs/liquid/)와 충돌이 난것이다.
{% endraw %}

## 해결책
* 해결책은 liquid [raw 태그](https://shopify.github.io/liquid/tags/raw/)를 사용하면된다. 
  * 단점은.. jekyll로 markdown을 보여줄땐 raw 태그가 안보이지만 일반 markdown 편집기에서는 raw 태그가 보임. (raw 파일 지저분..)
* 재발 방지 대책 
  * 로컬에서 테스트 해보지 않고 github에 올려서 push 이후 문제를 발견. 
  * 로컬에 jekyll 환경이 필요하다 생각함.
  * 이 사이트에서 [jekyll 환경 설정](https://shryu8902.github.io/_posts/2018-06-22-jekyll-on-windows/) 참조 해서 로컬에 jekyll 설치. 
