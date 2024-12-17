## 프로젝트소개
![logo](https://github.com/user-attachments/assets/6135e6a2-5554-4a3c-be7b-0e16dc7fb5d2)

- 프로젝트명: BUY&SELL(중고거래 사이트)
  
- 개발기간: 2024.11.01 ~ 2024.11.30

- 인원: 4명

## 팀원 소개 및 역할

- 김태용(PM): 회원가입, 로그인, 마이페이지, ID찾기, PW찾기 등 풀스텍 제작

- 주효상(백엔드): 판매하기, 구매하기, 상품수정, 상품삭제, 상품 상세보기 등 풀스텍 제작

- 김승민(프론트엔드): 피그마로 홈페이지 초안 작성, 메인홈페이지 프론트엔드 제작

- 강성빈(디자인): 로고와 광고배너 등 포토샵, 전체적인 디자인을 담당

## 기술 스택
![1](https://github.com/user-attachments/assets/eb3db343-e033-4b4b-9e67-ab9f2354ca24)

## ERD
![erd2](https://github.com/user-attachments/assets/85e07994-2ac2-4dc1-b225-5fc2cc8b982d)

## 프로젝트 구성

<details>
<summary>메인 홈페이지</summary>  
  
![main](https://github.com/user-attachments/assets/3d2c5875-60a6-4af0-a91d-b60f3403b9f8)

</details>

<details>
<summary>상품 상세보기</summary>  
  
![product](https://github.com/user-attachments/assets/a73a6d7e-c1e0-4ad4-9d89-3de5be556456)

</details>

<details>
  <summary>회원가입</summary>
  
  ![join](https://github.com/user-attachments/assets/8e6a369f-d5d4-45ea-ac01-76387d75c6a0)
  
</details>
<details>
  <summary>로그인</summary>

![login](https://github.com/user-attachments/assets/2014235e-3cff-471c-a5f8-3093d8ba7788)
  
</details>

<details>
  <summary>마이페이지</summary>

![mypage](https://github.com/user-attachments/assets/45379017-36dc-445e-bf13-49665425c9f2)
  
</details>

<details>
  <summary>판매</summary>

![add](https://github.com/user-attachments/assets/dd023cf4-5da2-4403-ade6-b70e90779c72)
  
</details>

<details>
  <summary>내 상점</summary>

![prductupdate](https://github.com/user-attachments/assets/a84acb56-cc36-4a94-8678-276e199c4a7c)
  
</details>

## 구현기능
**1. MYSQL과 JDBC를 활용한 회원관리, 상품관리 시스템 구현**
  - **기술:** MySQL, JDBC
  - **내용:** DTO와 DAO를 활용하여 회원가입 및 로그인 기능, 상품 등록 및 수정 삭제 기능 구현, 데이터베이스와의 통신 효율성을 높이고, 코드 재사용성을 극대화.
  - **성능 개선:** 쿼리 최적화와 PreparedStatement 사용으로 SQL Injection 방지 및 데이터검색 속도 향상.
    
**2. JSP와 세션을 이용한 로그인 정보 유지 및 권한 검증**
  - **기술:** JSP, HttpSession
  - **내용:** 로그인 정보를 세션에 저장하여 판매, 수정, 삭제 같은 기능은 로그인된 사용자만 접근 가능하도록 구현
  - **성능 개선:** 서버 측 세션 관리를 통해 로그인 여부를 효율적으로 검증하여 보안 강화 및 사용자 권한 관리
    
**3. AJAX와 JavaScript를 활용한 회원가입 및 로그인 기능 개선**
  - **기술:** AJAX, JavaScript, 쿠키
  - **내용:** 회원가입 및 로그인 시 실시간 유효성 검사, 자동 로그인 기능 구현(쿠키 저장), ID 및 비밀번호 찾기 기능 구현.
  - **성능 개선:** 페이지 새로고침 없이 데이터 전송 및 처리로 사용자 경험(UX) 향상 및 불필요한 서버 호출 감소.
    
**4. 부트스트랩과 CSS를 활용한 반응형 웹 디자인 적용**
 - **기술:** CSS, Bootstrap
 - **내용:** 데스크톱 환경에서 최적화된 반응형 UI 구현.
 - **성능 개선:** CSS 미니파일과 CDN을 활용해 로딩 속도 단축 및 사용자 편의성 증대.
   
**5. MultipartRequest를 활용한 파일 업로드 기능 구현**
 - **기술:** MultipartRequest
 - **내용:** 상품 등록 시 이미지 파일 업로드 및 관리 기는 구현, 업로드된 파일은 지정된 서버 디렉토리에 저장하고 파일 크기 및 중복 이름 처리 로직 적용
 - **성능 개선:** 효율적인 파일 처리와 검증을 통해 서버 리소스 낭비 방지 및 안정성 확보

## 특이사항
**1. 협업 및 소통 역량**
  - 첫 팀 프로젝트로 진행되었으며, **주 2회 정기 회의**를 통해 역할 분담과 진행 상황을 점검.
  - 회의 결과 및 진행 사항을 **노션**을 활용하여 체계적으로 기록 및 공유해 효율적인 소통을 유지.
  - 팀원 간 **시간 조율** 및 비협력적인 조원과의 갈등이 있었지만 적극적인 커뮤니케이션을 통해 문제를 해결하고 프로젝트를 성공적으로 마무리함.
    
**2. 고민 & 문제 해결 포인트**
- **코드 병합의 어려움:** 각 팀원이 작성한 코드를 하나의 프로젝트로 합치는 과정에서 어려움을 겪음. 개인 작업 시 경험하지 못한 협업에서의 복잡성을 경험.
    
- **Git & GitHub 협업:** 기존에는 개인적인 코드 저장 용도로만 GitHub를 사용했으나, 팀원 간의 코드 공유 및 협업을 위해 GitHub를 적극 활용. 협업 과정에서 충돌 해결 등 새로운 기능과 사용법을 학습하며 실력을 향상시킴.
    
- **프론트엔드 개발 역량 강화:** 팀원들 모두 프론트엔드 개발에 자신이 없어 어려움을 겪었지만 함께 프론트엔드 학습에 집중하며 개발을 성공적으로 마무리함. 이 과정에서 백엔드를 아무리 잘 만들어도 프론트엔드가 부족하면 프로젝트의 완성도가 크게 떨어진다는 것을 체감하며 프론트엔드의 중요성을 깊이 깨닫게 됨.
    
**3. 추가로 개발중인/개선 중인 사항**

- **경매 기능 개발 중:** 중고거래 사이트의 기능을 확장하기 위해 경매 기능 추가를 계획하고 개발 중. 이 기능을 통해 사용자 경험(UX)를 더욱 개선하고 다른 중고거래 사이트와의 차별점을 높일 예정.  

