---
layout  : wiki
title   : Total Commander 기본 사용법 
summary : 기본 설정 상태에서 사용할 수 있는 기능들 모음 
date    : 2022-04-30 00:36:15 +0900
updated : 2024-02-24 11:52:06 +0900
tag     : total-commander beyondcompare 
toc     : true
public  : true
parent  : [[TotalCommander-Category]] 
latex   : false
---
* TOC
{:toc}

# 단축키

* 자주 사용하는 Default 단축키
 
| Key                                                   | Action                                                       |
| :--:                                                  | :--                                                          |
| <kbd>F6</kbd>                                         | Rename for move files                                        |
| <kbd>F7</kbd>                                         | Create directory                                             |
| <kbd>TAB</kbd>                                        | Switch between left and right fle list                       |
| <kbd>Shift</kbd> + <kbd>Left</kbd>                    | TC상의 Command-line으로 Focus 이동                           |
| ^^ <kbd>Shift</kbd> + <kbd>Right</kbd>                | ^^ * 참조 : [Move to command line without mouse][Move2CL]    |
| <kbd>Ctrl</kbd> + <kbd>Left</kbd>                     | Cursor가 위치한 폴더의 내용을 다른쪽 창에서 보기             |
| ^^ <kbd>Ctrl</kbd> + <kbd>Right</kbd>                 | ^^                                                           |
| <kbd>Ctrl</kbd> + <kbd>Enter</kbd>                    | Cursor가 위치한 파일의 이름을 현재 cmd line 뒷쪽에 붙임      |
| ^^                                                    | ^^ 예제) `code` 치고 단축키 치면 파일이름이 들어옴           |
| ^^                                                    | ^^ 참조: TC 도움말에서 찾음                                  |
| <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>Enter</kbd> | Cursor가 위치한 파일의 경로+이름을 현재 cmd line 뒷쪽에 붙임 |

[Move2CL]: https://www.ghisler.ch/board/viewtopic.php?t=8210

# 도구 모음에 파일 비교도구 등록

## 등록 메뉴 진입 방법

* `도구 모음 바` 오른쪽 빈곳 우클릭후 `변경(C)...` 클릭

  ![totalcmd_button_bar.png](/wiki-img/2022/totalcmd_button_bar.png)
  * 도구 모음 변경 대화창 Open ( 수직 도구 모음 변경도 유사함)

## Beyond Compare 등록하기

* tags: #beyondcompare
* 다음과 같이 입력한다
  * 명령어 : `"C:\Program Files\Beyond Compare 4\BCompare.exe"` 입력
  * 매개변수 : %T%M %P%N
    * 위 매개변수 의미는 도움말 `Dialog box: Configuration - Change button bar`에 나옴
      * `%T` : inserts the current target path. Especially useful for packers. 
      * `%M` : places the current filename in the target directory into the command line
      * `%P` : causes the source path to be inserted into the command line, including a backslash (\) at the end.
      * `%N` : places the filename under the cursor into the command line, including a backslash (\) at the end. 
    * 위와 같이 설정한 후 비교할 때 ....
      * 왼쪽 리스트의 파일을 먼저클릭, 오른쪽 리스트파일을 두번째로 클릭한다음 비교버튼을 누르면 ..
      * Beyond Compare 또한 서로 같은 쪽에 비교대상을 보여주게 된다 
      * `%T%M` 과 `%P%N`의 위치를 바꾸면 서로 반대쪽에 비교대상이 나온다
      * 오른쪽 리스트를 먼저 클릭하고, 왼쪽 리스트를 두번째로 클릭해도서로 반대쪽에 비교대상이 나온다
  * 아이콘 파일 : `C:\Program Files\Beyond Compare 4\BCompare.exe`

# TC 설정 하기

* 참고 링크
  * [10년째 쓰고 있는 윈도우 탐색기 대체 프로그램 토탈 커맨더, 김효의 Page_Up 블로그](https://kim-expain.tistory.com/58)
* 파일형식별 색상설정
  * 색상 설정 메뉴 진입 : `환경설정 ▶ 화면 ▶ 색상 ▶ 파일 형식별 색상 정의(D)...`
  * 단일 확장자 형식에 각각 색상을 지정하는 것보다 같은 종류에 같은색을 설정하기위해 `파일 선택 규칙`을 정의하는게 좋다
  * 규칙 정의 진입 방법 : 

# 간단한 Tip

## Tip 1. TC가 설치되어 있는 위치 찾기

* 아래 메뉴중 맨 오른쪽 `Help` 메뉴아래 `About Total Commander` 클릭
  ![totalcmd_menu_bar.png](/wiki-img/2022/totalcmd_menu_bar.png)
  * 가장 아랫쪽에 `설정 파일` 위치와 `프로그램 파일` 위치가 나온다

## Tip 2. TC를 이용하여 File의 날짜 시간 바꾸기

- 스캔한 사진에 사진 찍은 날짜로 File 날짜 시간을 변경해주고 싶을때
- 메뉴바 : Files > Change Attributes... 클릭하면 아래와 비슷한 dialog box가 뜨는데..
    - ![Change Attributes Dialog](https://i.imgur.com/miZ7i3R.jpg)
    - 가운데 Change date/time 체크해주고
    - 날짜와 시간을 변경하고 OK해주면 된다

## Tip 3. TC의 현재 window position을 저장하기

- 참조링크 : [Save Position on exit not working](https://ghisler.ch/board/viewtopic.php?t=28449) 의 첫번째 답변
- 메뉴바 : Configuration > Save Position
    - ![Save Position menu](/wiki-img/2022/totalcmd_conf_savePosition.png) 
    - TC application의 windows 데스크탑상의 위치와 Size가 저장된다 
