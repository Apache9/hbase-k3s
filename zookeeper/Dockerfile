FROM ubuntu:22.04

RUN apt-get -qq update && \
  apt-get -qq install --no-install-recommends -y \
  curl \
  openjdk-8-jdk

ENV ZOOKEEPER_HOME /opt/zookeeper
ENV PATH ${ZOOKEEPER_HOME}/bin:$PATH

RUN curl --location --fail --silent --show-error --output /tmp/apache-zookeeper-3.8.0-bin.tar.gz "https://downloads.apache.org/zookeeper/zookeeper-3.8.0/apache-zookeeper-3.8.0-bin.tar.gz" && \
  cd /tmp && \
  tar -xzvf apache-zookeeper-3.8.0-bin.tar.gz && \
  mv apache-zookeeper-3.8.0-bin /opt/zookeeper && \
  rm apache-zookeeper-3.8.0-bin.tar.gz

COPY init.sh /home/entrypoint/init.sh
