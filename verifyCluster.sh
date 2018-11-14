#### To check the status of the cluster
curl -H "X-Requested-By: ambari" -X GET -u admin:$AMBARI_ADMIN_PASSWORD http://AMBARI_SERVER_HOSTNAME:8080/api/v1/clusters/$CLUSTER_NAME/requests/
