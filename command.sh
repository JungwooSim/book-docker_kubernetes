# Pod list
kubectl get pods

# Create Pod
kubectl apply -f nginx-pod-with-ubuntu.yaml

# Pod describe
# kubectl describe pods {pod name}
kubectl describe pods my-nginx-container

# kubectl log
# kubectl logs {pod name}
kubectl logs my-nginx-container

# delete pod
# kubectl delete pod {pod name}
kubectl delete pod my-nginx-container

# join pod
kubectl exec -it my-nginx-pod -c ubuntu-sidecar-container bash

# get pods
kubectl get po

# get Replicasets
kubectl get rs

# delete replicaset
# kubectl delete rs {replicaset name}
kubectl delete rs replicaset-nginx

# get deployment
kubectl get deploy

# get revision history
kubectl rollout history deployment my-nginx-deployment

# 이전 버전의 replicaset 으로 롤백
kubectl rollout undo deployment my-nginx-deployment --to-revision=1

# revision 정보와 활성화된 정보 확인 가능
kubectl describe deploy my-nginx-deployment

# deployment,pod,rs 모두 삭제
kubectl delete deployment,pod,rs --all