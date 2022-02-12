# ReplicaSet 생성
kubectl apply -f replicaset.yaml

# ReplicaSet과 Pod Template 확인
kubectl get rs blue-replicaset -o wide

# 생성된 Pod 목록과 배포된 노드 확인
kubectl get pod -o wide

# ReplicaSet의 Pod 생성 기록 확인 (kubectl describe)
kubectl describe rs blue-replicaset

# ReplicaSet의 Pod 생성 이후 과정 확인 (kubectl get events --sort-by=.metadata.creationTimestamp)
kubectl get events --sort-by=.metadata.creationTimestamp

# 포트포워딩 8080 -> 8080 (ReplicaSet에 의해 생성된 파드로 트래픽 전달)
kubectl port-forward rs/blue-replicaset 8080:8080 

# Pod로 요청 실행해보기 
curl -vs localhost:8080/hello
curl -vs localhost:8080/sky

# ReplicaSet 삭제
kubectl delete rs/blue-replicaset 