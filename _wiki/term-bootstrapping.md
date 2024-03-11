---
layout  : wiki
title   : Bootstrapping 
summary : 영문 Wikipedia 용어 Bootstrapping 발췌 번역 
date    : 2022-02-21 18:42:21 +0900
updated : 2022-02-21 22:55:41 +0900
tag     : bootstrapping 
toc     : true
public  : true
parent  : [[Term-Category]] 
latex   : false
---
* TOC
{:toc}

# 페이지 개요

* 원본 : [Bootstrapping, 영문 wikipedia](https://en.wikipedia.org/wiki/Bootstrapping)
* 용어 개념을 다지기 위함

# Bootstrapping

* 일반적으로, **bootstrapping**은 외부 조력 없이 지속되고 나아가는 self-starting 프로세스를 의미한다

## Etymology

<style>
.start-container {display: flex; align-items: center; justify-content: space-around}
</style>

<div markdown="1" class="start-container">

* 목이 긴 부츠는 윗부분에 tab, loop나 handle(손잡이)이 있는데 이것을 bootstrap이라고 한다
  * bootstrap은 손가락이나 boot hook 도구로 boot를 잡아당길수 있도록 돕는다
* "자신의 bootstrap으로 자기 자신을 끌어올리기"라는 속담이 불가능한 일을 가리키는 말로 이미 19세기 부터쓰이고 있었다
  * 이 속담은 적어도 1834년까지 거슬러올라가며, *Workingman's Advocate*에 등장한다.
    * "Murphee씨는 자신의 부츠 끈으로(by the straps of his boots) 컴벌랜드 강이나 헛간 마당 울타리를 넘을 수 있을 것으로 추측된다"
  * 1860년대에 `Philosophy of mind` 다음과 같이 언급되었다:
    * "mind가 자기 자신을 분석하려는 시도는 자신의 boostrap으로 자기 자신을 들어올리려는 노력과 닮아있다"
  * Bootstrap은 metaphor로서, 외부 조력이 없이 자기 자신만의 노력으로 개선됨을 가리키는 의미로 1922년에 사용된 기록이 있다
    * 이 metaphor는 외부 조력없이 스스로 유지되는 프로세스 시리즈에 대한 추가적인 메타포들도 소환을했다. 
* 이 용어는 Rudolf Erich Raspe의 *뮌히하우젠 남작의 놀라운 모험*로 부터 영향을 받긴 했지만...
  * 일단, 뮌히하우젠 남작이 자신의 머리카락(정확히는 pigtail)으로 자신과 자신의 말을 늪으로 부터 끌어올렸다는 이야기가 가장 연관이 많다
  * 하지만 이 이야기에는 bootstraps이 등장하지 않는다.
  * 뮌히하우젠 남작의 다양한 다른 버전에서도 딱히 bootstrap은 등장하지 않는다


| ![목이 긴 부츠](https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Dr_Martens%2C_black%2C_old.jpg/330px-Dr_Martens%2C_black%2C_old.jpg)<br>한 쪽 신발만 bootstrap이 보이는 사진                                                                                                                                                                                           |
| ![Munchausen 남작](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Zentralbibliothek_Solothurn_-_M%C3%BCnchhausen_zieht_sich_am_Zopf_aus_dem_Sumpf_-_a0400.tif/lossless-page1-330px-Zentralbibliothek_Solothurn_-_M%C3%BCnchhausen_zieht_sich_am_Zopf_aus_dem_Sumpf_-_a0400.tif.png) <br> 뮌히하우젠 남작이 자신의pigtail 로 자신과 자신의말을 늪에서 끌어올리고 있다 |

</div>

## Applications

### Computing (컴퓨터 공학쪽)

* Computer technology에서, **bootstrapping** 용어는 자기 자신의 language로 코딩할 수 있는 language compiler를 의미한다
  * 예를 들면 C 컴파일러는 C language로 작성된다.
  * 일단 기본적인 컴파일러가 작성되면, 반복 작업으로 개선이 이루어진다.
  * 이것은 자신의 bootstrap으로 language 자신을 끌어올리는 것과 같다고 볼 수있다
* 또한, **booting**은, power on 이나 general reset 이후에, 기본적인 software를 메모리에 로딩하는 프로세스로,
  * 커널이 operating system을 로드하고
  * operating system은 다른 device driver나 software를 필요에 따라 로딩할 것이다

#### Software loading and execution

* [Booting](https://en.wikipedia.org/wiki/Booting) and [Reboot (computing)](https://en.wikipedia.org/wiki/Reboot) 을 각각 참조하라
* **Booting**은 컴퓨터를 시동시키는 프로세스로, 내부 software를 시작시키는데 특히 연관된다.
* 이 프로세스는 연속적인 단계를 가지는데
  * 각 단계에서, 더 작고 간단한 프로그램이 
  * 다음 단계의, 더 크고 복잡한 프로그램을 로드하고 실행시키는 형태로 진행된다
* 이것은 computer가 "자신의 bootstrap으로 자기 자신을 끌어올린다는" 느낌, 
  * 즉, 자신만의 노력으로 자신을 나아지도록 한다는 의미로
  * Booting 으로 표현된다 ( 다시 한 번 위의 Ethymology의 속담 사례를 읽어보자) 
* Booting은, 하드웨어 기반의 프로시져 실행으로 시작하여 
  * 메인 메모리로 로드된 firmware와 software로 실행이 넘어가는, 이벤트의 연속 과정이다
* Booting은 종종 다음의 과정을 포함한다
  * self-test 수행
  * configurations setting의 로딩
  * BIOS 로딩
  * resident monitors 로딩
  * hypervisor 로딩
  * operating system 로딩
  * utility software 로딩
* 컴퓨터 용어 `bootstrap`은 1950년대에 metaphor 로서 등장했다
  * 컴퓨터에서, bootstrap 버튼을 누르면, hardwired 프로그램이 input unit으로부터 boostrap 프로그램을 읽어온다  
  * 그 다음엔, 컴퓨터가 bootstrap 프로그램을 실행하고, 컴퓨터가 다른 프로그램 instructions을 읽어오도록 동작시킨다
  * 이 과정이 자가 유지 프로세스(self-sustaining process)가 되었다
    * 즉, 수동으로 입력되는 instruction 같은 외부 도움없이 진행되는 과정인것이다.
    * 컴퓨팅 용어로서, bootstrap은 1953년 부터 사용되어 왔다 

#### Software development

* Bootstrapping은 더 복잡하고 빠른 프로그래밍 환경의 연속적인 개발을 의미할 수도 있다
  * 가장 간단한 개발환경은 아마도 
    * 매우 기본적인 text editor(예를 들면, ed)와
    * 어셈블러 프로그램일 것이다
  * 이 도구들을 이용하여
    * 좀 더 기능이 많은 텍스트 에디터와
    * higher-level 언어를 위한 간단한 컴파일러등을 작성할 수있다
  * 이런 작업의 반복으로 결국은
    * 그래픽이 도입된 IDE와 극한의 high-level 프로그래밍 언어까지도 작성할 수 있을 것이다
    * (역자주)결국, 스스로 자신을 끌어올리는 과정이다
* 역사적으로, bootstrapping은 새로운 hardware에서의 컴퓨터 프로그램 개발의 early technique으로 언급되기도 한다
  * 이 문단에서 묘사된 technique은 , 기존에 존재하던 컴퓨터에서 실행되는 cross compiler의 사용으로 대체 되어왔다
  * 프로그램 개발에서 Bootstrapping은 1950년대에 시작되었다
    * 이 때에는 프로그램이 종이위에 
    * 십진코드(decimal code)나 이진코드(binary code)의 0과 1의 bit 단위로 작성되었다
    * 당시에는 high-level 언어, 컴파일러, 어셈블러, 링커 같은것이 없었기 때문이다
  * 작은 어셈블러 프로그램이 새로운 컴퓨터(예를 들면 IBM 650)용으로 수기 작성되었다
    * 이 프로그램은 몇가지 instruction을 이진수 혹은 decimal code로 변환해준다. 이것을 A1이라고 하자 
    * 이 간단한 어셈블러는 자신이 정의한 어셈블리 언어를 이용하여 
      * 더 복잡한 operation code를 위한 추가적인 mnemonics을 사용할 수있도록 재작성되었다 
    * 개선된 어셈블러의 소스 프로그램은 이전버전의 실행파일(A1)에 의해 assemble 되어 
      * binary혹은 decimal code로 변환되었고 이것을 A2라고 하자
      * 이렇게 개선점을 포함한 채로, 다음의 목표를 달성할 때까지 cycle이 반복된다.
        * 원하는 모든 instruction의 추가
        * 실행중 분기할 주소들을 자동으로 계산하기
        * 다른 편의 기능들의 추가( 조건 어셈블리, 매크로, 최적화)
  * 이것이 초기의 어셈블리 프로그램 SOAP (Symbolic Optimal Assembly program)이 개발된 방법이다
    * 초기의 컴파일러, 링커, 로더, 유틸리티등이 어셈블리 언어로 코딩되었고
    * 이렇게 더 간단한 소프트웨어로 복잡한 소프트웨어를 개발하는 bootstrapping 과정이 계속되었다
* 이 용어는 특히 Doug Engelbart가 다음과 같은 자신의 신념을 옹호하는데 사용되었다
  * 조직은 자신이 개선을 위해 사용하는 과정을 개선함으로써 ( 따라서 시간이 지남에 따라 복합적인 효과를 얻으므로) 더 잘 발전할 수 있다
  * NLS hypertext system을 만든 그의 SRI 팀은, 그들이 개발한 도구를 도구 자신을 개선하는데 사용함으로 이 전략을 적용하였다 
    
#### Compilers

* Main articles : Bootstrapping (compilers)
* 추가 설명 미번역
 
#### ⭐⭐Installers

* Main articles : Installation (computer programs) 
* 컴퓨터 프로그램의 설치과정에서, 때때로 인스톨러나 패키지 매니저 자체를 업데이트할 필요가 생긴다
* 이에 대한 일반적인 패턴은 작은 실행가능한 bootstrapper 파일 (예를 들면, setup.exe)을 사용하는 것인데..
  * 이 파일은 인스톨러를 업데이트하고, 이후에 실제 installation을 시작시키는 것이다
  * 때때로 bootstrapper는 bootstrapping 과정중에 해당 소프트웨어를 위한 다른 prerequisites을 설치하기도 한다
 
#### Overlay networks

* Main articles : Bootstrapping node 
* 추가 설명 미번역
 
#### Discrete-event simulation

* Main articles : Discrete-event simulation 
* 추가 설명 미번역
 
#### Artificial intelligence and machine learning

* Main articles : Bootstrap aggregating and Intelligence explosion
* 추가 설명 미번역
        
### Statistics (통계학)

* Bootstrapping은 요약 통계(summary statistics)의 추정치(estimates)를 얻기 위해 사용되는 resampling 기술이다 
* 일단 현재는 관심이 없어 번역안함


