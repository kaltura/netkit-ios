#!/bin/bash

set -u

PODSPEC=*.podspec
POD=$(basename $PODSPEC .podspec)

pod ipc spec $POD.podspec > spec.json

TARGET_TAG=$(jq '.source.tag' --raw-output spec.json)
VERSION=$(jq '.version' --raw-output spec.json)
POD_NAME=$(jq '.name' --raw-output spec.json)
SUMMARY=$(jq '.summary' --raw-output spec.json)

cat spec.json



echo "POD info"
echo "$POD_NAME"
echo "$SUMMARY"
echo "$TARGET_TAG"
echo "$VERSION"

sed -e "s#@@RELEASE_NOTES@@#- TBA#g" -e "s#@@POD_NAME@@#$POD_NAME#g" -e "s#@@POD_PREFERRED_VERSION@@#$VERSION#g" -i '' .github/release_notes_template.md

cat .github/release_notes_template.md
