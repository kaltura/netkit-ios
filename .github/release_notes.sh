#!/bin/bash

set -u

PODSPEC=*.podspec
POD=$(basename $PODSPEC .podspec)

pod ipc spec $POD.podspec > spec.json

TARGET_TAG=$(jq '.source.tag' --raw-output spec.json)
VERSION=$(jq '.version' --raw-output spec.json)
POD_NAME=$(jp '.name' --raw-output spec.json)
SUMMARY=$(jp '.summary' --raw-output spec.json)


echo "POD info"
echo "$POD_NAME"
echo "$SUMMARY"
echo "$TARGET_TAG"
echo "$VERSION"


- sed -e "s#@@RELEASE_NOTES@@#- TBA#g" -e "s#@@POD_NAME@@#$POD_NAME#g" -e "s#@@POD_PREFERRED_VERSION@@#$VERSION#g" .github/release_notes_template.md

cat .github/release_notes_template.md
