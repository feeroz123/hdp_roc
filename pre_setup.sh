#### Update YUM and install tools
yum update
yum install -y wget scp curl openssl unzip tar ansible git

#### Updating host details to ANSIBLE
echo $(hostname -I) 'ansible-ssh-user=ansible ansible-ssh-pass=ansible' >> /etc/ansible/hosts

#### Create ansible local user and generate password-less ssh setup
useradd ansible && echo ansible | passwd ansible --stdin
ssh-keygen -t rsa -f ~/.ssh/id_rsa -q -P ""

#### Create a home directory for the project
mkdir hdp_roc && cd hdp_roc

#### Initialise GIT project and clone the files from repo
git init
git clone $CODE_REPO 
