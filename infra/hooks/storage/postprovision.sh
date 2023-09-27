#!/usr/bin/env bash
##############################################################################
# Calls: ./upload.sh <sourceDir> <container>
# Upload all files in <sourceDir> to Azure Storage <container>.
# Environment must have values for STORAGE_ACCOUNT_NAME and STORAGE_ACCOUNT_KEY
##############################################################################
# v1.0.0 | dependencies: Azure CLI
##############################################################################

# Upload directory - path from ../scripts/storage/upload.sh to directory to be uploaded
blobImagesDir="../../packages/blog-cms/data/uploads/"
scriptLocation="../../scripts/storage/upload.sh"
blobContainerName="$STORAGE_CONTAINER_NAME"

# Output vars
echo "blobImagesDir: $blobImagesDir"
echo "blobContainerName: $blobContainerName"
echo "scriptLocation: $scriptLocation"

echo "Uploading images to blob storage..."

# Start Script
#"$scriptLocation" "$blobImagesDir" "$blobContainerName"

echo "Uploaded images to blob storage..."