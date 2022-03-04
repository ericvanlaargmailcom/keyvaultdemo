param([string]$resourceGroup)
$adminCredential = Get-Credential -Message "Enter a username and password for the VM administrator."

$SubID = "9c108632-3066-4862-b0db-b34e82ba633d"
$rgName = "rg-keyvaultdeployed-demo-001"

For ($i = 1; $i -le 3; $i++) 
{

}

$vmName = "ConferenceDemo" + $i
$resourceGroup = "rgconfdemo"
Write-Host "Creating VM: " $vmName

New-AzVm -ResourceGroupName $resourceGroup -Name $vmName -Credential $adminCredential -Image UbuntuLTS
