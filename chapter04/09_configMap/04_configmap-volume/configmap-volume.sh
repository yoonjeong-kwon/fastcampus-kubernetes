# configs 디렉토리에 nginx 실행을 위한 server.conf 파일 작성

# nginx-config라는 ConfigMap을 configs 디렉토리로부터 생성
kubectl create configmap nginx-config --from-file=configs

# nginx-config라는 ConfigMap 확인 
kubectl get configmap nginx-config -o yaml

# web-server 파드에 ConfigMap을 사용하는 Pod 볼륨 선언
# volumes: # Pod에서 사용할 볼륨 목록 선언 
# - name: app-config  # 컨테이너에서 참조할 볼륨 이름
#   configMap:
#     name: nginx-config  # 참조할 ConfigMap 이름


# web-server 파드에 컨테이너가 ConfigMap 볼륨을 사용하도록 마운팅
# containers:
# - name: nginx
#   image: nginx
#   ports:
#   - containerPort: 80
#   volumeMounts:       # 컨테이너에서 Pod 볼륨 마운트 선언
#   - name: app-config  # 마운팅할 Pod 볼륨 이름
#     mountPath: /etc/nginx/conf.d  # 컨테이너 안에서 마운팅할 경로


# nginx 파드, my-app 파드와 서비스 생성 
kubectl apply -f web-server.yaml

# 생성한 파드 확인
kubectl get pod

# server.conf에 설정한대로 nginx 웹서버가 /myapp 요청을 my-app 컨테이너로 라우팅 하는지 확인 - 포트포워딩 8080:80 
kubectl port-forward web-server 8080:80

# 웹브라우저에서 실행 
localhost:8080/myapp
# Welcome to Version 1!

# ===== Host Info =====
# HostIP: 10.4.1.76
# HostName: nginx

# nginx 접속 로그 확인
kubectl exec web-server -- tail -10f /var/log/nginx/host.access.log

# 컨테이너의 마운팅 경로 /etc/nginx/conf.d에서 ConfigMap 파일 확인 
kubectl exec web-server -c nginx -- ls /etc/nginx/conf.d
kubectl exec web-server -c nginx -- cat /etc/nginx/conf.d/server.conf

# 파드 삭제
kubectl delete pod web-server
kubectl delete pod my-app
kubectl delete svc my-app
kubectl delete configmap nginx-config