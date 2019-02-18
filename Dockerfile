FROM evarga/jenkins-slave
LABEL maintainer="woj@sigman.pl"
LABEL version "0.0.1"

ENV TARGET="v11.10.0"

RUN apt-get update && apt-get install -y wget git && rm -rf /var/lib/apt/lists/*

RUN wget --no-verbose http://nodejs.org/dist/"${TARGET}"/node-"${TARGET}"-linux-x64.tar.gz \
    && tar xzf node-"${TARGET}"-linux-x64.tar.gz \
    && mv node-"${TARGET}"-linux-x64 /usr/local/ \
    && ln -s /usr/local/node-"${TARGET}"-linux-x64/bin/node /usr/local/bin \
    && ln -s /usr/local/node-"${TARGET}"-linux-x64/bin/npm /usr/local/bin

RUN rm node-"${TARGET}"-linux-x64.tar.gz

CMD ["/usr/sbin/sshd", "-D"]