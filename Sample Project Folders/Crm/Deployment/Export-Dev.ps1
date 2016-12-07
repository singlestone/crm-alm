# Script parameters #
$organizationName = "<OrgName>"
$serverUrl ="http://<crm-server>"
$crmAdminUser = "<username>"
$crmAdminPassword = ConvertTo-SecureString -String "<password>" -AsPlainText -Force
# Script parameters #

Write-Output "Connecting to CRM OnPremise as $crmAdminUser"
$crmCred = New-Object System.Management.Automation.PSCredential ($crmAdminUser,$crmAdminPassword) 
Try
{
    # Refer to https://msdn.microsoft.com/en-us/library/dn756303.aspx for more detail 
    $global:conn = Get-CrmConnection -OrganizationName $organizationName -ServerUrl $serverUrl -Credential $crmCred -ErrorAction Stop
    
    # Use the -InteractiveMode to test connectivity
    #$global:conn = Get-CrmConnection -InteractiveMode 
	
	# Export the solution to a working folder
    Export-CrmSolution -SolutionName Core -conn $global:conn -SolutionFilePath C:\Work\Exports\CrmStone\Solutions -SolutionZipFileName Core.zip
}
Catch
{
    throw 
}