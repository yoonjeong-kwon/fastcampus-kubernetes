# ReplicaSet 생성

# ReplicaSet과 Pod Template 확인

# 생성된 Pod 목록과 배포된 노드 확인

# ReplicaSet의 Pod 생성 기록 확인 (kubectl describe)

# ReplicaSet의 Pod 생성 이후 과정 확인 (kubectl get events --sort-by=.metadata.creationTimestamp)
kubectl get events --sort-by=.metadata.creationTimestamp

# 포트포워딩 8080 -> 8080 (ReplicaSet에 의해 생성된 파드로 트래픽 전달)

# ReplicaSet 삭제