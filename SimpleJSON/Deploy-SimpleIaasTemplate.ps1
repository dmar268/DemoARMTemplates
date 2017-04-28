### Define variables
{
$location = 'Australia Southeast'
$resourceGroupName = 'simple-iaas-template'
$resourceDeploymentName = 'iaas-template-deployment'
$templatePath = $env:SystemDrive + '\Code\GitHub\DemoARMTemplates\SimpleJSON'
$templateFile = 'simpleIaas.json'
$template = $templatePath + '\' + $templateFile
}

### Create Resource Group
{
New-AzureRmResourceGroup `
    -Name $resourceGroupName `
    -Location $Location `
    -Verbose -Force
}

### Deploy Resources
{
New-AzureRmResourceGroupDeployment `
    -Name $resourceDeploymentName `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile $template `
    -Verbose -Force
}