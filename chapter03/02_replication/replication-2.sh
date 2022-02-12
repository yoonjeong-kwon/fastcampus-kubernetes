# ReplicaSet 목록 조회 (Watch 모드)
kubectl get rs -w

# Pod 목록 조회 (Watch 모드)
kubectl get pod -w 

# app=blue-app 레이블을 가진 단독 팟 생성
kubectl apply -f blue-app.yaml

# ReplicaSet의 Pod 생성 기록 확인 (kubectl describe)
kubectl describe rs blue-replicaset

# ReplicaSet 삭제
kubectl delete rs/blue-replicaset 