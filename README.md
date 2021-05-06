# tf-azure-pipeline
This project is used as a common pipeline for all the terraform based client projects. The pipeline is divided into three stages
 - Stage 1 > terraform plan
 - Stage 2 > terraform publish to wiki
 - Stage 3 > terraform apply

All the configurations are used from the projects using the pipeline. For example if a client has written terraform based resources and wants them to be deployed to azure, this pipeline is well suited for that purpose.

The pipeline works with any Azure Subscription, Github or Wiki integrations, that may be provided by customer's code for which we can infer format structures by already created projects.

The pipeline uses repository configuration to clone pipeline code from executed customer code, so that the resouces are deployed as per client code implementation. The pipeline just acts as processor of information and deployment agent.

The scripts folder contains scripts required by pipeline to run for example terraform init, clone repository etc.

## Installation process with azure devops
1. Upon first time installation, Create or use existing Personal Access Token in Github Enterprise Server Account [creating a Personal Access Token - PAT](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token#:~:text=Creating%20a%20token,-Verify%20your%20email&text=In%20the%20upper%2Dright%20corner,Click%20Generate%20new%20token).
2. Create a service principal for azure deployment as per the subscription the resources need to be deployed, go to project settings and choose service connection
  - Give a name and choose Azure Resource Manager for service/connection type input
  - Choose service principal (automatic) - [connect to Azure](https://docs.microsoft.com/en-us/azure/devops/pipelines/library/connect-to-azure?view=azure-devops)
  - Choose scope level - subscription, select the right subscription and do not give any resource group name.
  - Give Service Connection Name and description
  - Hit Save, the service principal is now created
  - Use the same name in your variables-pipeline-{env}.yaml when referred for service connection. The reason there are multiple service principals is that they are used in different parts of the pipeline code and perform different actions, therefore it is possible to separate the permissions assigned to each accordingly. Currently we have two service connectoin.s
    - admin.azureConnection
    - admin.azureEnvironmentConnection

3. In Azure DevOps of client tenant create a new pipeline, choose github enterprise server (yaml)
4. Add a new service connection and provide the enterprise server url and paste the Access token you created in step 1
5. Additionally create a service connection for github and add it to repositories section of azure-pipeline-{env}.yaml
6. Create a new pipeline by choosing new azure-pipeline-production.yaml or  azure-pipeline-test.yaml from github enterprise repos based on the environment one wants to run the client code and it will preview in azure devops screen.
7. Ensure that the variables linked with corresponding azure-pipeline-(environment) are correctly created as per the environment.
 ```
   variables: 
     template: variables-pipeline-{env}.yaml
 ```

## Software Dependencies
1. Service Connection for fetching code from Github
2. Service connection for deploying terraform resources to an Azure Subscription
3. Azure DevOps for the Azure Tenant where the pipeline will be run.
4. PAT for Github and Azure DevOps are to be created seperately .

## Latest Releases
v0.0.1

## Build and Test
1. Once pipeline is previewed in Azure DevOps, run the pipeline against desired environment.
2. Triggers are also created in sample azure-pipeline-{env}.yaml, and can be used based as needed.
3. Check the output in the DevOps pipeline and then in azure portal for which the service connection was created.

## How to Contribute
tf-azure-pipeline is meant to be available for everybody and users can raise issues and changes based on standard Github processes. The code can be forked and pull requests can be created. I the change is relevant and pull request is reviewed and fixed, the changes can then be merged and release can be made.

Each changed code is documented in Release notes and then versioned.

  
By Following the above steps the github based azure pipeline will get integrated with Azure devops.

## Stages Descriptions

### Terraform Plan
Terraform plan performs following actions
1. Checkout pipeline code
2. Set Terraform backend
3. Install Terraform
4. Setup Authentication
5. Terraform Plan: 
    In terraform plan, Script terraform-init uses multiple flags to reference the azure resources where the remote state file is going to be read from and written to.
    1. terraform show flag : the flag is used to show the output of terraform plan and also to put the output to an out file
    2. terraform destroy: if at some point we want resources to be destroyed and redeployed, this flag should be used defaults to True/False (meant for testing)
6. Compress $(terraform.path) Artifact
7. publish artifact tfplan

### Terraform publish to wiki
Terraform publish performs following actions
1. Checkout pipeline code
2. Install Terraform
3. Setup Authentication
4. Git Clone Wiki
5. Terraform Show - Output
6. Write Terraform Show to Wiki
7. Archive Old Builds
8. Git Push Wiki - View Link Here

### Terraform Apply
Terraform Apply performs following actions
1. Checkout pipeline code
2. Install Terraform
3. Setup Authentication
4. Terraform Apply

## Configurations

| Configuration | Descriptopn  | example-values  |
| :-----: | :-: | :-: |
| admin.azureConnection | service connection to deploy resources to azure | azdo-management-principal |
| azureEnvironmentConnection | service connection for subscription storing state files and storage account | azdo-management-principal |
| admin.azureDevOpsOrganization | Organization where azure devops project is running the pipeline | az-do |
| admin.azureDevOpsProject | Project where azure devops will fetch the code from github | central-fileshare-cache |
| admin.azureGithubClientOrganization | Organization where github source terraform code is kept | corp-automation-finland-azure |
| admin.wikiProject | Azure devops project where wiki is created | wiki |
| admin.subscriptionId | Subscription id of the subscription where current terraform source code will be deployed | xxx |
| git.token | Personal Access token created in github to fetch code | xxx |
| git.tokenAzuredevops | Personal Access token created in azure devops to update wiki | xxx |
| settings.location | location of datacenter | westeurope |
| settings.project | Azure devops project where pipeline will be run | az-pipeline-terraform |
| settings.department | Azure devops organization where pipeline will be run | az-do |
| setting.branch | It is used to switch to specific branch of the source code. Very much required while testing | feature/test |

| terraform.backendLocation | location of datacenter | West Europe |
| terraform.path | Actual path where pipeline agent will find files to execute for source code | central-fileshare-cache |
| terraform.version | Version of terraform tobe used while build and deployment | 0.15.1 |
| terraform.destroy | It is used to destroy terraform resources in mentioned subscription | true/false |
| terraform.workdir | It is used to switch to specific terraform directory of the source code so that pipeline knows what to build and deploy| es-connectivity/terraform |

| terraform.remoteStateFileResourceGroup | Resource group for State file to use with terraform | tf-xx-rg |
| terraform.remoteStateFileStorageAccount | Storage Account to store terraform state file | tfxxsa |
| terraform.remoteStateFileBlobContainer | Blob Container used to store terraform state file content | tf-xx-bc |
| terraform.remoteStateFile | Terraform State file | tf-xx.tfstate |
| settings.wikireleasedirectory | Release directory to add wikis for projects in azure devops | tf-xx.tfstate |
| settings.cloneSourceWiki | Azure devops Source code environment for wiki | azuredevops |
| settings.cloneSourceTerraformCode | Source code environment for terraform code | github |

| settings.azureDevopsUrl | Azure devops Source code environment url for wiki publishing | dev.azure.com |
| settings.githubUrl | Github Enterprise Server url to fetch terraform source code | git.evry.cloud |
| settings.pipelineProject | Pipeline project to use for build (not in use at the moment) | tf-azure-pipeline |
| TF_VAR_ENVIRONMENT | Environment variable to distinguish variables when different environment are used | $(environment) |



