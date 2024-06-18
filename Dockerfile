FROM buildpack-deps:bullseye as download
LABEL Name=jq Version=1.7.1
WORKDIR /app
COPY sha256sum.txt .
ADD https://github.com/jqlang/jq/releases/download/jq-1.7.1/jq-linux-amd64 .
RUN sha256sum -c sha256sum.txt \
    && chmod 755 jq-linux-amd64

FROM scratch
COPY --from=download --chown=root:root /app/jq-linux-amd64 /usr/bin/jq
ENTRYPOINT [ "/usr/bin/jq" ]
