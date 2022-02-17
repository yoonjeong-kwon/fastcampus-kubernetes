# 인증서와 private key를 Secret에 저장하기
# 자체 서명한 인증서 도메인 - www.fastcampus-kubernetes.com

# Secret 타입 - 기본 generic or TLS 클라이언트나 서버를 위한 데이터 kubernetes.io/tls
kubectl create secret generic tls-config --from-file=secrets/https.cert --from-file=secrets/https.key

# tls-config 라는 Secret 조회 
kubectl get secret tls-config -o yaml
# https.cert 값을 디코딩 해보기 - https://www.base64decode.org/

# nginx 컨테이너가 https 트래픽을 처리할 수 있도록 TLS 인증서와 private key의 위치를 알려주어야 함 - server.conf 설정
# 1. configs/server.conf 파일 확인
# 2. nginx-config라는 ConfigMap을 configs 디렉토리로부터 생성
# 3. nginx-config 라는 ConfigMap을 app-config라는 Pod 볼륨으로 선언
# 4. nginx 컨테이너에서 app-config 볼륨을 /etc/nginx/conf.d 경로로 마운트 
kubectl create configmap nginx-config --from-file=configs

# nginx-config라는 ConfigMap 확인 
kubectl get configmap nginx-config -o yaml

# web-server.yaml 파일에서 ConfigMap 볼륨 확인 

# web-server.yaml 파일에 Secret 볼륨 선언
# 1. tls-config 라는 Secret을 tls 라는 Pod 볼륨으로 선언
# 2. nginx 컨테이너에서 tls 볼륨을 /etc/nginx/tls 경로로 마운트
# volumeMounts:
# - name: tls
#     mountPath: /etc/nginx/tls

# nginx 파드, my-app 파드와 서비스 생성 
kubectl apply -f web-server.yaml

# 생성한 파드 확인
kubectl get pod

# www.fastcampus-kubernetes.com 도메인 요청을 위한 /etc/hosts 파일 수정
127.0.0.1 www.fastcampus-kubernetes.com

# nginx 웹서버 컨테이너 포트포워딩 8443:443 
kubectl port-forward web-server 8443:443

# https 요청 전송 - curl이 서버 인증서를 확인하는 과정을 실행한다
curl -sv https://www.fastcampus-kubernetes.com:8443/myapp
# 결과 - unknown CA
# * TLSv1.2 (OUT), TLS alert, unknown CA (560):
# * SSL certificate problem: self signed certificate
# * Closing connection 0

# curl 클라이언트가 nginx 서버로부터 받은 인증서를 신뢰할 수 있도록 자체 서명한 인증서(secrets/https.cert)를 서버 인증서 검증에 사용하도록 설정
curl --cacert secrets/https.cert -sv https://www.fastcampus-kubernetes.com:8443/myapp
# 결과 - 정상 응답
# * Server certificate:
# *  subject: CN=www.fastcampus-kubernetes.com
# *  start date: Feb 17 14:22:37 2022 GMT
# *  expire date: Feb 15 14:22:37 2032 GMT

# Welcome to Version 1!
# ===== Host Info =====
# HostIP: 10.4.1.86

# 컨테이너의 마운팅 경로 /etc/nginx/conf.d, /etc/nginx/tls 확인
kubectl exec web-server -c nginx -- ls /etc/nginx/conf.d
kubectl exec web-server -c nginx -- ls /etc/nginx/tls
kubectl exec web-server -c nginx -- cat /etc/nginx/tls/https.cert # Base64 디코딩 

# 파드 삭제
kubectl delete pod web-server
kubectl delete pod my-app
kubectl delete svc my-app
kubectl delete configmap nginx-config
kubectl delete secret tls-config