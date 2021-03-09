#!/bin/bash
if [[ "$cloneUrl" == "$SETTINGS_CLONESOURCETERRAFORMCODE" ]]; then
     echo "##vso[task.setvariable variable=GIT_TOKEN]$gitToken"
    # clone main repository to instantiate ES module
    git config --global user.name $targetGitOrganization
    # branch is used for dev testing when certain branch needs to be cloned
    branch= [ ! -z $branchName ] && echo "-b $branchName"
    git clone $branch https://$gitToken@$SETTINGS_GITHUBURL/$targetGitOrganization/$targetDir.git
    echo "##vso[task.logissue type=warning]Git clone completed"
elif [[ "$cloneUrl" == "$SETTINGS_CLONESOURCEWIKI" ]]; then
    if [ -d "$targetDir" ]; then rm -rf $targetDir; fi
    # azdo is generic key for azure devops repos
    git clone https://azdo:$gitToken@$SETTINGS_AZUREDEVOPSURL/$targetGitOrganization/$targetProject/_git/$targetDir $targetDir
fi