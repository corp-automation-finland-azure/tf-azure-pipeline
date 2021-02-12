variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  default     = ""
}

variable "project_name" {
  description = "The name of the project."
  default     = ""
}

variable "subscription_type" {
  description = "Summary description of the purpose of the subscription that contains the resource. Often broken down by deployment environment type or specific workloads"
  default     = ""
}

variable "environment" {
  description = "The stage of the development lifecycle for the workload that the resource supports"
  default     = ""
}

variable "deployment_resource_group_name" {
  type        = string
  description = "Azure RG where to create resources."
  default     = "tf-rg3"
}

# patching variables

# Common infrastructure variables
variable "rg_name" {
    description = "Existing resource group to put all resources to"
    type        = "string"
}

# Automation account

variable "automation_account_name" {
  description   = "Name of automation account to configure"
  type          = "string"
}

# Update management variables

variable "update_conf_name" {
  description   = "Name of Automation Update Management configuration"
  type          = "string"
}

variable "operatingSystem" {
  description   = "Operating system of target machines. Possible values are Windows or Linux."
  type          = "string"
}

variable "scheduleStartTime" {
  description   = "Start time of the standard schedule"
  type          = "string"
}

variable "scheduleFrequency" {
  description   = "Frequency of the schedule. Possible values are OneTime, Day, Hour, Week, Month"
  type          = "string"
}

# Advanced Update management variables

variable "windows" {
  description = "Windows specific update configuration"
  default     = {
    # Update classification included in the software update configuration.  A comma separated string with required values (Unclassified, Critical, Security, UpdateRollup, FeaturePack, ServicePack, Definition, Tools, Updates)
    includedUpdateClassifications = "Unclassified, Critical, Security, UpdateRollup, FeaturePack, ServicePack, Definition, Tools, Updates"
    # KB numbers excluded from the software update configuration
    excludedKbNumbers = []
    # KB numbers included from the software update configuration
    includedKbNumbers = []
    # Reboot setting for the software update configuration (IfRequired, Never)
    rebootSetting = "IfRequired"
  }
  
}

variable "linux" {
  description = "Linux specific update configuration"
  default     = {
    # Update classifications included in the software update configuration (Unclassified, Critical, Security, Other).
    includedPackageClassifications  = "Unclassified, Critical, Security, Other"
    # packages excluded from the software update configuration
    excludedPackageNameMasks  = []
    # packages included from the software update configuration
    includedPackageNameMasks  = []
    # Reboot setting for the software update configuration (IfRequired, Never)
    rebootSetting = "IfRequired"
  }
  
}

# Machines to be included in upgrade

variable "azureVirtualMachines" {
  description = "List of azure resource Ids for azure virtual machines targeted by the software update configuration"
  default     = []
}


variable "nonAzureComputerNames" {
  description = "List of names of non-azure machines targeted by the software update configuration"
  default     = []
}

# Group targets for the software update configuration

variable "targetAzure" {
  description = "List of Azure queries in the software update configuration"
  default = {
    # List of Subscription or Resource Group ARM Ids
    scope = []
    # List of locations to scope the query to
    locations = []
    # Tag settings for the VM
    tagSettings = {
      # Dictionary of tags with its list of values
      tags = {}
      # Filter VMs by Any or All specified tags. - All or Any
      filterOperator  = "Any"
    }
  }
}

variable "targetNonAzure" {
  description = "List of non Azure queries in the software update configuration"
  default = {
    # Log Analytics Saved Search name
    functionAlias = ""
    # Workspace Id for Log Analytics in which the saved Search is resided
    workspaceId   = ""
  }
}