 #!/bin/bash
echo "Compressing ${terraformPath} directory..."
if  [ -z ${terraformWorkingDir} ]; then
tar -czf ${terraformRemoteStateFile}.tar.gz -C ${terraformPath}/${terraformWorkingDir}/ .
else
tar -czf ${terraformRemoteStateFile}.tar.gz -C ${terraformPath} .
fi
echo "##[debug] Compress terraform directory done"