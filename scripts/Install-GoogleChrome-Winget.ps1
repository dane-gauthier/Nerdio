# Check if winget is installed
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "winget not found. Installing winget..."
    Invoke-WebRequest https://raw.githubusercontent.com/asheroto/winget-installer/master/winget-install.ps1 -UseBasicParsing | Invoke-Expression
} else {
    Write-Host "winget is already installed."
}

# Install Google Chrome silently
winget install --id=Google.Chrome --silent --accept-package-agreements --accept-source-agreements
