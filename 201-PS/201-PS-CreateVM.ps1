# Vars
$SubscriptionName = "Microsoft Azure Internal Consumption" #adjust to your Subscription Name
$RGName = "201-Powershell-Demo-RG"
$Location = "West Europe"
$VMName = "Powershell-Demo"

# Connect to Azure with Device Login
Connect-AzAccount

# Set Subscription Context
Set-AzContext -SubscriptionName $SubscriptionName

# Create RG
New-AzResourceGroup -name $RGName -location $Location

# Generate credentials
$secpasswd = ConvertTo-SecureString "Passw0rd!12345" -AsPlainText -Force
$mycreds = New-Object System.Management.Automation.PSCredential ("vmadmin", $secpasswd)

# Create VM
New-AzVM -Name $VMName -ResourceGroupName $RGName -Location $Location -Credential $mycreds `
-VirtualNetworkName ("VNET-" + $VMName) -SubnetName ("VNET-" + $VMName) `
-Size "Standard_B2ms" -Image "Win2019Datacenter" `
-PublicIpAddressName ("PublicIP-" + $VMName) -SecurityGroupName ("NSG-" + $VMName) -OpenPorts "3389"

Write-Host "Connect with MSRDP to Public IP: " (Get-AzPublicIpAddress -ResourceGroupName $RGName -name ("PublicIP-" + $VMName)).IpAddress

# https://www.youtube.com/watch?v=st6-DgWeuos
Read-Host "To continue with VM Cleanup process press the any key... (where is the any key?!)"

Remove-AzResourceGroup -Name $RGName -Force:$true