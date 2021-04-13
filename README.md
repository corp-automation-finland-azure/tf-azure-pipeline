# tf-azure-pipeline
The project is used as a commonpipeline for all the terraform based client projects. The pipeline is divided into three stages
Stage1. terraform plan
Stage2. terraform publish to wiki
Stage3. terraform apply

All the configurations are used from projects which are utilizing the pipeline. for e.g if client has written terraform based resources and wants them to be deployed to azure, the pipeline is an easy fit for the use. 

The pipeline works on any subscription and github integration or wiki integrations, whatever is provided by client code. The format of which acan be referenced by already creted projects.

The pipeline uses repository configuration to clone pipeline code from client code run, so that the resouces are deployed as per client code implementation. The pipeline just acts as processor of information and deployment agent.

The scripts folder contains scripts required by pipeline to run for e.g terraform init, clone repo etc

## Installation process with azure devops
1. If first time installation, Create or use existing Personal Access Token in Github Enterprise Server Account refer https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token#:~:text=Creating%20a%20token,-Verify%20your%20email&text=In%20the%20upper%2Dright%20corner,Click%20Generate%20new%20token.
2. Once done, create a service principal for azure deployment as per the subscription the resources need to be deployed, go to project settings and choose service connection
  - Give a name and choose Azure Resource Manager for service/connection type input
  - Choose service principal (automatic) - https://docs.microsoft.com/en-us/azure/devops/pipelines/library/connect-to-azure?view=azure-devops
  - Choose scope level - subscription, select the right subscription and do not give any resource group name (otherwise will tie up terraform on resource group scode - Avoid)
  - Give Service Connection Name and description
  - Hit Save, the service principal is now created
  - Use the same name in your variables-pipeline-{env}.yaml when referred for service connection.

3. Once done, In Azure Devops of client tenant create new pipeline, choose github enterprise server (yaml)
4. Add new connection and provide the enterprise server url and paste the Access token you created in step 1
5. Additionally create a service connection for github and add it to repositories section of azure-pipeline-{env}.yaml
6. Create a new pipeline by choosing new azure-pipeline-production.yaml or  azure-pipeline-test.yaml from github enterprise repos based on the environment one wants to run the client code and it will preview in azure devops screen.
7. Ensure that the variables linked with corresponding azure-pipeline-(environment) are correctly created as per the environment.
 ```
   variables: 
     template: variables-pipeline-{env}.yaml
 ```

## Software Dependencies
1. Service Connection for Github code fetch
2. Service connection for azure portal subscription
3. Azure devops for whichever tenant from where the pipeline will be run.
4. PAT for Github and Azure devops seperately to be created.

## Latest Releases
v0.0.1

## Build and Test
1. Once pipeline is previewed in azure devops, run the pipeline against desired environment.
2. Triggers are also created in sample azure-pipeline-{env}.yaml, but can be used based on need.
3. Check the output in devops pipeline and then in azure portal for which the service connection was created.

## How to Contribute
tf-azure-pipeline is meant to be available for everybody and users can raise issues and changes based on standard github processes. The code can be forked and pull requests can be created. I the change is relevant and pull request is reviewed and fixed, the changes can then be merged and release can be made.

Each changed code is documented in Release notes and then versioned.

  
By Following these above steps the github based azure pipeline will get integrated with Azure devops.

## Stages Descriptions

### Terraform Plan
Terraform plan performs following actions
1. Checkout pipeline code
2. Set Terraform backend
3. Install Terraform
4. Setup Authentication
5. Terraform Plan: 
    In terraform plan, Script terraform-init uses multiple flags to do different stuff
    1. terraform show flag : the flag is used to show the output of terraform plan and also to put the output to an out file
    2. terraform destroy: if at some point we want resources to be destroyed and redeployed, this flag should be used defaults to True/False
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

