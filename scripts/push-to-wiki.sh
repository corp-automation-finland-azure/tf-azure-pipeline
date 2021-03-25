#!/bin/bash
git config --global user.email "azdo@pipeline.com"
git config --global user.name "AzureDevops Pipeline"
git pull
git add .
# refer https://docs.microsoft.com/en-us/azure/devops/pipelines/release/variables?view=azure-devops&tabs=shell for default variables
git commit -m "Build $BUILD_BUILDNUMBER"
git ls-files
git push https://azdo:$gitToken@dev.azure.com/$targetGitOrganization/$targetProject/_git/$targetDir
echo "### Link To Build ###"
echo "https://dev.azure.com/$targetGitOrganization/$targetProject/_wiki/wikis/$wikiDirectory/?wikiVersion=GBmain&pagePath=%2FBuilds%2F$BUILD_DEFINITIONNAME%2F$BUILD_BUILDNUMBER"
