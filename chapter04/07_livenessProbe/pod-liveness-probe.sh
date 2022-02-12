# livenessProbe 선언

# 파드 생성 
kubectl apply -f pod-liveness-probe.yaml

# 서비스 엔드포인트를 관찰
kubectl get endpoints -w

# 파드 STATUS와 RESTARTS를 관찰, 몇 초가 흐른 뒤... (CrashLoopBackOff 상태(컨테이너가 반복적으로 실패함)가 되었을 때 엔드포인트에서 제거된다)
kubectl get pod -w

# Pod 이벤트를 확인하여 문제 원인 확인
## State: 현재 컨테이너 실행 상태
## Last State: Terminated - 이전 컨테이너가 실행을 시작한 다음 어떤 이유로 실패해서 종료되었다
## 파드 상태가 CrashLoopBackOff 일 때 Conditions
#   Type              Status
#   Initialized       True 
#   Ready             False 
#   ContainersReady   False 
#   PodScheduled      True 
kubectl describe pod/unhealthy