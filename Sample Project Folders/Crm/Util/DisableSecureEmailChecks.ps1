# This script allows email configuration when CRM is not running SSL
add-pssnapin Microsoft.Crm.Powershell
$itemSetting = new-object 'System.Collections.Generic.KeyValuePair[String,Object]' ("AllowCredentialsEntryViaInsecureChannels",1)
$configEntity= new-object "Microsoft.Xrm.Sdk.Deployment.ConfigurationEntity"
$configEntity.LogicalName = "Deployment"
$configEntity.Attributes=new-object "Microsoft.Xrm.Sdk.Deployment.AttributeCollection"
$configEntity.Attributes.Add($itemSetting)
set-CrmAdvancedSetting -Entity $configEntity


$itemSetting = new-object 'System.Collections.Generic.KeyValuePair[String,Object]' ("ECAllowNonSSLEmail",1)
$configEntity= new-object "Microsoft.Xrm.Sdk.Deployment.ConfigurationEntity"
$configEntity.LogicalName = "Deployment"
$configEntity.Attributes=new-object "Microsoft.Xrm.Sdk.Deployment.AttributeCollection"
$configEntity.Attributes.Add($itemSetting)
set-CrmAdvancedSetting -Entity $configEntity
