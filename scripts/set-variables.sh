#!/bin/bash
echo "##vso[task.setvariable variable=ARM_SUBSCRIPTION_ID]$(az account show --query="id" -o tsv)"
echo "##vso[task.setvariable variable=ARM_CLIENT_ID]${servicePrincipalId}"
echo "##vso[task.setvariable variable=ARM_CLIENT_SECRET]${servicePrincipalKey}"
echo "##vso[task.setvariable variable=ARM_TENANT_ID]$(az account show --query="tenantId" -o tsv)"
echo "##vso[task.setvariable variable=ARM_ACCESS_KEY]$(az storage account keys list -n ${terraformBackendStorageAccount} --query="[0].value" -o tsv)"
echo "##vso[task.setvariable variable=GIT_TOKEN]${gitToken}"