kubectl delete ingress snackbar -n order
kubectl delete service order -n order
kubectl delete service payment -n order
kubectl delete service delivery -n order
kubectl delete deployment order -n order 
kubectl delete deployment payment -n payment 
kubectl delete deployment delivery -n delivery 

# kubectl apply -f service/
# kubectl apply -f deployment/
# kubectl apply -f ingress/