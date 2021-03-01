#! /bin/sh

echo "pod2 build"
echo "second line"
ls -la
pwd
echo $WORKSPACE
echo ${DOCKER_REPOSITORY}server:${BUILD_ID}
#docker login $DOCKER_HOST -u $DOCKER_USER -p $DOCKER_PASS
docker build -f $WORKSPACE/server.Dockerfile -t ${DOCKER_HOST}/${DOCKER_PROJECT}/server:${BUILD_ID} $WORKSPACE
#docker push "${DOCKER_HOST}/${DOCKER_PROJECT}/server:${BUILD_ID}"