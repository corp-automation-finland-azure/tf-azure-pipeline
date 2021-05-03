 #!/bin/bash
echo "Compressing ${terraformPath} directory..."
pwd
ls -l
if  [ -n ${terraformWorkingDir} ]; then
tar -czf ${terraformRemoteStateFile}.tar.gz -C ${terraformPath}/${terraformWorkingDir}/ .
else
tar -czf ${terraformRemoteStateFile}.tar.gz -C ${terraformPath} .
fi
echo "##[debug] Compress terraform directory done"