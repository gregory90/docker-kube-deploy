FROM sdurrheimer/alpine-glibc

ENV KUBECTL_VERSION 1.3.5

# Install kubectl
RUN apk add --update -t deps curl ca-certificates \
 && curl -L https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl \
 && apk del --purge deps \
 && rm /var/cache/apk/*

CMD ["kubectl"]
