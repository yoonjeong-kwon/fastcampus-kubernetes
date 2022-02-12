# v2 이미지 배포를 위한 ReplicaSet 생성
kubectl apply -f replicaset.yaml

# Pod 목록과 app 레이블 확인
kubectl get pod -L app

# ReplicaSet과 Pod Template 확인
kubectl get rs myapp-replicaset -o wide 

# 포트포워딩 8080 -> 8080 (ReplicaSet에 의해 생성된 파드로 트래픽 전달)
kubectl port-forward rs/myapp-replicaset 8080:8080

# 5번 요청 실행
for i in {0..5};
do curl -vs localhost:8080;
done

# ReplcaSet의 my-app 컨테이너 이미지를 이전 버전(1.0)으로 변경 - 롤백 준비
kubectl set image rs/myapp-replicaset my-app=my-app:1.0

# ReplicaSet과 Pod Template 확인 
kubectl get rs myapp-replicaset -o wide 

# Pod의 Owner 확인
kubectl get pod <pod-name> -o jsonpath="{.metadata.ownerReferneces[0].name}"

# 실행 중인 2.0 버전의 모든 Pod Label 변경
kubectl label pod <pod-name> app=to-be-fixed --overwrite
kubectl label pod <pod-name> app=to-be-fixed --overwrite
kubectl label pod <pod-name> app=to-be-fixed --overwrite

# 레이블을 변경한 Pod의 owner 확인
kubectl get pod <pod-name> -o jsonpath="{.metadata.ownerReferences[0].name}"

# ReplicaSet 확인 (배포 이미지 변경됨)
kubectl get rs myapp-replicaset -o wide 

# Pod 목록 확인
kubectl get pod

# ReplicaSet 이벤트 확인
kubectl describe rs myapp-replicaset

# 포트포워딩 8080 -> 8080 (ReplicaSet에 의해 생성된 파드로 트래픽 전달)
kubectl port-forward rs/myapp-replicaset 8080:8080

# 요청 실행
curl localhost:8080

# ReplicaSet 스케일 0으로 조정
kubectl scale rs/myapp-replicaset --replicas 0

# ReplicaSet 삭제
kubectl delete rs/myapp-replicaset 