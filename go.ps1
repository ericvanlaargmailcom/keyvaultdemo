New-AzResourceGroup -Name rg-keyvaultdeployed-demo-001 -Location westeurope -verbose

New-AzResourceGroupDeployment `
-ResourceGroupName rg-keyvaultdeployed-demo-001 `
-TemplateURI ./deploy.json `
-TemplateParameterFile ./deployparam.json `
-Verbose

# Remove-AzResourceGroup -Name rg-keyvaultdeployed-demo-001 -Force -verbose

# een heeeeele rare toevoeging wat moet deze functie in de code????