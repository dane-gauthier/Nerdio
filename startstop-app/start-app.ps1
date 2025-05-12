param (
    [string]$ResourceGroupName = "Dev-RG-Nerdio",
    [string]$AppService = "nmw-app-72db5tuhrtrs4"
)

$app = Get-AzWebApp -ResourceGroupName $ResourceGroupName -Name $AppService

if ($app.State -eq "Stopped") {
    Write-Output "$AppService is not running. Starting"
    Start-AzWebApp -ResourceGroupName $ResourceGroupName -Name $AppService > $null
} else {
    Write-Output "$AppService is already started."
}