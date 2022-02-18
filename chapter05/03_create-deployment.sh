# order, payment, delivery Deployment로 파드 배포

# 1. 애플리케이션 포트 정의를 위한 ConfigMap 생성
# 1-1. 애플리케이션별 포트 정의 파일 생성 - ORDER_HTTP_PORT: 8080, PAYMENT_HTTP_PORT 8080, DELIVERY_HTTP_PORT 8080
kubectl create configmap port-config -n order --from-file=configs/ORDER_HTTP_PORT 
kubectl create configmap port-config -n payment --from-file=configs/PAYMENT_HTTP_PORT 
kubectl create configmap port-config -n delivery --from-file=configs/DELIVERY_HTTP_PORT 

# 1-2. 각 네임스페이스의 port-config 라는 ConfigMap 조회
kubectl get configmap port-config -n order
kubectl get configmap port-config -n payment
kubectl get configmap port-config -n delivery



# 2. order 디플로이먼트 Manifest 파일 작성
# 2-1. deployment name: order, namespace: order, selector: app=order, image: yoonjeong/snackbar-order:1.0, container port: 8080
# 2-2. env.name: PORT, env.valueFrom.configMapKeyRef
kubectl apply -f deployment/03_deployment-order.yaml

# 2-3. order 디플로이먼트 조회
kubectl get deployment -n order

# 2-4. order-app 서비스 엔드포인트 조회
kubectl get endpoints order-app -n order

# 2-5. order-app 서비스(80)를 통한 order 파드 응답 확인
kubectl port-forward service/order-app 8080:80 -n order
curl localhost:8080

# 2-6. order 파드 컨테이너에 설정된 PORT 환경변수 확인
kubectl get pod -n order
kubectl exec order-7bf8cbdf8c-w4rxp -n order -- printenv PORT



# 3. payment 디플로이먼트 Manifest 파일 작성
# 3-1. deployment name: payment, namespace: payment, selector: app=payment, image: yoonjeong/snackbar-payment:1.0, container port: 8080
# 3-2. env.name: PORT, env.valueFrom.configMapKeyRef
kubectl apply -f deployment/03_deployment-payment.yaml

# 3-3. payment 디플로이먼트 조회
kubectl get deployment -n payment

# 3-4. payment-app 서비스 엔드포인트 조회
kubectl get endpoints payment-app -n payment

# 3-5. payment-app 서비스(80)를 통한 payment 파드 응답 확인
kubectl port-forward service/payment-app 8081:80 -n payment
curl localhost:8081

# 3-6. payment 파드 컨테이너에 설정된 PORT 환경변수 확인
kubectl get pod -n payment
kubectl exec payment-6c79db77f-4fgw7 -n payment -- printenv PORT



# 4. delivery 디플로이먼트 Manifest 파일 작성
# 4-1. deployment name: delivery, namespace: delivery, selector: app=delivery, image: yoonjeong/snackbar-delivery:1.0, container port: 8080
# 4-2. env.name: PORT, env.valueFrom.configMapKeyRef
kubectl apply -f deployment/03_deployment-delivery.yaml

# 4-3. delivery 디플로이먼트 조회
kubectl get deployment -n delivery

# 4-4. delivery-app 서비스 엔드포인트 조회
kubectl get endpoints delivery-app -n delivery

# 4-5. delivery-app 서비스(80)를 통한 payment 파드 응답 확인
kubectl port-forward service/delivery-app 8082:80 -n delivery
curl localhost:8082

# 4-6. delivery 파드 컨테이너에 설정된 PORT 환경변수 확인
kubectl get pod -n delivery
kubectl exec delivery-5c7d87cb9f-pxcl8 -n delivery -- printenv PORT




# 5. 각 파드 컨테이너 안에서 다른 네임스페이스의 다른 파드로 응답 확인 (FQDN 이용)
# 5-1. order 파드 컨테이너 안에서 다른 네임스페이스의 파드로 응답 확인
kubectl exec order-7bf8cbdf8c-w4rxp -n order -- curl -sv payment-app.payment.svc.cluster.local
# *   Trying 10.104.9.47:80...
# * Connected to payment-app.payment (10.104.9.47) port 80 (#0)
# > GET / HTTP/1.1
# > Host: payment-app.payment

# 5-2. payment 파드 컨테이너 안에서 다른 네임스페이스의 파드로 응답 확인
kubectl exec payment-6c79db77f-4fgw7 -n payment -- curl -sv delivery-app.delivery.svc.cluster.local
# *   Trying 10.104.11.107:80...
# * Connected to delivery-app.delivery (10.104.11.107) port 80 (#0)
# > GET / HTTP/1.1
# > Host: delivery-app.delivery

# 5-3. delivery 파드 컨테이너 안에서 다른 네임스페이스의 파드로 응답 확인
kubectl exec delivery-5c7d87cb9f-pxcl8 -n delivery -- curl -sv order-app.order.svc.cluster.local
# *   Trying 10.104.10.159:80...
# * Connected to order-app.order (10.104.10.159) port 80 (#0)
# > GET / HTTP/1.1
# > Host: order-app.order

# 5-4. order 파드 컨테이너 안에서 같은 네임스페이스의 ExternalName 타입 서비스를 이용하여 다른 네임스페이스의 파드 응답 확인
kubectl exec order-7bf8cbdf8c-w4rxp -n order -- curl -sv payment.order.svc.cluster.local
kubectl exec order-7bf8cbdf8c-w4rxp -n order -- curl -sv delivery.order.svc.cluster.local
# 성공한다면, 애플리케이션에서 payment를 도메인 이름으로 요청을 호출할 수 있다! 예. http://payment/receipt

# 5-5. order 컨테이너의 /checkout 엔드포인트를 이용하여 payment 컨테이너의 /receipt 엔드포인트 호출, 응답 확인
curl --request POST http://localhost:8080/checkout \
--header 'Content-Type: application/json' \
--data-raw '{
    "Pizza": 1,
    "Burger": 2,
    "Coke": 0,
    "Juice": 0
}'

# 5-6. order 컨테이너의 /detail 엔드포인트를 이용하여 delivery 컨테이너의 /status 엔드포인트 호출, 응답 확인
curl http://localhost:8080/detail


