#! /busybox/sh

echo "pod2 build"
echo "second line"
ls -la
pwd
/kaniko/executor --dockerfile $WORKSPACE/server.Dockerfile --no-push