FROM amazon/aws-cli:2.7.2

# yum-config-manager 用
RUN yum -y install yum-utils

RUN yum install tzdata -y
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
#RUN yum install cronie-anacron -y
RUN yum install cronie-noanacron -y

RUN yum localinstall -y https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
RUN yum-config-manager --disable mysql57-community
RUN yum-config-manager --enable mysql80-community
RUN rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022
RUN yum install -y mysql-community-client

ENV CRONTAB_FILE_PATH "/workdir/crontabs/default.crontab"

ADD entrypoint.alpine.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh



#FROM alpine:3.15.0
#
#ENV AWSCLI_VERSION=2.2.41
#ENV GLIBC_VER=2.31-r0
#
#RUN apk add --no-cache --virtual .dependencies \
#    curl
#RUN apk add --no-cache \
#    tzdata \
#    bash \
#    mysql-client
#
#RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
#
## ----------------------------------------------------------------------------------------------------------------------
##  [ add : glibc for aws cli ]
## ----------------------------------------------------------------------------------------------------------------------
#RUN curl -sL https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub -o /etc/apk/keys/sgerrand.rsa.pub
#RUN curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-${GLIBC_VER}.apk
#RUN curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-bin-${GLIBC_VER}.apk
##RUN curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-i18n-${GLIBC_VER}.apk
#RUN apk add --no-cache --virtual .glibc \
#        glibc-${GLIBC_VER}.apk \
#        glibc-bin-${GLIBC_VER}.apk
#
## ----------------------------------------------------------------------------------------------------------------------
##  [ install : aws cli ]
## ----------------------------------------------------------------------------------------------------------------------
#RUN curl -sL https://awscli.amazonaws.com/awscli-exe-linux-aarch64-${AWSCLI_VERSION}.zip -o awscliv2.zip
#RUN unzip awscliv2.zip
#RUN aws/install
#
## ----------------------------------------------------------------------------------------------------------------------
##  [ clean ]
## ----------------------------------------------------------------------------------------------------------------------
#RUN rm -rf \
#      awscliv2.zip \
#      aws \
#      /usr/local/aws-cli/v2/*/dist/aws_completer \
#      /usr/local/aws-cli/v2/*/dist/awscli/data/ac.index \
#      /usr/local/aws-cli/v2/*/dist/awscli/examples \
#      glibc-*.apk
#RUN apk del --purge .dependencies
#RUN apk del --purge tzdata
##    rm -rf /var/cache/apk/*
#
#
#
### ----------------------------------------------------------------------------------------------------------------------
###  [ chmod ]
### ----------------------------------------------------------------------------------------------------------------------
##RUN mkdir -p /var/spool/cron/crontabs
##RUN chmod -R 777 /var/spool/cron
#
## ----------------------------------------------------------------------------------------------------------------------
##  [ confirm ]
## ----------------------------------------------------------------------------------------------------------------------
#RUN aws --version
#
#
## ----------------------------------------------------------------------------------------------------------------------
##  [ main ]
##  - 注
##    - ここで処理を実行しないと動かない（ local では動くが EC2 上の docker では動かない ）
##      = コンテナの run 時に command として cron や crond の実行を渡しても正しく動かない
##    - ENTRYPOINT ではなく CMD だと動かない
## ----------------------------------------------------------------------------------------------------------------------
#ENV CRONTAB_FILE_PATH "/workdir/crontabs/default.crontab"
#
#ADD entrypoint.alpine.sh /entrypoint.sh
#RUN chmod +x /entrypoint.sh
#ENTRYPOINT /entrypoint.sh
#
#
#
#
#
#
#
#
#
#
#
#
#
##FROM ubuntu:16.04
##
###ENV PROFILE "none"
##ENV CRONTAB_FILE_PATH "/workdir/crontabs/default.crontab"
##
##RUN apt-get update && apt-get install -y cron
##ADD entrypoint.ubuntu.sh /entrypoint.sh
##RUN chmod +x /entrypoint.sh
##
##ENTRYPOINT /entrypoint.sh
#
