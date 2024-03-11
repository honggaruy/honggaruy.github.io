---
layout  : wiki
title   : Google Apps Script 안내서 
summary : 관련 용어 정리, 개념 정리및 안내서 링크 
date    : 2021-10-09 15:12:30 +0900
updated : 2022-12-11 00:55:07 +0900
tag     : 
toc     : true
public  : true
parent  : [[GoogleAppsScript-Category]]
latex   : false
---
* TOC
{:toc}

# 1. 개념 정리

## [Google Workspace Add-ons 란 ?](https://developers.google.com/workspace/add-ons/overview)

* Add-ons 이란?
  * 개발자가 편집할수 있는, Google Workspace applications에 통합된 application
* 어떤것을 할 수 있나?
  * 자동화된 테스팅과 배포
  * add-on 호스팅 서비스로 백그라운드 작업을 수행
  * command-line 도구로 배포를 생성하고 관리
  * Manage deployment permissions for service accounts

## 1-2. 요소별 특성

- Sheets : Range의 상위 개념
  - Column 전체의 너비를 제어 하고 싶을 때
    - Sheet 레벨의 제어가 필요함 : [sheet.setColumnWidth()](https://developers.google.com/apps-script/reference/spreadsheet/sheet#setcolumnwidthcolumnposition,-width), sheet.setColumnWidths()
    - Range 레벨에서는 제어함수가 없음
