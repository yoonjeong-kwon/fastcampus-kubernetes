# Pod 생성: kubectl apply –f <yaml 파일 경로>
kubectl apply -f hello-app-1.yaml
kubectl apply -f rose-app-1.yaml
kubectl apply -f sky-app-1.yaml
kubectl apply -f tree-app-1.yaml
kubectl apply -f tree-app-2.yaml

# Label 확인 (--show-labels, -L)
kubectl get pods --show-labels
kubectl get pod -L group,concept,position,version,element

# Label 추가 - concept, position, version (kubectl label)
kubectl label pod hello-app-1 version=v1
kubectl label pod rose-app-1 concept=flower element=rose position=bottom version=v1
kubectl label pod sky-app-1 concept=earth element=sky position=top version=v1
kubectl label pod tree-app-1 concept=earth element=tree position=bottom version=v1
kubectl label pod tree-app-2 concept=earth element=tree position=bottom version=v1

# Label 확인 (--show-labels, -L)
kubectl get pod -L group,concept,position,version

# Selector로 파드 집합 조회 (--selector or -l), group/concept/position/version 레이블 함께 출력
# -- group=nature 레이블을 가진 모든 파드 조회
kubectl get pod --selector group=nature -L group,concept,element,position,version
# -- concept가 flower이거나 earth인 모든 파드 조회 
kubectl get pod --selector 'concept in (flower,earth)' -L group,concept,element,position,version
# -- concept 레이블이 없는 모든 파드 조회 (! 이용)
kubectl get pod --selector '!concept' -L group,concept,element,position,version
# -- concept 레이블이 없는 모든 파드 조회 (notin 이용)
kubectl get pod --selector 'concept notin (earth, flower)' -L group,concept,element,position,version
# -- 물을 주어야 하는 group=nature 레이블을 가진 모드 파드 조회 (position=bottom)
kubectl get pod --selector group=nature,position=bottom -L group,concept,element,position,version
# -- 손이 닿지 않는 group=nature 레이블을 가진 파드의 IP 조회 (position=top)
kubectl get pod --selector group=nature,position=top -L group,concept,element,position,version
kubectl get pod --selector group=nature,position!=bottom -L group,concept,element,position,version

# Label 변경
# -- element=tree 레이블을 가진 모든 파드를 concept=mountain 레이블로 변경
kubectl label pod tree-app-1 concept=mountain --overwrite
kubectl label pod tree-app-2 concept=mountain --overwrite

# Label 확인 (--show-labels, -L)
kubectl get pod -L group,concept,element,position,version

# Label 삭제
# -- 파드 hello-app-1의 version 레이블 삭제
kubectl label pod hello-app-1 version-

# Label 확인 (--show-labels, -L)
kubectl get pod hello-app-1 -L group,concept,element,position,version

# 레이블을 이용한 Pod 집합 종료
kubectl delete pod -l group

