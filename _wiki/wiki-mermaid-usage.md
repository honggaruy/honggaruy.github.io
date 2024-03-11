---
layout  : wiki
title   : 위키에서 mermaid 활용 
summary : 다이어그램을 맘껏 그려보자! 
date    : 2023-11-01 18:18:20 +0900
updated : 2023-11-01 18:27:34 +0900
tag     : mermaid 
toc     : true
public  : true
parent  : [[Wiki-Setting-Category]] 
latex   : false
fontawe : false
---
* TOC
{:toc}

# mermaid란 ?
- 인어

# Test

```mermaid!
classDiagram
    class Shape {
        + id : String
    }
    link Shape "https://www.github.com" "This is a tooltip for a link"
    class Shape2
    click Shape2 href "https://www.github.com" "This is a tooltip for a link"
```  
