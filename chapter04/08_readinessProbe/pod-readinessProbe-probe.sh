# LoadBalancer 타입의 서비스 생성
kubectl apply -f service.yaml

# 서비스 ExternalIP 확인
kubectl get svc -w

# 서비스 엔드포인트를 환경변수 SERVICE로 저장
export SERVICE=$(kubectl get svc myapp -o jsonpath="{.status.loadBalancer.ingress[0].ip}")

# healthy, unhealthy 파드 생성 
kubectl apply -f pod-readinessProbe-probe.yaml

# 서비스 엔드포인트를 관찰
kubectl get endpoints -w

# 파드 READY를 관찰, 몇 초가 흐른 뒤...
kubectl get pod -o wide -w

# Pod 이벤트를 확인하여 문제 원인 확인
## Events
## 파드 Conditions
#   Type              Status
#   Initialized       True 
#   Ready             False 
#   ContainersReady   False 
#   PodScheduled      True 
kubectl describe pod/unhealthy

# 서비스 엔드포인트로 요청 실행
for i in {0..5};
do curl -v $SERVICE;
done

# unhealthy 파드에 접속하여 /var/ready 디렉토리 생성
kubectl exec -it unhealthy -- mkdir /var/ready 

# 서비스 엔드포인트, 파드 READY 상태를 관찰

# 서비스, 파드 삭제
kubectl delete all -l app=myapp