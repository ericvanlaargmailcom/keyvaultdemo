New-AzResourceGroup -Name rgdemocreatevm -Location 'westeurope'

New-AzVm `
    -ResourceGroupName 'rgdemocreatevm' `
    -Name 'VM01' `
    -Location 'westeurope' `
    -VirtualNetworkName 'Vnet01' `
    -SubnetName 'Subnet01' `
    -SecurityGroupName 'NetworkSecurityGroup01' `
    -PublicIpAddressName 'PublicIpAddress01' `
    -OpenPorts 80,3389
    
    
# Get-AzPublicIpAddress -ResourceGroupName 'myResourceGroup' | Select-Object -Property  'IpAddress'
# mstsc /v:publicIpAddress
# Install-WindowsFeature -Name Web-Server -IncludeManagementTools
