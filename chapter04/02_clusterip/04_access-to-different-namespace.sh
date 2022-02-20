# fancy-snackbar 네임스페이스 생성
kubectl create namespace fancy-snackbar

# fancy-snackbar 네임스페이스에 Deployment로 delivery 파드 배포, delivery 파드 집합을 위한 Service 배포 
kubectl apply -f service-of-different-namespace.yaml

# 모든 네임스페이스에서 project=snackbar 레이블을 가진 모든 리소스 조회
kubectl get all -l project=snackbar --all-namespaces

# 모든 네임스페이스에서 project=snackbar 레이블을 가진 Service Endpoints 조회 
kubectl get endpoints -l project=snackbar --all-namespaces 

# snackbar 네임스페이스에 order 컨테이너에서 fancy-snackbar 네임스페이스에 있는 delivery 서비스 CluserterIP로 요청 실행 후 응답 확인 
kubectl exec <order-pod> -n snackbar -- curl -s 10.80.13.248

# snackbar 네임스페이스에 order 컨테이너에서 fancy-snackbar 네임스페이스에 있는 delivery 서비스 도메인 이름으로 요청 실행 후 응답 확인 
kubectl exec <order-pod> -n snackbar -- curl -s delivery.fancy-snackbar

# snackbar 네임스페이스에 order 컨테이너에서 환경변수 목록 조회 - fancy-snackbar 네임스페이스의 delivery 서비스 환경변수 확인 
kubectl exec <order-pod> -n snackbar -- env

# 모든 네임스페이스에서 project=snackbar 레이블을 가진 모든 리소스 제거
kubectl delete all -l project=snackbar --all-namespaces 