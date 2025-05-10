param (
    [string]$ResourceGroupName = "Dev-RG-Nerdio",
    [string]$AppService1 = "nmw-app-kulf6gmswlqqy",
    [string]$AppService2 = "nmw-ccl-app-fff87"

)

# Stop nmw-app-kulf6gmswlqqy
$app1 = Get-AzWebApp -ResourceGroupName $ResourceGroupName -Name $AppService1

if ($app1.State -eq "Running") {
    Write-Output "$AppService1 is running. Stopping..."
    Stop-AzWebApp -ResourceGroupName $ResourceGroupName -Name $AppService1 > $null
} else {
    Write-Output "$AppService1 is already stopped."
}

# Stop nmw-ccl-app-fff87
$app2 = Get-AzWebApp -ResourceGroupName $ResourceGroupName -Name $AppService2

if ($app2.State -eq "Running") {
    Write-Output "$AppService2 is running. Stopping..."
    Stop-AzWebApp -ResourceGroupName $ResourceGroupName -Name $AppService2 > $null
} else {
    Write-Output "$AppService2 is already stopped."
}
