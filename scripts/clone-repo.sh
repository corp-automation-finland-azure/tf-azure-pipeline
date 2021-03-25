#!/bin/bash
echo "##[group]Clone GitHub/Git repository"
echo "##[debug] Clone repositoy script started"
if [[ "$cloneUrl" == "$SETTINGS_CLONESOURCETERRAFORMCODE" ]]; then
    echo "##[debug] Cloning terraform source code"
    echo "##vso[task.setvariable variable=GIT_TOKEN]$gitToken"
    # clone main repository to instantiate ES module
    git config --global user.name $targetGitOrganization
    # branch is used for dev testing when certain branch needs to be cloned
    git clone $([ ! -z $branchName ] && echo -b $branchName) https://$gitToken@$SETTINGS_GITHUBURL/$targetGitOrganization/$targetDir.git
    echo "##[debug] Git clone completed"
elif [[ "$cloneUrl" == "$SETTINGS_CLONESOURCEWIKI" ]]; then
    git config --global --list | grep url. | awk -F '.instead' '{print $1}' | while read line
    do
    echo $line
    git config --global --remove-section $line
    done
    echo "##[debug] Cloning wiki more"
    echo "$GIT_TOKENAZUREDEVOPS"
    if [ -d "$targetDir" ]; then rm -rf $targetDir; fi
    # azdo is generic key for azure devops repos
    git clone https://azdo:$GIT_TOKENAZUREDEVOPS@$SETTINGS_AZUREDEVOPSURL/$targetGitOrganization/$targetProject/_git/$targetDir $targetDir
    echo "##[debug] Git clone completed"
fi
echo "##[endgroup]"