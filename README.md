# README

GKE で CDN を利用する場合のrails application
public/integration_plugins/index.js が対象

## Docker

`docker-compose build`
`docker-compose up`

## deploy to GKE

`gcloud config list`
`gcloud config set project {project_name}`
`gcloud container clusters create [cluster_name] --machine-type=n1-standard-1 --zone=asia-northeast1 --num-nodes 1`
`gcloud container clusters list`
`kubectl config get-contexts`

`gcloud builds submit ./ --config cloudbuild.yaml`
`gcloud builds list | grep {build_name}`

`kubectl create secret generic [secret_name] --from-literal=secret_key_base=\`bundle exec rake secret\``

`kubectl apply -f kubernetes/deployment.yml`
`kubectl get pods`

`kubectl apply -f kubernetes/service.yaml`
`kubectl get services`

`curl EXTERNAL_IP/hoge`

## clean up

`kubectl delete deployment {deployment_name}`
`kubectl delete service {service_name}`
`gcloud container clusters delete {cluster_name} --zone=asia-northeast1`

