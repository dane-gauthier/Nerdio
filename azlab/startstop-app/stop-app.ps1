param (
    [string]$ResourceGroupName = "Dev-RG-Nerdio",
    [string]$AppService = "nmw-app-72db5tuhrtrs4"
)

$app = Get-AzWebApp -ResourceGroupName $ResourceGroupName -Name $AppService

if ($app.State -eq "Running") {
    Write-Output "$AppService is running. Stopping..."
    Stop-AzWebApp -ResourceGroupName $ResourceGroupName -Name $AppService > $null
} else {
    Write-Output "$AppService is already stopped."
}