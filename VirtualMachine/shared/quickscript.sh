sudo mkdir -p /disk1/dfs/nn
sudo mkdir -p /disk2/dfs/nn
sudo mkdir -p /disk1/dfs/dn
sudo mkdir -p /disk2/dfs/dn
sudo mkdir -p /disk1/nodemgr/local
sudo mkdir -p /disk2/nodemgr/local
sudo chown -R hdfs:hadoop /disk1/dfs/nn
sudo chown -R hdfs:hadoop /disk2/dfs/nn
sudo chown -R hdfs:hadoop /disk1/dfs/dn
sudo chown -R hdfs:hadoop /disk2/dfs/dn
sudo chown -R yarn:yarn /disk1/nodemgr/local
sudo chown -R yarn:yarn /disk2/nodemgr/local

