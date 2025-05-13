[string]$resourceGroup = "dev-rg-addc"
[string]$vmName = "avd-dc-01"

# Get the VM status
$vmStatus = Get-AzVM -ResourceGroupName $resourceGroup -Name $vmName -Status

# Extract the power state
$powerState = ($vmStatus.Statuses | Where-Object { $_.Code -like "PowerState/*" }).DisplayStatus

if ($powerState -eq "VM running") {
    Write-Output "$vmName is running. Stopping..."
    Stop-AzVM -ResourceGroupName $resourceGroup -Name $vmName -Force > $null
} elseif ($powerState -eq "VM deallocated") {
    Write-Output "$vmName is already deallocated."
}
