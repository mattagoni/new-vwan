# Define variables
$location = "australiasoutheast"
$resourceGroupName = "magoni"
$vwanName = "magoni_vwan"

##createds vwan with 2 Hubs
#New-AzResourceGroup -Location $location -Name $resourceGroupName
$virtualWan = New-AzVirtualWan -ResourceGroupName $resourceGroupName -Name $vwanName -Location $location 
#New-AzVirtualHub -VirtualWan $virtualWan -ResourceGroupName $resourceGroupName -Name "hub1" -AddressPrefix "10.0.1.0/24" -Location $location ; New-AzVirtualHub -VirtualWan $virtualWan -ResourceGroupName $resourceGroupName -Name "hub2" -AddressPrefix "10.0.2.0/24" -Location $location 
$job1 = Start-Job { New-AzVirtualHub -VirtualWan $using:virtualWan -ResourceGroupName $using:resourceGroupName -Name "hub1" -AddressPrefix "10.0.1.0/24" -Location $using:location }
$job2 = Start-Job { New-AzVirtualHub -VirtualWan $using:virtualWan -ResourceGroupName $using:resourceGroupName -Name "hub2" -AddressPrefix "10.0.2.0/24" -Location $using:location }
# Wait for both to finish
Wait-Job -Job $job1, $job2
# Check for errors
Receive-Job -Job $job1
Receive-Job -Job $job2
