FROM ubuntu:22.04

RUN apt-get -qq update && \
  apt-get -qq install --no-install-recommends -y \
  curl \
  openjdk-8-jdk

ENV HADOOP_HOME /opt/hadoop
ENV PATH ${HADOOP_HOME}/bin:$PATH

RUN curl --location --fail --silent --show-error --output /tmp/hadoop-3.3.4.tar.gz "https://downloads.apache.org/hadoop/common/hadoop-3.3.4/hadoop-3.3.4.tar.gz" && \
  cd /tmp && \
  tar -xzvf hadoop-3.3.4.tar.gz && \
  mv hadoop-3.3.4 /opt/hadoop && \
  rm hadoop-3.3.4.tar.gz

COPY core-site.xml hdfs-site.xml hadoop-env.sh /opt/hadoop/etc/hadoop/

COPY init.sh /home/entrypoint/init.sh
