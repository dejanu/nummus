FROM alpine:latest
COPY ke /usr/local/bin/
VOLUME /tmp
ENTRYPOINT ["/usr/local/bin/ke", "--kubeconfig", "/tmp/config", "audit"]
