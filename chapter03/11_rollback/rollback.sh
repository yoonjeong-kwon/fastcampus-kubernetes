# Annotation "kubernetes.io/change-cause" 작성하고 Deployment 생성
kubectl apply -f deployment.yaml

# Deployment 배포 진행중/완료 상태 확인
kubectl rollout status deployment/my-app

# 이미지 1.0 -> 2.0 변경 배포
kubectl set image deployment/my-app my-app=yoonjeong/my-app:2.0

# 배포 변경 사유 작성 "image update to 2.0"
kubectl annotate deployment/my-app kubernetes.io/change-cause="image updated to 2.0"

# Revision 목록 조회
kubectl rollout history deployment/my-app

# Revision 2 상세 조회
kubectl rollout history deployment/my-app --revision=2

# Revision 1로 롤백
kubectl rollout undo deployment/my-app
kubectl rollout undo deployment/my-app --to-revision=1

# Revision 목록 조회
kubectl rollout history deployment/my-app

# 롤백 변경 사유를 작성
kubectl annotate deployment/my-app kubernetes.io/change-cause="rollbacked to 1.0 for a few bugs"