#!/bin/bash
set -eux  # fail on error
echo $ARM_TENANT_ID

terraform init \
    -backend-config=storage_account_name=${terraformBackendStorageAccount} \
    -backend-config=container_name=${terraformBackendStorageContainer} \
    -backend-config=key=${terraformRemoteStateFile} \
    -backend-config=resource_group_name=${terraformBackendResourceGroup} \
    -backend-config=subscription_id=$ARM_SUBSCRIPTION_ID \
    -backend-config=tenant_id=$ARM_TENANT_ID \
    -backend-config=client_id=$ARM_CLIENT_ID \
    -backend-config=client_secret="$ARM_CLIENT_SECRET" \
    -no-color \
    -input=false
if  [[ $terraformDestroy == True ]]; then
  terraform state rm 'module.vnet_hub.data.azurerm_client_config.current'
  terraform destroy -auto-approve
  terraform state list 
fi
echo "------------------------------------build number--------------------"
echo ${BUILD_BUILDNUMBER}
echo "init complete"
terraform plan -out="${BUILD_BUILDNUMBER}.tfplan" -no-color -input=false
echo "##vso[task.logissue type=warning]Terraform plan completed"

[[ $terraformShowFlag == True ]] \
  && 
  terraform show -no-color ${BUILD_BUILDNUMBER}.tfplan
  terraform show -no-color ${BUILD_BUILDNUMBER}.tfplan > tfplan.out
