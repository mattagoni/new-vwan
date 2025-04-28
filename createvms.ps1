New-AzureRmResourceGroup -Name magoni -Location AustraliaSouthEast
New-AzResourceGroupDeployment -ResourceGroupName "magoni" -TemplateFile "/home/matthew/new-vwan/vmcreatetemplate.json" -TemplateParameterFile "/home/matthew/new-vwan/VM1parameters.json"
New-AzResourceGroupDeployment -ResourceGroupName "magoni" -TemplateFile "/home/matthew/new-vwan/vmcreatetemplate.json" -TemplateParameterFile "/home/matthew/new-vwan/VM2parameters.json"

#az network nic ip-config update --name ipconfig1 --resource-group magoni --nic-name magoni-vm01909 --remove PublicIpAddress
#Remove-AzureRmPublicIpAddress -Name magoni-vm01-ip -ResourceGroupName magoni -force
#az network nic ip-config update --name ipconfig1 --resource-group magoni --nic-name vic-vm01910 --remove PublicIpAddress
#Remove-AzureRmPublicIpAddress -Name magoni-vm02-ip -ResourceGroupName magoni -force
