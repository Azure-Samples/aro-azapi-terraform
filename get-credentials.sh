#/bin/bash

# Variables
aroClusterName="<azure-resources-name-prefix>Aro"
aroResourceGroupName="<azure-resources-name-prefix>RG"

# Run the following command to find the password for the kubeadmin user.
az aro list-credentials \
  --name $aroClusterName \
  --resource-group $aroResourceGroupName
