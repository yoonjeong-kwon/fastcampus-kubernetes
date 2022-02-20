# 1. development, production 클러스터 구성
# 1-1. Google Cloud Platform 콘솔로 이동
# 1-2. development 클러스터에 노드 1개, production 클러스터에 노드 2개를 할당
# 1-3. development, product 클러스터 접속 정보 구성 (kubeconfig) > GKE 콘솔에서 클러스터 목록 > Actions > 연결
## kubeconfig 파일에서 클러스터 접속 정보 확인
kubectl config view 

## kubectlconfig 파일 설정 - 클러스터 API Server 주소, 쿠버네티스 Root CA 인증서, 클러스터 사용자 인증 정책
gcloud auth login
gcloud container clusters get-credentials development --zone us-central1-c --project spatial-path-340502
gcloud container clusters get-credentials production --zone us-central1-c --project spatial-path-340502
kubectl config view

## kubectl 명령어를 요청하면 어떤 클러스터로 전송하는지 확인 
kubectl config current-context

## development 클러스터에 네임스페이스 구성을 위해 development 클러스터 컨텍스트로 전환 
kubectl config use-context gke_spatial-path-340502_us-central1-c_development
kubectl get pod

# 2. development, production 클러스터에 각각 order, payment, delivery 네임스페이스 생성
# 2-1. development 클러스터에 네임스페이스 구성
kubectl config current-context
kubectl create namespace order
kubectl create namespace payment
kubectl create namespace delivery

# 2-2. production 클러스터에 네임스페이스 구성
kubectl config current-context
kubectl config use-context gke_spatial-path-340502_us-central1-c_production
kubectl create namespace order
kubectl create namespace payment
kubectl create namespace delivery

# 3. kubeconfig 파일에 context 이름을 원하는대로 수정
# 3-1. context 이름이 너무 길다. 나만의 이름 부여하기 
vi ~/.kube/config

