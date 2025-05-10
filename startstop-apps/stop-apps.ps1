param (
    [string]$ResourceGroupName = "Dev-RG-Nerdio",
    [string]$AppService1 = "nmw-app-72db5tuhrtrs4"

)

$app1 = Get-AzWebApp -ResourceGroupName $ResourceGroupName -Name $AppService1

if ($app1.State -eq "Running") {
    Write-Output "$AppService1 is running. Stopping..."
    Stop-AzWebApp -ResourceGroupName $ResourceGroupName -Name $AppService1 > $null
} else {
    Write-Output "$AppService1 is already stopped."
}

