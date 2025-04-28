#New-AzureRmResourceGroup -Name magoni -Location AustraliaSouthEast
New-AzResourceGroupDeployment -ResourceGroupName "magoni" -TemplateFile "/home/matthew/new-vwan/vmcreatetemplate.json" -TemplateParameterFile "/home/matthew/new-vwan/VM1parameters.json"
New-AzResourceGroupDeployment -ResourceGroupName "magoni" -TemplateFile "/home/matthew/new-vwan/vmcreatetemplate.json" -TemplateParameterFile "/home/matthew/new-vwan/VM2parameters.json"

az network nic ip-config update --name ipconfig1 --resource-group magoni --nic-name magoni-vwan-vm1909 --remove PublicIpAddress
Remove-AzureRmPublicIpAddress -Name magoni-vwan-vm1-ip -ResourceGroupName magoni -force
az network nic ip-config update --name ipconfig1 --resource-group magoni --nic-name magoni-vm01910 --remove PublicIpAddress
Remove-AzureRmPublicIpAddress -Name magoni-vwan-vm2-ip -ResourceGroupName magoni -force
