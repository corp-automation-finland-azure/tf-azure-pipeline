#!/bin/bash

bn=$BUILD_DEFINITIONNAME
build_name=${bn// /_}
template="wiki/$wikiDirectory/Readme.md"
file_name="wiki/$wikiDirectory/Builds/$build_name/$BUILD_BUILDNUMBER.md"
tfout="$PIPELINE_WORKSPACE/$terraformDirectory/tfplan.out"
mkdir -p "wiki/$wikiDirectory/Builds/$build_name"

cat $template > $file_name
cat <<EOT >> ${file_name}

## Build Details
<table>
<tr>
<td><b>Build Reason</b></td>
<td>$BUILD_REASON</td>
</tr>
<tr>
<td><b>Requestor</b></td>
<td>$BUILD_REQUESTEDFOR</td>
</tr>
<tr>
<td><b>Repository</b></td>
<td><a href=$BUILD_REPOSITORY_URI>$BUILD_REPOSITORY_URI</a></td>
</tr>
<tr>
<td><b>Branch</b></td>
<td>$BUILD_SOURCEBRANCHNAME</td>
</tr>
<tr>
<td><b>Latest Commit</b></td>
<td><a href=$BUILD_REPOSITORY_URI/commit/$BUILD_SOURCEVERSION>$BUILD_SOURCEVERSION</a></td>
</tr>
<tr>
<td><b>Latest Commit Message</b></td>
<td><pre>$BUILD_SOURCEVERSIONMESSAGE</pre></td>
</tr>
</table>

## Terraform Show Output

\`\`\` sh
EOT

cat $tfout >> $file_name
cat <<EOT >> $file_name
\`\`\`
EOT