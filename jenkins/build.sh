#! /busybox/sh

echo "pod2 build"
echo "second line"
ls -la
pwd
echo $WORKSPACE
/kaniko/executor --context $WORKSPACE --dockerfile $WORKSPACE/server.Dockerfile --no-push