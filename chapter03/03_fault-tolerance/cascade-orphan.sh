# ReplicaSet 삭제
kubectl delete rs blue-replicaset

# ReplicaSet과 Pod 목록 확인
kubectl get rs
kubectl get pod

# ReplicaSet 배포
kubectl apply -f replicaset.yaml

# Pod의 Owner 정보 확인
kubectl get pod <pod-name> -o jsonpath="{.metadata.ownerReferences[0].name}"

# ReplicaSet만 삭제 (orphan: 고아 전략)
kubectl delete rs blue-replicaset --cascade=orphan

# ReplicaSet과 Pod 목록 확인
kubectl get rs
kubectl get pod

# Pod의 Owner 정보 확인
kubectl get pod <pod-name> -o jsonpath="{.metadata.ownerReferences[0].name}"

# ReplicaSet의 replicas를 2로 변경 후 재배포
kubectl apply -f replicaset.yaml

# ReplicaSet의 Pod Template과 Pod 목록 확인
kubectl get rs blue-replicaset -o wide
kubectl get pod

# ReplicaSet 이벤트 확인
kubectl describe rs blue-replicaset

# Pod의 Owner 정보 확인
kubectl get pod <pod-name> -o jsonpath="{.metadata.ownerReferences[0].name}"

# ReplicaSet 삭제
kubectl delete rs/blue-replicaset 