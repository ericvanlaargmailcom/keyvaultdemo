$Tenant = "8c781dba-1521-44e4-9886-e37f91a6f736"
$SubID = "9c108632-3066-4862-b0db-b34e82ba633d"
$rgName = "rg-keyvaultdeployed-demo-001"
$Location = "northeurope"

if ([string]::IsNullOrEmpty($(Get-AzContext).Account)) {Connect-AzAccount -Tenant $Tenant -SubscriptionId $SubID} -verbose

Set-AzContext -Subscription $SubID

New-AzResourceGroup -Name $rgName -Location $Location -verbose
New-AzResourceGroupDeployment `
-ResourceGroupName $rgName `
-TemplateURI ./deploy.json `
-TemplateParameterFile ./deployparam.json `
-Verbose

read-host "Press enter to cleanup the demo"
Remove-AzResourceGroup -Name NetworkWatcherRG -Force -verbose
Remove-AzResourceGroup -Name $rgName -Force -verbose


