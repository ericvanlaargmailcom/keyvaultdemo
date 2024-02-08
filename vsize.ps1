$SubID = "ef17a603-a390-49bd-946c-cc18aa67f388"
$rgName = "rg_keyvaultdeployed_demo_001" 
$VmName = "keyvaultvm" 

Select-AzSubscription -SubscriptionId $SubID -Verbose

$vm = Get-AzVm -Name $VmName -ResourceGroupName $rgName

$vm.HardwareProfile.vmSize = "Standard_D2s_v3"
Update-AzVM -ResourceGroupName $rgName -VM $vm -Verbose