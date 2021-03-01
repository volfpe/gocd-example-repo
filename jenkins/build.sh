#! /bin/sh

echo "pod2 build"
echo "second line"
ls -la
pwd
echo $WORKSPACE
docker build -f $WORKSPACE/server.Dockerfile $WORKSPACE