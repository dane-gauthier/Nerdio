# Set progress preference to minimize output
$progressPreference = 'silentlyContinue'

# Function to install and repair winget if not available
function Ensure-Winget {
    if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
        Write-Host "winget not found, attempting to bootstrap..."
        
        # Install NuGet provider
        Install-PackageProvider -Name NuGet -Force | Out-Null
        
        # Install WinGet PowerShell module
        Install-Module -Name Microsoft.WinGet.Client -Force -Repository PSGallery | Out-Null
        
        # Attempt to bootstrap winget
        Write-Host "Using Repair-WinGetPackageManager cmdlet to bootstrap winget..."
        Repair-WinGetPackageManager
    } else {
        Write-Host "winget is already installed."
    }
}

# Function to install Google Chrome using winget
function Install-Chrome {
    if (Get-Command winget -ErrorAction SilentlyContinue) {
        Write-Host "Installing Google Chrome silently via winget..."
        winget install --id=Google.Chrome --silent --accept-package-agreements --accept-source-agreements
        Write-Host "Google Chrome installation complete."
    } else {
        Write-Host "winget is still unavailable after repair attempt. Aborting Chrome installation."
    }
}

# Optional: Uncomment to allow script to bypass execution policy in restricted environments
Set-ExecutionPolicy Bypass -Scope Process -Force

# Run the functions
Ensure-Winget
Install-Chrome
