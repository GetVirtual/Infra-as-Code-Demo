az login

az group create -l westeurope -n 200-AzureCLI-Demo-RG

REM https://docs.azure.cn/zh-cn/cli/vm?view=azure-cli-latest#az-vm-create
az vm create -n AzureCLIdemovm -g 200-AzureCLI-Demo-RG --location westeurope --size Standard_B4ms --image Win2019Datacenter --admin-username vmadmin --admin-password P@ssw0rd1234 --public-ip-address AzureCLIdemo --public-ip-address-dns-name azureclidemodns --no-wait

