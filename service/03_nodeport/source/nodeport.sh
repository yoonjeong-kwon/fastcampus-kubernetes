# NodePort 타입의 order 서비스 생성, ClusterIP 타입의 payment 서비스 생성

# snackbar 네임스페이스의 project=snackbar 레이블을 가진 모든 리소스 조회 - Service의 NodePort 확인

# snackbar 네임스페이스의 project=snackbar 레이블을 갖는 모든 Service 리소스 상세 조회

# snackbar 네임스페이스의 Service Endpoints 조회 

# ClusterIP:NodePort로는 로컬머신에서 접근 불가

# GCP 포트 허용 정책 설정 - order 서비스의 NodePort에 대한 방화벽 해제 
gcloud compute firewall-rules create order --allow tcp:<node-port>

# 프로젝트가 설정되어 있지 않다고 메시지가 뜨는 경우
gcloud config set project <project-id>

# 노드 IP 조회 - 노드 External IP 복사

# 노드 External IP와 order 서비스의 NodePort를 ORDER 환경변수로 설정
export ORDER=<node-external-ip>:<node-port>

# ORDER 환경변수 이용해서 메뉴판 조회 (/menus)
curl http://$ORDER/menus

# ORDER 환경변수 이용해서 주문 요청 (/order)
curl --request POST http://$ORDER/order \
--header 'Content-Type: application/json' \
--data-raw '{
    "Pizza": 1,
    "Coke": 1,
    "Burger": 0,
    "Juice": 0
}'

# GCP 포트 허용 정책 조회
gcloud compute firewall-rules list

# GCP 포트 허용 정책 제거
gcloud compute firewall-rules delete order

# snackbar 네임스페이스의 project=snackbar 레이블을 가진 모든 리소스 제거 