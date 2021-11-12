$msdnsub = "9c108632-3066-4862-b0db-b34e82ba633d"
$rg = "rg-keyvaultdeployed-demo-001"
$location = "westeurope"

Set-AzContext -Subscription $msdnsub

New-AzResourceGroup -Name $rg -Location $location -verbose

New-AzResourceGroupDeployment `
-ResourceGroupName $rg `
-TemplateURI ./deploy.json `
-TemplateParameterFile ./deployparam.json `
-Verbose

read-host "Press enter to cleanup the demo"
Remove-AzResourceGroup -Name NetworkWatcherRG -Force -verbose
Remove-AzResourceGroup -Name $rg -Force -verbose

Set-AzContext -Subscription "af86d54a-4949-4bb5-997d-9dd0f288655a"