# Pod 생성 (networking-blue-green.yaml, networking-red.yaml)

# Pod 실행 및 IP 확인

# 컨테이너 IP 확인 (ifconfig eth0)

# 컨테이너 실행 로그 확인

# 컨테이너에 설정된 환경변수 POD_IP NAMESPACE NODE_NAME 확인 (printenv)

# blue-app 컨테이너 -> green-app 컨테이너 /tree, /hello 요청 실행

# green-app 컨테이너 -> blue-app 컨테이너 /sky, /hello 요청 실행

# blue-app 컨테이너 -> red-app 컨테이너 /rose, /hello 요청 실행
# -- red-app POD IP를 로컬 환경변수로 설정 (-o jsonpath="{.status.podIP}")

# red-app 컨테이너 -> blue-app 컨테이너 /sky, /hello 요청 실행
# -- blue-app POD IP를 로컬 환경변수로 설정 (-o jsonpath="{.status.podIP}")

# 포트포워딩을 통해 웹브라우저로 각 컨테이너 요청/응답 확인
# -- 컨테이너 포트: blue-app 8080, green-app 8081, red-app 8080

# Pod 종료