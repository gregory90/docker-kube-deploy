deploy to k8s,

1. Usage  
`gregory90/kube-deploy /deploy ./k8s`
Where k8s is a folder
2. All placeholders in form of ${placeholder} are replaced from env variables
3. kubectl is authenticated with basic auth. K8S_MASTER_HOST, K8S_LOGIN and K8S_PASSWORD must be present in env variables.
4. kubectl apply -f ./k8s
