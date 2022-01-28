FROM nginx:1.21.3

ENV TZ Asia/Tokyo
RUN echo "${TZ}" > /etc/timezone \
  && dpkg-reconfigure -f noninteractive tzdata

# fluentd 等を使わない場合、コンテナ内で独自にファイルの rotate が必要
RUN apt-get update && apt-get -y install logrotate
