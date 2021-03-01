#! /bin/sh

echo "pod2 build"
echo "second line"
ls -la
pwd
echo $WORKSPACE
echo ${DOCKER_REPOSITORY}server:${BUILD_ID}
docker build -f $WORKSPACE/server.Dockerfile -t "${DOCKER_REPOSITORY}server:${BUILD_ID}" $WORKSPACE
docker push ${DOCKER_REPOSITORY}server:${BUILD_ID}