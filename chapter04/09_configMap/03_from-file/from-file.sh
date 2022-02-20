# 파일로부터 ConfigMap을 생성하고 파드 컨테이너 환경변수로 전달하기 (envFrom)

# greeting-config-from-file라는 ConfigMap에 저장할 key와 value를 configs/ 디렉토리에 생성한다
## 환경변수 key: STUDENT_NAME, MESSAGE 
## 환경변수 value: 홍길동, 안녕
## ConfigMap은 파일 이름을 key로, 파일 내용을 value로 설정한다

# hello-app 파드 선언 시 envFrom 속성을 사용해서 greeting-config-from-file라는 ConfigMap 참조 

# envFrom:
# - configMapRef:
#     name: greeting-config-from-file
# env:
# - name: GREETING
#   value: $(MESSAGE)! $(STUDENT_NAME)

# ConfigMap 확인 
kubectl get configmap greeting-config-from-file -o yaml

# hello-app 파드 생성
kubectl apply -f hello-app.yaml

# Pod 확인
kubectl get pod

# 환경변수 GREETING 출력 확인 - 포트포워딩 8080:8080 
kubectl port-forward hello-app 8080:8080

# 웹브라우저에서 실행 
localhost:8080

# 파드 삭제
kubectl delete pod hello-app