﻿
### Define Deployment Variables
# 	Sub Id: 827c40df-a1c8-46f5-bed6-4910c1b08212

# To login to Azure Resource Manager
# Login-AzureRmAccount
#Login-AzureRmAccount -TenantId 820b3df5-13d5-4f8e-ac93-dadcbfa444ff

{

$resourceGroupName = 'simple-iaas'
$resourceProviderNamespace = 'Microsoft.Network'
$resourceTypeName = 'virtualNetworks'
$resourceGroupLocation = 'Australia Southeast'

$vNetName = 'simple-vnet'
$vNetAddressPrefix = '172.16.0.0/16'
$vNetSubnet1Name = 'subnet-1'
$vNetSubnet1Prefix = '172.16.1.0/24'
$vNetSubnet2Name = 'subnet-2'
$vNetSubnet2Prefix = '172.16.2.0/24'

$randomString = ([char[]]([char]'a'..[char]'z') + 0..9 | Sort-Object {Get-Random})[0..8] -join ''
$storageAccountNamePrefix = 'storage'
$storageAccountType = 'Standard_LRS'
$storageAccountName = $storageAccountNamePrefix + ($storageAccountType.Replace('Standard_','')).ToLower() + $randomString

}

### Get ARM Provider Locations
{
((Get-AzureRmResourceProvider `
    -ProviderNamespace "$resourceProviderNamespace").ResourceTypes | `
    Where-Object {$_.ResourceTypeName -eq "$resourceTypeName"}).Locations | `
    Sort-Object
}

### Create ARM Resource Group
{
$resourceGroup = New-AzureRmResourceGroup `
    -Name $resourceGroupName `
    -Location $resourceGroupLocation `
    -Verbose -Force


}


New-AzureRmResourceGroup -Name $resourceGroupName -Location $resourceGroupLocation

### Create Virtual Network Subnets
{
$vNetSubnet1 = New-AzureRmVirtualNetworkSubnetConfig `
    -Name $vNetSubnet1Name `
    -AddressPrefix $vNetSubnet1Prefix `
    -Verbose

$vNetSubnet2 = New-AzureRmVirtualNetworkSubnetConfig `
    -Name $vNetSubnet2Name `
    -AddressPrefix $vNetSubnet2Prefix `
    -Verbose
}

### Create Virtual Network
{
$vNet = New-AzureRmVirtualNetwork `
    -ResourceGroupName $resourceGroup.ResourceGroupName `
    -Location $resourceGroup.Location `
    -Name $vNetName `
    -AddressPrefix $vNetAddressPrefix `
    -Subnet $vNetSubnet1,$vNetSubnet2 `
    -Verbose -Force
}

### Create Storage Account
{
$storageAccount = New-AzureRmStorageAccount `
    -ResourceGroupName $resourceGroup.ResourceGroupName `
    -Location $resourceGroup.Location `
    -Name $storageAccountName `
    -Type $storageAccountType `
    -Verbose
}