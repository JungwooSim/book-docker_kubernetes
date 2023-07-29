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

# get pods detail
kubectl get po -o wide

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

# deployment,pod,rs,svc 모두 삭제
kubectl delete deployment,pod,rs,svc --all

# --image=alicek106/ubuntu:curl 이미지로 생성 후 "curl 10.1.0.30 | grep Hello" 명령어 수행
kubectl run -i --tty --rm debug --image=alicek106/ubuntu:curl --restart=Never curl 10.1.0.30 | grep Hello

# 리눅스 서버 생성해서 점속
kubectl run -i --tty --rm debug --image=alicek106/ubuntu:curl --restart=Never -- bash

# get service
kubectl get svc

# get endpoint object
kubectl get ep

# delete service
kubectl delete svc hostname-svc-clusterip