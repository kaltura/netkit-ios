#!/bin/bash

set -u

PODSPEC=*.podspec
POD=$(basename $PODSPEC .podspec)

pod ipc spec $POD.podspec > spec.json

TARGET_TAG=$(jq '.source.tag' --raw-output spec.json)
VERSION=$(jq '.version' --raw-output spec.json)

cat << EOF > post.json
{
  "ref": "refs/tags/$TARGET_TAG",
  "sha": "$GITHUB_SHA"
}
EOF

POST_URL=https://api.github.com/repos/$GITHUB_REPOSITORY/git/refs

curl $POST_URL -X POST -H "Content-Type: application/json" -H "authorization: Bearer $GITHUB_TOKEN" -d@post.json

echo "::set-output name=tag::$TARGET_TAG"
