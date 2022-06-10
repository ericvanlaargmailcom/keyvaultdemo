$SubID = "9c108632-3066-4862-b0db-b34e82ba633d"
$rgName = "rg-keyvaultdeployed-demo-001" 
$VmName = "keyvault-vm" 
$Location = "northeurope" 

Select-AzSubscription -SubscriptionId $SubID -Verbose
Set-AzVMAccessExtension -ResourceGroupName $RgName -Location $Location -VMName $VmName -Credential (get-credential) -typeHandlerVersion "2.0" -Name VMAccessAgent -Verbose

#comment eric