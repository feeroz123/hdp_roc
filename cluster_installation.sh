#!/usr/bin/bash


echo "Updating JSON files"
perl -pi -e "s#CLUSTER_NAME#$CLUSTER_NAME#g" hostmapping.json $BLUEPRINT_FILE
perl -pi -e "s#AMBARI_ADMIN_PASSWORD#$AMBARI_ADMIN_PASSWORD#g" hostmapping.json
perl -pi -e "s#AMBARI_SERVER_HOSTNAME#$AMBARI_SERVER_HOSTNAME#g" hostmapping.json
perl -pi -e "s#HDP_STACK_VERSION#$HDP_STACK_VERSION#g" $BLUEPRINT_FILE
echo "==============================================================================================================="
echo "Deleting Blueprint"
curl -s -H "X-Requested-By:ambari" -i -X DELETE -u admin:$AMBARI_ADMIN_PASSWORD http://$AMBARI_SERVER_HOSTNAME:8080/api/v1/blueprints/$CLUSTER_NAME
echo "==============================================================================================================="
echo "Register Blueprint"
curl -s -H "X-Requested-By: ambari" -X POST -u admin:$AMBARI_ADMIN_PASSWORD http://$AMBARI_SERVER_HOSTNAME:8080/api/v1/blueprints/$CLUSTER_NAME -d @$BLUEPRINT_FILE
echo "==============================================================================================================="
echo "Create Cluster"

curl -s -H "X-Requested-By: ambari" -X POST -u admin:$AMBARI_ADMIN_PASSWORD http://$AMBARI_SERVER_HOSTNAME:8080/api/v1/clusters/$CLUSTER_NAME -d @hostmapping.json
ret=$?
if [ $ret == 0 ]
then
	echo "Create cluster request submitted at `date`"
else
	echo "Create cluster request failed"
	exit $ret
fi
echo "==============================================================================================================="

for id in `curl -s --user admin:$AMBARI_ADMIN_PASSWORD -H 'X-Requested-By:ambari' -X GET http://$AMBARI_SERVER_HOSTNAME:8080/api/v1/clusters/$CLUSTER_NAME/requests/ | grep id | cut -d":" -f2`
do
	echo "Tracking Request : $id " 
	ProgressPercent=`curl -s --user admin:$AMBARI_ADMIN_PASSWORD -H 'X-Requested-By:ambari' -X GET http://$AMBARI_SERVER_HOSTNAME:8080/api/v1/clusters/$CLUSTER_NAME/requests/$id | grep progress_percent | awk '{print $3}' | cut -d . -f 1`
	echo " Progress: $ProgressPercent"
	 
	while [[ `echo $ProgressPercent | grep -v 100` ]]; do
	  ProgressPercent=`curl -s --user admin:$AMBARI_ADMIN_PASSWORD -H 'X-Requested-By:mycompany' -X GET http://$AMBARI_SERVER_HOSTNAME:8080/api/v1/clusters/$CLUSTER_NAME/requests/$id | grep progress_percent | awk '{print $3}' | cut -d . -f 1`
	  tput cuu1
	  echo " Progress: $ProgressPercent %"
	  sleep 10
	done
done
echo "Cluster build is completed at `date`"
echo "==============================================================================================================="
