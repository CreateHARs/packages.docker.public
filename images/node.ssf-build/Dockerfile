FROM node:16.13.0-alpine

# timezone setting
RUN apk --no-cache add tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata

# ---------------------------------------------------------------------------------------------------------------------
#  [For Amplify CLI] Install amplify cli
# ---------------------------------------------------------------------------------------------------------------------
RUN npm install -g @aws-amplify/cli@5.0.1

RUN npm root -g
RUN npm list -g

RUN echo -e "\n\n [ node     ] >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n`(node -v)`"
RUN echo -e "\n\n [ yarn     ] >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n`(yarn -v)`"
RUN echo -e "\n\n [ amplify  ] >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n`(amplify --version)`"

# amplify cli のバグ : aws config が存在し、かつ default が設定されていないとエラーになってコマンド実行できない
COPY ./files/root/.aws /root/.aws/
ENV AWS_SDK_LOAD_CONFIG 1

## 高速化用
#ENV YARN_CACHE_FOLDER=/yarn_cache_folder


# ---------------------------------------------------------------------------------------------------------------------
#  [For OpenAPI Generator] Install OpenJDK-8
# ---------------------------------------------------------------------------------------------------------------------
RUN apk update && apk add openjdk8

