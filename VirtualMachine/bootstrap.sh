#! /bin/bash

#update
sudo apt-get update
echo 'Jumanji - update completed'

#update/install JAVA jdk and jre
sudo apt-get install -y openjdk-7-jdk
sudo apt-get install -y openjdk-7-jre
echo 'Jumanji - Java installed/updated'

#disable firewall
sudo ufw disable
echo 'Jumanji - ufw disabled'

#edit host file to include IP addresses of Virtual Machines
sudo sevagrantd -i -e "\$a192.168.69.69 orange69\n192.168.69.70 blue69\n192.168.69.71 pink69\n192.168.69.72 green69\n192.168.69.73 cyan69\n192.168.69.74 purple69\n192.168.69.75 ivory69\n192.168.69.76 peru69\n192.168.69.77 violet69\n192.168.69.78 crimson69" /etc/hosts
echo 'Jumanji - Hosts edited'
#Include proper IP addresses

#Create Cloudera pref file
#sudo bash -c 'echo > /etc/apt/preferences.d/cloudera.pref'
#sudo sed -i "\$a\Package: *\nPin: release o=Cloudera, l=Cloudera\nPin-Priority: 501" /etc/apt/preferences.d/cloudera.pref
#echo 'Jumanji - Cloudera pref file added'
ufw 
sudo apt-get install -y --force-yes hadoop-hdfs-datanode
echo 'Jumanji - Hadoop Data Node installed'
sudo apt-get install -y --force-yes hadoop-yarn-resourcemanager
echo 'Jumanji - Hadoop Resource Manager installed'

#Configuration files
sudo bash -c 'echo " " > '/etc/hadoop/conf/core-site.xml''
sudo sed -i "\$a\<configuration><property><name>fs.defaultFS</name><value>hdfs://orange69:8020</value></property></configuration>" /etc/hadoop/conf/core-site.xml
echo 'Jumanji - core-site.xml created'

sudo bash -c 'echo " " > '/etc/hadoop/conf/hdfs-site.xml''
<<<<<<< HEAD
sudo sed -i "\$a\<configuration><property><name>dfs.namenode.name.dir</name><value>file:///disk1/dfs/nn,file:///disk2/dfs/nn</value></property><property><name>dfs.datanode.data.dir</name><value>file:///disk1/dfs/dn,file:///disk2/dfs/dn</value></property></configuration>" /etc/hadoop/conf/hdfs-site.xml

sudo bash -c 'echo " " > '/etc/hadoop/conf/hadoop-env.xml''
sudo sed -i 'export HADOOP_NAMENODE_OPTS="-Xmx64m" export HADOOP_SECONDARYNAMENODE_OPTS="-Xmx64m" export HADOOP_DATANODE_OPTS="-Xmx64m"export YARN_RESOURCEMANGER_OPTS="-Xmx64m"export YARN_NODEMANAGER_OPTS="-Xmx64m"export HADOOP_JOB_HISTORYSERVER_OPTS="-Xmx64m"' /etc/hadoop/conf/hadoop-env.xml

sudo bash -c 'echo " " > '/etc/hadoop/conf/mapred-site.xml''
sudo sed -i '
  <?xml version="1.0"?>
  <!--
  Licensed to the Apache Software Foundation (ASF) under one or more 
  contributor license agreements. See the NOTICE file distributed with 
  this work for additional information regarding copyright ownership.  
  The ASF licenses this file to You under the Apache License, Version 2.0
  (the "License"); you may not use this file except in compliance with the License.  
  You may obtain a copy of the License at 
	
	http://www.apache.org/licenses/LICENSE-2.0
  
  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
-->
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
  <property>
    <name>mapreduce.framework.name</name>
    <value>yarn</value>
  </property>
  <property>
    <name>mapreduce.jobhistory.address</name>
    <value>pink69:10020</value>
  </property>
  <property>
    <name>mapreduce.jobhistory.webapp.address</name>
    <value>pink69:19888</value>
  </property>
  <property>
    <name>yarn.app.mapreduce.am.staging-dir</name>
    <value>/user</value>
  </property>
</configuration>
'

sudo bash -c 'echo " " > '/etc/hadoop/conf/yarn-site.xml''
sudo sed -i '
<?xml version="1.0"?>
<!--
  Licensed to the Apache Software Foundation (ASF) under one or more
  contributor license agreements.  See the NOTICE file distributed with
  this work for additional information regarding copyright ownership.
  The ASF licenses this file to You under the Apache License, Version 2.0
  (the "License"); you may not use this file except in compliance with
  the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
--><?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
  <property>
    <name>yarn.resourcemanager.hostname</name>
    <value>blue69</value>
  </property>
  <property>
    <name>yarn.nodemanager.local-dirs</name>
    <value>file:///disk1/nodemgr/local,file:///disk2/nodemgr/local</value>
  </property>
  <property>
    <name>yarn.nodemanager.log-dirs</name>
    <value>/var/log/hadoop-yarn/containers</value>
  </property>
  <property>
    <name>yarn.nodemanager.remote-app-log-dir</name>
    <value>var/log/hadoop-yarn/apps</value>
  </property>

  <property>
    <name>yarn.nodemanager.aux-services</name>
    <value>mapreduce_shuffle</value>
  </property>

  <property>
    <name>yarn.nodemanager.aux-services.mapreduce_shuffle.class</name>
    <value>org.apache.hadoop.mapred.ShuffleHandler</value>
  </property>

  <property>
    <name>yarn.log-aggregation-enable</name>
    <value>true</value>
  </property>

  <property>
    <description>List of directories to store localized files in.</description>
    <name>yarn.nodemanager.local-dirs</name>
    <value>file:///var/lib/hadoop-yarn/cache/${user.name}/nm-local-dir</value>
  </property>

  <property>
    <description>Where to store container logs.</description>
    <name>yarn.nodemanager.log-dirs</name>
    <value>file:///var/log/hadoop-yarn/containers</value>
  </property>

  <property>
    <description>Where to aggregate logs to.</description>
    <name>yarn.nodemanager.remote-app-log-dir</name>
    <value>hdfs://var/log/hadoop-yarn/apps</value>
  </property>

  <property>
    <description>Classpath for typical applications.</description>
     <name>yarn.application.classpath</name>
     <value>
        $HADOOP_CONF_DIR,
        $HADOOP_COMMON_HOME/*,$HADOOP_COMMON_HOME/lib/*,
        $HADOOP_HDFS_HOME/*,$HADOOP_HDFS_HOME/lib/*,
        $HADOOP_MAPRED_HOME/*,$HADOOP_MAPRED_HOME/lib/*,
        $HADOOP_YARN_HOME/*,$HADOOP_YARN_HOME/lib/*
     </value>
  </property>
 </configuration>'
=======
sudo sed -i "\$a\<configuration><property><name>dfs.namenode.name.dir</name><value>file:///disk1/dfs/nn,file:///disk2/dfs/nn</value> </property> <property> <name>dfs.datanode.data.dir</name><value>file:///disk1/dfs/dn,file:///disk2/dfs/dn</value></property></configuration>" /etc/hadoop/conf/hdfs-site.xml
echo 'Jumanji - hdfs-site.xml created'
>>>>>>> 91797c1e304f26c64122fe020075af303e349a95

#page 14
sudo mkdir -p /disk1/dfs/nn
sudo mkdir -p /disk2/dfs/nn
sudo mkdir -p /disk1/dfs/dn
sudo mkdir -p /disk2/dfs/dn
sudo mkdir -p /disk1/nodemgr/local
sudo mkdir -p /disk2/nodemgr/local
echo 'Jumanji - Hadoop Directories created'

sudo chown -R hdfs:hadoop /disk1/dfs/nn
sudo chown -R hdfs:hadoop /disk2/dfs/nn
sudo chown -R hdfs:hadoop /disk1/dfs/dn
sudo chown -R hdfs:hadoop /disk2/dfs/dn
echo 'Jumanji - HDFS given ownership of Hadoop Directories'

sudo chown -R yarn:yarn /disk1/nodemgr/local
sudo chown -R yarn:yarn /disk2/nodemgr/local
echo 'Jumanji - YARN given ownership of NodeManager local Directories'

#page 16 YARN