# Login to Azure (dont forget within VS Code Popup will be hidden in background ...)
# Connect-AzureRmAccount
Set-AzureRmContext -SubscriptionId "180b44f4-1d54-4817-87ef-22ca8f374006"

# Create RG
New-AzureRmResourceGroup -Name "201-Powershell-Demo-RG" -Location WestEurope

# Generate credentials
$secpasswd = ConvertTo-SecureString "Passw0rd!12345" -AsPlainText -Force
$mycreds = New-Object System.Management.Automation.PSCredential ("vmadmin", $secpasswd)

# Create VM
New-AzureRmVm `
    -ResourceGroupName "201-Powershell-Demo-RG" `
    -Name "Powershell-Demo" `
    -Location "West Europe" `
    -Credential $mycreds `
    -VirtualNetworkName "Powershell-Demo-VNET" `
    -SubnetName "mySubnet" `
    -SecurityGroupName "Powershell-Demo-NSG" `
    -PublicIpAddressName "Powershell-Demo-IP" `
    -OpenPorts 3389

Read-Host 'Press Enter to continue and clean up…' | Out-Null

# Clean Up
Remove-AzureRmResourceGroup -Name "201-Powershell-Demo-RG" -Force