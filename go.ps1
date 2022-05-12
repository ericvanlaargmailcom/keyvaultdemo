$Tenant = "8c781dba-1521-44e4-9886-e37f91a6f736"
$SubID = "9c108632-3066-4862-b0db-b34e82ba633d"
# $PaygoSubID = "af86d54a-4949-4bb5-997d-9dd0f288655a"
$rgName = "rg_keyvaultdeployed_demo_001"
$Location = "northeurope"

if ([string]::IsNullOrEmpty($(Get-AzContext).Account)) {Connect-AzAccount -Tenant $Tenant -SubscriptionId $SubID}

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
#added comment

