FROM alpine:latest
LABEL maintainer="iHelpU.Tech (github.com/ihelpu-tech)"

ENV TIMEZONE=America/Chicago

RUN set -ex && \
    apk update && \
    apk upgrade && \
    apk add -t .base-rundeps \
            bash \
            busybox-extras \
            curl \
            grep \
            iputils \
            jq \
            less \
            libressl \
            doas \
            tzdata \
            vim \
            && \
    # Set the timezone
    cp -R /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
    echo "${TIMEZONE}" > /etc/timezone && \
    echo "Done"