<!-- 
# deploy as static site

```shell
BUCKET_NAME="gs://kiyotakeshi-nuxt-playground"

gsutil mb -p sandbox-330309 -c STANDARD -l ASIA-NORTHEAST1 -b on $BUCKET_NAME

gsutil web set -m index.html $BUCKET_NAME
gsutil web set -e index.html $BUCKET_NAME

gsutil iam ch allUsers:objectViewer $BUCKET_NAME

gsutil cp -r dist/* $BUCKET_NAME
``` -->

## deploy to Cloud Run

```shell
# ローカルでビルド
$ docker build -t $(npx -c 'echo "$npm_package_name"'):latest .

# ローカルで起動
$ docker run --name nuxt-sample -d -p 8080:8080 nuxt-sample

# ビルド gcr に push
# gcloud builds submit --tag gcr.io/$GCP_PROJECT_ID/$(npx -c 'echo "$npm_package_name"'):latest .
$ gcloud builds submit --config=./cloud-build.yaml

# gcr から起動
docker run --name nuxt-sample-from-gcr -d -p 8080:8080 gcr.io/sandbox-330309/nuxt-sample

# Cloud Run にデプロイ
gcloud run deploy nuxt-sample --image=asia.gcr.io/sample-project/nuxt:1.0.0 --platform managed --port 8080 --region asia-northeast1 --service
```
