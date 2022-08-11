#!/usr/bin/env bash
sed -i "s/@HDFS_MASTER_SERVICE@/$HDFS_MASTER_SERVICE/g" /opt/hadoop/etc/hadoop/core-site.xml

HADOOP_NODE="${HADOOP_NODE_TYPE}"

if [[ -z $JMX_EXPORTER_ARG ]]; then 
  echo "no JMX_EXPORTER_ARG" 
else 
  export HADOOP_NAMENODE_OPTS="$HADOOP_NAMENODE_OPTS $JMX_EXPORTER_ARG"
  export HADOOP_DATANODE_OPTS="$HADOOP_DATANODE_OPTS $JMX_EXPORTER_ARG"
fi

if [[ $HADOOP_NODE = "namenode" ]]; then
  if [[ ! -f "/home/hadoop/dfs/name/current/VERSION" ]]; then
    echo "format namenode"
    hdfs namenode -format
  fi
  echo "Start NameNode ..."
  hdfs namenode
elif [[ $HADOOP_NODE = "datanode" ]]; then
    echo "Start DataNode ..."
    hdfs datanode -regular
fi

