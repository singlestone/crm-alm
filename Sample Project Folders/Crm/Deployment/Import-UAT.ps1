# Script parameters #
$organizationName = "<OrgName>"
$serverUrl ="http://<serverUrl>"
$crmAdminUser = "<username>"
$crmAdminPassword = ConvertTo-SecureString -String "<password>" -AsPlainText -Force
# Script parameters #

Write-Output "Connecting to CRM OnPremise as $crmAdminUser"
$crmCred = New-Object System.Management.Automation.PSCredential ($crmAdminUser,$crmAdminPassword) 
Try
{
    # Refer to https://msdn.microsoft.com/en-us/library/dn756303.aspx for more detail 
    $global:conn = Get-CrmConnection -OrganizationName $organizationName -ServerUrl $serverUrl -Credential $crmCred -ErrorAction Stop

    Import-CrmSolution -SolutionFilePath C:\Work\Exports\CrmStone\Solutions\Core.zip -ActivatePlugIns -OverwriteUnManagedCustomizations -PublishChanges

}
Catch
{
    throw 
}