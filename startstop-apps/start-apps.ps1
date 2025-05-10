param (
    [string]$ResourceGroupName = "Dev-RG-Nerdio",
    [string]$AppService1 = "nmw-app-72db5tuhrtrs4"

)

$app1 = Get-AzWebApp -ResourceGroupName $ResourceGroupName -Name $AppService1

if ($app1.State -eq "Stopped") {
    Write-Output "$AppService1 is not running. Starting"
    Start-AzWebApp -ResourceGroupName $ResourceGroupName -Name $AppService1 > $null
} else {
    Write-Output "$AppService1 is already started."
}

