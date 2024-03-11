---
layout  : wiki
title   : 번역 - 흔한 플러터 에러 
summary :  
date    : 2021-12-07 23:32:02 +0900
updated : 2021-12-08 03:35:00 +0900
tag     : 
toc     : true
public  : true
parent  : 
latex   : false
---
* TOC
{:toc}

# 1. 개요

* 원문 :  [Common Flutter erros, flutter.dev](https://docs.flutter.dev/testing/common-errors)

# 2. 번역

## Introduction

* 이 페이지는 몇가지 자주 만나게 되는 Flutter framework erro를 설명하고 어떻게 해결해야할지 제안사항을 제공한다
* 이 페이지는 계속 업데이트 되는 living document 이며, 당신의 contribution을 환영한다
* 이 페이지에 PR을 제출하는 것을 환영한다

## 'A RederFlex overflowed...'

* RenFlex overflow 는 가장 흔한 에러중 하나다. 당신이 이미 만났을 수 있다.

### What does the error look like?

* 이 에러가 발생하면 아래 그림과 같이 yellow & black stripe 표시가 뜨면서
  * app UI 에서 overflow 에러가 났음을 알린다 (아래 그림은 원문에 없음)
   
![yellow-black-error](/wiki-img/2021/common-flutter-errors_01.png)
* debug console 내에서의 에러 문구는 다음과 같다
  ![yellow-black-error-text](/wiki-img/2021/common-flutter-errors_02.png)

### How might you run into this error?

* 이 에러는 `Column` 이나 `Row` widget이 child widget이 있을때 발생한다
* 이 때 child widget이 부모 위젯의 사이즈를 넘을때 발생한다
* 예를 들면, 아래의 code snippet이 일반적인 시나리오를 보여준다
```dart
Widget build(BuildContext context) {
  return Container(
    child: Row(
      children: [
        Icon(Icons.message),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Title", style: Theme.of(context).textTheme.headline4),
            Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed"
                " do eiusmod tempor incididunt ut labore et dolore magna "
                "aliqua. Ut enim ad minim veniam, quis nostrud "
                "exercitation ullamco laboris nisi ut aliquip ex ea "
                "commodo consequat."),
          ],
        ),
      ],
    ),
  );
}
```
* 위 코드에서, `Column`은 `Row`(부모 위젯)이 할당할 수 있는 공간보다 더 많이 차지하려고 하며,
  * 이로 인해 overflow error가 발생한다
* 왜 `Column`이 이렇게 행동할까?
  * 이 layout behavior를 이해하려면, flutter frameworkd이 layout을 어떻게 perform 하는지 알 필요가 있다
  > layout을 perform 하기위해, Flutter는 depth-first 탐색으로 render tree를 탐색하고
  > 부모로부터 자식에게로 **size 제약을 전달한다**... 자식들은 부모가 설정한 제약 조건내에서
  > 부모 개체에 size를 전달하여 응답한다  - [Flutter architectural overview](https://docs.flutter.dev/resources/architectural-overview#layout-and-rendering)
  
* 이 경우에, `Row` widget은 children의 size를 제한하지 않으며, `Column` widget도 마찬가지다
* 부모 widget의 제약이 없기 때문에, 두 번째 text widget은 보여줘야하는 모든 문자를 보여줄 수 있을정도로 커지려고 한다
* 자체 결정된 text widget의 width는 Column widget에 채택이 되는데
  * 이 때 부모 widget의 `Row`가 제공할수 있는 최대치의 공간을 넘기때문에 에러가 발생한다 

### How to fix it?

* `Column` widget이 최대치보다 커지하지 못하게 만들어야 한다
* 이 목표를 달성하기 위해, width를 제한해야 한다
* 한 가지 방법은 `Column` widget을 `Expanded` widget으로 감싸는 것이다
  ```dart
  child: Row(
    children: [
      Icon(Icons.message),
      Expanded(
        child: Column(
          // code omitted
        ),
      ),
    ]
  )
  ```
* 또 다른 방법은 `Column`을 `Flexible` widget을 감싸고 `flex` factor를 지정하는 것이다
* 사실, `Expanded` widget은 `flex` factor 1.0으로 설정한 `Flexible` widget과 동일하다 (소스 코드로 확인가능하다)
* Flutter layout에서 `Flex` widget을 어떻게 사용하는지 더 이해하기 위해, 
  * Flexible widget에 대한 [이 비디오](https://youtu.be/CI7x0mAZiY0) 를 시청하라
