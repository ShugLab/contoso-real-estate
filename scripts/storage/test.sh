#!/usr/bin/env bash
##############################################################################
# Usage: ./upload.sh <sourceDir> <container>
# Upload all files in <sourceDir> to Azure Storage <container>.
# Environment must have values for STORAGE_ACCOUNT_NAME and STORAGE_ACCOUNT_KEY
##############################################################################
# v1.0.0 | dependencies: Azure CLI
##############################################################################

# Get source and dir from input parameters
#sourceDir="${1:-}"
#containerName="${2:-}"
sourceDir="../../packages/blog-cms/data/uploads/"
containerName="strapi-media"

if [[ -z "$sourceDir" ]]; then
  echo "Usage: ./upload.sh <sourceDir> <container> (soureDir is missing)"
  exit 1
fi

if [[ -z "$containerName" ]]; then
  echo "Usage: ./upload.sh <sourceDir> <container> (container is missing)"
  exit 1
fi

# Get storage account name and key from azd
if [[ -x "$(command -v azd)" ]]; then
  echo "Getting values from azd"
  azd env get-values > .env
  source .env
  rm .env
  storageAccountName="$STORAGE_ACCOUNT_NAME"
  storageAccountKey="$STORAGE_ACCOUNT_KEY"
fi

if [[ -z "$storageAccountName" ]]; then
  echo "azd get-values doesn't have STORAGE_ACCOUNT_NAME."
  exit 1
fi

if [[ -z "$storageAccountKey" ]]; then
  echo echo "azd get-values doesn't have storageAccountKey."
  exit 1
fi

# Show inputs
echo "Source directory: $sourceDir"
echo "Storage account name: $storageAccountName"
echo "Container name: $containerName"

# Begin upload
echo "Uploading files to Azure Storage..."

az storage blob upload-batch --account-name "$accountName" --account-key "$accountKey" --destination "$containerName" --source "$sourceDir"

echo "Upload files to Azure Storage completed"