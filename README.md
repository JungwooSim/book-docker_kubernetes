### Kubernetes

쿠버네티스는 여러개의 컴포넌트로 구성되어 있다

- Master
    - 역할
        - 클러스터 관리
            - api server
            - controller manager
            - scheduler
- Worker
    - 역할
        - Application Container 가 생성되는 곳

## **Pod - 컨테이너를 다루는 기본 단위**

쿠버네티스에서 컨테이너 애플리케이션의 기본 단위를  Pod 라 부른다.

여러 개의 컨테이너를 추상화해 하나의 어플리케이션으로 동작하도록 하는 컨테이너 묶음

pod 는 1개 이상의 컨테이너로 구성된 컨테이너의 집합

쿠버네티스의 YAML은 일반적으로 아래 항목으로 구성된다

- apiVersion
- kind
- metadata
- spec
    - 리소스를 생성하기 위한 자세한 정보

**Docker Container 말고 Pod 를 사용하는 이유**

가장 큰 점은 여러 리눅스 namespace 를 공유하는 여러 컨네이너들을 추상화된 집합으로 사용하기 위함

<img src="/img/6-4.jpeg" width="600px;">

→ 여러 개의 컨테이너가 하나의 어플리케이션으로 움직이게 된다. (하나의 pod)

## Replica Set - 일정 개수의 pod 를 유지하는 controller

- 정해진 수의 동일한 pod 가 항상 실행되도록 관리
- 노드 장애 등의 이유로 pod 를 사용할 수 없다면 다른 노드에서 다시 생성

## Deployment - Replica Set, Pod 의 배포 관리

- Replica Set 보다 상위 개념이므로 Deployment 를 생성하면 Replica Set 가 생성된다
    - 운영환경에서 일반적으로 Deployment 를 생성하여 Replica Set 를 관리한다
- Replica Set 의 버전 관리 가능
- Replica Set 의 버전으로 쉽게 변경 가능
- 배포 정책 적용 가능
    - 롤링, 등

<img src="/img/6-10.png" width="600px;">

## Service - pod 를 연결하고 외부에 노출

**주요 역할**

- 여러 개의 pod 를 쉽게 접근할 수 있도록 고유한 이름 부여
- 여러 개의 pod 에 접근할 때, 요청을 분산하는 LB 기능 수행
- LB, cluster node 의 port 등을 통해 pod 를 외부로 노출

**주요 사용되고 있는 Service Type**

- ClusterIP
    - kubernetes 내부에서만 pod 에 접근할 때 사용
    - 외부에 노출 X → cluster 내부에서만 사용되는 pod 에 적합
- NodePort
    - pod 에 접근할 수 있는 port 를 cluster 의 모든 node 에 동일하게 개방
    - 외부에 노출
    - 접근할 수 있는 port 는 랜덤으로 정해진다 (단, 특정 port 로 접근하도록 설정 가능)
- LoadBalancer
    - cloud platform 에서 제공되는 LB 를 동적으로 provisioning 하여 pod 에 연결
    - 외부에 노출
    - 일반적으로 AWS, GCP 등과 같은 cloud platform 환경에서만 사용 가능

<img src="/img/6-13.png" width="600px;">

<aside>
💡 Service 의 Label “selector” 와 pod 의 Label 이 매칭돼 연결되면 kubernetes 는 자동으로 endpoint 라고 부르는 Object 를 별도로 생성한다.
endpoint 는 Service 가 가리키고 있는 도착점(endpoint) 을 나타내는데, 이것 또한 독립적인 kubernetes 자원이므로 이론상으로 Service 와 Endpoint 를 따로 생성하는것도 가능하다.

</aside>