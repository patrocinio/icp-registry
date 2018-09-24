# Sample
# ./docker_login.sh patro1-cluster.icp

CLUSTER=$1

echo Logging in to cluster $CLUSTER
docker login $CLUSTER:8500
