# Pod replicas 1 -> 3으로 늘리기

# ReplicaSet 생성 
kubectl apply -f replicaset.yaml

# Pod과 레이블 확인 
kubectl get pod --show-labels

# ReplicaSet Pod Template label 변경 
# - tier: backend 추가
kubectl apply -f replicasset.yaml

# Pod과 레이블 확인 
kubectl get pod --show-labels

# ReplicaSet과 Pod Template 확인 
kubectl get rs myapp-replicaset -o wide

# ReplicaSet의 replicas 변경 
kubectl scale rs myapp-replicaset --replicas=3

# ReplicaSet과 Pod Template 확인 
kubectl get rs myapp-replicaset -o wide

# Pod과 레이블 확인 (변경한 Pod Label로 생성됨)
kubectl get pod --show-labels

# ReplicaSet 이벤트 확인
kubectl describe rs myapp-replicaset

# Pod replicas 3 -> 1로 줄이기 
# ReplicaSet의 replicas 변경 
kubectl scale rs myapp-replicaset --replicas=1

# ReplicaSet 이벤트 확인
kubectl describe rs myapp-replicaset

# ReplicaSet 스케일 조정
kubectl scale rs myapp-replicaset --replics=0

# ReplicaSet 삭제
kubectl delete rs/myapp-replicaset