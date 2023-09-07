# jar 파일 생성 법(나이스평가정보기준)
- 나평정에선 패키지별로 메인클래스를 만들기때문에 소소경로를 src경로로 부터 잡아서 jar파일을 만들었었다.

Jar 파일 생성

1.소스폴더 경로 설정

프로젝트명 우클릭
Properties메뉴선택
Java Build path 선택
소스탭
Add Folder 버튼 선택
작업할 배치 폴더의 src채크 박스선택
Ok버튼 클릭
Apply and close클릭

2. Jar 생성

프로젝트명 우클릭
Export… 메뉴선택
Java > jar file 선택
Next 선택
앞에서 설정한 배치 src체크박스 선택
오른쪽의 .classpath및 다른 파일들 체크박스 해제
Jar저장경로 설정
Next
Next
Main class 오른쪽의 browerse.. 클릭
메인 클래스 선택 후 ok클릭
Finish클릭 


3. 확인

생성된 jar 미리보기로 확인
Class xml이 있음
