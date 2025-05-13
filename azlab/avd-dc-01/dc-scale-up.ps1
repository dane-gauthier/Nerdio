[string]$resourceGroup = "dev-rg-addc"
[string]$vmName = "avd-dc-01"
[string]$newSize = "Standard_DS3_v2"

# Get VM status for power state check
$vmStatus = Get-AzVM -ResourceGroupName $resourceGroup -Name $vmName -Status
$powerState = ($vmStatus.Statuses | Where-Object { $_.Code -like "PowerState/*" }).DisplayStatus

# Get modifiable VM object (no -Status)
$vm = Get-AzVM -ResourceGroupName $resourceGroup -Name $vmName

# Check if VM is already at the desired size
if ($vm.HardwareProfile.VmSize -eq $newSize) {
    Write-Output "$vmName is already size $newSize. No changes needed."
    return
}

# Stop VM if running
if ($powerState -eq "VM running") {
    Write-Output "$vmName is running. Stopping..."
    Stop-AzVM -ResourceGroupName $resourceGroup -Name $vmName -Force -NoWait > $null
    Write-Output "Waiting for VM to deallocate..."

    do {
        Start-Sleep -Seconds 10
        $vmStatus = Get-AzVM -ResourceGroupName $resourceGroup -Name $vmName -Status
        $powerState = ($vmStatus.Statuses | Where-Object { $_.Code -like "PowerState/*" }).DisplayStatus
    } while ($powerState -ne "VM deallocated")

    Write-Output "$vmName is now deallocated."
}

# Update the VM size
$vm.HardwareProfile.VmSize = $newSize
Update-AzVM -ResourceGroupName $resourceGroup -VM $vm > $null
Write-Output "$vmName resized to $newSize."

# Start the VM
Start-AzVM -ResourceGroupName $resourceGroup -Name $vmName > $null
Write-Output "$vmName has been started with new size $newSize."
