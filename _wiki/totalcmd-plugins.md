---
layout  : wiki
title   : Total Commander 플러그인 관련 
summary : 
date    : 2022-04-30 02:07:37 +0900
updated : 2023-10-11 13:06:39 +0900
tag     : total-commander 
toc     : true
public  : true
parent  : [[TotalCommander-Category]] 
latex   : false
---
* TOC
{:toc}

# TC의 올바른 디렉토리 관리

- 발췌: [토탈커맨더의 올바른 디렉토리 관리, TC 네이버 카페](https://cafe.naver.com/totalcommander/240)
- 토탈커맨더 트리구조 - Plugins 폴더를 만들어 넣는다 
  ```
  # totalcmd root
  ├── Filter64/  - default
  ├── Filter32/  - default
  ├── Language/  - default
  ├── Sounds/ - Custom, 효과음 ? 
  ├── Plugins/ - Custom, 플러그인 관리
  │   ├─ Applications - Plugin이 아닌 유틸 i.e. Plugin Manager등등
  │   ├─ WCX - 압축기 플러그인 (Packer plugins)
  │   ├─ WDX - 컨텐츠 플러그인 (Content Plugins) 
  │   ├─ WFX - 파일 시스템 플러그인 (File system plugins) 
  │   └─ WLX - 리스터 플러그인 (Lister Plugins) 
  ├─ wincmd.ini - 시스템 홈에 저장될수도 있음 
  ├─ Totalcmd.exe - 32bit 실행 파일 
  ├─ TOTALCMD64.exe - 64bit 실행 파일 
  └─ Wincmd.key - 구입키 
  ```
    - 위의 트리구조 편집은 tree command를 한 이후에 복사 붙여넣기 한 것

## TC Plugins Manager 로 플러그인 설치하는 방법

- TC에 단축메뉴로 등록해놓은 ( 이건 아마 되어있겠지??) TC Plugins Manager를 실행한다
    - 내가 확인한 것은 2.2.8 버전
- TCPM의 Dialog 창이 뜬다
- 중간쯤에 메뉴버튼 리본이 있는데 첫번째인 `Install`을 click
    - Install..  (개별파일에서 설치?)
    - Install from archive..  (압축파일에서 바로 설치)
    - Install from folder..  (풀어놓은 폴더에서 설치)
    - .. 와 같이 3개 메뉴가 나온다
- 플러그인은 보통 압축파일로 배포되므로 두번째를 가장 많이 쓴다
    - 위 메뉴를 통해 인터넷에서 다운로드 받은 압축파일이 있는 `다운로드 폴더`로 가서..
    - 설치를 누르고 폴더가 제대로 들어갔는지 확인한다
  
# WDX 플러그인

* 주로 음악파일이나 동영상 파일의 세부 정보를 TC 파일목록 뷰에서 바로 확인하기 위해 이용한다
* 플러그인을 설치하자 마자 바로 보이는 것은 아니고 `보기 모드`관련 설정이 필요하다

## 사용중인 플러그인

- MediaInfo
- TCMediaInfo
- [Exif 2.3](https://totalcmd.net/plugring/exif.html)

### 확인해볼 플러그인

* [WinScript](https://ghisler.ch/board/viewtopic.php?t=44032)

## 사용방법

### Step 1. TC 자체설정

* 기본 옵션이 `수직 분할` 상태로는 여러가지 정보를 보기 어려우므로 `수평 분할`상태로 바꾼다
  * 편의를 위해 상단 버튼 바에 `명령어: 수평 분할`버튼을 추가한다 (기본적으로 toggle이 적용된다)
* 사용자 열 보기를 설정할 예정인데 음악파일용, 동영상 파일용등 여러개를 만들어 toggle할 것이다
  * 버튼 만들기 : `원본: 다음 사용자 열 보기` (cm_SrcNextCustomView) 를 버튼 등록한다
    * 혹시 사용자 열 보기 옵션이 늘어나면  `원본: 이전 사용자 열 보기` (cm_SrcPrevCustomView) 버튼도 추가한다 
      
### Step 2. 사용자 열 보기 편집

* 사용자 열 환경 설정으로 진입한다
  * 메뉴에서 진입 : `보기메뉴 ▶ 사용자 열 모드 ▶ 사용자 열 환경설정...`
  * 옵션에서 진입 : `옵션 root ▶ 화면 ▶ 사용자 열` 
* `새로 만들기`로 추가 or 기존 열을 `편집`
* 편집화면으로 들어가면 TC 목록에서 보여줄 열을 편집할 수 있는데...
  * 맨 오른쪽에 <kbd>+</kbd> 키를 누르고 들어가면 이제서야 미리 설치한 `WDX` 플러그인 이름이 보인다
  * WDX 플러그인은 파일에서 정보를 뽑아내는 정보소스로 필요한 정보를 편집하여 해당 열에서 보여줄 정보를 편집한다

#### 사용자 열 

* 관련 도움말
  * `Dialog box: Custom columns`
    * [=pluginname.fieldname.unit] 이다 

### Exif 활용법

#### 관련링크

- [디지털 사진 관리, 파일 이름 일괄 변경, likenew.tistory.com](https://likenew.tistory.com/448)
- [몇년동안 쌓인 사진 파일 정리 하기(아이폰), 아날로그로의 귀환...](https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=iagapeu&logNo=220875813227)
      
# WLX 플러그인

* 파일의 내용을 확인하는 플러그인. 
* 파일을 선택한후 "빠른 보기"(<kbd>Ctrl</kbd>+<kbd>q</kbd>)로 각 파일별 lister 플러그인 활성화 한다 
  
  
## FileInfo

* .exe, .dll, .ocx 파일의 메타데이트를 보여주는 파일
* 2022-05-07 현재, 2.23 버전 ( 2017-05-18 업데이트)
* 64bit 버전 지원
* [TOTALCMD.NET 링크](http://totalcmd.net/plugring/fileinfo.html)

### 국내블로그 설명

* [TC/파일 정보 표시 플러그인 Fileinfo, qaos.com](https://qaos.com/article.php?sid=2447)

### ReadMe.txt 요약

* 4 versions are included in this zipped file.
	- wlx_fileinfo32 and wlx_fileinfo64 are statically linked to MFC, size is larger but no DLL is needed
	- wlx_fileinfo32_DL and wlx_fileinfo64_DL are dynamically linked to MFC, size is half the weight but 
	2 DLLs from MFC9.0 are needed (MFC90.dll, MSVCR90.dll)

##  pdfview

### 추가 설치 필요한 프로그램

* Ghostscript
  *  [Documentation](https://ghostscript.com/doc/current/Readme.htm)

### 설정

* 아래 설정은 pdfplugin 설치 폴더에 있는 `ReadMe.txt`를 참고하여 작성함
* 설치하면 `%COMMANDER_PATH%\lsplugin.ini`에 다음과 같은 설정이 자동으로 추가된다
  ```ini
  [pdfview]
  command=-dSAFER -dBATCH -dNOPAUSE -sDEVICE=bmp256 -r%3 -sOutputFile=%2 -dFirstPage=%4 -dLastPage=%4 "%1"
  resolution=144
  ```
* 그냥 Pdf 파일를 Lister로 보면 에러가 남. 다음 설정을 `lsplugin.ini`에 추가하자
  ```ini
  exepath="C:/Program Files/gs/gs9.56.1/bin/gswin64c.exe"
  ```

