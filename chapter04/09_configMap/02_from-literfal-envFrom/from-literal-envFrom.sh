# 리터럴 방식으로 ConfigMap 생성하고 파드 컨테이너 환경변수로 전달하기 (envFrom)

# hello-app 파드 선언 시 envFrom 속성을 사용해서 greeting-config라는 ConfigMap 참조 
# 환경변수: 1) STUDENT_NAME, 2) MESSAGE, 3) GREETING(STUDENT_NAME과 MESSAGE 조합)

# envFrom:
# - configMapRef:
#     name: greeting-config
# env:
# - name: GREETING
#   value: $(MESSAGE)! $(STUDENT_NAME)

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