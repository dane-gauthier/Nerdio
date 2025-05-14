# Get and display status of all Azure Web Apps
Write-Host "`n=== Azure Web App Statuses ===" -ForegroundColor Green
$webApps = Get-AzWebApp
foreach ($app in $webApps) {
    Write-Host "Web App: $($app.Name) - Status: $($app.State)"
}

# Get and display power state of all Azure VMs
Write-Host "`n=== Azure Virtual Machine Power States ===" -ForegroundColor Green
$vms = Get-AzVM -Status
foreach ($vm in $vms) {
    $powerState = $vm.PowerState -replace 'VM ', '' 
    Write-Host "VM: $($vm.Name) - Power State: $powerState"
}