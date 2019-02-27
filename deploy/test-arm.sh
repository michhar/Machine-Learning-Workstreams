###################################################################################################
#
# Example:
#  ./test-arm.sh mlpipelinerg mlpipeline123 wonderwoman somethingsecret Standard_NC6 mlpipeline123
#
###################################################################################################


az group create --name $1 --location westus2
az group deployment create \
  --name testdeploy \
  --resource-group $1 \
  --template-file "azuredeploy.json" \
  --parameters dnsLabelPrefix=$2 adminUsername=$3 adminPassword=$4 vmSize=$5 vmName=$6