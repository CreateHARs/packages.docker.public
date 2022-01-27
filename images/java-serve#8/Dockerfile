FROM openjdk:8-alpine

RUN apk --update add tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata && \
    rm -rf /var/cache/apk/*

RUN grep '^networkaddress.cache.ttl=' /usr/lib/jvm/java-1.8-openjdk/jre/lib/security/java.security || echo 'networkaddress.cache.ttl=10' >> /usr/lib/jvm/java-1.8-openjdk/jre/lib/security/java.security
RUN grep '^networkaddress.cache.negative.ttl=' /usr/lib/jvm/java-1.8-openjdk/jre/lib/security/java.security || sed -i -e '/networkaddress\.cache\.negative\.ttl\=10/d' /usr/lib/jvm/java-1.8-openjdk/jre/lib/security/java.security | echo 'networkaddress.cache.negative.ttl=0' >> /usr/lib/jvm/java-1.8-openjdk/jre/lib/security/java.security
