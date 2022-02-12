# app=blue-app 레이블을 가진 단독 팟 생성
kubectl apply -f blue-app.yaml

# Pod 생성 확인
kubectl get pod

# ReplicaSet 생성
kubectl apply -f replicaset.yaml

# ReplicaSet과 Pod Template 확인
kubectl get rs blue-replicaset -o wide

# Pod 생성 확인
kubectl get pod

# ReplicaSet의 Pod 생성 기록 확인 (kubectl describe)
kubectl describe rs blue-replicaset

# ReplicaSet 삭제
kubectl delete rs/blue-replicaset 