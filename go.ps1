# New-AzResourceGroup -Name rg-keyvaultdeploy-demo-001 -Location westeurope
# New-AzResourceGroupDeployment -ResourceGroupName rg-keyvaultdeploy-demo-001 -TemplateFile ./deploy.json -TemplateParameterFile ./deployparam.json
Remove-AzResourceGroup -Name rg-keyvaultdeploy-demo-001 -Force