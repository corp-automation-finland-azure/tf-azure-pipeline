# Introduction 
TODO: Give a short introduction of your project. Let this section explain the objectives or the motivation behind this project. 

# Getting Started
TODO: Guide users through getting your code up and running on their own system. In this section you can talk about:
1.	Installation process
2.	Software dependencies
3.	Latest releases
4.	API references.

# Build and Test
TODO: Describe and show how to build your code and run the tests. 

# Contribute
TODO: Explain how other users and developers can contribute to make your code better. 

If you want to learn more about creating good readme files then refer the following [guidelines](https://docs.microsoft.com/en-us/azure/devops/repos/git/create-a-readme?view=azure-devops). You can also seek inspiration from the below readme files:
- [ASP.NET Core](https://github.com/aspnet/Home)
- [Visual Studio Code](https://github.com/Microsoft/vscode)
- [Chakra Core](https://github.com/Microsoft/ChakraCore)

# Github Setup with AzureDevops
- Create Personal Access Token in Github Enterprise Server Account

- Go to Azure Devops and create new pipeline, choose github enterprise server (yaml)

- Add new connection and provide the enterprise server url and paste the Access token you created in step 1

- Choose azurepipeline.yaml and it will preview in azure devops screen.

- To run pipeline you would also require to add variable group, so go to pipeline > Library > Add variable group

- Add all the variables that are required in the group

- Once done, click on secure files and provide your private ssh keys (private ssh keys are required to talk to github server assuming public keys are present there) - TOFIX
- To pass variable group to pipeline, add it to azure pipeline under variables head like
    ```
   variables: 
     group: az-pipeline-terraform-variables
    ```
- Once done, create a service principal, go to project settings and choose service connection
  - Give a name and choose Azure Resource Manager for service/connection type input
  - Choose service principal (automatic)
  - Choose scope level - subscription, select the right subscription and do not give any resource group name (otherwise will tie up terraform on resource group scode - Avoid)
  - Give Service Connection Name and description
  - Hit Save, the service principal is now created
  - Use the same name in your azure pipeline when referred for service principal.
  
## Following these above steps the github based azure pipeline is integrated with Azure devops/

## Terraform Plan
Script terraform-init uses multiple flags to do different stuff
1. terraform show flag : the flag is used to show the output of terraform plan and also to put the output to an out file
2. terraform destroy: if at some point we want resources to be destroyed and redeployed, this flag should be used defaults to True/False

