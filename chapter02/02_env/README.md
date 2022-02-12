# Pod 템플릿 선언 시 컨테이너 환경변수 설정하기

## 실습 내용
### 쿠버네티스 값을 컨테이너로 전달할 환경변수와 값 참조 경로
  - POD_NAME: metadata.name
  - NAMESPACE_NAME: metadata.namespace
  - POD_IP: status.podIP
  - NODE_IP: status.hostIP
  - NODE_NAME: spec.nodeName
  
### Pod 템플릿 선언 시 컨테이너로 전달할 환경변수와 값
  - STUDENT_NAME: 본인이름
  - GREETING: STUDENT_NAME을 참조한 인삿말