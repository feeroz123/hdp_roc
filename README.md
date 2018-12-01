# hdp_roc
Installation of HDP on Cent OS 7 with ROC

Steps to deploy the project:
----------------------------------

1. Bring up a Cent OS 7 server/VM. (Minimum 10-12 GB free RAM, 12 GB Free disk space)
2. Run all the commands as mentioned in the pre_setup.sh manually.
3. Go to the project directory (/home/ansible/hdp_roc/hdp_roc) and run the following command to begin the installation of Ambari Server and Ambari Agent:
      <b>ansible-playbook hdp_centos7_playbook.yml</b>
7. Execute the following command to install and deploy the HDP cluster by using the provided blueprint files:
      <b>sh install_HDP_master.sh with-cleanup</b>


--> Coming up - Steps to install PRESTO and SOLR.
