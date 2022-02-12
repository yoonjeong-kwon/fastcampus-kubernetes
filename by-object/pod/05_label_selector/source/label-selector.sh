# Pod 생성: kubectl apply –f <yaml 파일 경로>

# Label 확인 (--show-labels, -L)

# Label 추가 - concept, position, version (kubectl label)

# Label 확인 (--show-labels, -L)

# Selector로 파드 집합 조회 (--selector or -l), group/concept/position/version 레이블 함께 출력
# -- group=nature 레이블을 가진 모든 파드 조회

# -- concept가 flower이거나 earth인 모든 파드 조회 

# -- concept 레이블이 없는 모든 파드 조회 (! 이용)

# -- concept 레이블이 없는 모든 파드 조회 (notin 이용)

# -- 물을 주어야 하는 group=nature 레이블을 가진 모드 파드 조회 (position=bottom)

# -- 손이 닿지 않는 group=nature 레이블을 가진 파드의 IP 조회 (position=top, position!=bottom)

# Label 변경
# -- element=tree 레이블을 가진 모든 파드를 concept=mountain 레이블로 변경

# Label 확인 (--show-labels, -L)

# Label 삭제
# -- 파드 hello-app-1의 version 레이블 삭제

# Label 확인 (--show-labels, -L)
# -- 파드 hello-app-1의 레이블 확인

# group 레이블을 가진 모든 파드를 종료
kubectl delete pod -l group

