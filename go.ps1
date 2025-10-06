$Tenant = "8c781dba-1521-44e4-9886-e37f91a6f736"
$SubID = "ef17a603-a390-49bd-946c-cc18aa67f388"
# $PaygoSubID = "af86d54a-4949-4bb5-997d-9dd0f288655a"
$rgName = "rg_vscodedepl_keyvaultvm_demo_001"
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




