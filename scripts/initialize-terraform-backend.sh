#!/bin/bash
set -eu # fail on error
RG=$resourceGroup
echo $remoteStateFile
export AZURE_STORAGE_ACCOUNT=$storageAccount
# export TERRAFORM_BREAK_LEASE=1
export AZURE_STORAGE_KEY="$(az storage account keys list -g "$RG" -n "$AZURE_STORAGE_ACCOUNT" --query '[0].value' -o tsv)"
if test -z "$AZURE_STORAGE_KEY"; then
    az configure --defaults group=$RG location=$location
    az group create -n $RG -o none
    az storage account create -n "$AZURE_STORAGE_ACCOUNT" -o none
    az storage account blob-service-properties update --enable-delete-retention true --delete-retention-days 100 -n "$AZURE_STORAGE_ACCOUNT" -o none
    az storage account blob-service-properties update --enable-versioning -n "$AZURE_STORAGE_ACCOUNT" -o none
    export AZURE_STORAGE_KEY="$(az storage account keys list -g "$RG" -n "$AZURE_STORAGE_ACCOUNT" --query '[0].value' -o tsv)"
fi
container=$storageContainer
if ! az storage container show -n "$container" -o none 2>/dev/null; then
    az storage container create -n "$container" -o none
fi
blob=$remoteStateFile
if [[ $(az storage blob exists -c "$container" -n "$blob" --query exists) = "true" ]]; then
    if [[ $(az storage blob show -c "$container" -n "$blob" --query "properties.lease.status=='locked'") = "true" ]]; then
        echo "State is leased"
        lock_jwt=$(az storage blob show -c "$container" -n "$blob" --query metadata.terraformlockid -o tsv)
        if [ "$lock_jwt" != "" ]; then
            lock_json=$(base64 -d <<<"$lock_jwt")
            echo "State is locked"
            jq . <<<"$lock_json"
        fi
        if [ "${TERRAFORM_BREAK_LEASE:-}" != "" ]; then
            az storage blob lease break -c "$container" -b "$blob"
        else
            echo "If you're really sure you want to break the lease, rerun the pipeline with variable TERRAFORM_BREAK_LEASE set to 1."
            exit 1
        fi
    fi
fi
