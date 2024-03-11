---
layout  : wiki
title   : PyScaffold로 파이썬 프로젝트 시작하기 
summary : 파이썬 프로젝트 생성기 
date    : 2020-11-15 12:47:16 +0900
updated : 2022-03-11 01:58:31 +0900
tag     : python pyscaffold windows-terminal 
toc     : true
public  : true
parent  : [[Python-Category]] 
latex   : false
---
* TOC
{:toc}

# Manifest

* 용어 설명 : [manifest](/wiki/keyword_collection#manifest) 
* [PyScaffold v4.0 정식배포](https://github.com/pyscaffold/pyscaffold/releases/tag/v4.0) - 2021-03-05 
* 2022년 3월 현재 이전 Stable 버전인 [v3.3 설명서](https://pyscaffold.org/en/v3.3.x/)도 있음

# 1. 개요

* 내용 발췌 원본 : [pyscaffold.org](https://pyscaffold.org/en/stable/)
* BillMaker를 PyScaffold로 시작했는데.. 정리해놓은 문서가 없음
* 처음부터 다시 만들며 정리해보기로 함.

## `PyScaffold`를 사용하는 목적

* `PyScaffold`는 고품질의 Python 패키지를 시작하기 위한 Python 프로젝트 생성기 이다
* `PyScaffold`를 사용하면..
  * PyPI에 공유 가능하도록 준비시켜주고
  * pip로 내 패키지를 설치할수 있도록 해준다
  * 또한 Python ecosystem에서 사용하는 best tool과 practices를 손쉽게 사용할 수 있다
  * 당신의 팀이 제정신이고 행복하며, 생산성이 있도록 유지할 수 있게 도와준다
* Note
  *  


# 2. 전개

## 기본 환경

* Windows 환경에서 진행할 것임
* `PyScaffold`를 사용하기 위해 할 일
  * Python 독립 환경 설치
  * PyScaffold 설치

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

#### PyScaffold version 4일 경우

* 현재 설치된 패키지를 확인하기 위해 shell에 `conda list` 명령 실행
  * python v3.9 & pyscaffold v4 일때 캡춰 (2022-02-21)
   
    ```sh
    ❯ conda list
    # packages in environment at D:\App\Anaconda3\envs\myproject:
    #
    # Name                    Version                   Build  Channel
    appdirs                   1.4.4              pyh9f0ad1d_0    conda-forge
    ca-certificates           2021.10.8            h5b45459_0    conda-forge
    certifi                   2021.10.8        py39hcbf5309_1    conda-forge
    configupdater             3.0.1              pyhd8ed1ab_0    conda-forge
    importlib-metadata        4.11.1           py39hcbf5309_0    conda-forge
    openssl                   1.1.1l               h8ffe710_0    conda-forge
    packaging                 21.3               pyhd8ed1ab_0    conda-forge
    pip                       22.0.3                   pypi_0    pypi
    pyparsing                 3.0.7              pyhd8ed1ab_0    conda-forge
    pyscaffold                4.1.4              pyhd8ed1ab_0    conda-forge
    python                    3.9.7                h6244533_1
    python_abi                3.9                      2_cp39    conda-forge
    setuptools                58.0.4           py39haa95532_0
    setuptools-scm            6.4.2              pyhd8ed1ab_0    conda-forge
    sqlite                    3.37.2               h2bbff1b_0
    tomli                     2.0.1              pyhd8ed1ab_0    conda-forge
    tomlkit                   0.10.0             pyha770c72_0    conda-forge
    typing                    3.10.0.0           pyhd8ed1ab_0    conda-forge
    tzdata                    2021e                hda174b7_0
    vc                        14.2                 h21ff451_1
    vs2015_runtime            14.27.29016          h5e58377_2
    wheel                     0.37.1             pyhd3eb1b0_0
    wincertstore              0.2              py39haa95532_2
    zipp                      3.7.0              pyhd8ed1ab_1    conda-forge
    ```
* tox를 설치하려면 `conda install -c conda-forge tox` 명령을 실행하라. 아래 2022-02-22일자 의존성확인
  ```sh
  ❯ conda install -c conda-forge tox
  Collecting package metadata (current_repodata.json): done
  Solving environment: done

  ## Package Plan ##

    environment location: D:\App\Anaconda3\envs\myproject

    added / updated specs:
      - tox


  The following packages will be downloaded:

      package                    |            build
      ---------------------------|-----------------
      colorama-0.4.4             |     pyh9f0ad1d_0          18 KB  conda-forge
      distlib-0.3.4              |     pyhd8ed1ab_0         371 KB  conda-forge
      filelock-3.6.0             |     pyhd8ed1ab_0          12 KB  conda-forge
      pip-22.0.3                 |     pyhd8ed1ab_0         1.5 MB  conda-forge
      platformdirs-2.5.1         |     pyhd8ed1ab_0          15 KB  conda-forge
      pluggy-0.13.1              |   py39hcbf5309_4          30 KB  conda-forge
      py-1.11.0                  |     pyh6c4a22f_0          74 KB  conda-forge
      six-1.16.0                 |     pyh6c4a22f_0          14 KB  conda-forge
      toml-0.10.2                |     pyhd8ed1ab_0          18 KB  conda-forge
      tox-3.24.5                 |   py39hcbf5309_0         157 KB  conda-forge
      virtualenv-20.13.1         |   py39hcbf5309_0         8.0 MB  conda-forge
      ------------------------------------------------------------
                                             Total:        10.2 MB

  The following NEW packages will be INSTALLED:

    colorama           conda-forge/noarch::colorama-0.4.4-pyh9f0ad1d_0
    distlib            conda-forge/noarch::distlib-0.3.4-pyhd8ed1ab_0
    filelock           conda-forge/noarch::filelock-3.6.0-pyhd8ed1ab_0
    pip                conda-forge/noarch::pip-22.0.3-pyhd8ed1ab_0
    platformdirs       conda-forge/noarch::platformdirs-2.5.1-pyhd8ed1ab_0
    pluggy             conda-forge/win-64::pluggy-0.13.1-py39hcbf5309_4
    py                 conda-forge/noarch::py-1.11.0-pyh6c4a22f_0
    six                conda-forge/noarch::six-1.16.0-pyh6c4a22f_0
    toml               conda-forge/noarch::toml-0.10.2-pyhd8ed1ab_0
    tox                conda-forge/win-64::tox-3.24.5-py39hcbf5309_0
    virtualenv         conda-forge/win-64::virtualenv-20.13.1-py39hcbf5309_0


  Proceed ([y]/n)?
  ```

* tox가 알아서 dependencies까지 설치해 준다고 하니 일단 추가로 설치할 패키지는 없음

#### PyScaffold Version 3일 경우

* 현재 설치된 패키지를 확인하기 위해 shell에 `conda list` 명령 실행

  * python v3.7 & pyscaffold v3 일때 캡춰

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
  * 참고2 : [Uploading to PyPI](https://pyscaffold.org/en/stable/features.html#uploading-to-pypi)
    * `python setup.py develop`은 이전 가이드 내용으로 현재(2022-02-22)는 강력하게 비추천되고 있다.
    * 자세한 사항은 링크 내용을 확인해보자  

    

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
