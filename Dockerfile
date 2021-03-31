FROM ubuntu:18.04 AS builder

LABEL maintainer="Yury Muski <muski.yury@gmail.com>"

WORKDIR /opt

ARG CURL_VERSION=curl-7_76_0
ARG QUICHE_VERSION=0.7.0

RUN apt-get update && \
    apt-get install -y build-essential git autoconf libtool cmake golang-go curl;

# https://github.com/curl/curl/blob/master/docs/HTTP3.md#quiche-version

# install rust & cargo
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y -q;

RUN git clone --recursive https://github.com/cloudflare/quiche

# build quiche
RUN export PATH="$HOME/.cargo/bin:$PATH" && \
    cd quiche && \
    git checkout $QUICHE_VERSION && \
    cargo build --release --features ffi,pkg-config-meta,qlog && \
    mkdir deps/boringssl/src/lib && \
    ln -vnf $(find target/release -name libcrypto.a -o -name libssl.a) deps/boringssl/src/lib/


# add curl
RUN git clone https://github.com/curl/curl
RUN cd curl && \
    git checkout $CURL_VERSION && \
    ./buildconf && \
    ./configure LDFLAGS="-Wl,-rpath,/opt/quiche/target/release" --with-ssl=/opt/quiche/deps/boringssl/src --with-quiche=/opt/quiche/target/release --enable-alt-svc && \
    make && \
    make DESTDIR="/ubuntu/" install


FROM ubuntu:bionic
RUN apt-get update && apt-get install -y curl

COPY --from=builder /ubuntu/usr/local/ /usr/local/
COPY --from=builder /opt/quiche/target/release /opt/quiche/target/release

# Resolve any issues of C-level lib
# location caches ("shared library cache")
RUN ldconfig

WORKDIR /opt
# add httpstat script
RUN curl -s https://raw.githubusercontent.com/b4b4r07/httpstat/master/httpstat.sh >httpstat.sh && chmod +x httpstat.sh

CMD ["curl"]