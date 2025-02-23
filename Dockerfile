FROM debian:bookworm

ENV DEBIAN_FRONTEND=noninteractive \
    SHELL="/bin/bash" \
    HOME="/root" \
    LANG="en_US.UTF-8" \
    LC_ALL="en_US.UTF-8"

SHELL ["/bin/bash", "-c"]

RUN MAN_DISABLE=true apt update && apt upgrade -y && \
    apt install -y --no-install-recommends \
    tzdata bc libssl-dev bison flex make git python3-all-dev curl wget zip cpio \
    sudo libxml2 libc6 zstd locales libstdc++6 software-properties-common lz4 \
    build-essential ca-certificates ccache libncurses-dev u-boot-tools zstd procps \
    rsync xz-utils file lzop gawk patchelf libarchive-tools && \
    echo "LC_ALL=en_US.UTF-8" | tee -a /etc/environment && \
    echo "en_US.UTF-8 UTF-8" | tee -a /etc/locale.gen && \
    echo "LANG=en_US.UTF-8" | tee -a /etc/locale.conf && \
    locale-gen en_US.UTF-8 && \
    apt clean && \
    rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/* \
           /etc/apt/apt.conf.d/* /var/cache/apt/archives/*

USER root

WORKDIR /root

CMD ["bash"]