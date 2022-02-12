# ReplicaSet이 생성하는 Pod 상태 변화 확인을 위해 실행 해놓기 
kubectl get rs - w

# Deployment 생성

# Deployment 배포 진행중/완료 상태 확인

# app=my-app 레이블을 가지는 모든 리소스를 레이블과 함께 자세한 정보 조회
kubectl get all -l app=my-app -o wide --show-labels

# ReplicaSet을 yaml 형식으로 조회
kubectl get rs/<replicaset-name> -o yaml

# Deployment의 컨테이너 이미지와 레이블 변경 후 재배포
# -- 레이블 version=v2 변경, 이미지 1.0 -> 2.0 변경
kubectl apply -f deployment.yaml

# Deployment의 ReplicaSet 이벤트 확인 (배포가 완료 되었을 때)

# ReplicaSet이 생성하는 Pod 상태 변화 확인 (Watch 모드)

# Deployment를 통해 생성한 Pod으로 요청 전달 & 응답 확인

# 모든 리소스를 레이블로 삭제 