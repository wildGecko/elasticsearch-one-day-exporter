FROM ubuntu:18.04
LABEL maintainer="Maksim Kuprienko <maksim.kuprienko@flant.com>"

RUN apt-get update \
        && apt-get dist-upgrade -y \
        && apt-get install -y --no-install-recommends \
            ca-certificates \
            curl

ENV VERSION v0.0.3
ENV DOWNLOAD_URL https://github.com/flant/elasticsearch-oneday-exporter/releases/download/${VERSION}/es-oneday-exporter-linux-amd64

RUN curl -fsSL "$DOWNLOAD_URL" -o /es-oneday-exporter \
        && chmod 755 /es-oneday-exporter

EXPOSE 9141/tcp

ENTRYPOINT [ "/es-oneday-exporter" ]
CMD [ "--base.dir", "/data" ]
