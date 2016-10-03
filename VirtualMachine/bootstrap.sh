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

#Create Cloudera list file
Q

#Create Cloudera pref file
sudo bash -c 'echo > /etc/apt/preferences.d/cloudera.pref'
sudo sed -i "\$a\Package: *\nPin: release o=Cloudera, l=Cloudera\nPin-Priority: 501" /etc/apt/preferences.d/cloudera.pref
echo 'Jumanji - Cloudera pref file added'

sudo apt-get install -y --force-yes hadoop-hdfs-datanode
echo 'Jumanji - Hadoop Data Node installed'
sudo apt-get install -y --force-yes hadoop-yarn-resourcemanager
echo 'Jumanji - Hadoop Resource Manager installed'

#Configuration files
sudo bash -c 'echo " " > '/etc/hadoop/conf/hdfs-site.xml''
sudo sed -i "\$a\<configuration><property><name>dfs.namenode.name.dir</name><value>file:///disk1/dfs/nn,file:///disk2/dfs/nn</value> </property> <property> <name>dfs.datanode.data.dir</name><value>file:///disk1/dfs/dn,file:///disk2/dfs/dn</value></property></configuration>" /etc/hadoop/conf/hdfs-site.xml


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