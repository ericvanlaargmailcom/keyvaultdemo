if ([string]::IsNullOrEmpty($(Get-AzContext).Account)) {Connect-AzAccount}

New-AzResourceGroup -Name 'rgcreatedemovm' -Location 'westeurope'

New-AzVm `
    -ResourceGroupName 'rgcreatedemovm' `
    -Name 'VM01' `
    -Location 'westeurope' `
    -VirtualNetworkName 'Vnet01' `
    -SubnetName 'Subnet01' `
    -SecurityGroupName 'NetworkSecurityGroup01' `
    -PublicIpAddressName 'PublicIpAddress01' `
    -OpenPorts 80,3389 `
    -Verbose
    
# todo via DSC Install-WindowsFeature -Name Web-Server -IncludeManagementTools
read-host "Press enter to cleanup the demo"
Remove-AzResourceGroup -Name 'rgcreatedemovm' -verbose -Force