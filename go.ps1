$SubID = "9c108632-3066-4862-b0db-b34e82ba633d"
$rgName = "rg-keyvaultdeployed-demo-001"
$Location = "northeurope"

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

Set-AzContext -Subscription "9c108632-3066-4862-b0db-b34e82ba633d"
## this is a new line
## dit lijntje erbij
