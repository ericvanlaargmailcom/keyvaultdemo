$SubID = "9c108632-3066-4862-b0db-b34e82ba633d"
$rgName = "rg_keyvaultdeployed_demo_001" 
$VmName = "keyvaultvm" 

Select-AzSubscription -SubscriptionId $SubID -Verbose

$vm = Get-AzVm -Name $VmName -ResourceGroupName $rgName

$vm.HardwareProfile.vmSize = "Standard_D2s_v3"
Update-AzVM -ResourceGroupName $rgName -VM $vm -Verbose