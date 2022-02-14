# 리터럴 방식으로 ConfigMap 생성하고 파드 컨테이너 환경변수로 전달하기

# ConfigMap 생성
kubectl create configmap greeting-config --from-literal=STUDENT_NAME=권윤정 --from-literal=MESSAGE=안녕

# 생성한 ConfigMap 확인
kubectl get configmap greeting-config -o yaml

# hello-app 파드 선언 시 greeting-config라는 ConfigMap 사용해서 환경변수 설정
# 환경변수: 1) STUDENT_NAME, 2) MESSAGE, 3) GREETING(STUDENT_NAME과 MESSAGE 조합)

# env:
# - name: STUDENT_NAME
#   valueFrom:
#     configMapKeyRef:
#         name: greeting-config    참조할 ConfigMap 이름
#         key: STUDENT_NAME   ConfigMap 데이터 중 사용할 key
# - name: MESSAGE
#     valueFrom:
#     configMapKeyRef:
#         name: greeting-config
#         key: GREETING
# - name: GREETING
#     value: $(MESSAGE)! $(STUDENT_NAME)

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