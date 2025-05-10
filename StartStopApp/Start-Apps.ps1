param (
    [string]$ResourceGroupName = "Dev-RG-Nerdio",
    [string]$AppService1 = "nmw-app-kulf6gmswlqqy",
    [string]$AppService2 = "nmw-ccl-app-fff87"

)

# Start nmw-app-kulf6gmswlqqy
$app1 = Get-AzWebApp -ResourceGroupName $ResourceGroupName -Name $AppService1

if ($app1.State -eq "Stopped") {
    Write-Output "$AppService1 is not running. Starting"
    Start-AzWebApp -ResourceGroupName $ResourceGroupName -Name $AppService1 > $null
} else {
    Write-Output "$AppService1 is already started."
}

# Start nmw-ccl-app-fff87
$app2 = Get-AzWebApp -ResourceGroupName $ResourceGroupName -Name $AppService2

if ($app2.State -eq "Stopped") {
    Write-Output "$AppService2 is not running. Starting..."
    Start-AzWebApp -ResourceGroupName $ResourceGroupName -Name $AppService2 > $null
} else {
    Write-Output "$AppService2 is already started."
}
