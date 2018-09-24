# Example
# ./update_certs.sh 172.16.40.228 patro1-cluster.icp

MASTER=$1
CLUSTER=$2

echo Updating certificates for ICP Cluster $CLUSTER on $MASTER
sudo cp /etc/hosts /etc/hosts.original
sudo sed -i  '' "/$CLUSTER/d" /etc/hosts
echo "$MASTER $CLUSTER" > /tmp/hosts
sudo sh -c "cat /tmp/hosts >> /etc/hosts"

echo Creating directory
sudo rm -rf /etc/docker/certs.d/$CLUSTER:8500
sudo mkdir /etc/docker/certs.d/$CLUSTER:8500/

echo Copying certificates for $MASTER
ssh user@$MASTER "sudo cp /etc/docker/certs.d/$CLUSTER\:8500/ca.crt /tmp"
sudo scp user@$MASTER:/tmp/ca.crt \
	/etc/docker/certs.d/$CLUSTER\:8500/