# 쿠버네티스에서 일어나는 이벤트를 관찰하기 (--sort-by=.metadata.creationTimestamp)
kubectl get events -w

# Deployment 생성
kubectl apply -f deployment.yaml

# Deployment로 배포한 Pod 확인
kubectl get pod

# Deployment 배포 진행중/완료 상태 확인
kubectl rollout status deployment/my-app

# Deployment의 컨테이너 이미지와 레이블 변경 후 재배포
# -- 레이블 version=v2 변경, 이미지 1.0 -> 2.0 변경
kubectl apply -f deployment.yaml

# ReplicaSet이 생성하는 Pod 상태 변화 확인 (Watch 모드)
# kubectl get rs -w 
# 출력창에 결과가 업데잍트될 때마다 kubectl get rs 명령어를 실행하여 출력 결과를 기록
