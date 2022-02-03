# DNS 서버를 이용해서 Service 이름으로 Service 호출

# snackbar 네임스페이스 생성
kubect create namespace snackbar

# Service, Deployment 배포 (service-clusterip.yaml)
kubectl apply -f service-clusterip.yaml

# snackbar 네임스페이스의 모든 리소스 조회
kubectl get all -n snackbar

# ‘payment’ 서비스 이름으로 order 컨테이너에서 payment 파드 요청/응답 확인 (서비스 포트: 80)

# snackbar 네임스페이스에 있는 order 컨테이너의 /etc/hosts 확인

# kube-system 네임스페이스의 모든 kube-dns 리소스 조회
kubectl get all -n kube-system | grep kube-dns

# snackbar 네임스페이스의 order 컨테이너 쉘 접속

# DNS 서버 설정 확인 
# - nameserver: 컨테이너에서 사용할 DNS 서버 주소
# - search: 클러스터 내에서 사용할 도메인 접미사 정의
# - svc.cluster.local: 모든 클러스터 로컬 서비스 이름에 사용되는 도메인 접미사
# - FQDN(fully qualified domain name): <서비스이름>.<네임스페이스>.svc.cluster.local
# - FQDN으로 DNS Server에서 Service IP를 조회한다

# FQDN으로 Payment 서비스 호출 

# 클러스터 접미사(svc.cluster.local)를 제거하고 Payment 서비스 호출

# 서비스 이름만으로 Payment 서비스 호출
