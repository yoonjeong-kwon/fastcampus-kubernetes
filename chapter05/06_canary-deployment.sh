# 1. order 1.0과 2.0 버전의 파드가 모두 트래픽을 받을 수 있도록 order-app 서비스 오브젝트의 selector: version을 제거
kubectl apply -f service/06_service-canary.yaml

# 2. 초기상태 - order-1.0 디플로이먼트 replicas를 10으로 조정, order-2.0 디플로이먼트 replicas를 0으로 조정
kubectl scale deployment order-1.0 -n order --replicas=10
kubectl scale deployment order-2.0 -n order --replicas=0

# 3. 주문 홈 - order.fast-snackbar.com 응답 확인
kubectl port-forward service/order-app 8080:80 -n order
curl -sv -H "Host: order.fast-snackbar.com" --request GET $INGRESS_IP

# 4. order 2.0 버전의 파드를 사용자에게 노출하고 싶은 만큼 replicas 조정, order 1.0 버전의 파드를 그만큼 감소
kubectl scale deployment order-2.0 -n order --replicas=2
kubectl scale deployment order-1.0 -n order --replicas=8
kubectl get deployment -n order

## 주문 홈 - order.fast-snackbar.com 응답 확인
for i in {1..10};
do curl -sv -H "Host: order.fast-snackbar.com" --request GET $INGRESS_IP
done

# 5. order 2.0 버전의 파드를 사용자에게 노출하고 싶은 만큼 replicas 조정, order 1.0 버전의 파드를 그만큼 감소
kubectl scale deployment order-2.0 -n order --replicas=4
kubectl scale deployment order-1.0 -n order --replicas=6
kubectl get deployment -n order

## 주문 홈 - order.fast-snackbar.com 응답 확인
for i in {1..10};
do curl -sv -H "Host: order.fast-snackbar.com" --request GET $INGRESS_IP
done

# 6. order 2.0 버전의 파드를 사용자에게 노출하고 싶은 만큼 replicas 조정, order 1.0 버전의 파드를 그만큼 감소
kubectl scale deployment order-2.0 -n order --replicas=6
kubectl scale deployment order-1.0 -n order --replicas=4
kubectl get deployment -n order

## 주문 홈 - order.fast-snackbar.com 응답 확인
for i in {1..10};
do curl -sv -H "Host: order.fast-snackbar.com" --request GET $INGRESS_IP
done

# 6. order 2.0 버전의 파드를 사용자에게 노출하고 싶은 만큼 replicas 조정, order 1.0 버전의 파드를 그만큼 감소
kubectl scale deployment order-2.0 -n order --replicas=10
kubectl scale deployment order-1.0 -n order --replicas=0
kubectl get deployment -n order

## 주문 홈 - order.fast-snackbar.com 응답 확인
for i in {1..10};
do curl -sv -H "Host: order.fast-snackbar.com" --request GET $INGRESS_IP
done