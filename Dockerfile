FROM sdurrheimer/alpine-glibc

ENV KUBECTL_VERSION 1.3.6
ENV \
    BUILD_DEPS="gettext"  \
    RUNTIME_DEPS="libintl"

# Install kubectl
RUN apk add --update -t deps curl ca-certificates \
 && curl -L https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl \
 && apk add --update $RUNTIME_DEPS \
 && apk add --virtual build_deps $BUILD_DEPS \
 && cp /usr/bin/envsubst /usr/local/bin/envsubst \
 && apk del --purge deps \
 && rm /var/cache/apk/*

COPY ./envsubst.sh /envsubst.sh
RUN chmod +x /envsubst.sh

CMD ["kubectl"]
