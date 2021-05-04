 #!/bin/bash
echo "Compressing ${terraformPath} directory..."
if  [ ! -z ${TERRAFORM_WORKDIR:+""}]; then
    tar -czf ${terraformRemoteStateFile}.tar.gz -C ${terraformPath}/$TERRAFORM_WORKDIR/ .
else
    tar -czf ${terraformRemoteStateFile}.tar.gz -C ${terraformPath} .
fi
echo "##[debug] Compress terraform directory done"