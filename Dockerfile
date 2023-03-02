FROM buildpack-deps:bullseye as download
LABEL Name=jq Version=1.6
WORKDIR /app
COPY sha256sum.txt .
ADD https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 .
RUN sha256sum -c sha256sum.txt \
    && chmod 755 jq-linux64

FROM scratch
COPY --from=download --chown=root:root /app/jq-linux64 /usr/bin/jq
ENTRYPOINT [ "/usr/bin/jq" ]
