# hdp_roc
Installation of HDP on Cent OS 7 with ROC

Steps to deploy the project:
----------------------------------

1. Bring up a Cent OS 7 server/VM.
2. Run all the commands below as the Root user of this server/VM.
3. Update "env_configurations.sh" file with required values. The variables exported in this script get used by the deplpoyment in further steps.
4. Execute the following command to set the necessary environment variables: 
      ./env_configurations.sh
5. Execute to perform pre-deployment installation and settings: 
      ./pre_setup.sh
6. Go to the project directory (/root/hdp_roc/hdp_roc) and run the following command to begin the installation of Ambari Server and Ambari Agent:
      ansible-playbook hdp_centos7_playbook.yml
7. Execute the following command to create the HDP cluster by using the provided blueprint files:
      ./initiateCluster.sh
8. Optionally, the status of initiate cluster request can be checked by executing: ./verifyCluster.sh
9. Once the cluster has been initiated, the cluster services can be started as:
      ./start_cluster_services.sh


--> Coming up - Steps to install HIVE and other tools.
