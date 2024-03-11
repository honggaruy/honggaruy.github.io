---
layout  : wiki
title   : vim의 text object 활용
summary : 알고 있으면 typing을 더 적게 할 수있다!!
date    : 2023-10-11 10:08:49 +0900
updated : 2023-10-11 10:33:36 +0900
tag     : vim custom-text-object vim-text-object
toc     : true
public  : true
parent  : [[Vim-Category]] 
latex   : false
fontawe : false
---
* TOC
{:toc}

# 관련 링크
- text-object 관련 vim 공식 설명
    - vim에서 `:h text-objects`를 입력하거나
    - [vimhelp.org의 이 곳](https://vimhelp.org/motion.txt.html#text-objects) 을 참조
- [Vim Text Objects: The Definitive Guide, Carbonfive blog](https://blog.carbonfive.com/vim-text-objects-the-definitive-guide/)
    - [번역, Vim 텍스트 개체: 궁극의 가이드, Nolboo's Blog](https://nolboo.kim/blog/2016/10/13/vim-text-objects-definitive-guide/)
- [Text Objects in Vim, Baeldung](https://www.baeldung.com/linux/text-objects-in-vim)
 
# 개념
- vim 명령을 `동사 - 목적어`의 개념으로 볼 때 `text-objects`란 `목적어`에 해당되는 부분 
    - 즉 동사를 통해 내가 무언가 하고 싶은 부분을 정밀하게 선택한 부분을 `text-objects`라고 볼 수 있다

# 활용
- `WCX - 압축기 플러그인 (Packer plugins)` 라는 텍스트가 있을때
    - "Packer plugins" 부분의 컬러를 변경하기 위해 mark 태그를 붙이고 싶다고 하자
    - ( 괄호 안의 텍스트는 `i)` text objects로 선택할수 있다
    - surround vim의 감싸기 operator인 `ys`를 사용하여
    - ( 괄요 안에 cursor를 두고
    - `ysi)<mark>`를 입력하면 ..
    - `WCX - 압축기 플러그인 (<mark>Packer plugins</mark>)` 와 같이 변경된다 
