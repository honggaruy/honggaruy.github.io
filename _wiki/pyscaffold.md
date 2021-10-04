---
layout  : wiki
title   : PyScaffold로 파이썬 프로젝트 시작하기 
summary : ... 
date    : 2020-11-15 12:47:16 +0900
updated : 2021-07-23 22:39:22 +0900
tag     : python pyscaffold windows-terminal 
toc     : true
public  : true
parent  : [[Python-Category]] 
latex   : false
---
* TOC
{:toc}

# 1. 개요

* BillMaker를 PyScaffold로 시작했는데.. 정리해놓은 문서가 없음
* 처음부터 다시 만들며 정리해보기로 함.


# 2. 전개

## 기본 환경

### Windows 환경

* Windows Terminal로 Anaconda 환경을 꾸밈
  ```json
  {
      // 참고 : https://dev.to/voodu/windows-terminal-conda-d3e
      "name": "Anaconda with Powershell",
      "suppressApplicationTitle": true,
      "startingDirectory": "D:/App/Anaconda3/",
      "commandline": "powershell.exe -ExecutionPolicy ByPass -NoExit -Command \"& 'D:/App/Anaconda3/shell/condabin/conda-hook.ps1' ; conda activate 'D:/App/Anaconda3'; conda env list \"",
      "hidden": false,
      "icon": "%OneDrive%/사진/WindowsTerminalImages/anaconda.png",
      "backgroundImage": "%OneDrive%/사진/WindowsTerminalImages/conda_cheat_sheet.png",
      "backgroundImageStretchMode": "none",
      "backgroundImageAlignment": "topRight" 
  },
  ```
  * 참고 : [Windows Terminal ❤ conda](https://dev.to/voodu/windows-terminal-conda-d3e) 
  * 아래와 같은 모양으로 Command Prompt에 자주 까먹는 명령을 띄워놓을수 있다.  
    * [편집가능한 Conda Cheat Sheet 링크, 비공개 Google Sheet](https://docs.google.com/spreadsheets/d/1DIhM4Lid6fZUylhIGMib9KVP-Fle-XdABka6Z-Y1TRQ/edit#gid=0)
    
    ![Windeos Terminal 그림](/wiki-img/2021/pyscaffold_01.png)
    
    

* 환경 설정 ( `BillMaker2`를 프로젝트명으로 할 때 )
  ```sh
  > conda create --name BillMaker2 python=3.7
  > conda activate BillMaker2
  > conda install -c conda-forge pyscaffold
  ```
  * 참고 : [pyscaffold github](https://github.com/pyscaffold/pyscaffold)
   
### 설치할 것이 좀 더 있다 

* 현재 설치된 패키지를 확인하기 위해 shell에 `conda list` 명령 실행
 
  ```sh
  ❯ conda list
  # packages in environment at D:\App\Anaconda3\envs\billmaker2:
  #
  # Name                    Version                   Build  Channel
  billmaker2                0.0.post0.dev1+g814211d.dirty          pypi_0    pypi
  ca-certificates           2020.6.20            hecda079_0    conda-forge
  certifi                   2020.6.20        py37hf50a25e_2    conda-forge
  openssl                   1.1.1h               he774522_0    conda-forge
  pip                       20.2.4                   py37_0
  pyscaffold                3.2.3                      py_0    conda-forge
  python                    3.7.9                h60c2a47_0
  python_abi                3.7                     1_cp37m    conda-forge
  setuptools                50.3.0           py37h9490d1a_1
  sqlite                    3.33.0               h2a8f88b_0
  vc                        14.1                 h0510ff6_4
  vs2015_runtime            14.16.27012          hf0eaf9b_3
  wheel                     0.35.1                     py_0
  wincertstore              0.2                      py37_0
  zlib                      1.2.11               h62dcd97_4 
  ```
* 아직 아래 PyScaffold에서 추천하는 추가 프로그램이 깔리지 않았다.
  * [PyScaffold 추가 프로그램](https://pyscaffold.org/en/latest/install.html#additional-requirements)
    * Sphinx
    * pytest
    * pytest-cov
     
* `conda install conda-forge::<Package Name>` 명령으로 각각 추가 설치한다

* 추가 프로그램 설치 후에 환경 설정2 ( `BillMaker2`를 프로젝트명으로 할 때 )
  ```sh
  > putup billmaker2
  > python setup.py develop
  ```
  * 참고 : [pyscaffold github](https://github.com/pyscaffold/pyscaffold)

### 테스트로 Console application 만들어 보기

* 위에서 기본적인 설치및 설정을 완료했다면..
  * Pyscaffold에서 기본제공하는 fibonacci console application을 만들어볼 수 있다.
* project root > src > billmaekr2 > skeleton.py 로 가서 제일 위의 주석을 읽어본다.
  * project root > setup.cfg 수정해보라고 나온다.
    * setup.cfg > [options.entry_points] 에서 다음 주석처리된 부분 활성화하도록 수정
      ```cfg
      console_scripts =
          fibonacci = billmaker2.skeleton:run
      ```

1. 프로젝트 root위치 cmd에서 `python setup.py install`을 실행
  ```sh
  > python setup.py install
  ```
2. cmd에서 아래와 같이 실행하면 결과가 나옴
  ```sh
  > fibonacci 3
  The 3-th Fibonacci number is 2
  ```
3. ../Anaconda3/envs/<Env_Name>/Scripts 에 "fibonacci.exe"가 만들어진 것을 확인한다.
4. 완료 !!

### 
