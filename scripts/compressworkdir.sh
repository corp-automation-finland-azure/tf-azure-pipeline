 #!/bin/bash
echo "Compressing ${terraformPath} directory..."
if  [ ! -z ${TERRAFORM_WORKDIR:=""} ]; then
    tar -czf ${terraformRemoteStateFile}.tar.gz -C ${terraformPath}/$TERRAFORM_WORKDIR/ .
    echo "Compressed $TERRAFORM_WORKDIR directory..."
else
    tar -czf ${terraformRemoteStateFile}.tar.gz -C ${terraformPath} .
    echo "Compressed ${terraformPath} directory..."
fi
echo "##[debug] Compress terraform directory done"