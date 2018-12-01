# As ROOT user:
# --------------
#### Update YUM and install tools
yum update
yum install -y wget scp curl openssl unzip tar ansible git

#### Set hostname env variable temporarily. Should be a FQDN
export AMBARI_SERVER_HOSTNAME=master.subex.com

### Set hostname 
echo $AMBARI_SERVER_HOSTNAME > /etc/hostname

### Set the hostname in Network
vi /etc/sysconfig/network	=> set HOSTNAME=$AMBARI_SERVER_HOSTNAME

### Update hostname entry in hosts file
vi /etc/hosts => $(hostname -i) $AMBARI_SERVER_HOSTNAME

### Set hostname in current session
hostname $AMBARI_SERVER_HOSTNAME

### Restart the network service to set hostname permanently
service network restart

#### Create ansible local user and generate password-less ssh setup
useradd ansible && echo ansible | passwd ansible --stdin

### Add ANSIBLE user to SUDO
Add ansible user to visudo => ansible ALL=(ALL)  NOPASSWD:ALL




# As ANSIBLE user :
# -----------------
ssh-keygen -t rsa -f ~/.ssh/id_rsa -q -P ""
ssh-copy-id ansible@master.subex.com

#### Updating host details to ANSIBLE
sudo echo $AMBARI_SERVER_HOSTNAME 'ansible-ssh-user=ansible ansible-ssh-pass=ansible' >> /etc/ansible/hosts

#### Copy the .bashrc_hdp file to HOME directory, and Execute it
cp .bashrc_hdp $HOME
source $HOME/.bashrc_hdp

#### Create a home directory for the project
mkdir hdp_roc && cd hdp_roc

#### Initialise GIT project and clone the files from repo
git init
git clone $CODE_REPO 

