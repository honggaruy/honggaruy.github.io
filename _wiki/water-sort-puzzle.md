---
layout  : wiki
title   : Water Sort Puzzle 풀이 알고리즘 
summary :  
date    : 2021-10-09 19:49:38 +0900
updated : 2021-10-11 17:45:32 +0900
tag     : puzzle algorithm water-sort
toc     : true
public  : true
parent  : [[Algorithm-Category]] 
latex   : false
---
* TOC
{:toc}

# 관련자료

* water sort puzzle 이란 모바일 게임이 있는데 해결하는 코드를 작성하고 싶다
* [Water Sort Puzzle](https://www.codechef.com/problems/WTRSORT)
* [Water sort puzzel level 50 solution, Levelsolved](https://levelsolved.com/water-sort-puzzle-level-50-solution/) : 해답나와 있는 사이트
* [WaterSortPuzzleSover, github](https://github.com/kuking/WaterSortPuzzleSolver) : github 코드 , Go 언어
* [Colour Sort Solver, github](https://github.com/discorev/colour-puzzle-solver) : github 코드, python 언어
  * 처음에 주어진 패턴에 따라  [BFS, Breadth-first search](https://en.wikipedia.org/wiki/Breadth-first_search) 혹은 [DFS, Depth-first search](https://en.wikipedia.org/wiki/Depth-first_search) 를 쓸 수 있다고 한다
* [Water Sort Puzzle, codechef](https://www.codechef.com/problems/WTRSORT) : 워터 소트 퍼즐을 이론적으로 분석

# 문제 모델링

* 참고 : [Water Sort Puzzle, codechef](https://www.codechef.com/problems/WTRSORT)
* 연구원이 서로 다른 색상의 비혼화성 시약 샘플간의 반응을 연구하려고 한다
* 컬러는 $N$ 가지가 있다 ($1$ 부터 $N$ 까지 번호가 매겨져 있다)
* 연구원은 $N + 2$ 개의 test tube를 가지고 있다 ( $1$ 부터 $N + 2$ 까지 번호가 달린다)
  * 각각의 tube는 $M$ ml 까지 담을 수 있다
  * 처음에는 $N + 1$ 과 $N + 2$ tube는 비어있다
  * 그리고 각 $i$ 번째 tube ($1 \leq i \leq N$ ) 는 임의의 colour들의 시약  $M$ ml로 완전히 채워져 있다
* 시약끼리는 서로 섞이지 않기 때문에 
  * $i$ 번째 튜브의 내용은 튜브 바닥부터 머리까지 $B_i,_1, B_i,_2,\ldots,B_i,_M$의 시퀀스로 묘사할 수 있다
  * 즉, 각각의 유효한 $j$에 대해, $i$번째 튜브의 튜브 바닥으로부터 $j$번째 밀리리터 부피의 시약은 $B_i,_j$ color 의 시약으로 채워진것이다.
  * 각 시약의 초기 부피는 $M$ ml와 같다
* 연구의 편의를 위해, 연구원은 시약을 색상에 따라 재분류 하고자 한다
  * 즉, 최종적으로는 각각의 colour $i$는 색상에 따라 한 개의 tube를 $M$ ml 채워야 하며, 그 튜브에 다른 colour는 없어야 한다 
  * 빈 tube나 시약의 위치는 어디든지 상관이 없다
* 이 작업을 성공하기 위해, 처음에 몇 개의 ( 하나도 아니거나 혹은 모든 ) 튜브의 시약 순서를 반대로 할 수도 있다 ( 역자주 : 안드로이드 게임에서 reverse 기능은 없었음)
  * 이 때, 두 가지 작업을 수행할 수 있다
   
1. 두 개의 테스트 tube $P$와 $Q$를 선택하고 tube $P$의 가장 위의 시약 1 ml를 tube $Q$의 top으로 옮긴다
  * 이것은 $P$가 비어있지 않고 $Q$가 full이 아닐 때만 허용된다
  * $Q$가 비어있으면, 이 작업의 비용은 0이다
  * 위의 경우가 아닐때, 시약 $P$의 가장 꼭대기의 colour를 $U$라고 하고, (이 작업하기 전의) 시약 $Q$의 꼭대기 colour를 $V$라고 하자.
    * 만약 $D_U,_V = -1$ 이면, 이 작업은 허용되지 않는다. 이 경우가 아니라면 이 작업이 허용되며 비용은 $D_U,_V$가 된다 
1. 테스트 tube $P$를 선택하고 여유 용량을 $1$ ml 증가 시킨다. 이 작업의 비용은 $C_P$라고 한다

* 시약을 다른 튜브의 가장 위에 붇는 비용과 어느 시약이 서로 반응하는지에 대한 정보를 제공받을 것이다
  * 그러므로, 서로의 튜브 위에는 부을수 없다
  * 즉, 행렬 $D$가 있다고 하자. 각각의 유효한 $i$와 $j$에 대해 $D_i,_j = D_j,_i$ 임과 각각의 유효한 $i$에 대해 $D_i,_i =0$ 임이 보증된다
  * (역자주: 이 부분은 잘 이해가 안 됨)

* 당신은 $2^{20} = 1,048,576$ 번의 이하의 작업으로 ( 위 에서 묘사한 상태의) 시약 분리를 완성해야 합니다
* 이 상태를 달성하기 위한 작업 비용의 합은 가능한 최소한의 비용이 되어야 합니다

---

## Input

* 첫번째 line은 빈 칸으로 분리된 두 개의 정수 $N$ 과 $M$을 포함한다
* 두번째 line은 빈 칸으로 분리된 $N + 2$ 개의 정수 $C_1,C_2,\ldots,C_{N+2}$를 포함한다
* $N$ 개의 line이 따라온다. 각각 유효한 $i$에 대해, $i$ 번째 line은 빈 칸으로 분리된 $N$개의 정수 $D_i,_1,D_i,_2,\ldots,D_i,_N$을 포함한다
* $N$ 개의 추가적인 line들이 뒤따른다. 각각 유효한 $i$에 대해, $i$ 번째 line은 빈 칸으로 분리된 $M$개의 정수 $B_{i,1},B_{i,2},\ldots,B_{i,M}$을 포함한다 

---

## Output

* 첫번째 줄은, 빈 칸으로 분리된 두개의 정수 $X$와 $Y$($0 \leq X \leq N, 0 \leq Y \leq 2^{20}$)를 프린트하라
  * 각각의 의미는 당신이 뒤집어야 하는 튜브의 갯수와 당신이 수행하길 바라는 작업의 횟수이다
* 다음 줄은, 빈 칸으로 분리된 $X$개의 정수 $A_1,A_2,\ldots,A_X$를 프린트하라
  * 각각은 당신이 뒤집어야 하는 테스트 튜브의 번호이다 ( 유효한 $i$에 대해 $1 \leq A_i \leq N$을 만족) 
