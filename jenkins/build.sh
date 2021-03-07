#! /bin/sh

MODEL_VERSION=$(cat model_version.txt)
docker login $BUILD_DOCKER_HOST -u $BUILD_DOCKER_USER -p $BUILD_DOCKER_PASS
echo "version: $MODEL_VERSION"
docker build -f $WORKSPACE/py-server/Dockerfile --build-arg MODEL_VERSION=$MODEL_VERSION --build-arg MLFLOW_TRACKING_USERNAME --build-arg MLFLOW_TRACKING_PASSWORD --build-arg MLFLOW_S3_ENDPOINT_URL --build-arg AWS_ACCESS_KEY_ID --build-arg AWS_SECRET_ACCESS_KEY -t ${BUILD_DOCKER_HOST}/${BUILD_DOCKER_PROJECT}/server:${BUILD_ID} $WORKSPACE/py-server
docker push ${BUILD_DOCKER_HOST}/${BUILD_DOCKER_PROJECT}/server:${BUILD_ID}