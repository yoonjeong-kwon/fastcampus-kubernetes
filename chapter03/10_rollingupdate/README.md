# Deployment로 배포할 때 RollingUpdate 전략 이해

1. Depeloyment로 1.0 버전의 파드를 RollingUpdate 전략으로 배포
2. Deployment의 Pod 템플릿 이미지를 2.0으로 변경 후 배포
3. 배포하는 과정에서 ReplicaSet의 Desired 수 관찰 (Recreate과 비교)