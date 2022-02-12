# snackbar 네임스페이스 생성
kubect create namespace snackbar

# Service, Deployment 배포 (service.yaml)
kubectl apply -f service.yaml

# snackbar 네임스페이스의 모든 리소스 조회
kubectl get all -n snackbar

# snackbar 네임스페이스의 order, payment Service 상세 확인
kubectl get svc order -o wide -n snackbar
kubectl get svc payment -o wide -n snackbar

# snackbar 네임스페이스의 모든 Endpoints 리소스 확인 (kubectl get pod -o wide 조회 후 IP 비교)
kubectl get endpoints -n snackbar

# order Service IP(ClusterIP) 조회 (-o jsonpath="{.spec.clusterIP}")
kubectl get svc order -o jsonpath="{.spec.clusterIP}" -n snackbar

# 로컬에서 Service IP와 Port 호출 확인
curl $(kubectl get svc order -o jsonpath="{.spec.clusterIP}" -n snackbar)