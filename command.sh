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

# deployment,pod,rs,svc 볼수 있음
kubectl get all

# Deployment 의 pod 개수 수정
# kubectl scale --replicas=1 deploy {deploy name}
kubectl scale --replicas=1 deploy hostname-deployment

# get namespace
kubectl get ns

# get pod where namespace
# kubectl get po --namespace {namespace}
kubectl get po -n kubernetes-dashboard

# delete namespace 가 설정된 모두
kubectl delete namespace production

# get configmap
kubectl get cm

# pod 의 환경 변수 출력
# kubectl exec {pod name} env
kubectl exec container-env-example env

# file 을 사용하요 configmap 생성
kubectl create configmap from-envfile --from-env-file multiple-keyvalue.env

# secret key, value 생성
kubectl create secret generic my-password --from-literal password=123123

# get secret
kubectl get secret my-password -o yaml