# a, b, c 명령어를 미리 실행하고 출력 결과 관찰하기  

# Deployment 생성
kubectl apply -f deployment.yaml

# Deployment의 ReplicaSet 이벤트 확인
kubectl describe deployment/my-app

# Deployment의 Pod Template에 레이블을 추가하고 재배포
# -- deployment.yaml에 주석 해체 
kubectl apply -f deployment.yaml

# Deployment의 ReplicaSet 이벤트 확인
kubectl describe deployment/my-app

# a. ReplicaSet이 생성하는 Pod 상태 변화 확인 (Watch 모드)
kubectl get rs -w

# b. Deployment를 통해 생성한 Pod 상태 변화 확인 (Watch 모드)
kubectl get deployment -w

# c. Deployment 배포 진행중/완료 상태 확인
kubectl rollout status deployment/my-app

# Old ReplicaSet의 Pod 이벤트 
kubectl describe rs/<old-replicaset-name>

# New ReplicaSet의 Pod 이벤트 
kubectl describe rs/<new-replicaset-name>

# Deployment를 통해 생성한 Pod으로 요청 전달 & 응답 확인
kubectl port-forward deployment/my-app 8080:8080

# 모든 리소스를 레이블로 삭제 
kubectl delete all -l app=my-app