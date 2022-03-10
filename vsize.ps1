$SubID = "9c108632-3066-4862-b0db-b34e82ba633d"
$rgName = "rg-keyvaultdeployed-demo-001" 
$VmName = "keyvault-vm" 

Select-AzSubscription -SubscriptionId $SubID -Verbose

$vm = Get-AzVm -Name $VmName -ResourceGroupName $rgName

$vm.HardwareProfile.vmSize = "Standard_DS3_v2"
Update-AzVM -ResourceGroupName $rgName -VM $VmName -Verbose