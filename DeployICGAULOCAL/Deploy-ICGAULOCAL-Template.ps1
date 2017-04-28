### Define variables

$location = 'Australia Southeast'
$resourceGroupName = 'RG-ICGAULOCAL'
$resourceDeploymentName = 'ICGAULOCAL-deployment'
$templatePath = $env:SystemDrive + '\Code\GitHub\DemoARMTemplates\DeployICGAULOCAL'
$templateFile = 'DeployStorage-vnet.json'
$template = $templatePath + '\' + $templateFile


### Create Resource Group

New-AzureRmResourceGroup `
    -Name $resourceGroupName `
    -Location $Location `
    -Verbose -Force


### Deploy Resources

New-AzureRmResourceGroupDeployment `
    -Name $resourceDeploymentName `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile $template `
    -Verbose -Force



$location = 'Australia Southeast'
$resourceGroupName = 'RG-ICGAULOCAL'
$resourceDeploymentName = 'ICGAULOCAL-deployment'
$templatePath = $env:SystemDrive + '\Code\GitHub\DemoARMTemplates\DeployICGAULOCAL'
$templateFile = 'DeployVMDC.json'
$template = $templatePath + '\' + $templateFile


### Create Resource Group

New-AzureRmResourceGroup `
    -Name $resourceGroupName `
    -Location $Location `
    -Verbose -Force


### Deploy Resources

New-AzureRmResourceGroupDeployment `
    -Name $resourceDeploymentName `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile $template `
    -Verbose -Force
