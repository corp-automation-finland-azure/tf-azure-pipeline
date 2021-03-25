#!/bin/bash
git pull
git status
echo "status done"
git add .
echo "add done"
git config --global user.email "you@example.com"
git config --global user.name "Your Name"


# refer https://docs.microsoft.com/en-us/azure/devops/pipelines/release/variables?view=azure-devops&tabs=shell for default variables
git commit -m "Build t"
echo "commit done"
git ls-files
git push https://azdo:$gitToken@dev.azure.com/$targetGitOrganization/$targetProject/_git/$targetDir
echo "### Link To Build ###"
echo "https://dev.azure.com/$targetGitOrganization/$targetProject/_wiki/wikis/$wikiDirectory/?wikiVersion=GBmain&pagePath=%2FBuilds%2F$BUILD_DEFINITIONNAME%2F$BUILD_BUILDNUMBER"
