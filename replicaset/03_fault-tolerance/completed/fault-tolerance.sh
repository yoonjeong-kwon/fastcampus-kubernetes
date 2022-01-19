# ReplicaSet 생성
kubectl apply -f replicaset.yaml

# ReplicaSet과 Pod Template 확인
kubectl get rs blue-replicaset -o wide

# 생성된 Pod 목록과 배포된 노드 확인
kubectl get pod -o wide

# Pod 제거 
kubectl delete pod <pod-name>

# Pod 목록 확인 
kubectl get pod

# Pod 제거 후 ReplicaSet의 행동 확인
kubectl describe rs blue-replicaset