# Pod 생성
kubectl apply -f blue-green-app.yaml
kubectl apply -f red-app.yaml

# Pod 실행 및 IP 확인
kubectl get pod -o wide

# 컨테이너 IP 확인 (ifconfig eth0)
kubectl exec blue-green-app -c blue-app -- ifconfig eth0
kubectl exec blue-green-app -c green-app -- ifconfig enth0
kubectl exec red-app -c red-app -- ifconfig eth0

# 컨테이너 실행 로그 확인
kubectl logs blue-green-app -c blue-app
kubectl logs blue-green-app -c green-app
kubectl logs red-app -c red-app

# 컨테이너에 설정된 환경변수 확인 (printenv)
kubectl exec blue-green-app -c blue-app -- printenv POD_IP NAMESPACE NODE_NAME
kubectl exec blue-green-app -c green-app -- printenv POD_IP NAMESPACE NODE_NAME
kubectl exec red-app -c red-app -- printenv POD_IP NAMESPACE NODE_NAME

# blue-app 컨테이너 -> green-app 컨테이너 /tree, /hello 요청 실행
kubectl exec blue-green-app -c blue-app -- curl -vs localhost:8081/tree
kubectl exec blue-green-app -c blue-app -- curl -vs localhost:8081/hello

# green-app 컨테이너 -> blue-app 컨테이너 /sky, /hello 요청 실행
kubectl exec blue-green-app -c green-app -- curl -vs localhost:8080/sky
kubectl exec blue-green-app -c green-app -- curl -vs localhost:8080/hello

# blue-app 컨테이너 -> red-app 컨테이너 /rose, /hello 요청 실행
export RED_POD_IP=$(kubectl get pod red-app -o jsonpath="{.status.podIP}")
echo $RED_POD_IP
kubectl exec blue-green-app -c blue-app -- curl -vs $RED_POD_IP:8080/rose
kubectl exec blue-green-app -c blue-app -- curl -vs $RED_POD_IP:8080/hello

# red-app 컨테이너 -> blue-app 컨테이너 /sky, /hello 요청 실행
export BLUE_POD_IP=$(kubectl get pod blue-green-app -o jsonpath="{.status.podIP}")
echo $BLUE_POD_IP
kubectl exec red-app -- curl -vs $BLUE_POD_IP:8080/sky
kubectl exec red-app -- curl -vs $BLUE_POD_IP:8080/hello

# 포트포워딩을 통해 웹브라우저로 각 컨테이너 요청/응답 확인
kubectl port-forward blue-green-app 8080:8080
kubectl port-forward blue-green-app 8081:8081
kubectl port-forward red-app 8082:8080

# Pod 종료
kubectl delete pod --all