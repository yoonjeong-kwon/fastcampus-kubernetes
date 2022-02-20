# LoadBalancer 타입의 order 서비스 생성, ClusterIP 타입의 payment 서비스 생성
kubectl apply -f service.yaml

# snackbar 네임스페이스의 project=snackbar 레이블을 가진 모든 리소스 조회 - Service의 ExternalIP와 NodePort 확인
kubectl get all -l project=snackbar -n snackbar

# snackbar 네임스페이스의 project=snackbar 레이블을 갖는 모든 Service 리소스 상세 조회
kubectl get svc -l project=snackbar -n snackbar -o wide

# snackbar 네임스페이스의 Service Endpoints 조회 
kubectl get endpoints -n snackbar

# order 서비스의 External IP를 ORDER 환경변수로 설정
export ORDER=<service-external-ip>

# ORDER 환경변수 이용해서 메뉴판 조회 (/menus)
curl http://$ORDER/menus

# ORDER 환경변수 이용해서 주문 요청 (/checkout)
curl --request POST http://$ORDER/checkout \
--header 'Content-Type: application/json' \
--data-raw '{
    "Pizza": 1,
    "Burger": 2,
    "Coke": 0,
    "Juice": 0
}'

# snackbar 네임스페이스의 project=snackbar 레이블을 가진 모든 리소스 제거 
kubectl delete all -l project=snackbar -n snackbar