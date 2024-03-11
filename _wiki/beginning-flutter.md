---
layout  : wiki
title   : 플러터 시작하기 
summary : Flutter 홈 페이지에서 튜토리얼 따라하기중..
date    : 2021-07-07 14:09:25 +0900
updated : 2022-05-18 14:55:54 +0900
tag     : flutter 
toc     : true
public  : true
parent  : [[Flutter-Category]] 
latex   : false
---
* TOC
{:toc}

# 1. 개요

* flutter 앱을 만들기 시작할 때 확인해야 하는 작업

# 2. 설치된 앱 확인

* 안드로이드 스튜디오 설치
* 플러터 SDK 설치
  * 내 메인 컴은 `d:/App/flutter/`에 설치 ( 2021-07-07에 확인)
  * 설치 여부 확인 방법 ( Powershell 환경 가정)
    ```sh
    > cd d:/App/flutter/bin
    > flutter doctor
    ```
* 안드로이드 스튜디오에 플러터와 다트 플러그인 설치
  * `[File ⇒ Setting ⇒ Plugins]`에서 `Flutter`와 `Dart` 플러그인이 설치되어있는지 확인

## 간단한 dart 코드 확인

* 간단한 dart 코드 실행 확인하는 사이트 : [dartpad](https://dartpad.dartlang.org/)

## flutter 업그레이드 하기

* 참조 링크: [Upgrading Flutter, docs.flutter.dev](https://docs.flutter.dev/development/tools/sdk/upgrading)
* 선택된 채널에 따라 버전이 다름 (stable, beta, master)
* `flutter channel stable` : stable 채널로 선택하기
  * 2022-05-18 현재 버전 3.0 배포중 
* `flutter upgrade` : 업그레이드 실행

# 3. Flutter 앱 개발 다시 시작하기

* 오랫만에 다시 개발을 재개할 경우 따라할 Step by Step
* [이 곳](https://flutter.dev/docs/get-started/install) 에 있는 `Get started` 를 기반으로 한다 

## Quick Re-start

* Editor, SDK, AVD 등 필요한 패키지가 모두 설치된 초기상태에서 시작한다
* [Create the app](https://flutter.dev/docs/get-started/test-drive?tab=androidstudio#create-app) : 신규 프로젝트 생성
  * `Run the app` : 앱 실행
  * 환경이 준비되었는지 확인하는 의미
* [Step 1: Create the starter Flutter app](https://flutter.dev/docs/get-started/codelab#step-1-create-the-starter-flutter-app)
  * 템플릿에서 `main.dart`만 변경한 것
  * 기본 구조를 파악한다
  * [Observations](https://flutter.dev/docs/get-started/codelab#observations)
    * 이 예제는 `Material app`을 생성하는 것 
    * root 폴더에서 `pubspec.yaml` 파일에 `uses-material-design: true`로 설정하면 Material 아이콘등을 사용할 수 있다 
    * Javascript와 같이 method 생성시 arrow(=>) notation을 사용할 수 있다
    * app이 StatelessWidget을 상속받는데 app 자체를 하나의 위젯으로 만든다
    * Scaffodle widget은 제목과 바디로 이루어진 간단한 앱의 빼대를 만드는 위젯이다
      * 내부 subtree는 복잡해질 수 있다 
    * 위젯의 주요 작업은 build() method를 호출하는 것으로
      * 하위 수준 위젯의 측면에서 위젯을 어떻게 display할지 묘사하는 것이 주요 작업이다
    * 이 위젯의 body는 `Center` 위젯으로 구성되는데
      * `Center`는 `Text` 자식 위젯을 포함한다.
      * `Center`는 자신의 subtree를 center에 위치시킨다
* [Step 2: Use an external package](https://flutter.dev/docs/get-started/codelab#step-2-use-an-external-package)
  * Step 1 에서 추가된 건 `english_words` 라는 외부 패키지를 사용해보는 것 
    * 외부 패키지 사용을 위해...
      * `import` 로 [pub.dev의 `englisht_words` 패키지](https://pub.dev/packages/english_words) 추가
        1. pubspec.yaml 의 `dependencies` 섹션에 추가
        2. `Pub get` 수행 : dependencies 설치 
        3. `lib/main.dart`에 import 추가
           ```dart
           import 'package:english_words/english_words.dart'
           ```
 * [Step 3: Add a Stateful widget](https://flutter.dev/docs/get-started/codelab#step-3-add-a-stateful-widget)
   * State*less* widgets 과 State*ful* widgets 의 차이점 원문에서 읽어볼것
   * StatefulWidget 구현시에 필요한 두가지
     1. `StatefulWidget` class 는 그 자체는 변경불가(immutable)하고 버리고 새로 만들수 있지만,..
     2. `State` class 는 widget의 수명주기 동안 유지된다
   * stateful widget의 boilerplate code를 자동 생성하는 keyword가 있다 (마치 emmet 처럼..)
     * `stful`의 typing을 시작하면 물어보는 창이 뜨는데 <kbd>Return</kbd>을 쳐준다
   * `RandomWords`를 widget의 이름으로 입력 한다 (그냥 번역)
     * `RandomWords` widget은 `State` class를 생성하는 것 외에 몇가지를 더 수행한다
     * `RandomWords`를 stateful widget의 이름으로 입력하면, 
       * 같이 따라가는 `State` class에 `_RandomWordsState`의 이름을 IDE가 자동적으로 넣어 완성해준다
       * 기본적으로, `State` class의 이름 앞에 underbar가 붙는다
       * 이름 앞의 underscore 는 Dart 언어에서 private 속성을 적용 ( enforces privacy) 을 의미하며
         * `State` objects의 best practice 로 추천된다 
    * 또한, IDE는 state class를 `State<RandowmWords>`로 부터 자동적으로 확장하는데,
      * `RandomWords` widget에 특화된 제네릭 `State` class 를 사용한다는 것을 가리킨다
      * 대부분의 앱의 logic은 이곳에 위치한다 - 그것은 `RandomWords` widget의 state를 관리한다
      * 이 class는 생성된 단어쌍들의 목록을 저장한다
        * 이 단어쌍의 목록은 사용자가 스크롤 할수록 무한히 커진다
      * 그리고 이 codelab의 파트2에서는
        * 사용자가 하트 아이콘을 토글해서 좋아하는 단어쌍을 추가하거나 제거합니다 
* [Step 4: Create an infinite scrolling ListView](https://flutter.dev/docs/get-started/codelab#step-4-create-an-infinite-scrolling-listview)
  * `_RandomWordsState`를 확장하여 단어쌍을 생성하고 display할 것이다
  * 사용자가 목록을 스크롤하면 ( `ListView` widget 으로 보인다 )

# [Write Your First Flutter App, part 2](https://codelabs.developers.google.com/codelabs/first-flutter-app-pt2#0)

## [4. Add icons to the list](https://codelabs.developers.google.com/codelabs/first-flutter-app-pt2#3)

* part 1을 했으면 여기서 부터 다시 시작
* `Set` type 을 처음 써봄. 사용자가 하트 표시한 WordPair 를 저장할 예정
  * 이 경우에는 `List` 보다 `Set` type 이 선호된다고 함
    * 이유는 `Set`이 중복을 허용하지 않기 때문임
    * 별다른 index를 관리하지 않으므로 `Set`에 저장하는 것만으로 중복금지가 구현되어 효율적인듯..
  * ListTile 결과에 하트 아이콘 붙이기 - 아직 탭은 안됨

## [5. Add interactivity](https://codelabs.developers.google.com/codelabs/first-flutter-app-pt2#4)

* 여기서는 하트 아이콘을 tappable 하도록 할 것임
* `ListTitle` 에서 onTap 파라미터 활성화 ▶ setState()를 호출
* Tip.
  * Flutter의 reactive style framework 에서
  * `setState()`를 호출하는 것은, `State` 객체에 대해 `build()` method 를 trigger 하는 것으로...
  * 결과적으로, UI를 업데이트 하도록 함

## [6. Navigate to a new screen](https://codelabs.developers.google.com/codelabs/first-flutter-app-pt2#5)

* 여기서는 (Flutter에서 *route* 라고 불리는) 새로운 페이지를 추가하여 하트 아이콘 설정한 것만 보여준다
  * 더불어서, *home route*와 *new route* 간을 어떻게 오가는지 배운다
* Flutter 에서는, `Navigator` 가 app의 route들을 보관하는 stack을 관리한다
  * `Navigator`의 stack 위로 route을 pushing 하면 해당 route로 display를 업데이트 한다
  * `Navigatoer`의 stack에서 route를 poping  하면 이전 route로 display가 전환 된다
* 다음으로, `_RamdomWordsState`의 `build` method의 `AppBar`에 list icon을 추가한다
  * 사용자가 이 list icon을 click하면, 
  * favorite 들이 저장된 새로운 route를 `Naviagro`에 pushing 하고 , icon을 보여준다
* Tip :
  * 어떤 widget 속성은 하나의 widget (child) 으로만 설정하지만
  * `action` 갈은 속성은 widget 의 배열 (children)으로 설정된다
* 다음으로, route를 하나만들어서 `Navigator`의 stack으로 push한다
  * 이 action은 스크린이 새로운 route를 display하도록 한다
  * 새로운 페이지의 내용은 `MaterialPageRoute`의 `builder` property 안에서 anonymous function으로 구성된다
* `Navigator.of` call에서 `context` argument란 무엇일까?
  * 아래 `BuildContext`에 대해 설명하는 video를 확인하라
    ![BuildContext?](https://youtu.be/rIaaH87z1-g)
    
    * widget 의 constructor를 호출하면
    * Flutter Frameworkd이 "createElement()" method를 호출
      * 이 method는 이 widget의 element를 frameworkd에 return
      * framework이 "build(context)" method를 호출하면, 이전에 생성돈 element가 context parameter의 argument로 전달됨
      * 이렇게 build() method 안에서 context(element object's) properties와 method를 사용할 수 있다 
    
* 다음으로, `MaterialPageRoute`와 builder를 추가할 것이다.
  * 일단 지금은, `ListTiel` 행을 생성하는 code를 추가한다
  * `ListTile`의 `divideTiles()` method 는 각 `ListTile`간에 수평 간격을 추가한다
  * `devided` 변수는 convenience function `toList()`를 이용해 list로 변환된 마지막 행을 hold한다.
  * (역자주) 여기에 추가된 코드를 나름대로 해석
    * _pushSaved()는 하트 아이콘 누를 때 동작하는 callback으로 설정됨
      * 하트 아이콘 누를 때 해야할 동작 = _pushSaved() 
        * _saved set iterable 각각에 대해 Tile 생성 
    * Navigator 는 Route (별도 페이지)를 저장할 수 있는 stack
      * Navigator.push는 stack에 Route(페이지)를 push 한다는 의미 
      * 그럼 push 내부에서는 Route 를 빌드하는 코드가 들어가야함
        * 그게 MaterialPageRoute<vod>()
          * 그 내부에서 Scaffold() 형식으로 반환 하는 builder를 파라메터로 넘겨줌
        * Scaffold 에서 파라미터로 사용하는 body를 ListView로 만들 때 list로 입력하므로
          * 최종결과인 divided는 toList()로 형식을 변환함
  *  코드상에 Navigator.pop 을 명시하지 않아도 back 버튼이 생김

## [7. Change the UI using themes](https://codelabs.developers.google.com/codelabs/first-flutter-app-pt2#6)

* 앱의 look and feel을 바꾸기 위해 theme을 customize 할 수 있다
  * `ThemeData` class를 건드려서 , app 의 default theme중 primary color만 'white'로 바꿔본다 

## [4. Build the main user interface](https://codelabs.developers.google.com/codelabs/flutter#3)

* 새로운 프로젝트 시작
* 👁‍🗨 시작코드 Observations 
  * 모든 Dart 프로그램은 `main()`으로 시작한다 
    * command-line app, AngularDart app, Flutter app 이건 상관없이...
  * `main()` 과 `runApp()` 함수 definitions은 자동 생성된 app에서와 동일함
  * `runApp()` 함수는 `Widget`을 argument로 취한다.
  * 이 chat app은 UI에서 Material Design elements를 사용한다
    * 그래서 `MaterialApp` 객체를 생성하고 `runApp()` 함수의 argument로 넘겨준다 
    * `MaterialApp` widget은 당신 app의 widget tree의 root가 된다
  * `home` argument는 당신의 app에서 사용자가 보는 default screen을 지정한다
    * 이 경우에, 그것은 `Scaffold` widget으로 구성되는데, (Scaffold는) child widget으로 간단한 `AppBar`를 포함한다
    * 이 것이 Materail app의 전형적인 모습이다
* `Run` icon으로 실행시키면, 처음에는 오래걸리지만 다음번 부터는 빨라질 것이다
  * Hot restart와 Full restart가 있다. 상세내용은 원문 확인

### Build the chat screen

* interactive components의 기초를 다지기 위해, 앱을 두 개의 서로 다른 subclass로 분리한다
  * root-level `FriendlyChatapp` widget : 절대 안바뀐다 
  * a child `ChatScreen` widget : 메시지가 전달되거나 내부 상태가 변하면 rebuild 된다
* 지금은, 위 두 classes를 `StatelessWidget`에서 확장해도 된다.
  * 나중에, `ChatScreen` 을 *stateful* widget으로 변경하게 된다.
  * 이런식으로, 필요한 때에 widget의 state를 변경할 수 있다
* ▶ 표시가 있는 직접 해보기에서 Android Studio Editor의 자동 제안 사용하는 방법 배움
* Tip : 에서 코드 창 오른쪽 클릭하면 나오는 Context menu에서 `Reformat with dartfmt` 사용법 배움
* 👁‍🗨 Observations 
  * 이번 step 는 Flutter framework의 몇가지 key concepts에 대해 소개함
  * `build()` method에서 widget으로 표시되는 user interface의 일부를 describe 했다.
    * frameworkd은 `FriendlyChatApp`왜 `ChatScreen`의 `build()` method를 호출하면서,
    * 이 widget들을 widget hierarchy에 넣었고 그들의 dependencies가 변경되었다
  * `@override`는 Dart annotation 인데, 
    * 이것으로 tagging된 method가 superclass의 method를 override 한다는 의미이다
  * `Scaffold`나 `AppBar` 같은 일부 widget들은, `Material Design` apps에 specific 한 것들이다
    * `Text`같은 다른 widgets은 일반적인 것들이며, 어느 app에서나 사용할 수 있다
    * Flutter frameworkd의 다른 library들로 부터온 widget들 도 한 개의 app에서 호환하여 쓸 수 있다
  * hot reload가 `main()`을 다시 실행하지 않기 때문에 , `main()` method를 간소화하여 hot reload를 enable 시킨다
* hot reload ⚡버튼을 click하여 즉시 변화하는 것을 보자
  * UI를 class들로 분리한 후 root widget을 변경해도 UI에서는 visible change가 안보일 것이다
  * Tip: 
    * hot reload이후 red screen을 보게 되면, hot restart를 시도하라
    * 그래도 문제가 해결되지 않으면, 
      * app을 멈추고, full restarte를 수행하라
    * hot reload는 existing widgest들의 state를 변경한당
      * 예를들어 hot reload전에 widget을 지운다면 , red screen이 발생할 수 있다
      * frameworkd이 그런 older widgets를 업데이트 하려고 시도할때 app이 fail 날 수 있다

## [5. Add a UI for composing messages](https://codelabs.developers.google.com/codelabs/flutter#4)

* device에서 text field에 들어가면 soft keyboard가 뜬다
  * 비어있지 않은 창에 chat messages type하고 Return key를 치거나
  * graphical Send button 으로 
* chat screen을 일단 위쪽에 만들거지만, 나중에 아래쪽으로 옮길것이다

### Add an interactive text input field

* Flutter framework 는 `TextField`라고 불리는 *Material Design widget` 을 제공한다
  * 이것은 mutable state를 갖는 `StatefulWidget`으로 input field의 동작을 customizing하는 속성을 가진다
  * `State`는 widget이 빌드될 때 synchronous하게 읽을 수 있고 widget의 수명중에 변경될 수 있는 정보이다
  * FriendlyChat app에 첫번째 stateful widget을 추가하기 위해 몇가지 modifications이 필요하다
    * `ChatScreen` class 를 statefule하게 변경하기
      * 선택후 <kbd>Alt</kbd>+<kbd>Enter</kbd>로 메뉴 불러와서 `Convert to StatefulWidget`으로 선택하여 변경하기 
      * Tip : identifier에 underscore(_)를 붙여서 library 상에서 identifier를 private 하게 만든다.
        * Dart library는 일련의 calsses, constants, functions, typedefs, properties, exceptions를 one package에 담았다
        * Dart compiler가 privacy를 강제한다.
        * 더 자세한 사항은 dart.dev 사이트의 [Libraries and visibility](https://dart.dev/guides/language/language-tour#libraries-and-visibility)를 참고하자
    * `_ChatScreenState`에 `TextEditingController` 추가하기
      * Tip : Flutter framework API의 소스 코드 definition을 보는 것이 뒤편에서 무슨 일이 일어나는지 이해하는데 유용할것이다
        * 이것은 쉽게 할수있는데... 에디터 창에서 class나 method name 을 select하고..
          * 오른쪽 클릭해서 `Go to... Declaration`을 메뉴에서 선택한다
          * OS에 따라, `Command`키나 `Control` 버튼을 클릭할수도 있다.
          * [more options and keyboard shortcuts](https://flutter.dev/docs/development/tools/android-studio#keyboard-shortcuts)를 참조하자
  * 이제 app이 state를 관리할 수 있는 능력이 생겼기에, `_ChatScreenState` class 에 input field 와 send button을 넣으면 된다
    * `_ChatScreenState`에 `_buildTextComposer` function 을 추가한다 
    * 👁‍🗨 Observations 
      * Flutter에서는, widget의 stateful data는 `State` 객체에 encapsulated 된다
        * `State` objects는 그리고 나서 `StatefulWidget` class를 확장한 widget가 associated 된다
      * 위 코드는 `_buildTextComposer()`라 불리는 private method를 정의하는데 
        * 이 method는 설정이 적용된(configured) `TextField` widget을 탑재한 `Container` widget을 return 한다
      * `Container` widget에는 screen의 edge와 input field의 각 side간의 horizontal margin 설정이 추가된다
      * `EdgeInsets.symmetric`에 전달된 단위(units)는 , 
        * device의 pixel ratio에 의존적인, 특정 숫자의 physcical pixels로 번역된 logical pixels 이다
        * 당신은 아마도 Android 용어(density-independet pixels1)나 iOS의 용어(points)에 익숙할 것이다
      * `onSubmitted` 속성은 private callback method,`_handleSubmitted()`를 제공한다. 
        * 처음에 이 method는 단지 field 를 clear 하는 기능만 있지만,
        * 나중에 chat message를 send하는 기능을 추가할 것이다
      * `TextEditingController`의 `TextField`는 text field에 대한 관리기능을 제공한다.
        * 이 controller는 field를 clear 하고 값을 읽어온다 
          
          
### Add a text composer widget

* 👁‍🗨 Observations 
  * `_buildTextComposer` method는 text input field를 encapsulates 하는 widget을 return 한다
  * `body` 속성에 `_buildTextComposer`를 추가하여 app이 text input하는 user control을 보여주도록 한다

### Add a responsive Send button

* 코드작성> `_buildTextComposer` 함수 내에서, `Row:` 내부에 `TextField`를 넣는다
* 코드작성> `TextField`를 `Flexible` widget으로 감싼다
  * 여기서 <kbd>Alt</kbd>+<kbd>Enter</kbd>를 눌러 **Wrap with widget** 자동완성을 이용해본다
* 👁‍🗨 Observations 
  * `Row`를 이용하여 **Send** 버튼을 input field에 가까이 둘 수 있게 한다
  * `TextField`를 `Flexible` widget으로 감싸는 것은 
    * `Row`가 text field의 size를 자동조절하여
    * 버튼에 의해 사용되지 않는 남은 공간을 사용하도록 `Row`에게 알려준다 
  * 오른쪽 bracket 다음에 comma를 추가하여 fommatter가 어떻게 code를 format할 지 알려준다
* 다음으로, **Send** 버튼을 추가한다.
  * 이 것은 Material app이므로, 대응되는 Material icon ▶ 을 사용한다 
  * Tip: 표준 Material Design icon의 목록은 
    * [Material Icons](https://fonts.google.com/icons?selected=Material+Icons) 사이트와 [Icons class](https://api.flutter.dev/flutter/material/Icons-class.html) 의 상수값들을 참고한다
* 코드작성> `Row`에 **Send** 버튼을 추가한다
  * 👁‍🗨 Observations 
    * `IconButton` 이 **Send** 버튼을 display 한다
    * `icon` 속성이 Material library로 부터 `Icons.send` 상수를 지정하여, 새로운 `Icon` 인스턴스를 생성한다
    * `Container` widget 안에 `IconButton`을 위치시켜서 버튼의 margin spacing을 조절할수 있게 한다
      * 이렇게 하면 당신의 input field 옆에서 좀더 visually fit 해보인다
    * `onPressed` 속성은 익명함수를 사용하여 `_handleSubmitted()` method를 호출하공
      * `_textController`를 이용하여 message 내용을 넘긴다
    * Dart 에서, arrow 문법 ( => 표현식) 은 때때로 함수를 선언하는데 사용된다
      * 이것은 `{ return expression; }` 의 단축 표현으로 오직 one-line 함수에만 사용된다
      * 익명과 중첩 함수를 포함하여 Dart 함수 지원에대한 개요를 보려면, [Dart Langauge Tour](https://dart.dev/guides/language/language-tour)를 참고하라
* 버튼의 컬러는 black인데, 이것은 default Material esign theme에서 왔다.
  * app에 accent 컬러를 주기위해서, `IconButton`에 color argument를 pass하거나, 다른 theme을 적용해라
* 코드작성 > `_buildTextComposer()`에서, `Container`를 `IconTheme`으로 감싸라
  * 👁‍🗨 Observations 
    * Icons는, `IconTheme`으로부터 color,opacity,size를 상속받는데, 
      * (IconTheme widget은) 이런 chracteristics를 정의하기 위해 `IconThemeData` 객체를 이용한다
    * `IconThemes`의 `data` 속성은 현재 them의 `ThemeData` 객체를 지정한다
      * 이것은 버튼(과 widget tree의 모든 다른 icon들)에 현재 theme의 accent color를 준다 
    * `BuildContext` 객체는 app의 widget tree의 한 widget의 lcoation에 대한 handle 이다
      * 각각의 widget은 자신만의  `BuildContext`를 가지는데, 
        * (BuildContext 가) `StatelessWidget.build`나 `State.build` 에 의해 return된 widget의 parent가 된다 
      * 이것은 `_buildTextComposer()`가, 그것의 encapsulating `state`로 부터 `BuildContext` 객체에 access할 수 있다는 것을 의미한다
      * 때문에, context 를 method에 명시적으로 넘겨줄 필요가 없다

## [6. Debug your app](https://codelabs.developers.google.com/codelabs/flutter#5)

* app을 debug 하기 위한 몇가지 방법이 있다
* IDE에서 바로 breakpoints를 설정할 수도 있지만,
  * [Dart DevToos](https://flutter.dev/docs/development/tools/devtools/overview) 를 사용할 수도 있다 (Chrome DevTools과 헷갈리지 말자)
* 이번 codelab은 Android Studio와 IntelliJ를 이용해 어떻게 breakpoint를 잡는지 보여준다
* VS Code 같은 다른 editor를 사용한다면 DevTools로 debugging 해라
* Dart DevTools에 대한 친절한 소개를 원한다면, [Write your first Flutter app on the web의 Step 2.5](https://flutter.dev/docs/get-started/codelab-web#step-25-launch-dart-devtools)를 참조하라
* Anddroid Studio와 IntelliJ IDE로 emulator, simulator, device 에서 실행중인 app을 디버깅할 수 있다
* 이 에디터로 아래 일들을 할수 있다:
  * 앱을 디버깅할 device나 simulator 선택하기
  * console message 보기
  * breakpoint 설정하기
  * 실행시간에 변수를 조사하거나 표현식을 평가하기(evaluate expressions)
* Tip: 디버깅을 좀더 공부하려면 [Debugging Flutter apps](https://flutter.dev/docs/testing/debugging) 를 참조하라
* Android Studio와 IntelliJ 에디터는 앱이 실행중일때 system log를 보여주고,
  * breakpoint를 설정하고 execution flow를 조정할 수 있도록 Debugger UI를 제공한다

### Work with breakpoints

* 코드작성 > breakpoint로 Flutter app 디버깅하기
  * 간단하게 breakpoint 잡고 멈춰보는 것 까지만 실습

## [7. Add a UI for displaying messages](https://codelabs.developers.google.com/codelabs/flutter#6)

* 기본 app scaffolding과 화면이 준비되었다. 이제 chat message를 보여줄 영역을 정의한다

### chat message 목록을 구현한다

* 이번 section에서는, (여러개의 작은 widget을 생성하고 조합하는 방식인) composition으로 chat message를 보여주는 widget을 만든다
* 한 개의 chat message를 보여주는 widget 부터 시작한다
  * 그 다음, 이 widget을 중첩하여 부모 scrollable list로 넣는다
  * 마지막으로, 이 scrollable list를 기본 app scaffold에 넣는다
* 코드작성 > `ChatMessage` stateless widget을 추가한다: 
* 코드작성 > `Row`를 `ChatMessage`의 `build()` method에 추가 한다:
  * 이 시점에서 분석기는 정의안된  `_name`만 불평해야 한다. 바로 고쳐본다
  * 코드작성 > `_name` 변수를 정의한다
    * 각 chat message를 보낸이의 이름으로 label 하려는 목적이다 
    * 보통 사용자의 이름은 atehntication을 통해 가져오지만   
    * 간단한 테스트 앱 작성을 위해 hard-code한다 
* 👁‍🗨 Observations 
  * `ChatMessage`의 `build()` method는 `Row` widget을 return 하는데
    * `Row` widget은 간단한 graphical 아바타를 보여줘서 누가 chat message를 보냈는지 알려준다 
    * `Column` widget은 보낸사람 이름과, text message를 가진다
  * `CircleAvatar`는 사용자의 첫번째 이니셜로 구분이 되도록 한다
    * 이를 위해, `_name` 변수의 첫번째 character를 child `Text` widget 으로 전달한다
  * `crossAxisAlignment` 파라미터는 `Row` constructor 안에서 `CrossAxisAlignment.start`로 지정한다
    * 아바타와 message를 부모 widget과 상대적인 위치에 놓기 위함이다
    * 아바타의 부모 widget은 `Row` 이고 main axis가 horizontal 이라서
      * `CrossAxisAlignment.start`는 수직축을 따라 가장 높은 위치로 설정한다
    * message의 경우 부모 widget은 `Column` 이고 main axis가 vertical 인데
      * `CrossAxisAlignment.start`는 수평축을 따라 가장 왼쪽 위치로 설정한다
  * 아바타 다음에, 두 개의 `Text` widget이 수직으로 정렬되어 있어서
    * 위쪽은 보낸사람 이름, 아랫쪽은 text message가 위치한다
  * `Theme.of(context)` 는 해당 앱의 기본 flutter `ThemeData`객체를 제공한다
    * 나중에 나오는 step에서, Android 와 iOS에서 다르게 앱을 스타일링한다
  * `ThemeData`의 `textTheme` 속성은 `headline4`와 같은, text를 위한 Material Design logical 스타일 에 대한 access를 제공한다
    * 이 때문에, font size나 다른 text 속성을 hard-coding 하는 일을 피할 수 있다
    * 이 예제에서는, 보낸사람 이름을 message text보다 크게 설정했다

### UI에 chat message 목록을 구현한다

* 다음 refinement는 chat messages의 목록으 가져와서 UI에 보여주는 것이다
* 사용자가 메세지 이력을 볼수 있도록 이 목록을 scrollable 하도록 만들고 싶을것이다
* 이 목록은 또한 메시지를 시간순으로 표시되어야 한다
  * 또한 가장 최근 메시지가 보여지는 목록중 가장 아랫쪽에 배치되어야 한다 
* 코드작성 > `_messages` list를 `_ChatScreenState`에 추가한다    
* 코드작성 > `_ChatScreenState`의 `_handleSubmitted()` method를 변경한다
* 코드작성 > 내용 전달이후 포커스를 text field로 다시 가져오기 구현
* 👁‍🗨 Observations 
  * 목록의 각 item은 `ChatMessage` instance 이다
  * 목록은 empty 상태로 초기화된다
  * `_messages`를 변경하기 위해 `setState()`를 호출하면, widget tree의 이 부분이 바뀌었다는 것을 framework가 알게된다
    * 그래서 framework은 UI를 rebuild 할 필요가 있게된다
    * `setState()`에서는 동기적인(synchronous) operations만 수행되어야 하는데, 
      * 그렇지않으면 framework이 operation이 끝나기전에 widget들을 rebuild할 수 있기 때문이다
    * State 객체의 internal state에 많은 변경을 더할때, 
      * 모든 변경을 한 번의 `setState()` 호출에 결합하는것이 좀더 일반적인 사용법이라 할 수있다.
  * 일반적으로, `setState()` 호출의 outside에서 일부 private data를 변경한 후에
    * `setState()`를 empty closure와 함께 호출하는 것이 가능하다
    * 하지만, `setState`의 closure내부에서 데이타를 업데이트하는 것이 선호되는데, 
      * 이렇게 함으로써, 이후에 이것을 호출해야하는 것을 잊지 않을 것이다

### message list를 위치 시키다

* 당신은 이제 chat message 목록을 보여줄 준비가 다 되었다.
* `ChatMessage` widget에서 `_messages` list를 가져와서, `ListView` widget에 넣고 scrollable list로 만들자
* 코드작성 >`_ChatScreenState`의  `build()` method 안에서, `Column` 안에 `ListView`를 추가하라 
* 👁‍🗨 Observations
  * `ListView.builder` factory method는, list의 item당 한 번식 호출되는 함수를 제공하여 on demand로 list를 빌드한다 
    * 그 함수는 호출때 마다 새로운 widget을 반환한다
    * builder 또한 자동으로 그 `children` parameter의 mutation을 감지하고 rebuild를 시작한다
  * `ListView.builder` 생성자로 넘어가는 parameter들은 list 내용과 외관을 customize한다
  * `padding`은 message text 주변에 공백을 생성한다
  * `itemCount`는 list내에서 메시지 숫자를 특정한다
  * `itemBuilder`는 `[index]`내의 각 widget을 build하는 함수를 제공한다.
    * 현재의 build context가 필요하지는 않기 때문에, `IndexedWidgetBuilder`의 첫번째 argument는 무시해도 된다
    * 해당 argument를 underscore(_)만으로 naming하는 것은 해당 argument가 사용되지 않을것을 가리키는 convention이다 
  * `Scaffold` widget의 `body` 속성은 , 이제 input field와 **Send** 버튼 뿐만아니라 incoming 메시지의 목록또한 포함한다
    * layout은 아래의 widget들을 포함한다 
      
  * `Column` : 직계 childrent을 수직적으로 배치한다. `Column` 위젯은 (`Row`와 마찬가지로) child widgets의 목록을 가져오는데
    * (child widget)은 scrolling list와 input field의 한 줄이 된다
  * `ListView`의 부모로서의 `Flexible` : framework에게 말해서, 받은 메시지들로 `Column`을 채운다. 이때 `TextField`는 고정 사이즈를 유지한다
  * `Divider` : 메시지를 표시된 UI 와 메시지를 작성하는 text input들 사이에 수평선을 그린다
  * text composer의 부모로서의 `Container` : 배경 이미지, padding, margins등 다른 여러 레이아웃을 정의한다
  * `decoration` : 배경 color를 정의하는 새로운 `BoxDecoration` 객체를 생성한다. 
    * 이 경우에는 기본 theme의 `ThemeData` 객체에의해 정의되는 `cardColor`를 사용했다
    * 이것은 메시지를 작성하는 UI에 메시지 리스트와 다른 배경을 제공한다 
 
## [8. Animate your app](https://codelabs.developers.google.com/codelabs/flutter#7)
 
 * 앱에 대한 사용자 경험이 유연하고 직관적으로 만들기 위해 widget에 애니메이션을 추가할 수 있다.
   * 이 section에서 채팅 메시지 목록에 기본적인 애니메이션 효과를 추가하는 방법을 배운다
 * 새로운 chat 메시지를 보낼때 , 단순히 메시지를 보여주는 대신, 메시지목록을 바닥에서 위쪽으로 천천히 움직이도록 해보자
 * Flutter 에서의 애니메이션은, typed value와 status(예를 들면 다음과 같은 forward, reverse, cpmpleted, and dismissed) 포함한  `Animation` 객체에 encapsulated 되어있다
   * 당신은 widget에 애니메이션 객체를 붙이거나 애니메이션 객체에 대한 변경을 관찰할수도 있다
   * 애니메이션 객체에 대한 변경을 기반하여, framework은 widget이 보이는 외관을 바꿀수있고 widget tree를 rebuild할 수 있다

### 애니메이션 controller를 지정한다

* 애니메이션이 어떻게 동작해야하는지 지정하기 위해 `AnimationController` class를 사용한다.
* `AnimationController`는 애니메이션의 중요한 특성, 플레이 시간이나 플레이 방향(forward 나 reverse0등을 정의할수 있도록 해준다
* 코드작성 > `_ChatScreenSate` class 정의를 업데이트하여 `TickerProviderStateMixin`을 포함시킨다
* 코드작성 > `ChatMessage` class 정의 안에 animation controller를 저장할 변수를 추가한다
* 코드작성 > `_handleSubmitted()` method에 animation controller를 추가한다
* 👁‍🗨 Observations
  * `AnimationController`가 애니메이션의 runtime duration을 700 milliseconds로 지정했다
    * 이렇게 긴 duration은 animation effect를 충분히 느리게 만들어서 애니메이션이 변화하는 과정을 관찰할수있게 해준다.
    * 앱에 실제 적용할 때는 좀더 짧게 해야할 것이다
  * animation controller가 새로운 `ChatMessage` instance에 부착되어서, 메시지가 chat list에 추가될 때마다 `play forward`로 동작하도록 설정되었다
  * `AnimationController`를 생성할 때, `vsync` argument를 넘겨줘야 한다.
    * `vsync`는 애니메이션을 앞쪽으로 진행하도록하는 heartbeats( the `Ticker`)의 소스이다
    * 이 예제는 `_ChatScreenState`를 `vsync`로 사용해서, `_ChatScreenState` class 정의에 `TickerProviderStateMixin` 믹스인을 추가한다
  * 다트에서, mixin은 class body가 multiple class hierarchies에서 재사용되도록 허용한다.
    * 더 자세한 정보는 [Adding features to a class: mixins](https://dart.dev/guides/language/language-tour#adding-features-to-a-class-mixins) 을 참고한다

### Size Transition widget을 추가한다

* 텍스트가 미끌어져 입력될 때 점차적으로 노출되도록하는 `ClipRect`에 애니메이션 효과를 주도록  `SizeTransition` widget을 추가한다
* 코드작성 > `ChatMessage`의 `build()` method에 `SizeTransition` widget을 추가한다
* 👁‍🗨 Observations
  * `SizeTransition` class와 합체된 `CurvedAnimation` 객체는 ease-out(천천히 움직이는?) 애니메이션 효과를 나타낸다
    * ease-out 효과로 인해 메시지는 애니메이션 초기에 빠르게 slide up 되어다가 멈출때까지 slow down 된다
  * `SizeTransition` widget은 텍스트가 slide in 할때 좀 더 텍스트를 노출해주는 `ClipRect` 애니메이팅하는 동작을 한다
* Tip
  * 만약에 hot reload로 앱을 동작시키면 , red screen을 보게 될 것이다.
  * 왜그럴까? hot reload는 당신의 앱의 state를 저장한다.
  * 이 경우에 , 만약 당신이 기존 chat message 목록에 조금이라 메시지를 입력했다면, 이 메시지가 저장되었다는 것을 의미한다 
  * hot reload가 앱을 업데이트 하려할 경우, 앞선 목록에 소급적으로 애니메이션을 콘트롤러가 적용되지 않기 때문에 , crash가 난 것이다
  * hot restart가 이 문제를 해결할 수 있다.

### 애니메이션의 폐기

* 애니메이션 controller를 폐기해보는 것은 , 사용하던 리소스를 더 이상 사용하지 않을때 놓아주는 , 좋은 연습이 된다
* 코드작성 > `_ChatScreenState`에 `dispose()` method를 추가한다
* 애니메이션으로 좀더 실험해보고 싶다면, 시도해볼 몇가지 아이디어를 추천한다
  * `_handleSubmitted()`의 `duration` 값을 변경하여 애니메이션을 speed up 하거나 slow donw 해보라  
  * `Curves` class에 정의된 상수를 이용하여 다른 animation curve를 테스트 해봐라
  * `SizeTransition` 대신 `FadeTransition` widget으로 `Container`에서 fade-in animation 효과를 테스트 해봐라

## [9. Apply finishing touches](https://codelabs.developers.google.com/codelabs/flutter#8)

* 이번 optional step에서는, 몇가지 복잡한 디테일을 추가한단
* 예를들면 보낼 텍스트가 있는 경우에만 **Send** 버튼을 enable하거나
* 긴 메시지를 wrapping 하거나
* 안드로이드나 iOS에 특화한 native-looking UI를 구현하는 것이다 
  
### send 버튼을 context-aware 하도록 만들기

* 현재 보낼 텍스트가 없더라도 **Send 버튼** 이 enable 되어있다.
* 보낼 텍스트 존재하는지 여부에 따라 send 버튼의 모양이 바꾸고 싶을수 있다
* 코드작성 > `_isComposing` private 변수를 추가하여 input field에서 사용자 타이핑할 때 true로 설정하도록 한다
* 코드작성 > `_ChatScreenState`에 `onChanged()` 콜백 method를 추가한다
* 코드작성 > `_ChatScreenState`에서 `onPressed()` 콜백 method를 업데이트한다
* 코드작성 > `_handleSubmitted`를 수정하여 텍스트 필드가 비었을 경우 `_isComposing`을 false로 설정한다
* 👁‍🗨 Observations
  * `onChanged` 콜백이 `TextField`에게 사용자가 텍스트를 수정했다가 알려준다.
    * `TextField`는 필드의 현재 값에서 값이 변경될 때마다 이 method를 호출한다
  * `onChanged` 콜백은 `setState()`를 호출하여  필드에 텍스트가 존재한다면 `_isComposing`을 true로 변경한다
  * `_isComposing`이 false 일때, `onPressed` 속성이 `null`로 설정된다
  * `onSubmitted` 속성 또한 메시지 리스트에 빈 문자열을 추가하지 않도록 수정된다
  * 사용자가 텍스트 필드에 문자열을 입력하면 `_isComposing`이 `true`가 된다.
    * 사용자가 **Send** 버튼을 누르면 framework이 `_handleSubmitted()`를 invoke 한다
  * 사용자 텍스트 필드에 입력하지 않으면, `_isComposing`은 `false`이고 
    * 그 widget의 `onPressed` 속성은 `null`로 설정되어, **Send** 버튼은 비활성화된다.
    * frameworkd이 자동적으로 버튼 color를 `Theme.of(context).disabledColor`로 변경한다

### 긴 문자열 줄 바꾸기 (wrap)

* UI가 표현하기에는 긴 문자열을 사용자가 입력할 때, 모든 입력된 메시지를 보이기 위해 줄 바꿈이 필요하다
* 현재는 넘치는 문자열을 잘리면서, visual overflow 에러가 나타난다.
* 줄 바꿈이 되도록하는 간단한 방법은 문자열을 `Expande` widget에 넣는 방법이다
* 코드작성 > `Column` widget은 `Expanded` widget 으로 감싼다
* 👁‍🗨 Observations
  * `Expanded` widget은 자식 widget 에게 layout constraints를 가할 수 있는데... 
    * 이 경우에는 `Column`의 width 에 제한을 가한다.
    * 여기서, 보통 콘텐츠에 의해 결정되는  `Text` widget의 width에 대해 제한하고 있다

### Android 와 iOS 용으로 커스터마이즈

* 당신의 앱에 자연스러운 look & feel을 주기위해, 
  * theme의 추가하고 `FriendlyChatApp` class의 `build()` method에 간단한 로직을 추가할 수 있다 
* 이번 step 에서, 다른 primary와 accent 컬러 세트를 적용하는 platform theme을 하나 정의한다
* 또한 **Send** 버튼에 대해서 
  * 안드로이드에서 Material Design의 `IconButton`을,
  * iOS에서는 `CupertinoButton` 을 사용한다 
* 코드작성 > 아래 코드를 `main.dart` 의 `main()` method 아래에 추가한다
* 👁‍🗨 Observations
  * `kDefaultTheme ThemeData` 객체는 안드로이드용 컬러(purple with orange accents) 를 지정한다 
  * `kIOSTheme ThemeData` 객체는 iOS용 컬러(light grey with orange accents) 를 지정한다
* 코드작성 > `FriendlyChatApp` class 에서  `MaterialApp` widget의 `theme` 속성을 이용하여 theme을 변경한다
* 코드작성 > `AppBar` widget 의 theme을 modify한다 ( 당신 app UI의 top에 있는 banner) 
* 👁‍🗨 Observations
  * top-level `defaultTargetPlatform` 속성과 **conditional operatiors** 가 theme 을 선택하기 위해 사용되었다
  * `elevation` 속성은 `AppBar`의 z-coordinate을 정의한다
  * `4.0`의 z-coordinate 값은 정의된 shadow (Android) 를 가지며, `0.0` 값(iOS)은 shadow가 없다
* 코드작성 > send icon을 Android와 iOS 용으로 customize 한다
* 코드작성 > `Container` widget내의 top-level `Column`을 감싸고, 윗쪽 edge에 light grey border 효과를 준다
  * 이 border는 iOS에서, app bar를 app과 비주얼적으로 구분하는데 도움을 준다  

## [10. Next steps](https://codelabs.developers.google.com/codelabs/flutter#9)

* **Congratulations!** 당신은 이제 Flutter framework으로 cross-platform mobile app을 구축하는 기본을 알게 되었다
* **What we covered**
  * 바닥에서 부터 Flutter app을 만드는 방법 
  * Android Studio 와 IntelliJ 에서 사용할 수 있는 단축키 사용법
  * 당신의 Flutter app을, 에뮬레이터, 시뮬레이터, 실제 디바이스에서 실행하고, hot reload하고, 디버그하는 방법
  * 인터페이스를 widget과 animation으로 customize하는 방법
  * Android와 iOS에 대해 사용자 interface를 customize하는 방법
* **What's next**
  * 다른 [Flutter codelabs](https://docs.flutter.dev/codelabs) 을 시도해봐라
  * Material compnents로 앱을 만드는 것에 대해 흥미가있나요?
  * 5-part Material components(MDC) 코드랩 시리즈로 쇼핑앱을 만들면서 좀더 배워보세요
    * [MDC-101 Flutter: Material Components(MDC) Bascics](https://codelabs.developers.google.com/codelabs/mdc-101-flutter#0) 로 시작하세요
  * Flutter에 대해 계속 배우세요
    * [flutter.dev](https://flutter.dev/) : Flutter project 문서 사이트
    * The [Flutter cookbook](https://docs.flutter.dev/cookbook)
    * The [Flutter API reference](https://api.flutter.dev/index.html) documentation
    * 추가적인 [Flutter sample apps](https://flutter.github.io/samples/#) 과 source code
  * 키보드 단축키에 대한 정보
    * [Flutter - 빠른 개발위한 IDE 단축키](https://medium.com/flutter-community/flutter-ide-shortcuts-for-faster-development-2ef45c51085b#df6e), Pooja Bhaumik 작성 
    * [Flutter: 내가 좋아하는 단축키](https://medium.com/coding-with-flutter/flutter-my-favourite-keyboard-shortcuts-63f6474afc8c), Andrea Bizzotto 작성

## [11. Optional: Get the sample code](https://codelabs.developers.google.com/codelabs/flutter#10)

* 샘플을 레퍼런스로 보고거나 코드랩의 특정 section부터 시작하고 싶어서 샘플 코드를 다운로드 받고 싶을수 있다
* 코드랩의 샘플코드를 다운받으려면 터미널에서 아래 명령을 입력하라
  ```sh
  > git clone https://github.com/flutter/codelabs
  ```
* 이 코드랩의 샘플 코드는 `friendly_chat` 폴더에 있다.
  * 각각 번호가 붙혀진 단계별폴더에는 각 단계의 최종 코드를 볼 수있다.
  * 각 단계별 어느 코드라도 `lib/main.dart`에서 가져와서 [`DartPad instance`](https://dartpad.dev/?null_safety=true)에 넣고 실행시켜볼 수있다

# TroubleShooting

## Flutter Doctor Fail

* Android Studio를 Bumblebee로 업데이트 했더니 다음과 같이 에러가 날 경우
  * 얼마전에 Windows 11으로 업데이트 했다가 다시 Windows 10으로 복구했을때 초기화 되었을 수 있다.. 

```
>flutter doctor
Doctor summary (to see all details, run flutter doctor -v):
[√] Flutter (Channel beta, 2.3.0-24.1.pre, on Microsoft Windows [Version 10.0.19044.1466], locale ko-KR)
[!] Android toolchain - develop for Android devices (Android SDK version 30.0.0)
    X cmdline-tools component is missing
      Run `path/to/sdkmanager --install "cmdline-tools;latest"`
      See https://developer.android.com/studio/command-line for more details.
    X Android license status unknown.
      Run `flutter doctor --android-licenses` to accept the SDK licenses.
      See https://flutter.dev/docs/get-started/install/windows#android-setup for more details.
[√] Chrome - develop for the web
[√] Android Studio (version 4.2.0)
[√] Connected device (2 available)

! Doctor found issues in 1 category.
```

### 해결책

* 안드로이드 스튜디오를 설치했을경우 , Tools ▶ (중간쯤) SDK Manager ▶ (대화창 가운데탭) SDK Tools ▶ (3번째쯤) Android SDK Command-line Tools (latest) 체크
  * 그림 참조: [flutter doctor --android-licenses 문제 해결하기, 커니의 안드로이드 이야기](https://www.androidhuman.com/2021-06-02-flutter_android_license_noclassdeffound)
  ![cmd-line tools](https://www.androidhuman.com/assets/posts/2021-06-02-flutter_android_license_noclassdeffound/sdk_manager.png)
* Apply & OK
* 이제 `flutter doctor` 패스함
  ```
  ╰─ flutter doctor
  Doctor summary (to see all details, run flutter doctor -v):
  [✓] Flutter (Channel beta, 2.3.0-24.1.pre, on Microsoft Windows [Version 10.0.19044.1706], locale ko-KR)
  [✓] Android toolchain - develop for Android devices (Android SDK version 30.0.0)
  [✓] Chrome - develop for the web
  [✓] Android Studio (version 4.2.0)
  [✓] Connected device (2 available)

  • No issues found!
  ```
