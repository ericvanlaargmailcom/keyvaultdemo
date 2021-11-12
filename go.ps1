$msdnsub = "9c108632-3066-4862-b0db-b34e82ba633d"
Set-AzContext -Subscription $msdnsub

C:\DumpStack.log.tmp
New-AzResourceGroup -Name rg-keyvaultdeployed-demo-001 -Location westeurope -verbose

New-AzResourceGroupDeployment `
-ResourceGroupName rg-keyvaultdeployed-demo-001 `
-TemplateURI ./deploy.json `
-TemplateParameterFile ./deployparam.json `
-Verbose

Remove-AzResourceGroup -Name rg-keyvaultdeployed-demo-001 -Force -verbose
