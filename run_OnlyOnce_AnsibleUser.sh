# As ANSIBLE user :
# -----------------
ssh-keygen -t rsa -f ~/.ssh/id_rsa -q -P ""
ssh-copy-id ansible@master.subex.com

### Set Cod Repo env variable
export CODE_REPO=http://github.com/feeroz123/hdp_roc

#### Create a home directory for the project
mkdir hdp_roc && cd hdp_roc

#### Initialise GIT project and clone the files from repo
git init
git clone $CODE_REPO 

#### Copy the .bashrc_hdp file to HOME directory, and Execute it
cp .bashrc_hdp $HOME
source $HOME/.bashrc_hdp
