---
layout  : wiki
title   : C++ 개발환경 구축하기 
summary : WSL 과 Windows Native 모두 
date    : 2022-02-23 00:45:05 +0900
updated : 2022-03-07 14:28:00 +0900
tag     : c++
toc     : true
public  : true
parent  : [[C-CPP-Category]] 
latex   : false
---
* TOC
{:toc}

# Visual Studio 로 C++ 콘솔 앱 프로젝트 만들기 (2022-02-23)

* 발췌 원본
  * [C++ 콘솔 앱 프로젝트 만들기](https://docs.microsoft.com/ko-kr/cpp/build/vscpp-step-1-create?view=msvc-170)
  * [C++ 콘솔 앱 프로젝트 빌드 및 실행](https://docs.microsoft.com/ko-kr/cpp/build/vscpp-step-2-build?view=msvc-170)

## 콘솔 앱 프로젝트 만들기

* Visula Studio 파일 메뉴 ▶ 새로 만들기 ▶ 프로젝트.. ( <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>N</kbd> )
  * 다음의 `새 프로젝트 만들기` 다이얼로그 열기에서 `콘솔 앱` 선택
    ![새 프로젝트 만들기](https://docs.microsoft.com/ko-kr/cpp/build/media/vs2019-choose-console-app.png?view=msvc-170)
* `새 프로젝트 구성` 다이얼로그에서 `프로젝트 이름`란에 *HelloWorld* 입력
  * 솔루션 이름도 자동으로 동일하게 지정됨
  * 솔루션과 프로젝트를 같은 directory 둘지 결정하는 옵션이 있음.
  * (궁금)솔루션은 프로젝트 메타데이터 인듯싶고 프로젝트에는 소스만 있는건가??
    ![새 프로젝트 구성](https://docs.microsoft.com/ko-kr/cpp/build/media/vs2019-configure-new-project-hello-world.png?view=msvc-170)
* 다음과 같이 새 프로젝트가 빌드및 실행할 준비가 됨
  * 코멘트로 표시되는 내용은 다음과 같음
    ```cpp
    // 프로그램 실행: <Ctrl+F5> 또는 [디버그] > [디버깅하지 않고 시작] 메뉴
    // 프로그램 디버그: <F5> 키 또는 [디버그] > [디버깅 시작] 메뉴

    // 시작을 위한 팁: 
    //   1. [솔루션 탐색기] 창을 사용하여 파일을 추가/관리합니다.
    //   2. [팀 탐색기] 창을 사용하여 소스 제어에 연결합니다.
    //   3. [출력] 창을 사용하여 빌드 출력 및 기타 메시지를 확인합니다.
    //   4. [오류 목록] 창을 사용하여 오류를 봅니다.
    //   5. [프로젝트] > [새 항목 추가]로 이동하여 새 코드 파일을 만들거나, [프로젝트] > [기존 항목 추가]로 이동하여 기존 코드 파일을 프로젝트에 추가합니다.
    //   6. 나중에 이 프로젝트를 다시 열려면 [파일] > [열기] > [프로젝트]로 이동하고 .sln 파일을 선택합니다.
    ```
  * VS IDE가 준비된 모습은 다음과 같다 
    ![VS Ready to build](https://docs.microsoft.com/ko-kr/cpp/build/media/vs2019-hello-world-code.png?view=msvc-170)
    
## 콘솔 앱 프로젝트 빌드 및 실행


* `빌드` 메뉴 ▶ `솔루션 빌드` ( <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>B</kbd> )
  * 출력창에서 빌드결과가 나옴 
  ![프로젝트 빌드하기](https://docs.microsoft.com/ko-kr/cpp/build/media/vscpp-build-solution.gif?view=msvc-170)
* `디버그` 메뉴 ▶ `디버그 하지 않고 시작` ( <kbd>Ctrl</kbd> + <kbd>F5</kbd> )
  ![디버그 하지 않고 시작](https://docs.microsoft.com/ko-kr/cpp/build/media/vscpp-start-without-debugging.gif?view=msvc-170)
  
## 더보기

* [간단한 콘솔용 계산기 앱을 만들어 보며 VS 환경 익히기, microsoft](https://docs.microsoft.com/ko-kr/cpp/get-started/tutorial-console-cpp?view=msvc-170)
  * 프로젝트 만들기, 간단한 계산기 앱 코딩, 디버깅 테스트, git 올리가까지 경험할 수 있다
  * VS 편의 기능을 적극적으로 이용하도록 구성되었다
* [좀 더 복잡한 데모 프로젝트, microsoft](https://devblogs.microsoft.com/cppblog/getting-started-with-visual-studio-for-c-and-cpp-development/)

### Visual Studio 환경설정

* [Visual Studio IDE 개인 설정, microsoft](https://docs.microsoft.com/ko-kr/visualstudio/ide/personalizing-the-visual-studio-ide?view=vs-2022)

# WSL C++ 개발환경 (2022-03-07)

* Linux 환경 : Ubuntu 20.04 LTS
  * Windows Terminal에서 Ubuntu-20.04 창 열기 ( <kbd>Ctrl</kbd>+<kbd>shift</kbd>+<kbd>6</kbd> )
  * cd ~/repository/CppProjects ( tab 자동완성을 활용하라 )
* 에디터 : VSCode with Remote-WSL plugin
  * 자세한 사항은 [Using C++ and WSL in VS Code](https://code.visualstudio.com/docs/cpp/config-wsl) 를 참조하라
  * VS Code 환경을 구축하고
  * 위의 `cd` 명령으로 `CppProjects`에 위치한 상태에서  `code .`를 입력 
* 의존성 주입 방법은?
* 빌드 방법은?
* 실행 방법은?
