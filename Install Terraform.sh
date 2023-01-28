#This file is to 
sudo yum install -y yum-utils
sudo yum update
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform
status=$?

if [[ $status != 0 ]] then;
cd /etc/yum.repos.d/
sed -i 's|$releasever|7|g' hashicorp.repo
sudo yum -y install terraform
status=$?
if [[ $status != 0 ]] then;
echo "Issue with Terraform install"
fi 
fi
sudo mkdir -p /terraform/practice
chmod -R 777 /terraform

