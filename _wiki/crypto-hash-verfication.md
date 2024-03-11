---
layout  : wiki
title   : 파일 hash 확인하기 
summary : 다운받은 인스톨러가 정상적인 파일일까?
date    : 2022-05-20 02:55:15 +0900
updated : 2022-05-22 10:15:47 +0900
tag     : cryptographic-hash-function sha256 md5
toc     : true
public  : true
parent  : [[Cross-Category]] 
latex   : false
---
* TOC
{:toc}

# 1. 개요

* 인터넷에서 설치 파일을 다운로드 받을때 원본과 같은지 (data integrity) 확인할 수 있도록 hash값을 알려준다
  * e.g., [Anaconda installer file hashes, docs.anaconda.com](https://docs.anaconda.com/anaconda/install/hashes/)
  * [Hashes for Anaconda3...exe](https://docs.anaconda.com/anaconda/install/hashes/Anaconda3-2022.05-Windows-x86_64.exe-hash/)
* 각 OS별로 확인하는 cmd-line 툴이 있으므로 사용법을 알아보자
* 참조 링크 : 
  * [Cyptographic hash verification, conda.io](https://conda.io/projects/conda/en/latest/user-guide/install/download.html#cryptographic-hash-verification)
  * [sha256sum 명령어, John Grib 위키](https://johngrib.github.io/wiki/sha256sum/) 


# 2. OS별 확인 방법

## 알고리즘

* conda.io 에서는 SHA-256이 좀더 secure 하므로 MD5 verification 을 추천하지 않는다고 함

## Windows

* PowerShell V4 or later
  ```
  > Get-FileHash .\demoApplication.zip -Algorithm SHA256

  Algorithm       Hash                                                                   Path
  ---------       ----                                                                   ----
  SHA256          8DA1D5669D0453C7F2817A5A1491F94C32FB101B5DB20E271F7468704F449ABA       D:\repository\demoApplication.zip

  > Get-FileHash .\demoApplication.zip -Algorithm MD5

  Algorithm       Hash                                                                   Path
  ---------       ----                                                                   ----
  MD5             02C268530F3028A5ABD39AB3F061DD41                                       D:\repository\demoApplication.zip
  ```
* PowerShell V4 or later 아닌경우는 생략
* 원격에서 받은 Hash값과 파일을 입력하면 비교해서 같은지 판단해주는 .ps1 스크립트도 있다
  * [PowerShell Compare-Hash Function](https://www.bytesizedalex.com/powershell-compare-hash-function/)
    * github :[Compare-Hash, github.com/bytesizedalex](https://github.com/bytesizedalex/compare-hash)
  * 내가 만들어 보려 했는데 이미 있다. 하지만... 개선할 점은 없는지 확인해보자
    ![anti-re-invent-wheel](https://pbs.twimg.com/media/CdGC-kcWIAAG9hL?format=jpg&name=small)
    * 입력을 json 파일로도 받도록 개선해보면 어떨까?
      * 참고해볼것 : [How to pass JSON to Posh? - 2nd answer](https://stackoverflow.com/a/69679083/9457247) 

## macOS

* In iTerm or a terminal window enter
  ```
  > shasum -a 256 filename 
  ```
  
## Linux

* In a terminal window enter
  ```
  $ sha256sum script.sh
  be8bc5a929486c703f8753d6c9a1880a27693c6519337328b20e6f70686cd672  script.sh
  
  $ md5sum script.sh
  c5214fe378e7c30d560f82d9800113d4  script.sh
  ```
* 관련 포스팅 참조
  * [An Introduction to hashing and checksums in Linux, redhat.com](https://www.redhat.com/sysadmin/hashing-checksums)
