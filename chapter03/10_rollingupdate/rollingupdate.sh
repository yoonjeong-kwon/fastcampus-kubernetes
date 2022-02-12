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
# Recreate로 배포 시 ReplicaSet 변화와 비교
# NAME                DESIRED   CURRENT   READY   AGE
# my-app-5cf9bb6d65   3         0         0       0s
# my-app-5cf9bb6d65   3         0         0       0s
# my-app-5cf9bb6d65   3         3         0       0s
# my-app-5cf9bb6d65   3         3         1       10s
# my-app-5cf9bb6d65   3         3         2       12s
# my-app-5cf9bb6d65   3         3         3       12s
# my-app-5cf9bb6d65   0         3         3       4m6s
# my-app-5cf9bb6d65   0         3         3       4m6s
# my-app-5cf9bb6d65   0         0         0       4m6s
# my-app-5bc87cc67f   3         0         0       0s
# my-app-5bc87cc67f   3         0         0       1s
# my-app-5bc87cc67f   3         3         0       1s
# my-app-5bc87cc67f   3         3         1       12s
# my-app-5bc87cc67f   3         3         2       15s
# my-app-5bc87cc67f   3         3         3       15s