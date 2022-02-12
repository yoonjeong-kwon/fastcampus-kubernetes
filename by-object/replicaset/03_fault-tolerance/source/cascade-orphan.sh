# ReplicaSet 삭제

# ReplicaSet과 Pod 목록 확인

# ReplicaSet 배포

# Pod의 Owner 정보 확인
kubectl get pod <pod-name> -o jsonpath="{.metadata.ownerReferences[0].name}"

# ReplicaSet만 삭제 (--cascade)

# Pod의 Owner 정보 확인
kubectl get pod <pod-name> -o jsonpath="{.metadata.ownerReferences[0].name}"

# ReplicaSet의 Pod Template과 Pod 목록 확인

# ReplicaSet의 replicas를 2로 변경 후 재배포

# ReplicaSet과 Pod 목록 확인

# ReplicaSet 이벤트 확인

# Pod의 Owner 정보 확인
kubectl get pod <pod-name> -o jsonpath="{.metadata.ownerReferences[0].name}"

# ReplicaSet 삭제