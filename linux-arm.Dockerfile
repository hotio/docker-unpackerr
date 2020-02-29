FROM golang:stretch as builder
ARG BINARY=unpackerr

RUN mkdir -p $GOPATH/pkg/mod $GOPATH/bin $GOPATH/src /${BINARY}
WORKDIR /${BINARY}

ARG UNPACKERR_VERSION=2d915f50ce9a5276de02a14517fe63a42e26974f

RUN git clone -n https://github.com/davidnewhall/unpackerr.git . && \
    git checkout ${UNPACKERR_VERSION} -b hotio && \
    COMMIT_DATE=$(date -u --date=@$(git show -s --format=%ct ${UNPACKERR_VERSION}) +'%Y-%m-%dT%H:%M:%SZ') && sed -i "s/DATE=.*/DATE=${COMMIT_DATE}/g" .metadata.sh && \
    CGO_ENABLED=0 make ${BINARY}.armhf.linux

FROM hotio/base@sha256:8598d7707dd3e8471cf80df6a471a1f100f207ca5f1e33b08e6b0a64d961e3dd

ARG DEBIAN_FRONTEND="noninteractive"

# install app
COPY --from=builder /unpackerr/unpackerr.armhf.linux /${APP_DIR}/unpackerr

COPY root/ /
