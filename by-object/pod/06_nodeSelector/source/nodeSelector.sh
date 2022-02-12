# 노드 목록과 레이블 확인

# 노드에 Label 추가
# -- 첫번째, 세번째 노드에 soil=moist
# -- 두번째 노드에 soil=dry

# soil 노드 레이블 확인

# Pod 생성 (kubectl run <pod-name> --labels="" --image= --port= --overrides='{"key": {"key": {"key": "value"}}}')
# apiVersion: v1
# kind: Pod
# metadata:
#   name: tree-app-1
#   labels:
#     element: tree
# spec:
#   nodeSelector:
#     soil: moist
#   containers:
#   - name: tree-app
#     image: yoonjeong/green-app:1.0
#     ports:
#     - containerPort: 8081
for i in {1..5}; 
do # 이곳에 kubectl 작성
done

# Pod이 배포된 노드 확인

# element=tree 레이블을 가진 모든 파드 삭제
