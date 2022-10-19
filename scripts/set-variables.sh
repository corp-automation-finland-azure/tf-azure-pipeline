#!/bin/bash
echo "##[group]Set backend variables and git configurations"
echo "##[debug] Set variables script started"
echo "##vso[task.setvariable variable=ARM_SUBSCRIPTION_ID]$(az account set --subscription "$subscriptionId")"
echo "##vso[task.setvariable variable=ARM_CLIENT_ID]${servicePrincipalId}"
echo "##vso[task.setvariable variable=ARM_CLIENT_SECRET]${servicePrincipalKey}"
echo "##vso[task.setvariable variable=ARM_TENANT_ID]$(az account show --query="tenantId" -o tsv)"
echo "##vso[task.setvariable variable=ARM_ACCESS_KEY]$(az storage account keys list -n ${terraformBackendStorageAccount} --query="[0].value" -o tsv)"
echo "##vso[task.setvariable variable=GIT_TOKEN]${gitToken}"
echo "##[debug] Variables have been set"
# delete previous global configurations
if  [[ $addRedirect == True ]]; then
  git config --global --list | grep url. | awk -F '.instead' '{print $1}' | while read line
  do
    echo $line
  git config --global --remove-section $line
  done
  echo "##[debug] Delete global git configurations done"
  git config --global url."https://azdo:${GIT_TOKEN}@${SETTINGS_GITHUBURL}/${targetGitOrganization}/".insteadOf https://${SETTINGS_GITHUBURL}/${targetGitOrganization}/
  git init
  echo "##[debug] Git global configuration is set"
  echo "##[endgroup]"
  # replace URL so that we can use tokens for modules
fi


