#!/bin/bash
set -eu
cd `dirname $0`

#DOCKER_OWNER=CreateHARs
DOCKER_OWNER=createhars

# bash command docker:login:ghcr
function docker:login:ghcr() {
  # cat ~/ghcr.txt | docker login ghcr.io -u ${GITHUB_PERSONAL_USER_NAME} --password-stdin
  echo ${GITHUB_PERSONAL_ACCESS_TOKEN} | docker login ghcr.io -u ${GITHUB_PERSONAL_USER_NAME} --password-stdin
}

function publish:image:sample() {
  DOCKER_REPO=packages.docker.public
  SOURCE_DIR=./images/sample
  docker build -t ghcr.io/${DOCKER_OWNER}/${DOCKER_REPO}/sample:latest -f ${SOURCE_DIR}/Dockerfile ${SOURCE_DIR}
  docker push     ghcr.io/${DOCKER_OWNER}/${DOCKER_REPO}/sample:latest
}

function test() {
  github_ref="refs/heads/images/sample/releases/1.0.0"
  branch="${github_ref/refs\/heads\//}"
  echo $branch
  version="${branch/images\/sample\/releases\//}"
  echo $version
}


$1