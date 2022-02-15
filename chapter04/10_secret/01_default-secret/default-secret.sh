
# 쿠버네티스에서 기본적으로 설정되어 있는 Default Secret 확인
kubectl get secret
kubectl get secret default-token-kjfvl -o yaml  # 값 3개가 모두 암호화 되어 있음 (Base64로 인코딩)


# 모든 컨테이너에 Default Secret이 마운트되어 있음을 확인
kubectl describe pod web-server

# 컨테이너 접속
kubectl exec -it web-server -- sh
# 마운트 경로 확인
ls /var/run/secrets/kubernetes.io/serviceaccount
cat /var/run/secrets/kubernetes.io/serviceaccount/ca.crt     # 암호화되어 있지 않음
cat /var/run/secrets/kubernetes.io/serviceaccount/namespace  # 암호화되어 있지 않음
cat /var/run/secrets/kubernetes.io/serviceaccount/token      # 암호화되어 있지 않음

# web-server 컨테이너에서 API Server로 호출해보기
# 모든 파드가 생성될 때 kubernetes 서비스 엔드포인트를 컨테이너 환경변수로 설정한다. 따라서 web-server 컨테이너가 API Server 주소를 알고 있다
kubectl get svc kubernetes
env | grep KUBERNETES

# API Server로 요청 실행하기 - curl이 서버 인증서를 확인하는 과정을 실행한다 (예. 신뢰할 수 있는 웹사이트인지 확인하는 것과 동일)
curl -sv https://kubernetes
# * TLSv1.3 (OUT), TLS alert, unknown CA (560):
# } [2 bytes data]
# * SSL certificate problem: unable to get local issuer certificate
# * Closing connection 0

# curl이 서버에서 보낸 인증서가 신뢰할 수 있는 CA기관에서 서명한 인증서임을 확인, But 403에러. API Server가 curl 클라이언트 신원을 확인할 수 없음. 접근 권한을 부여하지 못함
curl --cacert /var/run/secrets/kubernetes.io/serviceaccount/ca.crt -sv https://kubernetes

# API Server에 요청할 때 인증 토큰, 사용자 이름/암호, 클라이언트 인증서를 이용해서 신원을 제공해야함, 서버에 인증 토큰으로 신원 확인 요청 
export AUTH_TOKEN=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)
curl --cacert /var/run/secrets/kubernetes.io/serviceaccount/ca.crt -H "Authorization: Bearer $AUTH_TOKEN" https://kubernetes

# 그러나 API Server에 해당 클라이언트에 대한 권한을 부여하지 않았기 때문제 접근 불가. 
# 쿠버네티스는 리소스에 접근을 세부적으로 제어하기 위한 방법들을 제공 https://kubernetes.io/ko/docs/reference/access-authn-authz/authorization/#authorization-modules
# 테스트를 위해 모든 클라이언트에게 클러스터 관리자 권한을 부여하도록 만듦
kubectl create clusterrolebinding test-cluster-role --clusterrole=cluster-admin --group=system:serviceaccounts
