# Kubernetes 초격차 - 기초

필수 쿠버네티스 오브젝트와 개념에 대해 학습합니다.

## 커리큘럼
![커리큘럼](images/curriculum.png)

## 질문과 답변
- 게시판: https://github.com/yoonjeong-kwon/fastcampus-kubernetes/discussions/categories/q-a
- 이메일: chloe.lecture@gmail.com

## Google Cloud Platform 무료 평가판 크레딧 확인 방법
![Google Cloud Platform 무료 평가판 크레딧 확인 방법](images/check-gcp-freetier.png)

## 목차
### Chapter 01. 처음 만나는 쿠버네티스
- Ch01_01. 오리엔테이션
- Ch01_02. 쿠버네티스와 클러스터 동작 방식
- Ch01_03. [실습] 쿠버네티스 클러스터 구성 및 실습준비
- Ch01_04. 쿠버네티스 오브젝트 개념
- Ch01_05. [실습] kubectl 명령어 맛보기
### Chapter 02. Pod과 친해지기
- Ch02_01. Pod 소개
- Ch02_02. [실습] Pod – 컨테이너로 환경변수 전달
- Ch02_03. [실습] Pod – Pod과 컨테이너들간의 통신
- Ch02_04. Label과 Selector 소개
- Ch02_05. [실습] Pod – Label과 Selector
- Ch02_06. [실습] Pod – nodeSelector로 선택한 노드집합에 Pod 배포
### Chapter 03. Pod 복제와 배포에 날개달기
- Ch03_01. ReplicaSet 소개
- Ch03_02. [실습] ReplicaSet – Pod 복제를 위해 태어난 ReplicaSet
- Ch03_03. [실습] ReplicaSet – Pod 종료 시 ReplicaSet 행동 실험
- Ch03_04. [실습] ReplicaSet – Pod Template 변경
- Ch03_05. [실습] ReplicaSet – 손쉽게 Pod 개수 조정
- Ch03_06. [실습] ReplicaSet – Pod Template 이미지 변경을 통한 롤백
- Ch03_07. Deployment 소개
- Ch03_08. [실습] Deployment – Pod 배포를 손쉽게
- Ch03_09. [실습] Deployment – 개발할 땐 Recreate 배포
- Ch03_10. [실습] Deployment – 운영할 땐 안정적인 RollingUpdate 배포
- Ch03_11. [실습] Deployment – Revision과 Annotation을 활용한 Pod 롤백
### Chapter 04. 쿠버네티스로 서비스 운영하기
- Ch04_01. Service 소개
- Ch04_02. [실습] Service - ClusterIP 서비스로 Pod 노출하는 방법
- Ch04_03. [실습] Service - NodePort 서비스로 Pod 노출하는 방법 
- Ch04_04. [실습] Service - LoadBalancer 서비스로 Pod 노출하는 방법
- Ch04_05. Ingress와 IngressController 소개
- Ch04_06. [실습] Ingress - 여러 Service를 단일 IP로 노출하는 방법
- Ch04_07. [실습] Pod livenessProbe와 컨테이너 재시작
- Ch04_08. [실습] 준비된 Pod으로 로드밸런싱 (readinessProbe)
- Ch04_09. [실습] ConfigMap으로 App 설정파일을 외부화
- Ch04_10. [실습] Secret으로 민감 데이터 관리하기
### Chapter 05. 쿠버네티스 도전
- Ch05_01. [실습] 미션 6가지로 완성해보는 쿠버네티스 기본
