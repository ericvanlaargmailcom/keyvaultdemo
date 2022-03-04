$SubID = "9c108632-3066-4862-b0db-b34e82ba633d"
$rg = "rg-keyvaultdeployed-demo-001"
$location = "northeurope"

Set-AzContext -Subscription $SubID

New-AzResourceGroup -Name $rg -Location $location -verbose

New-AzResourceGroupDeployment `
-ResourceGroupName $rg `
-TemplateURI ./deploy.json `
-TemplateParameterFile ./deployparam.json `
-Verbose

read-host "Press enter to cleanup the demo"
Remove-AzResourceGroup -Name NetworkWatcherRG -Force -verbose
Remove-AzResourceGroup -Name $rg -Force -verbose

Set-AzContext -Subscription "9c108632-3066-4862-b0db-b34e82ba633d"
## this is a new line
## dit lijntje erbij
