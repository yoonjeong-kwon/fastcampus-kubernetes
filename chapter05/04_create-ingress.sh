# 1. ingress 생성
# 1-1. name: snackbar, namespace: order, host: order.fast-snackbar.com, pathType: Prefix, path: "/", service name: order-app, port.number: 80
kubectl apply -f ingress/ingress-snackbar.yaml

# 1-2. 생성한 Ingress 리소스 확인
kubectl get ingress snackbar -n order

# 1-3. Ingress Address 확인
kubectl get ingress snackbar -n order -o jsonpath="{.status.loadBalancer.ingress[0].ip}"

# 1-4. 주문 결제 요청 - order.fast-snackbar.com/checkout 응답 확인
export INGRESS_IP=$(kubectl get ingress snackbar -n order -o jsonpath="{.status.loadBalancer.ingress[0].ip}")

curl -H "Host: order.fast-snackbar.com" --request POST $INGRESS_IP/checkout \
--header 'Content-Type: application/json' \
--data-raw '{
    "Pizza": 1,
    "Burger": 2,
    "Coke": 0,
    "Juice": 0
}'

# 1-5. 주문 메뉴 조회 - order.fast-snackbar.com/menus 응답 확인
curl -H "Host: order.fast-snackbar.com" --request GET $INGRESS_IP/menus

# 1-6. 주문 상세 조회 - order.fast-snackbar.com/detail 응답 확인
curl -H "Host: order.fast-snackbar.com" --request GET $INGRESS_IP/detail