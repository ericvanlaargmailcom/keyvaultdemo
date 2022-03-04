$SubID = "9c108632-3066-4862-b0db-b34e82ba633d"
$rgName = "rg-keyvaultdeployed-demo-001" 
$VmName = "" 
$Location = "<LOCATION>" 

Connect-AzAccount 
Select-AzSubscription -SubscriptionId $SubID 
Set-AzVMAccessExtension -ResourceGroupName $RgName -Location $Location -VMName $VmName -Credential (get-credential) -typeHandlerVersion "2.0" -Name VMAccessAgent
