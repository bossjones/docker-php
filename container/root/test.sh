#!/usr/bin/env bash

# https://github.com/aelsabbahy/goss/tree/master/integration-tests/goss

# wget https://github.com/aelsabbahy/goss/releases/download/v0.0.22/goss-linux-amd64 -O /usr/local/bin/goss
# chmod +x /usr/local/bin/goss

# NOTE: This also assumes that docker-php/container/root/test folder exists w/ content goss (binary) and goss.json (tests)
# NOTE: Clearly this has a hard coded path in here for the time being while learning how this works. It should def be updated in the correct manner.
docker run --privileged -d -v /Users/malcolm/dev/bossjones/docker-php/container/test:/tmp/test  --name test_container bryanlatten/docker-php /sbin/init

out=$(docker exec test_container sh -c '/tmp/test/goss -g /tmp/test/goss.json validate')
echo "$out"
grep -q 'Count: 1, Failed: 0' <<<"$out"

# docker exec test_container sh -c '/tmp/test/goss -g /tmp/test/goss.json validate'
# grep -q 'Count: 39, Failed: 0' <<<"$out"
# sleep 10

docker rm -vf test_container
