#This file is to
mv /etc/yum.repos.d/hashicorp.repo /etc/yum.repos.d/hashicorp.repo_old
sudo yum install -y yum-utils
sudo yum -y update
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform
status=$?

if [[ $status != 0 ]]
then
cd /etc/yum.repos.d/
sed -i 's|$releasever|8|g' hashicorp.repo
sudo yum -y install terraform
status=$?
if [[ $status != 0 ]]
then
echo "Issue with Terraform install"
fi
fi
sudo mkdir -p /terraform/practice
chmod -R 777 /terraform

#Az login
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo yum install -y https://packages.microsoft.com/config/rhel/8/packages-microsoft-prod.rpm
sudo yum install -y azure-cli
