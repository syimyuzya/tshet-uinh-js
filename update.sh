#!/usr/bin/env bash

set -e

pushd ../qieyun-js > /dev/null
npm test
npm run doc:html
npm pack
commit_hash="$(git rev-parse --short HEAD)"

popd > /dev/null
tar xvf ../qieyun-js/qieyun-*.tgz
mv package/* .
rm -d package
git rm --cached -r .
git add .
git commit -m "Dist for dev-0.13 ${commit_hash}"
