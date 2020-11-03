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
- 1. Create Personal Access Token in Github Enterprise Server Account

- 2. Go to Azure Devops and create new pipeline, choose github enterprise server (yaml)

- 3. Add new connection and provide the enterprise server url and paste the Access token you created in step 1

- 4. Choose azurepipeline.yaml and it will preview in azure devops screen.

- 5. To run pipeline you would also require to add variable group, so go to pipeline > Library > Add variable group

- 6. Add all the variables that are required in the group

- 7. Once done, click on secure files and provide your private ssh keys (private ssh keys are required to talk to github server assuming public keys are present there) - TOFIX
- 8. To pass variable group to pipeline, add it to azure pipeline under variables head like
  variables: 
    group: az-pipeline-terraform-variables

- 9. Once done, create a service principal, go to project settings and choose service connection
  - 9.1. Give a name and choose Azure Resource Manager for service/connection type input
  - 9.2. Choose service principal (automatic)
  - 9.3. Choose scope level - subscription, select the right subscription and do not give any resource group name (otherwise will tie up terraform on resource group scode - Avoid)
  - 9.4. Give Service Connection Name and description
  - Hit Save, the service principal is now created
  - Use the same name in your azure pipeline when referred for service principal.
  
## Following these above steps the github based azure pipeline is integrated with Azure devops/

