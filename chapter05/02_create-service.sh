# order, payment, delivery 애플리케이션 파드 간 통신을 위한 Service 엔드포인트 생성 

# 1. order 서비스 Manifest 파일 작성
# 1-1 service name: order-app, namespace: order, type: NodePort, selector: app=order, service port: 80, container port: 8080
kubectl apply -f service/02_service-nodeport.yaml

# 1-2. order -> payment 네임스페이스의 payment-app 서비스 호출을 위한 Service 생성
# 1-3. order -> delivery 네임스페이스의 delivery-app 서비스 호출을 위한 Service 생성
kubectl apply -f service/02_communicate-another-namespace-service.yaml

# 1-4. order 네임스페이스의 서비스 조회
kubectl get svc -n order
kubectl get endpoints -n order


# 2. payment 서비스 Manifest 파일 작성
# 2-1. service name: payment-app, namespace: payment, type: NodePort, selector: app=payment, service port: 80, container port: 8080
kubectl apply -f service/02_service-nodeport.yaml

# 2-2. payment 서비스 조회
kubectl get svc -n payment
kubectl get endpoints -n payment


# 3. delivery 서비스 Manifest 파일 작성
# 3-1. service name: delivery-app, namespace: delivery, type: NodePort, selector: app=delivery, service port: 80, container port: 8080
kubectl apply -f service/02_service-nodeport.yaml

# 3-2. payment 서비스 조회
kubectl get svc -n delivery
kubectl get endpoints -n delivery