# Login to Azure (dont forget within VS Code Popup will be hidden in background ...)
# Connect-AzureRmAccount
Set-AzureRmContext -SubscriptionId "180b44f4-1d54-4817-87ef-22ca8f374006"

# Create RG
New-AzureRmResourceGroup -Name "201-Powershell-Demo-RG" -Location WestEurope

New-AzureRmVm `
    -ResourceGroupName "201-Powershell-Demo-RG" `
    -Name "Powershell-Demo" `
    -Location "West Europe" `
    -Credential (Get-Credential) `
    -VirtualNetworkName "Powershell-Demo-VNET" `
    -SubnetName "mySubnet" `
    -SecurityGroupName "Powershell-Demo-NSG" `
    -PublicIpAddressName "Powershell-Demo-IP" `
    -OpenPorts 80,3389


Remove-AzureRmResourceGroup -Name "201-Powershell-Demo-RG" -Force