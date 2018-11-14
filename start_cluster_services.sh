curl -u admin:$AMBARI_ADMIN_PASSWORD -i -H 'X-Requested-By: ambari' -X PUT -d '{"RequestInfo": {"context" :"Start HDFS via REST"}, "Body": {"ServiceInfo": {"state": "STARTED"}}}' http://`hostname -f`:8080/api/v1/clusters/$CLUSTER_NAME/services/HDFS
 
curl -u admin:$AMBARI_ADMIN_PASSWORD -i -H 'X-Requested-By: ambari' -X PUT -d '{"RequestInfo": {"context" :"Start YARN via REST"}, "Body": {"ServiceInfo": {"state": "STARTED"}}}' http://`hostname -f`:8080/api/v1/clusters/$CLUSTER_NAME/services/YARN
 
curl -u admin:$AMBARI_ADMIN_PASSWORD -i -H 'X-Requested-By: ambari' -X PUT -d '{"RequestInfo": {"context" :"Start MAPREDUCE2 via REST"}, "Body": {"ServiceInfo": {"state": "STARTED"}}}' http://`hostname -f`:8080/api/v1/clusters/$CLUSTER_NAME/services/MAPREDUCE2
 
curl -u admin:$AMBARI_ADMIN_PASSWORD -i -H 'X-Requested-By: ambari' -X PUT -d '{"RequestInfo": {"context" :"Start HIVE via REST"}, "Body": {"ServiceInfo": {"state": "STARTED"}}}' http://`hostname -f`:8080/api/v1/clusters/$CLUSTER_NAME/services/HIVE
 
curl -u admin:$AMBARI_ADMIN_PASSWORD -i -H 'X-Requested-By: ambari' -X PUT -d '{"RequestInfo": {"context" :"Start TEZ via REST"}, "Body": {"ServiceInfo": {"state": "STARTED"}}}' http://`hostname -f`:8080/api/v1/clusters/$CLUSTER_NAME/services/TEZ
 
curl -u admin:$AMBARI_ADMIN_PASSWORD -i -H 'X-Requested-By: ambari' -X PUT -d '{"RequestInfo": {"context" :"Start HCATALOG via REST"}, "Body": {"ServiceInfo": {"state": "STARTED"}}}' http://`hostname -f`:8080/api/v1/clusters/$CLUSTER_NAME/services/HCATALOG
 
curl -u admin:$AMBARI_ADMIN_PASSWORD -i -H 'X-Requested-By: ambari' -X PUT -d '{"RequestInfo": {"context" :"Start WEBHCAT via REST"}, "Body": {"ServiceInfo": {"state": "STARTED"}}}' http://`hostname -f`:8080/api/v1/clusters/$CLUSTER_NAME/services/WEBHCAT
 
curl -u admin:$AMBARI_ADMIN_PASSWORD -i -H 'X-Requested-By: ambari' -X PUT -d '{"RequestInfo": {"context" :"Start ZOOKEEPER via REST"}, "Body": {"ServiceInfo": {"state": "STARTED"}}}' http://`hostname -f`:8080/api/v1/clusters/$CLUSTER_NAME/services/ZOOKEEPER
