# 1. order 2.0 버전의 파드 배포
## 1.0 -> 2.0으로 변경
kubectl apply -f deployment/05_deployment-order.yaml

# 2. order-app 서비스 오브젝트의 selector를 2.0으로 변경
kubectl apply -f service/05_service-blue-green.yaml

# 3. 주문 홈 - order.fast-snackbar.com 응답 확인
curl -sv -H "Host: order.fast-snackbar.com" --request GET $INGRESS_IP

# 4. 1.0 버전 정리
# kubectl get rs -n order
# kubectl delete rs/order-1.0-86f867d8c8 -n order
