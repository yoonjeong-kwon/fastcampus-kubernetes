# Pod 생성
kubectl apply -f hello-app.yaml

# Pod 실행 및 IP 확인
kubectl get pod -o wide
kubectl get pod/hello-app -o json

# 컨테이너 IP 확인
kubectl exec hello-app -- ifconfig eth0
kubectl exec hello-app -- cat /etc/hosts

# 컨테이너에 설정된 환경변수 확인 (env)
kubectl exec hello-app -- env

# 컨테이너가 리스닝하고 있는 포트 확인
kubectl exec hello-app -- netstat -an

# 로컬 포트 포워딩  (8080 -> 8080)
kubectl port-forward hello-app 8080:8080

# HTTP Server 응답 확인  (웹브라우저 or curl)
curl -v localhost:8080

# Pod 종료
kubectl delete pod --all
# kubectl delete pod hello-pod
